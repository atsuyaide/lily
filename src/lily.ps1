<#
    .SYNOPSIS
      Check the version of Lily, restart and more
#>

Param(
   [switch]$version,
   [switch]$help,
   [Parameter()][ArgumentCompletions("load", "reload")]$command = ""
)

class Lily {
   [string] version(){
      return "v$Env:_VERSION"
   }

   [string] logo(){
   # Using DOS Rabel in https://textkool.com/ja/ascii-art-generator
   return @"

   █████        ███  ████            
  ░░███        ░░░  ░░███            
   ░███        ████  ░███  █████ ████
   ░███       ░░███  ░███ ░░███ ░███ 
   ░███        ░███  ░███  ░███ ░███ 
   ░███      █ ░███  ░███  ░███ ░███ 
   ███████████ █████ █████ ░░███████ 
  ░░░░░░░░░░░ ░░░░░ ░░░░░   ░░░░░███ 
                            ███ ░███ 
                           ░░██████   $($this.version())
                            ░░░░░░   

Type "manual" to show command list

"@
   }

   [void] load() {
      Write-Host $this.logo()
      ainit
      cinit
   }

   [void] reload() {
      Clear-Host
      $this.load()
   }

   [String] help() {
      return @"
Usage: lily [-version] [-help] <command>

Lily has the following commands:

   load     Load ``profile`, `alias.txt`` and `.lilyrc` and exit
   reload   Clear the screen and restart Lily
"@
   }
}

$lily = [Lily]::new()

if ($version) {
   Write-Output $lily.version()
} elseif ($help) {
   Write-Output $lily.help()
} elseif ($Command -eq "load") {
   $lily.load()
} elseif ($Command -eq "reload") {
   $lily.reload()
} elseif ($Command -eq "") {
   Write-Output $lily.help()
} else {
   Write-Output "`"$command`" does not defined`n$($lily.help())"
}