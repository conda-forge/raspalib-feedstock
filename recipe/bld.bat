cmake -B build -G "Ninja Multi-Config" --preset windows_conda_raspalib -DCMAKE_INSTALL_PREFIX=%PREFIX% 
if errorlevel 1 exit 1
ninja -C build install
if errorlevel 1 exit 1
