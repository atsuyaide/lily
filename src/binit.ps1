<#
    .SYNOPSIS
        Open the contents of bookmark.txt in the default browser
#>

$rootProfile=$(Join-Path $Env:_ROOT "bookmark.txt")
$uesrProfile=$(Join-Path $Env:HOME "bookmark.txt")

if (Test-Path $uesrProfile) {
    $bookmarkProfile = $uesrProfile
} else {
    $bookmarkProfile = $rootProfile
}

foreach($uri in Get-Content $bookmarkProfile) {
    if (!($uri -match "^#")){ bopen $uri }
}