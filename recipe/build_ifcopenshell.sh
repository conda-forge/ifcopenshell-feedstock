#!/bin/bash

# IF osx use file lib suffix .dylib
# IF linux use file lib suffix .so
# IF windows use file lib suffix .dll

if [ "$(uname)" == "Darwin" ]; then
    export FSUFFIX=dylib
    export LDFLAGS="$LDFLAGS -Wl,-flat_namespace,-undefined,suppress"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    export FSUFFIX=so
fi

# Cmake files from a newer commit (349cbf27) that fixes build issues with HDF5 on osx and linux arch64
# Copy contents explicitly to avoid creating cmake/cmake/ nesting
cp "${RECIPE_DIR}/config/cmake/"* "${SRC_DIR}/cmake/"

# Remove the upstream HDF5Config.cmake to prevent it from interfering with our custom FindHDF5.cmake
# This ensures find_package(HDF5) uses Module mode and finds our new file.
rm "${SRC_DIR}/cmake/HDF5Config.cmake" || true

cmake ${CMAKE_ARGS} -G Ninja \
 -DSCHEMA_VERSIONS="2x3;4;4x1;4x3_add2" \
 -DCMAKE_BUILD_TYPE=Release \
 -DCMAKE_INSTALL_PREFIX=$PREFIX \
 ${CMAKE_PLATFORM_FLAGS[@]} \
 -DCMAKE_PREFIX_PATH=$PREFIX \
 -DCMAKE_SYSTEM_PREFIX_PATH=$PREFIX \
 -DPYTHON_EXECUTABLE:FILEPATH=$PYTHON \
 -DPython_ROOT_DIR:PATH=$PREFIX \
 -DGMP_LIBRARY_DIR=$PREFIX/lib \
 -DMPFR_LIBRARY_DIR=$PREFIX/lib \
 -DOCC_INCLUDE_DIR=$PREFIX/include/opencascade \
 -DOCC_LIBRARY_DIR=$PREFIX/lib \
 -DHDF5_SUPPORT:BOOL=ON \
 -DHDF5_INCLUDE_DIR=$PREFIX/include \
 -DHDF5_LIBRARY_DIR=$PREFIX/lib \
 -DHDF5_C_COMPILER_EXECUTABLE=FALSE \
 -DHDF5_CXX_COMPILER_EXECUTABLE=FALSE \
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
 ./cmake

ninja

ninja install -j 1

python "${RECIPE_DIR}/update_version_init.py" "${PKG_VERSION}" "${SP_DIR}/ifcopenshell/__init__.py"
