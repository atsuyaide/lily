<#
    .SYNOPSIS
        Displays a list of aliases that are registered in doskey
#>

$(Get-ChildItem function:)| foreach-object {
    if ($_.Source -eq "Lily") { Write-Output $_.Name }
}