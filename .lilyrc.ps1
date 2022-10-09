# Change default prompt
function global:prompt {
     "[" + (Get-Date -Format "yy/MM/dd hh:MM:ss") + "] " + (Split-Path (Get-Location) -Leaf) + " >> "
}

$Global:DefaultBrowser="C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
# $Global:DefaultBrowser="C:\Program Files\Google\Chrome\Application\chrome.exe"