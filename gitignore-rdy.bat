@echo off
:: Descripcion: Crea un .gitignore completo e inicializa Git
setlocal
color 0f
cls
echo ==========================================
echo    CONFIGURANDO REPOSITORIO GIT
echo ==========================================
echo [+] Creando .gitignore pro...
(
echo node_modules/
echo .env
echo .env.local
echo .DS_Store
echo __pycache__/
echo .vscode/
echo dist/
echo build/
echo *.sqlite
) > .gitignore

echo [+] Inicializando Git...
git init
echo.
echo [✔] Repo listo con .gitignore configurado.
pause