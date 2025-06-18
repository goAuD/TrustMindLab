# Firefox cookie-k és cache törlése

# Cookie fájlok törlése minden profilból
$roamingProfiles = Join-Path $env:APPDATA "Mozilla\Firefox\Profiles"
if (Test-Path $roamingProfiles) {
    Get-ChildItem $roamingProfiles -Directory | ForEach-Object {
        $cookieFile = Join-Path $_.FullName "cookies.sqlite"
        if (Test-Path $cookieFile) {
            Write-Output "Törlés: $cookieFile"
            Remove-Item $cookieFile -Force
        }
    }
} else {
    Write-Output "Firefox profil nem található a Roaming mappában."
}

# Cache törlése minden profilból
$localProfiles = Join-Path $env:LOCALAPPDATA "Mozilla\Firefox\Profiles"
if (Test-Path $localProfiles) {
    Get-ChildItem $localProfiles -Directory | ForEach-Object {
        $cacheDir = Join-Path $_.FullName "cache2"
        if (Test-Path $cacheDir) {
            Write-Output "Törlés: $cacheDir"
            Remove-Item $cacheDir -Recurse -Force
        }
    }
} else {
    Write-Output "Firefox cache mappa nem található a Local mappában."
}
