@echo off
:: Descripcion: Menu estilo Vite con flechas y descripciones fijas
setlocal enabledelayedexpansion
title Terminal CoipoNorte

:: Habilitar soporte de colores ANSI en la consola de Windows
reg add HKCU\Console /v VirtualTerminalLevel /t REG_DWORD /d 1 /f >nul 2>&1

:init
set "folder=%~dp0"
set "me=%~nx0"
set count=0

:: Cargamos los archivos en memoria
for %%f in ("%folder%*.bat") do (
    set "filename=%%~nxf"
    if /i not "!filename!"=="%me%" (
        set /a count+=1
        set "cmd!count!=%%~nf"
        set "file!count!=%%~f"
        set "desc!count!=Sin descripcion."
        for /f "tokens=2 delims=:" %%a in ('findstr /c:":: Descripcion:" "%%f" 2^>nul') do (
            set "desc!count!=%%a"
        )
    )
)
:: Opción de salida
set /a count+=1
set "cmd!count!=Salir"
set "desc!count!= Finalizar programa"

set "selected=1"

:menu
cls
echo.
echo  [96m?[0m [1mSelecciona una herramienta:[0m
echo  [90m(Usa las flechas para navegar y Enter para ejecutar)[0m
echo.

for /L %%i in (1,1,%count%) do (
    set "name=!cmd%%i!"
    
    if %%i==%selected% (
        :: Opción seleccionada: Flecha mas brillante y texto resaltado
        echo   [96m^> !name![0m  [90m- !desc%%i![0m
    ) else (
        :: Opción no seleccionada: Texto normal
        echo     [37m!name![0m  [90m- !desc%%i![0m
    )
)

echo.

:: Script de PowerShell para capturar flechas y Enter
:: 38=Arriba, 40=Abajo, 13=Enter
powershell -Command "$host.UI.RawUI.FlushInputBuffer(); $key = $host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown'); exit $key.VirtualKeyCode"
set "key=%errorlevel%"

if "%key%"=="38" (
    set /a selected-=1
    if !selected! lss 1 set selected=%count%
    goto menu
)
if "%key%"=="40" (
    set /a selected+=1
    if !selected! gtr %count% set selected=1
    goto menu
)
if "%key%"=="13" (
    goto execute
)
goto menu

:execute
if %selected%==%count% exit /b

set "runCmd=!file%selected%!"
cls
echo.
echo  [33mrunning[0m !cmd%selected%!...
echo  [90m--------------------------------------------------[0m
echo.
call "!runCmd!"
echo.
echo  [90m--------------------------------------------------[0m
echo  [32mDone.[0m Presiona cualquier tecla para volver.
pause > nul
goto menu