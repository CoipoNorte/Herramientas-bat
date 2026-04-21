@echo off
:: Descripcion: Init npm (ESM), crea index.js y configura scripts
setlocal enabledelayedexpansion
color 0b
cls
echo ==========================================
echo    INIT PROYECTO: ESTILO COIPONORTE
echo ==========================================

:: 1. Inicializar npm
echo [1/3] Creando package.json...
call npm init -y > nul

:: 2. Obtener nombre de la carpeta
for %%I in (.) do set "folderName=%%~nxI"

:: 3. Refactor con NODE para inyectar Type: Module y Scripts
echo [2/3] Configurando entorno ESM y Scripts...
node -e "const fs = require('fs'); const pkg = JSON.parse(fs.readFileSync('package.json', 'utf8')); pkg.type = 'module'; pkg.description = 'Proyecto: %folderName%'; pkg.scripts = { ...pkg.scripts, start: 'node index.js', dev: 'node index.js' }; fs.writeFileSync('package.json', JSON.stringify(pkg, null, 2));"

:: 4. Crear index.js si no existe
echo [3/3] Creando archivo principal...
if not exist index.js (
    echo console.log('🚀 Proyecto %folderName% iniciado'^); > index.js
)

echo.
echo ==========================================
echo    TODO LISTO - A CODEAR SE HA DICHO
echo ==========================================
pause