<#
    .SYNOPSIS
        Register the contents of alias.txt as command
#>

$ROOT_PROFILE=$(Join-Path "$Env:_ROOT" "alias.txt")

pdoskey /macrofile="$ROOT_PROFILE"

$USER_PROFILE=$(Join-Path "$Env:USERPROFILE" "alias.txt")

if (Test-Path $USER_PROFILE) {
    pdoskey /macrofile="$USER_PROFILE"
}