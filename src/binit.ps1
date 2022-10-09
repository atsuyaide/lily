$ROOT_PROFILE=$(Join-Path $Env:_LILY_ROOT "bookmark.txt")
$USER_PROFILE=$(Join-Path $Env:USERPROFILE "bookmark.txt")

if (Test-Path $USER_PROFILE) {
    $PROFILE=$USER_PROFILE
} else {
    $PROFILE=$ROOT_PROFILE
}

foreach($uri in Get-Content $PROFILE) {
    if (!($uri -match "^#")){ bopen $uri }
}