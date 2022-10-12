<#
    .SYNOPSIS
        Register the contents of alias.txt as command
#>

$ROOT_PROFILE=$(Join-Path $Env:_ROOT "alias.txt")

pdoskey /macrofile=$ROOT_PROFILE
