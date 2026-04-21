@echo off
:: Descripcion: Lista proyectos, entra en ellos y abre VS Code
setlocal enabledelayedexpansion
cls
color 0b
echo ==========================================
echo    DIRECTORIO DE PROYECTOS
echo ==========================================
set i=0
for /d %%f in (*) do (
    set /a i+=1
    set "folder!i!=%%f"
    if !i! lss 10 (echo  [!i!]  %%f) else (echo  [!i!] %%f)
)
echo ------------------------------------------
set /p sel=" >> ID del proyecto: "
if not defined folder%sel% (goto :final)

set "target=!folder%sel%!"
code "%target%"
echo cd /d "%target%" > %temp%\ir.bat

:final
endlocal
if exist %temp%\ir.bat (
    %temp%\ir.bat
    del %temp%\ir.bat
)