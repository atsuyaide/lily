# Setup Environment variables
$Env:_VERSION = "0.1.1"
$Env:_ROOT = $PSScriptRoot
$Env:_SRC = $(Join-Path $Env:_ROOT "src")
$Env:HOME = $Env:USERPROFILE
$Env:InitDir = $Env:USERPROFILE
$Env:showLogo = $true

$Env:PATH += ";$Env:_SRC"

# Startup
lily load 
if ($Env:showLogo) {
    lily logo
}
Set-Location $Env:InitDir