"""Runtime smoke test for the ifcopenshell geometry pipeline.

For every schema the package builds (IFC2X3, IFC4, IFC4X1, IFC4X3_ADD2), this
builds a small model with an extruded solid (via ``ifcopenshell.api``), so every
geometry mapping plug-in is exercised. It also loads an IfcAdvancedBrep fixture
(``curved_thick_plate.ifc``, IFC4X3_ADD2). Each case runs
``ifcopenshell.geom.iterator`` (initialize + iterate) and
``ifcopenshell.geom.create_shape``.

Every case runs in its own subprocess, so a hard crash (e.g. a dyld
``_dyld_missing_symbol_abort`` or a segfault in a geometry plugin) is reported
as a named failure instead of killing the test runner.

Regression test for ifcopenshell 0.9.0 build 0 on macOS, where
``ifcopenshell.geom.iterator`` aborted in every geometry mapping plug-in
because the libraries were linked with ``-flat_namespace -undefined suppress``.
"""

import os
import signal
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
ADVANCED_BREP_FIXTURE = os.path.join(HERE, "curved_thick_plate.ifc")

CASES = {
    "extrusion-IFC2X3": ("IFC2X3", None),
    "extrusion-IFC4": ("IFC4", None),
    "extrusion-IFC4X1": ("IFC4X1", None),
    "extrusion-IFC4X3_ADD2": ("IFC4X3_ADD2", None),
    "advanced_brep-IFC4X3_ADD2": ("IFC4X3_ADD2", ADVANCED_BREP_FIXTURE),
}


def build_extrusion_model(schema):
    # ifcopenshell.api does not import its submodules; import each one used.
    import ifcopenshell.api.aggregate
    import ifcopenshell.api.context
    import ifcopenshell.api.geometry
    import ifcopenshell.api.project
    import ifcopenshell.api.root
    import ifcopenshell.api.spatial
    import ifcopenshell.api.unit

    f = ifcopenshell.api.project.create_file(version=schema)
    if schema == "IFC2X3":
        # IFC2X3 requires an OwnerHistory on every rooted entity.
        import ifcopenshell.api.owner
        import ifcopenshell.api.owner.settings

        person = f.createIfcPerson(FamilyName="test")
        organisation = f.createIfcOrganization(Name="test")
        user = f.createIfcPersonAndOrganization(ThePerson=person, TheOrganization=organisation)
        application = f.createIfcApplication(organisation, "0.0", "test", "test")
        ifcopenshell.api.owner.settings.get_user = lambda file: user
        ifcopenshell.api.owner.settings.get_application = lambda file: application
    project =ifcopenshell.api.root.create_entity(f, ifc_class="IfcProject", name="test")
    ifcopenshell.api.unit.assign_unit(f)
    model = ifcopenshell.api.context.add_context(f, context_type="Model")
    body = ifcopenshell.api.context.add_context(
        f, context_type="Model", context_identifier="Body", target_view="MODEL_VIEW", parent=model
    )
    site = ifcopenshell.api.root.create_entity(f, ifc_class="IfcSite", name="site")
    ifcopenshell.api.aggregate.assign_object(f, products=[site], relating_object=project)
    element = ifcopenshell.api.root.create_entity(f, ifc_class="IfcBuildingElementProxy", name="box")
    ifcopenshell.api.geometry.edit_object_placement(f, product=element)
    representation = ifcopenshell.api.geometry.add_wall_representation(
        f, context=body, length=2.0, height=1.0, thickness=0.2
    )
    ifcopenshell.api.geometry.assign_representation(f, product=element, representation=representation)
    ifcopenshell.api.spatial.assign_container(f, products=[element], relating_structure=site)
    assert f.by_type("IfcExtrudedAreaSolid"), "model has no IfcExtrudedAreaSolid"
    return f


def run_case(name):
    import ifcopenshell
    import ifcopenshell.geom

    schema, path = CASES[name]
    if path is None:
        f = build_extrusion_model(schema)
    else:
        f = ifcopenshell.open(path)
        assert f.by_type("IfcAdvancedBrep"), "fixture has no IfcAdvancedBrep"
    assert f.schema_identifier.upper() == schema, (f.schema_identifier, schema)
    print(f"{name}: ifcopenshell {ifcopenshell.version}, schema {f.schema_identifier}", flush=True)

    settings = ifcopenshell.geom.settings()

    print(f"{name}: geom.iterator", flush=True)
    iterator = ifcopenshell.geom.iterator(settings, f)
    assert iterator.initialize(), "iterator.initialize() returned False (no geometry produced)"
    n_shapes = 0
    while True:
        shape = iterator.get()
        assert len(shape.geometry.verts) > 0, f"iterator shape {shape.id} has no vertices"
        n_shapes += 1
        if not iterator.next():
            break
    assert n_shapes >= 1, "iterator produced no shapes"
    print(f"{name}: iterator OK ({n_shapes} shape(s))", flush=True)

    products = [p for p in f.by_type("IfcProduct") if p.Representation is not None]
    assert products, "no product with a representation"
    for product in products:
        print(f"{name}: geom.create_shape #{product.id()} {product.is_a()}", flush=True)
        shape = ifcopenshell.geom.create_shape(settings, product)
        assert len(shape.geometry.verts) > 0, f"create_shape for #{product.id()} has no vertices"
    print(f"{name}: create_shape OK ({len(products)} product(s))", flush=True)


def describe_returncode(rc):
    if rc < 0:
        try:
            return f"killed by signal {signal.Signals(-rc).name}"
        except ValueError:
            return f"killed by signal {-rc}"
    return f"exit code {rc}"


def main():
    if len(sys.argv) == 3 and sys.argv[1] == "--case":
        import faulthandler

        faulthandler.enable()
        run_case(sys.argv[2])
        return 0

    failed = []
    for name in CASES:
        print(f"===== {name}", flush=True)
        proc = subprocess.run(
            [sys.executable, os.path.abspath(__file__), "--case", name],
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            universal_newlines=True,
            timeout=600,
        )
        print(proc.stdout.rstrip(), flush=True)
        if proc.returncode == 0:
            print(f"===== {name}: PASSED", flush=True)
        else:
            print(f"===== {name}: FAILED ({describe_returncode(proc.returncode)})", flush=True)
            failed.append(f"{name} ({describe_returncode(proc.returncode)})")

    if failed:
        print("FAILED geometry cases: " + ", ".join(failed), flush=True)
        return 1
    print(f"All {len(CASES)} geometry cases passed", flush=True)
    return 0


if __name__ == "__main__":
    sys.exit(main())
