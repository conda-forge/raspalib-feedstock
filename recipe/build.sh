#!/bin/bash

if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" != "1" ]]; then
  if [[ "${target_platform}" == linux* ]]; then
    cmake -B build --preset=linux_conda_raspalib -DCMAKE_POLICY_VERSION_MINIMUM=3.32
  elif [[ "${target_platform}" == osx-* ]]; then
    cmake -B build --preset=mac_conda_raspalib -DCMAKE_POLICY_VERSION_MINIMUM=3.32
  fi
else
  if [[ "${target_platform}" == linux* ]]; then
    cmake -B build --preset=linux_conda_raspalib ${CMAKE_ARGS} -DCMAKE_POLICY_VERSION_MINIMUM=3.32
  elif  [[ "${target_platform}" == osx-* ]]; then
    cmake -B build --preset=mac_conda_raspalib ${CMAKE_ARGS} -DCMAKE_POLICY_VERSION_MINIMUM=3.32
  fi
fi

ninja -C build install -v
