@echo off
cd /d %~dp0

if "%1"=="" (
  set /p TARGET=Enter clone path: 
) else (
  set TARGET=%1
)

set /p REPO=Enter git repo URL: 

cd /d %TARGET%
git clone %REPO%

for %%f in ("%REPO%") do set FOLDER=%%~nf

cd %FOLDER%

echo Installing...
npm install

echo Starting dev server...
npm run dev

pause