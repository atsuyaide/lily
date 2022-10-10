# Encoding UTF-8 with BOM
Remove-Module PSReadLine

$Env:_VERSION="0.1.0"
$Env:_ROOT="$PSScriptRoot"
$Env:_SRC=$(Join-Path "$Env:_ROOT" "src")
$Env:PATH="$Env:_SRC;" + $Env:PATH
$Env:HOME=$Env:USERPROFILE
Set-Item function:Global:prompt {$host.UI.WriteLine("Green", $host.UI.RawUI.BackgroundColor,(Get-Location).Path); Get-Date -Format "yy/MM/dd hh:MM:ss >> " }

lily load 
cd $Env:HOME
