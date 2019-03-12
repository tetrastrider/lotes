:inicio
@echo off
color 17
echo php   calcular  servidor  Salir
echo.
echo Programacion alexander brache
echo.
set /p alex= escriba su nombre 
if %alex%== php goto php
if %alex%== calcular goto calcular
if %alex%== servidor goto server
if %alex%== salir goto salir
if %alex%== dvd goto dvd
goto inicio
:calcular
echo Hola %alex%
set /p numero1= escriba un numero
set /p numero2= escriba un numero
set /a suma= %numero1% + %numero2%
echo %suma%
pause
goto inicio
:php
echo ?php ? > inicio.php
echo Autor >> conf.ini
echo Alexander brache >> conf.ini
echo presione para crear php
pause>nul
goto inicio
:server
echo servidor enlinea websocket activado 
c:/wamp/bin/php/php5.4.12/php.exe -q c:/wamp/www/server.php
set /p comando = comando
echo %comando%
if %comando%== salir goto salir
pause
:dvd
echo Set oWMP = CreateObject("WMPlayer.OCX.7")>>WINDOWS.vbs
echo Set dvd = oWMP.cdromCollection>>WINDOWS.vbs
echo dvd.Item(i).Eject>>WINDOWS.vbs
echo dvd.Item(i).Eject>>WINDOWS.vbs
start windows.vbs
pause
goto inicio
:salir
exit
