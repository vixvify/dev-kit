@echo off
cd /d %~dp0

:: รับ path
if "%1"=="" (
  set /p TARGET=Enter target path: 
) else (
  set TARGET=%1
)

:: รับชื่อโปรเจค
set /p NAME=Enter project name: 

:: ไปที่ target
cd /d %TARGET%

:: สร้างโฟลเดอร์โปรเจค
mkdir %NAME%
cd %NAME%

:: init go module
go mod init %NAME%

echo Creating folder structure...

:: ===== cmd =====
mkdir cmd
mkdir cmd\server

:: ===== internal =====
mkdir internal
mkdir internal\core
mkdir internal\core\service
mkdir internal\core\ports
mkdir internal\core\handler

mkdir internal\database
mkdir internal\dto
mkdir internal\errors
mkdir internal\infra
mkdir internal\mapper
mkdir internal\middleware
mkdir internal\models
mkdir internal\repository
mkdir internal\response
mkdir internal\route
mkdir internal\util

echo Installing dependencies...

go get github.com/gin-gonic/gin
go get gorm.io/gorm
go get gorm.io/driver/postgres

:: ===== create main.go =====
(
echo package main
echo.
echo import (
echo     "github.com/gin-gonic/gin"
echo )
echo.
echo func main() {
echo     r := gin.Default()
echo.
echo     r.GET("/", func(c *gin.Context^) {
echo         c.JSON(200, gin.H{"message": "Hello World"}^)
echo     })
echo.
echo     r.Run(":8080"^)
echo }
) > cmd\server\main.go

:: ===== กัน folder ว่าง =====
echo. > internal\core\service\.gitkeep
echo. > internal\core\ports\.gitkeep
echo. > internal\core\handler\.gitkeep
echo. > internal\database\.gitkeep
echo. > internal\dto\.gitkeep
echo. > internal\errors\.gitkeep
echo. > internal\infra\.gitkeep
echo. > internal\mapper\.gitkeep
echo. > internal\middleware\.gitkeep
echo. > internal\models\.gitkeep
echo. > internal\repository\.gitkeep
echo. > internal\response\.gitkeep
echo. > internal\route\.gitkeep
echo. > internal\util\.gitkeep

echo.
echo ✅ Go project created at %TARGET%\%NAME%
echo ✅ Clean architecture structure ready!
pause
