## Browser Setting
## Set the default browser. The browser set here will be used by `bopen` command.
$Env:DefaultBrowser = "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
## If you want to specify Chrome as your default browser (Chrome must be installed)
# $Env:DefaultBrowser = "C:\Program Files\Google\Chrome\Application\chrome.exe"

## Promt Setting
Set-Item function:Global:prompt {$host.UI.WriteLine("Green", $host.UI.RawUI.BackgroundColor, (Convert-Path $pwd)); Get-Date -Format "yy/MM/dd hh:MM:ss >> " }

## Miniconda(Python)
## If you have Miniconda installed on your $Env:USERPROFILE, you can activate conda with the following command.
# . "$Env:USERPROFILE\miniconda3\shell\condabin\conda-hook.ps1"
# conda activate "$Env:USERPROFILE\miniconda3"

## Git/GitBash
## If you have GItBash installed on your `C'\Program Files\`, 
## you can use GitBash commands (git, grep, sed, ...) in Lily with the following configuration.
## Note: Not all commands can be fully supported due to conflicting command names (e.g. `ls` command).
##       If you have a better solution, please let us know in an Issue:)
#$Env:PATH += "C:\Program Files\Git\bin;C:\Program Files\Git\usr\bin;"
