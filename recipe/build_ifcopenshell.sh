#!/bin/bash
set -e

# IF osx use file lib suffix .dylib
# IF linux use file lib suffix .so
# IF windows use file lib suffix .dll

export IFC_SCHEMA_VERSIONS="2x3;4;4x1;4x3_add2"

EXTRA_CMAKE_ARGS=()
if [ "$(uname)" == "Darwin" ]; then
    export FSUFFIX=dylib
    # Link everything two-level with all symbols resolved at link time (the
    # linker default). Do NOT put -flat_namespace / -undefined suppress in
    # LDFLAGS: that hides missing link dependencies, which then abort at
    # runtime in dyld (_dyld_missing_symbol_abort) on first use.
    # Only the SWIG Python extension (the only CMake MODULE target) may leave
    # the libpython symbols undefined; the interpreter provides them.
    EXTRA_CMAKE_ARGS+=("-DCMAKE_MODULE_LINKER_FLAGS=${LDFLAGS} -Wl,-undefined,dynamic_lookup")
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    export FSUFFIX=so
fi

cmake ${CMAKE_ARGS} -G Ninja \
 -DSCHEMA_VERSIONS="${IFC_SCHEMA_VERSIONS}" \
 -DCMAKE_BUILD_TYPE=Release \
 -DCMAKE_INSTALL_PREFIX=$PREFIX \
 ${CMAKE_PLATFORM_FLAGS[@]} \
 "${EXTRA_CMAKE_ARGS[@]}" \
 -DCMAKE_PREFIX_PATH=$PREFIX \
 -DCMAKE_SYSTEM_PREFIX_PATH=$PREFIX \
 -DPYTHON_EXECUTABLE:FILEPATH=$PYTHON \
 -DPython_ROOT_DIR:PATH=$PREFIX \
 -DGMP_LIBRARY_DIR=$PREFIX/lib \
 -DMPFR_LIBRARY_DIR=$PREFIX/lib \
 -DOCC_INCLUDE_DIR=$PREFIX/include/opencascade \
 -DOCC_LIBRARY_DIR=$PREFIX/lib \
 -DJSON_INCLUDE_DIR=$PREFIX/include \
 -DCGAL_INCLUDE_DIR=$PREFIX/include \
 -DLIBXML2_INCLUDE_DIR=$PREFIX/include/libxml2 \
 -DLIBXML2_LIBRARIES=$PREFIX/lib/libxml2.$FSUFFIX \
 -DCOLLADA_SUPPORT:BOOL=OFF \
 -DBUILD_EXAMPLES:BOOL=OFF \
 -DIFCXML_SUPPORT:BOOL=ON \
 -DGLTF_SUPPORT:BOOL=ON \
 -DBUILD_CONVERT:BOOL=ON \
 -DBUILD_IFCPYTHON:BOOL=ON \
 -DBUILD_IFCGEOM:BOOL=ON \
 -DBUILD_GEOMSERVER:BOOL=OFF \
 -DBOOST_USE_STATIC_LIBS:BOOL=OFF \
 -DWITH_ROCKSDB=ON \
 -DWITH_ZSTD=ON \
 ./cmake

ninja

ninja install -j 1

python "${RECIPE_DIR}/update_version_init.py" "${PKG_VERSION}" "${SP_DIR}/ifcopenshell/__init__.py"

if [ "$(uname)" == "Darwin" ]; then
    # Build-time guard. It runs here rather than in the test phase because
    # osx-arm64 is cross-compiled on osx-64 and its tests are skipped.
    bash "${RECIPE_DIR}/check_macho_linkage.sh" install_manifest.txt
fi
