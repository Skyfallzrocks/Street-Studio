@echo off
rem Runs Source\Build.ps1 and saves the output to build-log.txt
cd /d "%~dp0Source"
echo Building Street Studio... output goes to build-log.txt
powershell -NoProfile -ExecutionPolicy Bypass -File ".\Build.ps1" > "%~dp0build-log.txt" 2>&1
echo %ERRORLEVEL% > "%~dp0build-exitcode.txt"
