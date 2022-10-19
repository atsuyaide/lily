# Encoding UTF-8 with BOM
# Remove-Module PSReadLine # To make doskey available in powershell

# Setup Environment variables
$Env:_VERSION="0.1.0"
$Env:_ROOT="$PSScriptRoot"
$Env:_SRC=$(Join-Path "$Env:_ROOT" "src")
$Env:PATH="$Env:_SRC;" + $Env:PATH
$Env:HOME=$Env:USERPROFILE

# Startup
lily load 
Set-Location $Env:InitDir
