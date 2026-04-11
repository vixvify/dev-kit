@echo off
cd /d %~dp0

if "%1"=="" (
  set /p TARGET=Enter target path: 
) else (
  set TARGET=%1
)

set /p NAME=Enter project name: 

cd /d %TARGET%
npx create-next-app@latest %NAME%

echo Project created at %TARGET%\%NAME%
pause