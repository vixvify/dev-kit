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

mkdir "%NAME%"
cd "%NAME%"

go mod init %NAME%

echo Creating folder structure...

mkdir cmd
echo. > cmd\main.go

mkdir internal

mkdir internal\domain
mkdir internal\domain\entities
mkdir internal\domain\ports

mkdir internal\infrastructure
mkdir internal\infrastructure\database
mkdir internal\infrastructure\repository

mkdir internal\presentation
mkdir internal\presentation\dto
mkdir internal\presentation\handler
mkdir internal\presentation\mapper
mkdir internal\presentation\routes

mkdir internal\service

mkdir internal\shared
mkdir internal\shared\errors
mkdir internal\shared\middleware
mkdir internal\shared\response
mkdir internal\shared\utils

echo Installing dependencies...

go get github.com/gin-gonic/gin
go get gorm.io/gorm
go get gorm.io/driver/postgres

echo. > internal\domain\entities\.gitkeep
echo. > internal\domain\ports\.gitkeep

echo. > internal\infrastructure\database\.gitkeep
echo. > internal\infrastructure\repository\.gitkeep

echo. > internal\presentation\dto\.gitkeep
echo. > internal\presentation\handler\.gitkeep
echo. > internal\presentation\mapper\.gitkeep
echo. > internal\presentation\routes\.gitkeep

echo. > internal\service\.gitkeep

echo. > internal\shared\errors\.gitkeep
echo. > internal\shared\middleware\.gitkeep
echo. > internal\shared\response\.gitkeep
echo. > internal\shared\utils\.gitkeep

echo.
echo ✅ Go project created at %TARGET%\%NAME%
echo ✅ Clean architecture structure ready!

pause