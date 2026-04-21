@echo off
:: Descripcion: Limpia temporales de Windows y cache de npm
setlocal
color 0e
cls
echo ==========================================
echo    LIMPIEZA DE SISTEMA Y NPM
echo ==========================================
echo [+] Borrando temporales de Windows...
del /s /f /q %temp%\*.* >nul 2>&1
rd /s /q %temp% >nul 2>&1
md %temp%

echo [+] Limpiando cache de npm (force)...
call npm cache clean --force

echo.
echo [✔] ¡Listo! PC y Node como nuevos.
pause