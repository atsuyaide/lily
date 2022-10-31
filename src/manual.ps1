<#
    .SYNOPSIS
        Displays list of available commands
#>

# If help-content is missing or Synopsis is not set, it will not appear in the manual listing
$out = "==== Commands ====`n"
Get-ChildItem "$env:_SRC\[a-zA-Z]`*.ps1" -File | Foreach-Object {
    $commandName = $_.BaseName
    $helpObject = Get-Help $commandName
    $SYNOPSIS = $helpObject.SYNOPSIS
    if ($helpObject.GetType().Name -ne "String" -and $SYNOPSIS -notmatch "`n") {
        $out += "$commandName`n $SYNOPSIS`n"
    }
}

$out += "`n==== Aliases ===="
Get-ChildItem function: | foreach-object {
    if ($_.Source -eq "Lily") {
        $aliasName = $_.Name
        $helpObject = Get-Help $aliasName
        $SYNOPSIS = $helpObject.SYNOPSIS
        if ($helpObject.GetType().Name -ne "String" -and $SYNOPSIS -notmatch "`n") {
            $out += "`n$aliasName`n $SYNOPSIS"
        }
    }
}
Write-Output $out
