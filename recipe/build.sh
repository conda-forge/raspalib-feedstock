#!/bin/bash
if [[ "$CONDA_BUILD_CROSS_COMPILATION" != "1" ]]; then
  cmake -B build --preset conda_raspalib -DCMAKE_INSTALL_PREFIX=${PREFIX}
else
  cmake ${CMAKE_ARGS} -B build --preset conda_raspalib -DCMAKE_INSTALL_PREFIX=${PREFIX} -DCMAKE_OSX_ARCHITECTURES="arm64"
fi
ninja -C build install
