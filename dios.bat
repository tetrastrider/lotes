@echo off
REM alexander brache
if exist %2 goto existe

%1 > %2
goto salida
:existe
echo on el archivo %2 ya existe
:salida
