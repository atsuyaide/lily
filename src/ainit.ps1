#=# ainit
#=#  alias.txtに記載された情報をコマンド登録します.
$ROOT_PROFILE=$(Join-Path $Env:_ROOT "alias.txt")

pdoskey /macrofile=$ROOT_PROFILE
