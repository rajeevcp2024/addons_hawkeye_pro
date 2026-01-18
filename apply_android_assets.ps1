\
# Apply Android icon + splash assets after `npx cap add android`
# Run from project root in PowerShell:
#   powershell -ExecutionPolicy Bypass -File .\scripts\apply_android_assets.ps1

$ErrorActionPreference = "Stop"

$projRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$projRoot = Split-Path -Parent $projRoot

$androidRes = Join-Path $projRoot "android\app\src\main\res"
if (!(Test-Path $androidRes)) {
  Write-Host "Android project not found. Run: npx cap add android" -ForegroundColor Yellow
  exit 1
}

$assetRoot = Join-Path $projRoot "assets\android-res"

Write-Host "Copying launcher icons..." -ForegroundColor Cyan
Copy-Item -Force -Recurse (Join-Path $assetRoot "mipmap-*") $androidRes

# Ensure drawable exists
$drawable = Join-Path $androidRes "drawable"
if (!(Test-Path $drawable)) { New-Item -ItemType Directory -Path $drawable | Out-Null }

Write-Host "Copying splash screen..." -ForegroundColor Cyan
Copy-Item -Force (Join-Path $assetRoot "drawable\splash_screen.png") $drawable

Write-Host "Done. Now run: npx cap sync  (then build APK in Android Studio)" -ForegroundColor Green
