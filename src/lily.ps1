# Encoding UTF-8 with BOM

#%# lily
#%#      Lily関連の

Param(
   [String]$Command
)


function showVersion() {
   echo "v$Env:_LILY_VERSION"
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
                           ░░██████   v$ENV:_LILY_VERSION
                            ░░░░░░   

Type "manual" to show command list

"@
}

function initialize() {
   cls
   ainit
   cinit
   showLogo
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
} elseif ($Command -eq "init") {
   initialize 
} elseif ($Command -eq "help") {
   showHelp
} else {
   Write-Host "未定義のサブコマンドです."
   showHelp
}