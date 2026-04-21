# 🛠️ CoipoNorte Dev-Tools

Una colección de scripts de automatización (.bat) diseñados para acelerar el flujo de trabajo de desarrolladores Fullstack (React, Node.js, SQLite). 

Incluye un **Menú Interactivo** con estética moderna (estilo Vite/Inquirer) para ejecutar herramientas mediante flechas y teclado.

## 🚀 Características

- 🎨 **Interfaz Moderna:** Menú con colores ANSI y selector de flechas.
- ⚡ **Productividad:** Comandos cortos para tareas complejas.
- 📁 **Navegación Inteligente:** Salta entre proyectos y abre VS Code al instante.
- 🔌 **Gestión de Puertos:** Libera puertos bloqueados (3000, 5173, etc.) con un clic.
- 📦 **Fullstack Ready:** Scripts para inicializar proyectos Node (ESM) y entornos SQLite.

## 🛠️ Herramientas Incluidas

| Comando | Descripción |
| :--- | :--- |
| `help-h` | **Menú Maestro:** Interfaz visual para navegar y ejecutar todo el arsenal. |
| `dir-p` | Navegador de proyectos con apertura automática de VS Code. |
| `init-s` | Inicializa proyectos Node.js con soporte ESM y scripts preconfigurados. |
| `kill-p` | Busca y termina procesos que bloquean puertos específicos. |
| `gitclone-todo` | Clona, instala dependencias y levanta Front/Back automáticamente. |
| `make-db` | Configura un entorno de base de datos SQLite con scripts de inicio. |
| `gitignore-rdy` | Crea un `.gitignore` profesional e inicializa el repositorio Git. |
| `clean-p` | Limpieza profunda: borra `node_modules` y reinstala dependencias. |
| `limpiar` | Mantenimiento del sistema: limpia temporales y caché de npm. |

## 🔧 Instalación

Para usar estos comandos desde cualquier carpeta de tu terminal, sigue estos pasos:

1. **Descarga los archivos:** Clona este repo o copia los archivos `.bat` en una carpeta local (ejemplo: `C:\herramientas`).
2. **Configura el PATH:**
   - Presiona la tecla `Win` y busca "Variables de entorno".
   - Entra en **Variables de entorno...**
   - En **Variables del sistema**, busca la fila `Path` y haz clic en **Editar**.
   - Haz clic en **Nuevo** y pega la ruta donde guardaste los archivos (`C:\herramientas`).
   - Acepta todos los cambios.
3. **Reinicia tu terminal:** Escribe `help-h` en cualquier consola y ¡disfruta!

## 🖱️ Bonus: Abrir CMD aquí (Menú Contextual)

Dentro de la carpeta encontrarás un archivo llamado `abrir_cmd.reg`. Ejecútalo (doble clic) para añadir la opción **"Abrir CMD aquí"** con el icono oficial de la consola al hacer clic derecho en cualquier carpeta.

## 🎨 Estética

El menú principal utiliza **PowerShell** de fondo para detectar las teclas de dirección y **Secuencias de Escape ANSI** para los colores, logrando una experiencia de usuario similar a las herramientas CLI modernas de Node.js.

---
Creado con ❤️ por **CoipoNorte**