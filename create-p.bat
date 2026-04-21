@echo off
:: Descripcion: Crea proyectos React (CRA o Vite)
setlocal
color 0a
cls
echo ==========================================
echo    NUEVO PROYECTO REACT
echo ==========================================
echo  [1] Create-React-App (Antigua)
echo  [2] Vite + React (Moderna/Veloz)
echo.
set /p op="Selecciona: "
set /p nom="Nombre del proyecto: "

if "%op%"=="1" (
    npx create-react-app %nom%
) else (
    npm create vite@latest %nom% -- --template react
)
echo.
echo [+] Proyecto %nom% creado.
pause