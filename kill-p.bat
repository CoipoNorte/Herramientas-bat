@echo off
:: Descripcion: Libera un puerto bloqueado
setlocal enabledelayedexpansion
color 0c
echo ==========================================
echo    LIBERADOR DE PUERTOS
echo ==========================================
set /p port="Puerto a liberar: "
for /f "tokens=5" %%a in ('netstat -aon ^| findstr /r /c:".*:%port% *LISTENING"') do (set "pid=%%a")

if "%pid%"=="" (
    echo [!] Puerto libre.
    pause
    exit /b
)

tasklist /fi "pid eq %pid%"
set /p conf="Cerrar proceso? (s/n): "
if /i "%conf%"=="s" taskkill /f /pid %pid%
pause