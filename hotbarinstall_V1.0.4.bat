@echo off
::--------------------------------------------------------------------------------------------------::
set ver=1.0.4
set log=HotbarInstall_LOG_%date%_R%random%.txt
set logdir=HI_LOGS
set "HIdir=%~dp0"
set "HIdir=%HIdir:~0,-1%"

set "BLUE=[94m"
set "RED=[91m"
set "YELLOW=[93m"
set "GREEN=[92m"
set "CYAN=[96m"
set "MAGENTA=[95m"
set "RESET=[0m"

taskkill /F /IM javaw.exe
title Minecraft custom hotbar installer V%ver%
mode 30, 15
::--------------------------------------------------------------------------------------------------::
:mnu
CLS

echo  %BLUE%# # # # # # # # # # # # # #
echo    %CYAN%HOTBARINSTALLER %YELLOW%V%ver%
echo  %BLUE%# # # # # # # # # # # # # #
echo.
echo %CYAN%Hotbar file name:
echo.
set /P htbrnme="  "


if not exist "%htbrnme%" (
    CLS
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo      %RED%File does not exist.
    timeout>NUL /T 3 /NOBREAK
    goto mnu
) else (
    goto rn
)


:rn
ren %htbrnme% hotbar.nbt

::--------------------------------------------------------------------------------------------------::
CLS
::--------------------------------------------------------------------------------------------------::
:PTHH
CLS
echo  %BLUE%# # # # # # # # # # # # # #
echo    %CYAN%HOTBARINSTALLER %YELLOW%V%ver%
echo  %BLUE%# # # # # # # # # # # # # #
echo.
echo %CYAN%Minecraft path:
echo.
echo %YELLOW%[1] for default.%CYAN%
echo.
set /P mcpth="  "

if "%mcpth%"=="1" set mcpth=%appdata%\.minecraft


if "%mcpth%"=="%HIdir%" (
    CLS
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo   %RED%Cannot be in the same dir.
    timeout>NUL /T 3 /NOBREAK
    goto PTHH
) else (
    CLS
    goto PPCFF
)
:PPCFF


if exist "%mcpth%" (
    CLS
    goto PPCDD
) else (
    CLS
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo         %RED%Dir not found.
    timeout>NUL /T 3 /NOBREAK
    goto PTHH
)
:PPCDD


del %mcpth%\hotbar.nbt
CLS
echo %GREEN%
echo.
echo.
echo.
echo.
echo.
echo         Wait 5 seconds.
timeout>NUL /T 5 /NOBREAK
CLS
copy hotbar.nbt %mcpth%
CLS
del hotbar.nbt
::--------------------------------------------------------------------------------------------------::
MD %logdir% > %log%
echo. >> %log%
echo %date% >> %log%
time /t >> %log%
echo. >> %log%
echo [1] Tried to rename %htbrnme% to hotbar.nbt >> %log%
echo [2] Tried to delete %mcpth%\hotbar.nbt >> %log%
echo [3] Tried to copy hotbar.nbt to %mcpth% >> %log%
echo [4] Tried to delete hotbar.nbt from current dir.>> %log%

copy %log% %logdir%
del %log%
::--------------------------------------------------------------------------------------------------::
CLS
echo.
echo.
echo.
echo.
echo.
echo.
echo   Click any button to close.
pause>NUL
exit