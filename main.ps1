# Encoding UTF-8 with BOM
Remove-Module PSReadLine
chcp 65001

$Env:_LILY_VERSION="0.1.0"
$Env:_LILY_ROOT="$PSScriptRoot"
$Env:_LILY_SRC=Join-Path "$Env:_LILY_ROOT" "src"
$Env:PATH="$Env:_LILY_SRC;" + $Env:PATH

init

cd $Env:_LILY_ROOT
