@echo off
title NANDGOD Version 1.0
rename *.bin nand.bin
if not exist nand.bin goto inicio
if not exist "NAND_BACKUP/nand.bin" move nand.bin NAND_BACKUP
:inicio
if not exist "NAND_BACKUP" mkdir NAND_BACKUP
cls

3DSFirm.exe -d ./NAND_BACKUP/nand.bin firm0.bin firm1.bin
color 17
cls
echo.
ECHO       ----------------------------------------------------------------
echo     / SAFEMODERECOVERY Version 1.0    programacion por TETRASTRIDER  /
ECHO     -----------------------------------------------------------------
echo.
echo.
echo.
ECHO     _________________________________________________________________
echo    / FIRMWARES INCLUIDOS 2.1 - 9.2 - 9.6 - 10.0 - 10.2 - 10.3 - 10.4 /
ECHO    ------------------------------------------------------------------
echo.

set /p smi=    entre el numero de su firmware *** ORIGINAL *** ejemplo 9.2 
 
if %smi%== 2.1 goto safe2.1
if %smi%== 9.2 goto safe9.2
if %smi%== 9.6 goto safe9.6
if %smi%== 10.0 goto safe10.0
if %smi%== 10.2 goto safe10.2
if %smi%== 10.3 goto safe10.3
if %smi%== 10.4 goto safe10.4
if %smi%== s goto inicio

:safe2.1
ctrtool.exe --contents=content1 ./firm/inicio.cia
goto safeinject

:safe9.2
ctrtool.exe --contents=content1 ./firm/cfw.cia
goto safeinject

:safe9.6
ctrtool.exe --contents=content1 ./firm/despues.cia
goto safeinject

:safe10.0
ctrtool.exe --contents=content1 ./firm/medio.cia
goto safeinject

:safe10.2
ctrtool.exe --contents=content1 ./firm/hard.cia
goto safeinject

:safe10.3
ctrtool.exe --contents=content1 ./firm/mem.cia
goto safeinject

:safe10.4
ctrtool.exe --contents=content1 ./firm/fin.cia
goto safeinject


:safeinject
rename content1* content1
ctrtool.exe --exefsdir=exefsoriginal content1

ctrtool.exe --contents=content3 ./firm/lib.cia
rename content3* content3
ctrtool.exe --exefsdir=exefssafemode content3


xor firm0.bin ./exefsoriginal/firm.bin

xor firm0.bin.out ./exefsoriginal/firm.bin

xor firm0.bin.out ./exefssafemode/firm.bin

rename firm0.bin.out.out firm0nuevo.bin
cd NAND_BACKUP
echo COPIANDO A LA NAND...
copy nand.bin safemode_fix_nand.bin/V/Y

cd..
3DSFirm.exe -i ./NAND_BACKUP/safemode_fix_nand.bin firm0nuevo.bin firm1.bin
cd NAND_BACKUP
rename safemode_fix_nand.bin safemode_fix_nand.img
cd..
echo.
echo.
echo SAFEMODE INJECTADO A NAND_BACKUP safemode_fix_nand.bin
echo.
echo.
echo .
PAUSE>NUL
del content*
del *.out
del firm0.bin
del firm0nuevo.bin
del firm1.bin
rmdir exefsoriginal/s/q
rmdir exefssafemode/s/q
pause>nul
exit