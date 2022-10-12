<#
    .SYNOPSIS
        Displays a list of aliases that are registered in doskey
#>


pdoskey /macros | Sort-Object | ForEach-Object { $_ -replace ";#=#(.*?)$", ""}