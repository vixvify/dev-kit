@echo off
cd /d %~dp0

if "%1"=="" (
  set /p TARGET=Enter project path: 
) else (
  set TARGET=%1
)

cd /d %TARGET%

echo Building...
go build -o app.exe

echo Running...
app.exe

pause