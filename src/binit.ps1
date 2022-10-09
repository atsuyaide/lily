$ROOT_PROFILE=$(Join-Path $Env:_LILY_ROOT "bookmark.txt")
$USER_PROFILE=$(Join-Path $Env:USERPROFILE "bookmark.txt")

foreach($line in Get-Content $ROOT_PROFILE) {
    echo $line
    doskey /exename=powershell.exe "$line"
}