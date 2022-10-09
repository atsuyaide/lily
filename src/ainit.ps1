#%# ainit
#%#     alias.txtに記載された情報をコマンド登録します.
$ROOT_PROFILE=$(Join-Path $Env:_LILY_ROOT "alias.txt")

doskey /exename=powershell.exe /macrofile=$ROOT_PROFILE
