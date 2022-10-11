# Encoding UTF-8 with BOM
#=# lily
#=#  Open the URL passed as argument in the default browser

Param(
   [String]$Command
)


function showVersion() {
   Write-Output "v$Env:_VERSION"
}

function showLogo() {
   # Using DOS Rabel in https://textkool.com/ja/ascii-art-generator
   Write-Output @"

   █████        ███  ████            
  ░░███        ░░░  ░░███            
   ░███        ████  ░███  █████ ████
   ░███       ░░███  ░███ ░░███ ░███ 
   ░███        ░███  ░███  ░███ ░███ 
   ░███      █ ░███  ░███  ░███ ░███ 
   ███████████ █████ █████ ░░███████ 
  ░░░░░░░░░░░ ░░░░░ ░░░░░   ░░░░░███ 
                            ███ ░███ 
                           ░░██████   v$ENV:_VERSION
                            ░░░░░░   

Type "manual" to show command list

"@
}

function load() {
   ainit
   cinit
   showLogo
}

function reload() {
   cls
   load
}

function showLicense {
   Get-Content "$Env:_ROOT\LICENSE"
}

function showHelp() {
   Write-Output @"
Lily v$Env:_VERSION

This is help.
"@
}

if ($Command -eq "version") {
   showVersion
} elseif ($Command -eq "logo") {
   showLogo
} elseif ($Command -eq "load") {
   load 
} elseif ($Command -eq "license") {
   showLicense 
} elseif ($Command -eq "reload") {
   reload 
} elseif ($Command -eq "help") {
   showHelp
} elseif ($Command -eq "") {
   showHelp
} else {
   Write-Host "`"$command`" does not defined"
   showHelp
}