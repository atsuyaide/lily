<#
    .SYNOPSIS
        Reload .lilyrc
#>

# Load root profile
$lilyProfile = $(Join-Path "$Env:_ROOT" "profile")
$tmpProfilePath = $(Join-Path "$Env:HOME" "profile.ps1")
Copy-Item -Force "$lilyProfile" "$tmpProfilePath"
. "$tmpProfilePath"
if (Test-Path "$tmpProfilePath") {
    Remove-Item -Force "$tmpProfilePath"
}

# Load user profile
$USER_PROFILE = $(Join-Path "$Env:HOME" ".lilyrc")
if (Test-Path "$USER_PROFILE") {
    $lilyrc = $(Join-Path "$Env:HOME" ".lilyrc")
    $tmpLilyrcPath = $(Join-Path "$Env:HOME" "lilyrc.ps1")
    Copy-Item -Force "$lilyrc" "$tmpLilyrcPath"
    . "$tmpLilyrcPath"
    if (Test-Path "$tmpLilyrcPath") {
        Remove-Item -Force "$tmpLilyrcPath"
    }
}
