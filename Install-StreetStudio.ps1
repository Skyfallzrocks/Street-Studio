param([switch]$Update)
$ErrorActionPreference = 'Stop'
if (Get-Process -Name Cities2 -ErrorAction SilentlyContinue) {
    throw 'Close Cities: Skylines II before installing Street Studio.'
}
$payload = Join-Path $PSScriptRoot 'StreetStudio'
if (-not (Test-Path -LiteralPath (Join-Path $payload 'StreetStudio.dll'))) {
    $payload = Join-Path $PSScriptRoot 'Package\StreetStudio'
}
if (-not (Test-Path -LiteralPath (Join-Path $payload 'StreetStudio.dll'))) {
    throw 'Extract the complete Street Studio release ZIP before running this installer.'
}
$gameData = Join-Path $env:USERPROFILE 'AppData\LocalLow\Colossal Order\Cities Skylines II'
$target = [IO.Path]::GetFullPath((Join-Path $gameData 'Mods\StreetStudio'))
# Backups must live outside the game's data folder: the game scans it and loads any StreetStudio copy it finds as an extra mod.
$backupRoot = Join-Path $PSScriptRoot 'InstallBackups'
$oldBackupRoot = Join-Path $gameData 'ModsData\StreetStudioBackups'
if (Test-Path -LiteralPath $oldBackupRoot) {
    New-Item -ItemType Directory -Path $backupRoot -Force | Out-Null
    Get-ChildItem -LiteralPath $oldBackupRoot | Move-Item -Destination $backupRoot -Force
    Remove-Item -LiteralPath $oldBackupRoot -Force
    Write-Host "Moved old backups out of the game folder to $backupRoot"
}
if (Test-Path -LiteralPath $target) {
    if (-not $Update) { throw 'Street Studio is already installed. Run this script with -Update to back it up and update it.' }
    $backup = Join-Path $backupRoot (Get-Date -Format 'yyyyMMdd-HHmmss-fff')
    New-Item -ItemType Directory -Path $backup -Force | Out-Null
    Copy-Item -LiteralPath $target -Destination $backup -Recurse
    Write-Host "Previous installation backed up to $backup"
}
New-Item -ItemType Directory -Path $target -Force | Out-Null
Get-ChildItem -LiteralPath $payload | Copy-Item -Destination $target -Recurse -Force
Write-Host "Street Studio installed to $target"
Write-Host 'Start with a test city and disable Road Builder in that playset. This is an experimental build.'
