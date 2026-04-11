@echo off
cd /d %~dp0

if "%1"=="" (
  set /p TARGET=Enter project path: 
) else (
  set TARGET=%1
)

cd /d %TARGET%

echo Installing...
npm install

echo Building...
npm run build

echo Starting...
npm start

pause