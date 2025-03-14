#!/bin/bash

if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" != "1" ]]; then
  if [[ "${target_platform}" == linux* ]]; then
    cmake -B build --preset=linux_conda_raspalib
  elif [[ "${target_platform}" == osx-* ]]; then
    cmake -B build --preset=mac_conda_raspalib
  fi
else
  if [[ "${target_platform}" == linux* ]]; then
    cmake -B build --preset=linux_conda_raspalib ${CMAKE_ARGS}
  elif  [[ "${target_platform}" == osx-* ]]; then
    cmake -B build --preset=mac_conda_raspalib ${CMAKE_ARGS}
  fi
fi

ninja -C build install -v
