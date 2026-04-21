@echo off
:: Descripcion: Muestra esta lista de comandos disponibles
setlocal enabledelayedexpansion
title Centro de Ayuda
color 0b
cls

echo ==========================================================
echo    MIS HERRAMIENTAS DE DESARROLLO
echo ==========================================================
echo  COMANDO        DESCRIPCION
echo ----------------------------------------------------------

set "folder=%~dp0"
for %%f in ("%folder%*.bat") do (
    set "name=%%~nf        "
    set "displayName=!name:~0,14!"
    set "desc=Sin descripcion."
    for /f "tokens=2 delims=:" %%a in ('findstr /c:":: Descripcion:" "%%f" 2^>nul') do (
        set "desc=%%a"
    )
    echo  !displayName! !desc!
)
echo ----------------------------------------------------------
echo.
pause