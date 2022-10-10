# Encoding UTF-8 with BOM

#=# lily
#=#  Lily関連の

Param(
   [String]$Command
)


function showVersion() {
   echo "v$Env:_VERSION"
}

function showLogo() {
   # Using DOS Rabel in https://textkool.com/ja/ascii-art-generator
   Write-Host @"

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

function showHelp() {
   Write-Host @"
This is help.
"@
}

if ($Command -eq "version") {
   showVersion
} elseif ($Command -eq "logo") {
   showLogo
} elseif ($Command -eq "load") {
   load 
} elseif ($Command -eq "reload") {
   reload 
} elseif ($Command -eq "help") {
   showHelp
} else {
   Write-Host "未定義のサブコマンドです."
   showHelp
}