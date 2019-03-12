@echo off
set BAT_HOME=%~dp0
echo %BAT_HOME%
cd %BAT_HOME%
echo %0
echo %~d0
echo %~p0
echo %~dp0
echo %~x0
echo %~s0
echo %~sp0
for /r %%i in (*) do echo %%i
echo "%date:~0,4%-%date:~5,2%-%date:~8,2% 
echo.    ^<resourceDir^>/%basedir%/resources^</resourceDir^>
:: for /f "tokens=2-4 delims=/- " %a in ('DATE/T') do echo %c%b%a
pause