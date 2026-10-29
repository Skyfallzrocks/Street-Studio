@echo off
rem Runs Install-StreetStudio.ps1 -Update and saves the output to install-log.txt
cd /d "%~dp0"
powershell -NoProfile -ExecutionPolicy Bypass -File ".\Install-StreetStudio.ps1" -Update > "%~dp0install-log.txt" 2>&1
echo %ERRORLEVEL% > "%~dp0install-exitcode.txt"
