About ifcopenshell-feedstock
============================

Feedstock license: [BSD-3-Clause](https://github.com/conda-forge/ifcopenshell-feedstock/blob/main/LICENSE.txt)

Home: https://ifcopenshell.org

Package license: LGPL-3.0-or-later

Summary: IfcOpenShell is a library to support the IFC file format

Development: https://github.com/IfcOpenShell/IfcOpenShell

Documentation: https://ifcopenshell.org/

IfcOpenShell
============

<p align="center">
<img src="https://github.com/IfcOpenShell/IfcOpenShell/assets/88302/34901387-e2dd-4a0c-8e38-9ffc32a66cde">
</p>

IfcOpenShell is an open source ([LGPL]) software library for working with Industry Foundation Classes ([IFC]). Complete
parsing support is provided for [IFC2x3 TC1], [IFC4 Add2 TC1], IFC4x1, IFC4x2, and [IFC4x3 Add2]. Extensive geometric support
is implemented for the IFC releases [IFC2x3 TC1] and [IFC4 Add2 TC1]. Extending with support for arbitrary IFC schemas
is possible at compile-time when using C++ and at run-time when using Python.

In addition to a C++ and Python API, IfcOpenShell comes with an ecosystem of tools, notably including IfcConvert (an application
to convert IFC models to other formats), Bonsai (an add-on to Blender providing a graphical IFC authoring platform),
and many other libraries, CLI apps, and more. Support is also provided for auxiliary standards such as BCF and IDS.

For more information, see:

* [IfcOpenShell Website](http://ifcopenshell.org)
* [IfcOpenShell Documentation](https://docs.ifcopenshell.org)
  * [IfcOpenShell C++ Installation](https://docs.ifcopenshell.org/ifcopenshell/installation.html)
  * [IfcOpenShell Python Installation](https://docs.ifcopenshell.org/ifcopenshell-python/installation.html)
  * [IfcOpenShell Python Hello World Tutorial](https://docs.ifcopenshell.org/ifcopenshell-python/hello_world.html)
* [Bonsai Website](https://bonsaibim.org)
* [Bonsai Documentation](https://docs.bonsaibim.org/index.html)
  * [Add-on Installation](https://docs.bonsaibim.org/quickstart/installation.html)
  * [Exploring an IFC model](https://docs.bonsaibim.org/quickstart/explore_model.html)

Development is sponsored through your generous donations!

[![Open Collective Contributors](https://img.shields.io/opencollective/all/opensourcebim?label=Sponsors&color=22ce5f)](https://opencollective.com/opensourcebim/)

Contents
--------

<table>
  <tr>
      <td>Name</td>
      <td>Description</td>
      <td>License</td>
      <td>Service</td>
  </tr>
  <tr>
      <td>bcf</td>
      <td>Library to read and write BCF-XML and query OpenCDE BCF-API modules</td>
      <td>LGPL-3.0-or-later</td>
      <td><a href="https://pypi.org/project/bcf-client/"><img src="https://img.shields.io/pypi/v/bcf-client?label=PyPI&amp;color=006dad" alt="PyPI"></a></td>
  </tr>
  <tr>
      <td>bonsai</td>
      <td>Add-on to Blender providing a graphical native IFC authoring platform</td>
      <td>GPL-3.0-or-later</td>
      <td><a href="https://bonsaibim.org/download.html"><img src="https://img.shields.io/badge/BonsaiBIM.org-Download-70ba35" alt="Official"></a> <a href="https://github.com/IfcOpenShell/IfcOpenShell/releases?q=bonsai&amp;expanded=true"><img src="https://img.shields.io/github/v/release/ifcopenshell/ifcopenshell?filter=bonsai-*&amp;label=GitHub-Unstable&amp;color=f6f8fa" alt="GitHub Unstable"></a> <a href="https://community.chocolatey.org/packages/blenderbim-nightly/"><img src="https://img.shields.io/chocolatey/v/blenderbim-nightly?label=Chocolatey&amp;color=5c9fd8" alt="Chocolatey"></a></td>
  </tr>
  <tr>
      <td>bsdd</td>
      <td>Library to query the bSDD API</td>
      <td>LGPL-3.0-or-later</td>
      <td><a href="https://pypi.org/project/bsdd/"><img src="https://img.shields.io/pypi/v/bsdd?label=PyPI&amp;color=006dad" alt="PyPI"></a></td>
  </tr>
  <tr>
      <td>ifc2ca</td>
      <td>Utility to convert IFC structural analysis models to Code_Aster</td>
      <td>LGPL-3.0-or-later</td>
      <td></td>
  </tr>
  <tr>
      <td>ifc4d</td>
      <td>Convert to and from IFC and project management software</td>
      <td>LGPL-3.0-or-later</td>
      <td><a href="https://pypi.org/project/ifc4d/"><img src="https://img.shields.io/pypi/v/ifc4d?label=PyPI&amp;color=006dad" alt="PyPI"></a></td>
  </tr>
  <tr>
      <td>ifc5d</td>
      <td>Report and optimise cost information from IFC</td>
      <td>LGPL-3.0-or-later</td>
      <td><a href="https://pypi.org/project/ifc5d/"><img src="https://img.shields.io/pypi/v/ifc5d?label=PyPI&amp;color=006dad" alt="PyPI"></a></td>
  </tr>
  <tr>
      <td>ifcbimtester</td>
      <td>Wrapper for Gherkin based unit testing for IFC models</td>
      <td>LGPL-3.0-or-later</td>
      <td></td>
  </tr>
  <tr>
      <td>ifcblender</td>
      <td>Historic Blender IFC import add-on</td>
      <td>LGPL-3.0-or-later*</td>
      <td></td>
  </tr>
  <tr>
      <td>ifccityjson</td>
      <td>Convert CityJSON to IFC</td>
      <td>LGPL-3.0-or-later</td>
      <td><a href="https://pypi.org/project/ifccityjson/"><img src="https://img.shields.io/pypi/v/ifccityjson?label=PyPI&amp;color=006dad" alt="PyPI"></a></td>
  </tr>
  <tr>
      <td>ifcclash</td>
      <td>Clash detection library and CLI app</td>
      <td>LGPL-3.0-or-later</td>
      <td><a href="https://pypi.org/project/ifcclash/"><img src="https://img.shields.io/pypi/v/ifcclash?label=PyPI&amp;color=006dad" alt="PyPI"></a></td>
  </tr>
  <tr>
      <td>ifcconvert</td>
      <td>CLI app to convert IFC to many other formats</td>
      <td>LGPL-3.0-or-later*</td>
      <td><a href="https://docs.ifcopenshell.org/ifcconvert/installation.html"><img src="https://img.shields.io/badge/IfcOpenShell.org-Download-70ba35" alt="Official"></a> <a href="https://github.com/IfcOpenShell/IfcOpenShell/releases?q=ifcconvert&amp;expanded=true"><img src="https://img.shields.io/github/v/release/ifcopenshell/ifcopenshell?filter=ifcconvert-*&amp;label=GitHub&amp;color=f6f8fa" alt="GitHub"></a></td>
  </tr>
  <tr>
      <td>ifccsv</td>
      <td>Library and CLI app to export and import schedules from IFC</td>
      <td>LGPL-3.0-or-later</td>
      <td><a href="https://pypi.org/project/ifccsv/"><img src="https://img.shields.io/pypi/v/ifccsv?label=PyPI&amp;color=006dad" alt="PyPI"></a></td>
  </tr>
  <tr>
      <td>ifcdiff</td>
      <td>Compare changes between IFC models</td>
      <td>LGPL-3.0-or-later</td>
      <td><a href="https://pypi.org/project/ifcdiff/"><img src="https://img.shields.io/pypi/v/ifcdiff?label=PyPI&amp;color=006dad" alt="PyPI"></a></td>
  </tr>
  <tr>
      <td>ifcfm</td>
      <td>Extract IFC data for FM handover requirements</td>
      <td>LGPL-3.0-or-later</td>
      <td><a href="https://pypi.org/project/ifcfm/"><img src="https://img.shields.io/pypi/v/ifcfm?label=PyPI&amp;color=006dad" alt="PyPI"></a></td>
  </tr>
  <tr>
      <td>ifcmax</td>
      <td>Historic extension for IFC support in 3DS Max</td>
      <td>LGPL-3.0-or-later*</td>
      <td><a href="https://docs.ifcopenshell.org/ifcmax.html"><img src="https://img.shields.io/badge/IfcOpenShell.org-Download-70ba35" alt="Official"></a></td>
  </tr>
  <tr>
      <td>ifcopenshell-python</td>
      <td>Python library for IFC manipulation</td>
      <td>LGPL-3.0-or-later*</td>
      <td><a href="https://docs.ifcopenshell.org/ifcopenshell-python/installation.html"><img src="https://img.shields.io/badge/IfcOpenShell.org-Download-70ba35" alt="Official"></a> <a href="https://github.com/IfcOpenShell/IfcOpenShell/releases?q=ifcopenshell-python&amp;expanded=true"><img src="https://img.shields.io/github/v/release/ifcopenshell/ifcopenshell?filter=ifcopenshell-python-*&amp;label=GitHub&amp;color=f6f8fa" alt="GitHub"></a> <a href="https://pypi.org/project/ifcopenshell/"><img src="https://img.shields.io/pypi/v/ifcopenshell?label=PyPI&amp;color=006dad" alt="PyPI"></a> <a href="https://anaconda.org/conda-forge/ifcopenshell"><img src="https://img.shields.io/conda/vn/conda-forge/ifcopenshell?label=Anaconda&amp;color=43b02a" alt="Anaconda"></a> <a href="https://anaconda.org/ifcopenshell/ifcopenshell"><img src="https://img.shields.io/conda/vn/ifcopenshell/ifcopenshell?label=Anaconda-Unstable&amp;color=43b02a" alt="Anaconda Unstable"></a> <a href="https://hub.docker.com/r/aecgeeks/ifcopenshell"><img src="https://img.shields.io/docker/pulls/aecgeeks/ifcopenshell?label=Docker&amp;color=1D63ED" alt="Docker"></a> <a href="https://aur.archlinux.org/packages/ifcopenshell"><img src="https://img.shields.io/aur/version/ifcopenshell?label=AUR&amp;color=1793d1" alt="AUR"></a> <a href="https://aur.archlinux.org/packages/ifcopenshell-git"><img src="https://img.shields.io/aur/version/ifcopenshell-git?label=AUR-Unstable&amp;color=1793d1" alt="AUR Unstable"></a></td>
  </tr>
  <tr>
      <td>ifcpatch</td>
      <td>Utility to run pre-packaged scripts to manipulate IFCs</td>
      <td>LGPL-3.0-or-later</td>
      <td><a href="https://pypi.org/project/ifcpatch/"><img src="https://img.shields.io/pypi/v/ifcpatch?label=PyPI&amp;color=006dad" alt="PyPI"></a></td>
  </tr>
  <tr>
      <td>ifcsverchok</td>
      <td>Blender Add-on for visual node programming with IFC</td>
      <td>GPL-3.0-or-later</td>
      <td><a href="https://github.com/IfcOpenShell/IfcOpenShell/releases?q=ifcsverchok&amp;expanded=true"><img src="https://img.shields.io/github/v/release/ifcopenshell/ifcopenshell?filter=ifcsverchok-*.*.*.*&amp;label=GitHub-Unstable&amp;color=f6f8fa" alt="GitHub Unstable"></a></td>
  </tr>
  <tr>
      <td>ifctester</td>
      <td>Library, CLI and webapp for IDS model auditing</td>
      <td>LGPL-3.0-or-later</td>
      <td><a href="https://pypi.org/project/ifctester/"><img src="https://img.shields.io/pypi/v/ifctester?label=PyPI&amp;color=006dad" alt="PyPI"></a></td>
  </tr>
</table>

Contents
--------

The IfcOpenShell C++ codebase is split into multiple interal libraries:

<table>
  <tr>
      <td>Name</td>
      <td>Description</td>
      <td>License</td>
  </tr>
  <tr>
      <td>ifcgeom</td>
      <td>Internal library for IfcOpenShell</td>
      <td>LGPL-3.0-or-later*</td>
  </tr>
  <tr>
      <td>ifcgeom_schema_agnostic</td>
      <td>Internal library for IfcOpenShell</td>
      <td>LGPL-3.0-or-later*</td>
  </tr>
  <tr>
      <td>ifcgeomserver</td>
      <td>Internal library for IfcOpenShell</td>
      <td>LGPL-3.0-or-later*</td>
  </tr>
  <tr>
      <td>ifcjni</td>
      <td>Internal library for IfcOpenShell</td>
      <td>LGPL-3.0-or-later*</td>
  </tr>
  <tr>
      <td>ifcparse</td>
      <td>Internal library for IfcOpenShell</td>
      <td>LGPL-3.0-or-later*</td>
  </tr>
  <tr>
      <td>ifcwrap</td>
      <td>Internal library for IfcOpenShell</td>
      <td>LGPL-3.0-or-later*</td>
  </tr>
  <tr>
      <td>qtviewer</td>
      <td>Internal library for IfcOpenShell</td>
      <td>LGPL-3.0-or-later*</td>
  </tr>
  <tr>
      <td>serializers</td>
      <td>Internal library for IfcOpenShell</td>
      <td>LGPL-3.0-or-later*</td>
  </tr>
</table>

<a href="https://github.com/IfcOpenShell/IfcOpenShell/tree/master/COPYING.LESSER" title="LGPL-3.0-or-later">LGPL</a>
<a href="https://technical.buildingsmart.org/standards/ifc/" title="IFC">IFC</a>
<a href="https://standards.buildingsmart.org/IFC/RELEASE/IFC2x3/TC1/HTML/" title="IFC2x3 TC1">IFC2x3 TC1</a>
<a href="https://standards.buildingsmart.org/IFC/RELEASE/IFC4/ADD2_TC1/HTML/" title="IFC4 Add2 TC1">IFC4 Add2 TC1</a>
<a href="https://www.visualstudio.com/" title="Visual Studio">Visual Studio</a>
<a href="http://landinghub.visualstudio.com/visual-cpp-build-tools" title="Visual C++ Build Tools">Visual C++ Build Tools</a>
<a href="https://msys2.github.io/" title="MSYS2">MSYS2</a>
<a href="https://github.com/IfcOpenShell/IfcOpenShell/tree/master/win/readme.md" title="win/readme.md">win/readme.md</a>
<a href="https://github.com/IfcOpenShell/IfcOpenShell/tree/master/nix/build-all.py" title="nix/build-all.py">nix/build-all.py</a>


Current build status
====================


<table>
    
  <tr>
    <td>Azure</td>
    <td>
      <details>
        <summary>
          <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=6954&branchName=main">
            <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/ifcopenshell-feedstock?branchName=main">
          </a>
        </summary>
        <table>
          <thead><tr><th>Variant</th><th>Status</th></tr></thead>
          <tbody><tr>
              <td>linux_64_python3.10.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=6954&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/ifcopenshell-feedstock?branchName=main&jobName=linux&configuration=linux%20linux_64_python3.10.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>linux_64_python3.11.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=6954&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/ifcopenshell-feedstock?branchName=main&jobName=linux&configuration=linux%20linux_64_python3.11.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>linux_64_python3.12.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=6954&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/ifcopenshell-feedstock?branchName=main&jobName=linux&configuration=linux%20linux_64_python3.12.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>linux_64_python3.13.____cp313</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=6954&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/ifcopenshell-feedstock?branchName=main&jobName=linux&configuration=linux%20linux_64_python3.13.____cp313" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>linux_64_python3.9.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=6954&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/ifcopenshell-feedstock?branchName=main&jobName=linux&configuration=linux%20linux_64_python3.9.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>linux_aarch64_python3.10.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=6954&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/ifcopenshell-feedstock?branchName=main&jobName=linux&configuration=linux%20linux_aarch64_python3.10.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>linux_aarch64_python3.11.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=6954&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/ifcopenshell-feedstock?branchName=main&jobName=linux&configuration=linux%20linux_aarch64_python3.11.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>linux_aarch64_python3.12.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=6954&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/ifcopenshell-feedstock?branchName=main&jobName=linux&configuration=linux%20linux_aarch64_python3.12.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>linux_aarch64_python3.13.____cp313</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=6954&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/ifcopenshell-feedstock?branchName=main&jobName=linux&configuration=linux%20linux_aarch64_python3.13.____cp313" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>linux_aarch64_python3.9.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=6954&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/ifcopenshell-feedstock?branchName=main&jobName=linux&configuration=linux%20linux_aarch64_python3.9.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>osx_64_python3.10.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=6954&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/ifcopenshell-feedstock?branchName=main&jobName=osx&configuration=osx%20osx_64_python3.10.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>osx_64_python3.11.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=6954&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/ifcopenshell-feedstock?branchName=main&jobName=osx&configuration=osx%20osx_64_python3.11.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>osx_64_python3.12.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=6954&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/ifcopenshell-feedstock?branchName=main&jobName=osx&configuration=osx%20osx_64_python3.12.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>osx_64_python3.13.____cp313</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=6954&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/ifcopenshell-feedstock?branchName=main&jobName=osx&configuration=osx%20osx_64_python3.13.____cp313" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>osx_64_python3.9.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=6954&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/ifcopenshell-feedstock?branchName=main&jobName=osx&configuration=osx%20osx_64_python3.9.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>osx_arm64_python3.10.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=6954&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/ifcopenshell-feedstock?branchName=main&jobName=osx&configuration=osx%20osx_arm64_python3.10.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>osx_arm64_python3.11.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=6954&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/ifcopenshell-feedstock?branchName=main&jobName=osx&configuration=osx%20osx_arm64_python3.11.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>osx_arm64_python3.12.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=6954&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/ifcopenshell-feedstock?branchName=main&jobName=osx&configuration=osx%20osx_arm64_python3.12.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>osx_arm64_python3.13.____cp313</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=6954&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/ifcopenshell-feedstock?branchName=main&jobName=osx&configuration=osx%20osx_arm64_python3.13.____cp313" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>osx_arm64_python3.9.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=6954&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/ifcopenshell-feedstock?branchName=main&jobName=osx&configuration=osx%20osx_arm64_python3.9.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>win_64_python3.10.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=6954&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/ifcopenshell-feedstock?branchName=main&jobName=win&configuration=win%20win_64_python3.10.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>win_64_python3.11.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=6954&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/ifcopenshell-feedstock?branchName=main&jobName=win&configuration=win%20win_64_python3.11.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>win_64_python3.12.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=6954&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/ifcopenshell-feedstock?branchName=main&jobName=win&configuration=win%20win_64_python3.12.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>win_64_python3.13.____cp313</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=6954&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/ifcopenshell-feedstock?branchName=main&jobName=win&configuration=win%20win_64_python3.13.____cp313" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>win_64_python3.9.____cpython</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=6954&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/ifcopenshell-feedstock?branchName=main&jobName=win&configuration=win%20win_64_python3.9.____cpython" alt="variant">
                </a>
              </td>
            </tr>
          </tbody>
        </table>
      </details>
    </td>
  </tr>
</table>

Current release info
====================

| Name | Downloads | Version | Platforms |
| --- | --- | --- | --- |
| [![Conda Recipe](https://img.shields.io/badge/recipe-ifcopenshell-green.svg)](https://anaconda.org/conda-forge/ifcopenshell) | [![Conda Downloads](https://img.shields.io/conda/dn/conda-forge/ifcopenshell.svg)](https://anaconda.org/conda-forge/ifcopenshell) | [![Conda Version](https://img.shields.io/conda/vn/conda-forge/ifcopenshell.svg)](https://anaconda.org/conda-forge/ifcopenshell) | [![Conda Platforms](https://img.shields.io/conda/pn/conda-forge/ifcopenshell.svg)](https://anaconda.org/conda-forge/ifcopenshell) |

Installing ifcopenshell
=======================

Installing `ifcopenshell` from the `conda-forge` channel can be achieved by adding `conda-forge` to your channels with:

```
conda config --add channels conda-forge
conda config --set channel_priority strict
```

Once the `conda-forge` channel has been enabled, `ifcopenshell` can be installed with `conda`:

```
conda install ifcopenshell
```

or with `mamba`:

```
mamba install ifcopenshell
```

It is possible to list all of the versions of `ifcopenshell` available on your platform with `conda`:

```
conda search ifcopenshell --channel conda-forge
```

or with `mamba`:

```
mamba search ifcopenshell --channel conda-forge
```

Alternatively, `mamba repoquery` may provide more information:

```
# Search all versions available on your platform:
mamba repoquery search ifcopenshell --channel conda-forge

# List packages depending on `ifcopenshell`:
mamba repoquery whoneeds ifcopenshell --channel conda-forge

# List dependencies of `ifcopenshell`:
mamba repoquery depends ifcopenshell --channel conda-forge
```


About conda-forge
=================

[![Powered by
NumFOCUS](https://img.shields.io/badge/powered%20by-NumFOCUS-orange.svg?style=flat&colorA=E1523D&colorB=007D8A)](https://numfocus.org)

conda-forge is a community-led conda channel of installable packages.
In order to provide high-quality builds, the process has been automated into the
conda-forge GitHub organization. The conda-forge organization contains one repository
for each of the installable packages. Such a repository is known as a *feedstock*.

A feedstock is made up of a conda recipe (the instructions on what and how to build
the package) and the necessary configurations for automatic building using freely
available continuous integration services. Thanks to the awesome service provided by
[Azure](https://azure.microsoft.com/en-us/services/devops/), [GitHub](https://github.com/),
[CircleCI](https://circleci.com/), [AppVeyor](https://www.appveyor.com/),
[Drone](https://cloud.drone.io/welcome), and [TravisCI](https://travis-ci.com/)
it is possible to build and upload installable packages to the
[conda-forge](https://anaconda.org/conda-forge) [anaconda.org](https://anaconda.org/)
channel for Linux, Windows and OSX respectively.

To manage the continuous integration and simplify feedstock maintenance
[conda-smithy](https://github.com/conda-forge/conda-smithy) has been developed.
Using the ``conda-forge.yml`` within this repository, it is possible to re-render all of
this feedstock's supporting files (e.g. the CI configuration files) with ``conda smithy rerender``.

For more information please check the [conda-forge documentation](https://conda-forge.org/docs/).

Terminology
===========

**feedstock** - the conda recipe (raw material), supporting scripts and CI configuration.

**conda-smithy** - the tool which helps orchestrate the feedstock.
                   Its primary use is in the construction of the CI ``.yml`` files
                   and simplify the management of *many* feedstocks.

**conda-forge** - the place where the feedstock and smithy live and work to
                  produce the finished article (built conda distributions)


Updating ifcopenshell-feedstock
===============================

If you would like to improve the ifcopenshell recipe or build a new
package version, please fork this repository and submit a PR. Upon submission,
your changes will be run on the appropriate platforms to give the reviewer an
opportunity to confirm that the changes result in a successful build. Once
merged, the recipe will be re-built and uploaded automatically to the
`conda-forge` channel, whereupon the built conda packages will be available for
everybody to install and use from the `conda-forge` channel.
Note that all branches in the conda-forge/ifcopenshell-feedstock are
immediately built and any created packages are uploaded, so PRs should be based
on branches in forks and branches in the main repository should only be used to
build distinct package versions.

In order to produce a uniquely identifiable distribution:
 * If the version of a package **is not** being increased, please add or increase
   the [``build/number``](https://docs.conda.io/projects/conda-build/en/latest/resources/define-metadata.html#build-number-and-string).
 * If the version of a package **is** being increased, please remember to return
   the [``build/number``](https://docs.conda.io/projects/conda-build/en/latest/resources/define-metadata.html#build-number-and-string)
   back to 0.

Feedstock Maintainers
=====================

* [@Krande](https://github.com/Krande/)
* [@adrianinsaval](https://github.com/adrianinsaval/)
* [@looooo](https://github.com/looooo/)

