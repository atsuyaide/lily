<#
    .SYNOPSIS
        Displays list of available commands
#>

Write-Output "==== Commands ===="
Get-ChildItem "$env:_SRC\[a-zA-Z]`*.ps1" -File | Foreach-Object {
    $fileName = $_.BaseName
    $SYNOPSIS = (Get-Help $fileName).SYNOPSIS
    Write-Output $fileName
    Write-Output " $SYNOPSIS"
}
Write-Output ""

Write-Output "==== Aliases ===="
Write-Output $(pdoskey /macros | sort | Select-String ";#=#" | ForEach-Object { $_ -replace "^(.*?)=(.*?);#=#", "`$1;#=#" } | ForEach-Object { $($_ -split";#=#")[0, -1] })
