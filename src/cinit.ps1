$ROOT_PROFILE=$(Join-Path $Env:_LILY_ROOT ".lilyrc")
$USER_PROFILE=$(Join-Path $Env:USERPROFILE ".lilyrc")

if (Test-Path $USER_PROFILE) {
    $PROFILE=$USER_PROFILE
} else {
    $PROFILE=$ROOT_PROFILE
}

$PROFILE_TMP=$(Join-Path $Env:HOME "lilyrc.ps1")
Copy-Item -Force $PROFILE $PROFILE_TMP
. $PROFILE_TMP
Remove-Item -Force $PROFILE_TMP