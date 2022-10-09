#%# manual
#%#     利用可能なコマンドと簡単な説明を表示します.
#%#     スクリプト内で行頭に"#%#"でコメントアウトされている箇所を
#%#     コマンド説明と解釈し表示します.

Get-ChildItem "$Env:_LILY_SRC\*.ps1" | Foreach-Object {
    $fileName = $_.FullName
    Get-Content $fileName | Select-String "^#%#" | foreach { $_ -replace "#%#","" }
}