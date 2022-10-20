<#
    .SYNOPSIS
        Reload .lilyrc
#>

# Load root profile
$Lilyrc=$(Join-Path "$Env:_ROOT" "profile")
$Lilyrc_TMP=$(Join-Path "$Env:HOME" "lilyrc.ps1")
Copy-Item -Force "$Lilyrc" "$Lilyrc_TMP"
. "$Lilyrc_TMP"
Remove-Item -Force "$Lilyrc_TMP"

# Load user profile
$USER_PROFILE=$(Join-Path "$Env:HOME" ".lilyrc")
if (Test-Path "$USER_PROFILE") {
    $Lilyrc=$(Join-Path "$Env:HOME" ".lilyrc")
    $Lilyrc_TMP=$(Join-Path "$Env:HOME" "lilyrc.ps1")
    Copy-Item -Force "$Lilyrc" "$Lilyrc_TMP"
    . "$Lilyrc_TMP"
    Remove-Item -Force "$Lilyrc_TMP"
}
