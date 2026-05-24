@echo off
setlocal

for /f "delims=" %%i in ('powershell -NoProfile -Command "Add-Type -AssemblyName System.Windows.Forms; $f=New-Object System.Windows.Forms.FolderBrowserDialog; $f.SelectedPath='C:\'; if($f.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK){$f.SelectedPath}"') do (
    set TARGET=%%i
)

if not defined TARGET (
    echo No folder selected.
    pause
    exit /b
)

echo Selected path: %TARGET%
echo.

set /p NAME=Enter project name:

cd /d "%TARGET%"

echo Creating Next.js app with src directory...
call npx create-next-app@latest %NAME% --src-dir

cd /d "%TARGET%\%NAME%\src"

echo Creating folder structure...

if not exist app mkdir app

mkdir components
mkdir core
mkdir infra
mkdir lib
mkdir store
mkdir utils

mkdir core\constants
mkdir core\domain
mkdir core\ports
mkdir core\service

mkdir infra\interface
mkdir infra\repositories

echo. > core\constants\.gitkeep
echo. > core\domain\.gitkeep
echo. > core\ports\.gitkeep
echo. > infra\interface\.gitkeep
echo. > infra\repositories\.gitkeep

echo.
echo ✅ Project created at %TARGET%\%NAME%
echo ✅ Using src/ structure
echo ✅ Folder structure created successfully!

pause
