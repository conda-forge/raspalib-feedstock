cmake -B build -G "Ninja Multi-Config" --preset windows_conda_raspalib %CMAKE_ARGS% -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=%PREFIX% -DCMAKE_POLICY_VERSION_MINIMUM=3.32
if errorlevel 1 exit 1
cmake --build build --config Release -v
if errorlevel 1 exit 1
ninja -C build install -v
if errorlevel 1 exit 1
