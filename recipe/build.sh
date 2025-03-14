#!/bin/bash
if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" != "1" || "${CROSSCOMPILING_EMULATOR:-}" != "" ]]; then
  if [[ "${target_platform}" == linux-64 ]]; then
    cmake -B build --preset linux_conda_raspalib -DCMAKE_INSTALL_PREFIX=${PREFIX}
  elif [[ "${target_platform}" == osx-* ]]; then
    cmake ${CMAKE_ARGS} -B build --preset mac_conda_raspalib -DCMAKE_INSTALL_PREFIX=${PREFIX}
  fi
else
  if [[ "${target_platform}" == linux-ppc64le ]]; then
    cmake ${CMAKE_ARGS} -B build --preset linux_conda_raspalib -DCMAKE_INSTALL_PREFIX=${PREFIX}
  elif [[ "${target_platform}" == linux-aarch64 ]]; then
    cmake ${CMAKE_ARGS} -B build --preset linux_conda_raspalib -DCMAKE_INSTALL_PREFIX=${PREFIX}
  elif  [[ "${target_platform}" == osx-* ]]; then
    cmake ${CMAKE_ARGS} -B build --preset mac_conda_raspalib -DCMAKE_INSTALL_PREFIX=${PREFIX} -DCMAKE_OSX_ARCHITECTURES="arm64"
  fi
fi
ninja -C build install -v

