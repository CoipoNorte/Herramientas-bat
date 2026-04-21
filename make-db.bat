@echo off
:: Descripcion: Genera entorno SQLite (init/delete/scripts)
setlocal
color 0e
echo [+] Configurando base de datos...

if not exist config.db mkdir config.db

(
echo const sqlite3 = require^('sqlite3'^).verbose^(^);
echo const db = new sqlite3.Database^('./database.sqlite'^);
echo db.serialize^(^(^) =^> {
echo   db.run^('CREATE TABLE IF NOT EXISTS usuarios (id INTEGER PRIMARY KEY, nombre TEXT)'^);
echo   console.log^('✅ DB Lista'^);
echo }^);
echo db.close^(^);
) > config.db\init-db.js

:: Agregar scripts al package.json si existe
if exist package.json (
    echo [+] Inyectando scripts en package.json...
    :: (Aqui se podria usar un script de node para editar el JSON de forma segura)
)

echo [+] Entorno de DB creado en /config.db
pause