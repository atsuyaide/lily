$MainFilePath=$(Join-Path "$(Convert-Path $pwd)" "main.ps1")
$SourceFilePath="%windir%\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy ByPass -NoExit -Command `"& '$MainFilePath'`""

$WScriptObj=New-Object -ComObject ("WScript.Shell")
$ShortcutPath=$(Join-Path "$(Convert-Path $pwd)" "LILY.lnk")
$shortcut=$WscriptObj.CreateShortcut($ShortcutPath)
$shortcut.TargetPath=$SourceFilePath
$shortcut.Save()