# minimal setup.py for conda-forge

from setuptools import setup


def get_long_description():
    """Get the long description from the README file."""
    with open("README.md") as f:
        return '    '.join(f.readlines())


setup(
    name="ifcopenshell",
    version="0.0.0",
    description="Python bindings for the IFCOpenShell library",
    long_description=get_long_description(),
    long_description_content_type="text/markdown",
)
