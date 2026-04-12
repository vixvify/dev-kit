@echo off
cd /d %~dp0

:: รับ path
if "%1"=="" (
  set /p TARGET=Enter target path: 
) else (
  set TARGET=%1
)

set /p NAME=Enter project name: 

cd /d %TARGET%

echo Creating Next.js app with src directory...
call npx create-next-app@latest %NAME% --src-dir

cd /d %TARGET%\%NAME%\src

echo Creating folder structure...

mkdir app
mkdir components
mkdir core
mkdir infra
mkdir lib
mkdir store
mkdir utils

mkdir core\constants
mkdir core\domain
mkdir core\ports

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
