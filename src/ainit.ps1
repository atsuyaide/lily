<#
    .SYNOPSIS
        Register the contents of alias.txt as command
#>

function makeFucntion($Param) {
    if ($Param -match "^.*=.*$") {
        $comment = ""
        if ($Param -match " ### ") {
            $main = $($Param -split " ### ")[0]
            $comment = $($($Param -split " ### ")[1])
        } else {
            $main = $Param
        }
        $name = $($main -split "=")[0]
        $content = $($main -split "=")[1]
    } else {
        throw "Invalid format `"$Param`""
    }

    $out = ""
    if ($comment.Length -ne 0) {
        $out += "<#`n    .SYNOPSIS`n        $comment`n#>`n"
    }
    return $out + "function $name {`n    $content`n}`n"
}


$tempPsmPath = $(Join-Path $Env:HOME "\Lily.psm1")

$rootProfile = $(Join-Path "$Env:_ROOT" "alias.txt")
Get-Content $rootProfile | ForEach-Object {Write-Output $(makeFucntion($_)) >> $tempPsmPath}

$userProfile = $(Join-Path "$Env:HOME" "alias.txt")
if (Test-Path $userProfile) {
    Get-Content $userProfile | ForEach-Object {Write-Output $(makeFucntion($_)) >> $tempPsmPath}
}

Import-Module $tempPsmPath
Remove-Item $tempPsmPath -Force
