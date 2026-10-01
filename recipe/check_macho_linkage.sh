#!/bin/bash
# Build-time regression guard for the macOS linkage of the installed binaries.
#
# ifcopenshell 0.9.0 build 0 was linked with a global
# `-Wl,-flat_namespace,-undefined,suppress`. IfcOpenShell loads its schema
# and geometry plug-ins with boost::dll's default mode (RTLD_LAZY|RTLD_LOCAL),
# and dyld's flat-namespace lookup does not search RTLD_LOCAL images. The
# first call from a flat-namespace geometry mapping plug-in into its schema
# plug-in (e.g. Ifc4x3_add2::IfcContext::Class()) therefore aborted in
# `_dyld_missing_symbol_abort`. This check makes such a build fail instead of
# shipping:
#
#   * every installed Mach-O must be linked with a two-level namespace
#     (TWOLEVEL in the header flags);
#   * every shared library / executable must have no undefined symbols
#     (NOUNDEFS). Only the SWIG Python extension (_ifcopenshell_wrapper) may
#     use `-undefined dynamic_lookup`, and then only for libpython symbols;
#     it must not link libpython itself;
#   * the schema and geometry mapping plug-ins of every schema in
#     $IFC_SCHEMA_VERSIONS (";"-separated, e.g. "2x3;4") must be among the
#     checked files.
#
# It only reads Mach-O headers and symbol tables, so it also works when
# osx-arm64 is cross-compiled on an osx-64 host (where tests are skipped).
#
# Usage: IFC_SCHEMA_VERSIONS="2x3;4" check_macho_linkage.sh <install_manifest.txt>

set -u

manifest="${1:-install_manifest.txt}"
OTOOL_BIN="${OTOOL:-otool}"
NM_BIN="${NM:-nm}"

if [ ! -f "$manifest" ]; then
    echo "check_macho_linkage: install manifest '$manifest' not found" >&2
    exit 1
fi

failures=0
checked=0
wrapper_seen=0
checked_names=" "

echo "check_macho_linkage: using otool=$OTOOL_BIN nm=$NM_BIN"
printf '%-70s %-8s %s\n' "FILE" "TYPE" "FLAGS"

while IFS= read -r f; do
    [ -n "$f" ] || continue
    [ -f "$f" ] || continue
    [ -L "$f" ] && continue
    case "$f" in
        *.dylib|*.so|"$PREFIX"/bin/*) ;;
        *) continue ;;
    esac

    header="$("$OTOOL_BIN" -hv "$f" 2>/dev/null)" || continue
    echo "$header" | grep -q "Mach header" || continue

    # Last line of `otool -hv`: magic cputype cpusubtype caps filetype ncmds sizeofcmds flags...
    line="$(echo "$header" | tail -n 1)"
    filetype="$(echo "$line" | awk '{print $5}')"
    flags="$(echo "$line" | awk '{for (i = 8; i <= NF; i++) printf "%s ", $i}')"
    rel="${f#"$PREFIX"/}"
    printf '%-70s %-8s %s\n' "$rel" "$filetype" "$flags"
    checked=$((checked + 1))
    checked_names="$checked_names$(basename "$f") "

    if ! echo " $flags " | grep -q " TWOLEVEL "; then
        echo "  ERROR: $rel is not linked with a two-level namespace (flat_namespace)" >&2
        failures=$((failures + 1))
    fi

    case "$(basename "$f")" in
        _ifcopenshell_wrapper*)
            wrapper_seen=1
            # The extension module legitimately looks up libpython symbols at
            # runtime. Anything else looked up dynamically is a missing link
            # dependency.
            bad="$("$NM_BIN" -m -u "$f" 2>/dev/null | grep "dynamically looked up" | awk '{print $3}' | grep -v -E '^_{1,2}Py' || true)"
            if [ -n "$bad" ]; then
                echo "  ERROR: $rel has non-Python symbols that are only resolved at runtime:" >&2
                echo "$bad" | sed 's/^/    /' >&2
                failures=$((failures + 1))
            fi
            # Linking libpython would load a second interpreter runtime.
            if "$OTOOL_BIN" -L "$f" 2>/dev/null | tail -n +2 | grep -q "libpython"; then
                echo "  ERROR: $rel links libpython; it must use -undefined dynamic_lookup instead:" >&2
                "$OTOOL_BIN" -L "$f" 2>/dev/null | grep "libpython" | sed 's/^/    /' >&2
                failures=$((failures + 1))
            fi
            ;;
        *)
            if ! echo " $flags " | grep -q " NOUNDEFS "; then
                echo "  ERROR: $rel has undefined symbols (no NOUNDEFS flag):" >&2
                "$NM_BIN" -m -u "$f" 2>/dev/null | grep -v "from " | sed 's/^/    /' >&2 || true
                failures=$((failures + 1))
            fi
            ;;
    esac
done < "$manifest"

if [ "$checked" -lt 10 ]; then
    echo "check_macho_linkage: ERROR: only $checked Mach-O files checked; expected the ifcopenshell libraries" >&2
    exit 1
fi
if [ "$wrapper_seen" -ne 1 ]; then
    echo "check_macho_linkage: ERROR: _ifcopenshell_wrapper extension not found in $manifest" >&2
    exit 1
fi
for schema in $(echo "${IFC_SCHEMA_VERSIONS:-}" | tr ';' ' '); do
    for plugin in "ifcopenshell_parse_schema_ifc$schema.dylib" "ifcopenshell_geometry_mapping_ifc$schema.dylib"; do
        case "$checked_names" in
            *" $plugin "*) ;;
            *)
                echo "  ERROR: expected plug-in $plugin was not found in $manifest" >&2
                failures=$((failures + 1))
                ;;
        esac
    done
done
if [ "$failures" -ne 0 ]; then
    echo "check_macho_linkage: FAILED ($failures problem(s) in $checked Mach-O files)" >&2
    exit 1
fi
echo "check_macho_linkage: OK ($checked Mach-O files: all TWOLEVEL; all but the Python extension NOUNDEFS)"
