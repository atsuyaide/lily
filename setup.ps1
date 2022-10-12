Set-ExecutionPolicy ByPass -Scope CurrentUser

$MainFilePath=$(Join-Path "$(Convert-Path $pwd)" "main.ps1")
$SourceFilePath="%windir%\System32\WindowsPowerShell\v1.0\powershell.exe"
$Arguments="-ExecutionPolicy ByPass -NoExit -Command `"& '$MainFilePath'`""
$ShortcutPath=$(Join-Path "$(Convert-Path $pwd)" "LILY.lnk")

$WScriptObj=New-Object -ComObject ("WScript.Shell")
$shortcut=$WscriptObj.CreateShortcut($ShortcutPath)
$shortcut.TargetPath=$SourceFilePath
$shortcut.Description="Lily (Powershell Prompt)"
$shortcut.WorkingDirectory="%HOMEPATH%"
$shortcut.Arguments=$Arguments
$shortcut.Save()