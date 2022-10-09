$ROOT_PROFILE=$(Join-Path $Env:_LILY_ROOT "alias.txt")

doskey /exename=powershell.exe /macrofile=$ROOT_PROFILE
