<#
    .SYNOPSIS
      Check the version of Lily, restart and more
#>

Param(
   [switch]$version,
   [switch]$help,
   [string]$command = ""
)

$logoText = @"

   █████        ███  ████
  ░░███        ░░░  ░░███
   ░███        ████  ░███  █████ ████
   ░███       ░░███  ░███ ░░███ ░███
   ░███        ░███  ░███  ░███ ░███
   ░███      █ ░███  ░███  ░███ ░███
   ███████████ █████ █████ ░░███████
  ░░░░░░░░░░░ ░░░░░ ░░░░░   ░░░░░███
                            ███ ░███
                           ░░██████   v$($Env:_VERSION)
                            ░░░░░░

Type `"manual`" to show command list
"@

$helpText = @"
Usage: lily [-version] [-help] <command>`

Lily has the following commands:
   load     Load ``profile``, ``alias.txt`` and ``.lilyrc`` and exit
   reload   Clear the screen and restart Lily
"@

if ($version) {
   Write-Output "v$($Env:_VERSION)"
} elseif ($help) {
   Write-Output $helpText
} elseif ($Command -eq "logo") {
   Write-Output $logoText
} elseif ($Command -eq "load") {
   _ainit
   _cinit
} elseif ($Command -eq "reload") {
   Clear-Host
   . $Env:_ROOT\main.ps1
} elseif ($Command -eq "") {
   Write-Output $helpText
} else {
   Write-Output "`"$command`" command does not defined`n$helpText"
}
