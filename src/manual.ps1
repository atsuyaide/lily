#=# manual
#=#  利用可能なコマンドと簡単な説明を表示します.
#=#  スクリプト内で行頭に"#%#"でコメントアウトされている箇所を
#=#  コマンド説明と解釈し表示します.

Write-Host $host.UI.WriteLine("Yellow", $host.UI.RawUI.BackgroundColor, "===Commands==") -NoNewline
Get-ChildItem "$Env:_SRC\*.ps1" | Foreach-Object {
    $fileName = $_.FullName
    Get-Content $fileName | Select-String "^#=# " | foreach { $_ -replace "#=# ","" }
}
Write-Host ""

Write-Host $host.UI.WriteLine("Yellow", $host.UI.RawUI.BackgroundColor, "===Aliases==") -NoNewline
pdoskey /macros | sort | %{ $_.Split("#=#")[0, -1] }
Write-Host ""