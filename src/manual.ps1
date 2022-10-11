#=# manual
#=#  Displays list of available commands

function showManual {
    Write-Output "==== Commands ===="
    Write-Output $(Get-Content "$env:_SRC\[a-zA-Z]`*.ps1" | Select-String "^#=# " | foreach { $_ -replace "#=# ", "" })
    Write-Output ""

    Write-Output "==== Aliases ===="
    Write-Output $(pdoskey /macros | sort | Select-String ";#=#" | ForEach-Object { $_ -replace "^(.*?)=(.*?);#=#", "`$1;#=#" } | ForEach-Object { $($_ -split";#=#")[0, -1] })
}

showManual | more
