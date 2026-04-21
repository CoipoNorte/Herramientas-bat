@echo off
:: Descripcion: Clona un repo, instala dependencias y levanta Back y Front
setlocal
color 0d
cls
echo ==================================================
echo    ORQUESTADOR DE PROYECTO FULLSTACK
echo ==================================================
echo.

set /p repo="Introduce la URL de GitHub: "
set /p folder="Nombre de la carpeta destino: "

echo [+] Clonando...
git clone %repo% %folder%
cd /d %folder%

echo [+] Abriendo VS Code...
start code .

:: Instalacion y arranque del Backend
echo [+] Lanzando ventana de Backend...
start cmd /k "title BACKEND - %folder% && cd backend && npm install && npm run dev"

:: Instalacion y arranque del Frontend
echo [+] Lanzando ventana de Frontend...
start cmd /k "title FRONTEND - %folder% && cd frontend && npm install && npm run dev"

echo.
echo [!] Esperando a que los servidores arranquen...
timeout /t 8 /nobreak > nul
start http://localhost:5173

echo ==================================================
echo    PROCESO COMPLETADO
echo ==================================================
pause