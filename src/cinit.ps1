$ROOT_PROFILE=$(Join-Path $Env:_LILY_ROOT ".lilyrc.ps1")
$USER_PROFILE=$(Join-Path $Env:USERPROFILE ".lilyrc.ps1")

if (Test-Path $USER_PROFILE) {
    $PROFILE=$USER_PROFILE
} else {
    $PROFILE=$ROOT_PROFILE
}

. $PROFILE