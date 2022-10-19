<#
    .SYNOPSIS
        Displays list of available commands
#>

# If help-content is missing or Synopsis is not set, it will not appear in the manual listing
Write-Output "==== Commands ===="
Get-ChildItem "$env:_SRC\[a-zA-Z]`*.ps1" -File | Foreach-Object {
    $fileName = $_.BaseName
    $helpObject = Get-Help $fileName
    if ($helpObject.GetType().Name -ne "String" -and $helpObject.SYNOPSIS -ne "") {
        $SYNOPSIS = $helpObject.SYNOPSIS
        Write-Output $fileName
        Write-Output " $SYNOPSIS"
    }
}
Write-Output ""

# Aliases with no comments listed will not appear in the manual listing
Write-Output "==== Aliases ===="
$(Get-ChildItem function:)| foreach-object {
    if ($_.Source -eq "Lily") {
        $helpObject = Get-Help $_.Name
        if ($helpObject.SYNOPSIS -notmatch "`n") {
            $SYNOPSIS = $helpObject.SYNOPSIS
            Write-Output $_.Name
            Write-Output " $SYNOPSIS"
        }
    }
}
# Write-Output $(pdoskey /macros | Sort-Object | Select-String ";#=#" | ForEach-Object { $_ -replace "^(.*?)=(.*?);#=#", "`$1;#=#" } | ForEach-Object { $($_ -split";#=#")[0, -1] })
