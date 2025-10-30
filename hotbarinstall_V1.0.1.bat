@echo off
::--------------------------------------------------------------------------------------------------::
set ver=1.0.1
set log=HotbarInstall_LOG_%date%_R%random%.txt

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
echo  %BLUE%# # # # # # # # # # # # # #
echo    %CYAN%HOTBARINSTALLER %YELLOW%V%ver%
echo  %BLUE%# # # # # # # # # # # # # #
echo.
echo %CYAN%Hotbar file name:
echo.
set /P htbrnme="  "
ren %htbrnme% hotbar.nbt
::--------------------------------------------------------------------------------------------------::
CLS
::--------------------------------------------------------------------------------------------------::
echo  %BLUE%# # # # # # # # # # # # # #
echo    %CYAN%HOTBARINSTALLER %YELLOW%V%ver%
echo  %BLUE%# # # # # # # # # # # # # #
echo.
echo %CYAN%Minecraft path:
echo.
echo %YELLOW%[1] for default.%CYAN%
echo.
set /P mcpth="  "
if "%mcpth%"=="1" set mcpth=C:\users\%username%\appdata\roaming\.minecraft
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
::--------------------------------------------------------------------------------------------------::
echo %date% > %log%
time /t >> %log%
echo. >> %log%
echo [1] Tried to rename %htbrnme% to hotbar.nbt >> %log%
echo [2] Tried to delete %mcpth%\hotbar.nbt >> %log%
echo [3] Tried to copy hotbar.nbt to %mcpth% >> %log%
::--------------------------------------------------------------------------------------------------::
echo.
echo.
echo.
echo.
echo.
echo.
echo   Click any button to close.
pause>NUL
exit