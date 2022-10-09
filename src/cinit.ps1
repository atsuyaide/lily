$ROOT_PROFILE=$(Join-Path $Env:_LILY_ROOT ".lilyrc.ps1")
$USER_PROFILE=$(Join-Path $Env:USERPROFILE ".lilyrc.ps1")

. $ROOT_PROFILE

if (Test-Path $USER_PROFILE) {. $USER_PROFILE }