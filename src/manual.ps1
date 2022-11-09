<#
    .SYNOPSIS
        Displays list of available commands
#>
$ManualArray = @()

# If help-content is missing or Synopsis is not set, it will not appear in the manual listing
Get-ChildItem "$env:_SRC\[a-zA-Z]`*.ps1" -File | Foreach-Object {
    $commandName = $_.BaseName
    $helpObject = Get-Help $commandName
    $SYNOPSIS = $helpObject.SYNOPSIS
    if ($helpObject.GetType().Name -ne "String" -and $SYNOPSIS -notmatch "`n") {
        $ManualArray += [PSCustomObject]@{
          "CommandName"=$commandName
          "Description"=$SYNOPSIS
        }
    }
}

Get-ChildItem function: | foreach-object {
    if ($_.Source -eq "Lily") {
        $aliasName = $_.Name
        $helpObject = Get-Help $aliasName
        $SYNOPSIS = $helpObject.SYNOPSIS
        if ($helpObject.GetType().Name -ne "String" -and $SYNOPSIS -notmatch "`n") {
            $ManualArray += [PSCustomObject]@{
              "CommandName"=$aliasName
              "Description"=$SYNOPSIS
            }
        }
    }
}
$ManualArray | Sort-Object