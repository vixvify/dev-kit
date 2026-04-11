@echo off
cd /d %~dp0

if "%1"=="" (
  set /p TARGET=Enter target path: 
) else (
  set TARGET=%1
)

set /p NAME=Enter project name: 

cd /d %TARGET%
mkdir %NAME%
cd %NAME%

go mod init %NAME%

echo Installing dependencies...
go get github.com/gin-gonic/gin
go get gorm.io/gorm
go get gorm.io/driver/postgres

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
) > main.go

echo Go project created at %TARGET%\%NAME%
pause