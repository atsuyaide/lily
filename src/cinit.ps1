<#
    .SYNOPSIS
        Reload .lilyrc
#>

# Load root profile
$Lilyrc=$(Join-Path "$Env:_ROOT" ".lilyrc")
$Lilyrc_TMP=$(Join-Path "$Env:USERPROFILE" "lilyrc.ps1")
Copy-Item -Force "$Lilyrc" "$Lilyrc_TMP"
. "$Lilyrc_TMP"
Remove-Item -Force "$Lilyrc_TMP"

# Load user profile
$USER_PROFILE=$(Join-Path "$Env:USERPROFILE" ".lilyrc")
if (Test-Path "$USER_PROFILE") {
    $Lilyrc=$(Join-Path "$Env:USERPROFILE" ".lilyrc")
    $Lilyrc_TMP=$(Join-Path "$Env:USERPROFILE" "lilyrc.ps1")
    Copy-Item -Force "$Lilyrc" "$Lilyrc_TMP"
    . "$Lilyrc_TMP"
    Remove-Item -Force "$Lilyrc_TMP"
}
