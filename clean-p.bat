@echo off
:: Descripcion: Borra node_modules y reinstall para limpiar el proyecto
setlocal
color 0c
cls
echo ==========================================
echo    LIMPIEZA PROFUNDA DE PROYECTO
echo ==========================================
echo.
echo [!] Se eliminara node_modules y package-lock.json
set /p conf="¿Estas seguro? (s/n): "

if /i "%conf%"=="s" (
    echo [+] Borrando carpetas... (esto puede tardar)
    rmdir /s /q node_modules 2>nul
    del /f /q package-lock.json 2>nul
    
    echo [+] Reinstalando dependencias...
    call npm install
    
    echo.
    echo [✔] Proyecto limpio y dependencias frescas.
) else (
    echo [x] Operacion cancelada.
)
pause