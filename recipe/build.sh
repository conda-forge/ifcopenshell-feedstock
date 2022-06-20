mkdir build && cd build

# this disables linking to python DSO
if [ `uname` == Darwin ]; then
    export  LDFLAGS="$LDFLAGS  -Wl,-flat_namespace,-undefined,suppress"
	LIBXML2="$PREFIX/lib/libxml2.dylib"
else
	LIBXML2="$PREFIX/lib/libxml2.so"
fi

cmake -G "Ninja" \
 -D CMAKE_BUILD_TYPE:STRING=Release \
 -D CMAKE_INSTALL_PREFIX:FILEPATH=$PREFIX \
 -D CMAKE_PREFIX_PATH:FILEPATH=$PREFIX \
 -D CMAKE_SYSTEM_PREFIX_PATH:FILEPATH=$PREFIX \
 -D OCC_INCLUDE_DIR:FILEPATH=$PREFIX/include/opencascade \
 -D OCC_LIBRARY_DIR:FILEPATH=$PREFIX/lib \
 -D PYTHON_EXECUTABLE:FILEPATH=$PYTHON \
 -D COLLADA_SUPPORT:BOOL=OFF \
 -D BUILD_EXAMPLES:BOOL=OFF \
 -D BUILD_GEOMSERVER:BOOL=OFF \
 -D BUILD_CONVERT:BOOL=OFF \
 -D BUILD_IFCMAX:BOOL=OFF \
 -D IFCXML_SUPPORT:BOOL=ON \
 -D LIBXML2_INCLUDE_DIR:FILEPATH=$PREFIX/include/libxml2 \
 -D LIBXML2_LIBRARIES:FILEPATH=${LIBXML2} \
 -D CGAL_INCLUDE_DIR:FILEPATH="$PREFIX/include/CGAL/" \
 -D GMP_INCLUDE_DIR:FILEPATH="$PREFIX/include" \
 -D MPFR_INCLUDE_DIR:FILEPATH="$PREFIX/include" \
 -D CGAL_LIBRARY_DIR:FILEPATH="$PREFIX/lib" \
 -D GMP_LIBRARY_DIR:FILEPATH="$PREFIX/lib" \
 -D MPFR_LIBRARY_DIR:FILEPATH="$PREFIX/lib" \
 ../cmake

ninja install
