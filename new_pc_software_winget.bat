@echo off
setlocal enabledelayedexpansion
echo Checking for Winget...

:: Verify winget is available
where winget >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Winget is not installed or not in your PATH.
    echo Please go to the Microsoft Store and update "App Installer".
    pause
    exit /b
)

winget upgrade --all --accept-package-agreements --accept-source-agreements

echo Starting Winget Installation Script...
echo ---------------------------------------

:: Use the ^ symbol at the end of each line to continue the list
:: This makes it very easy to add/remove apps later.
set apps_id=^
 Warp.Warp ^
 Google.Chrome ^
 Fork.Fork ^
 SublimeHQ.SublimeText.4 ^
 Microsoft.VisualStudioCode ^
 AgileBits.1Password ^
 Valve.Steam ^
 Plex.PlexMediaServer ^
 REALiX.HWiNFO ^
 Guru3D.Afterburner ^
 LocalSend.LocalSend ^
 Google.GoogleDrive ^
 Microsoft.PowerToys ^
 Amazon.AWSCLI ^
 Notion.Notion ^
 qBittorrent.qBittorrent ^
 RevoUninstaller.RevoUninstaller ^
 Wagnardsoft.DisplayDriverUninstaller ^
 voidtools.Everything ^
 ShareX.ShareX ^
 Logitech.OptionsPlus ^
 Logitech.LogiBolt ^
 VideoLAN.VLC ^
 ALCPU.CoreTemp ^
 Insta360.Link.Controller ^
 dotPDN.PaintDotNet ^
 CodeSector.TeraCopy ^
 Postman.Postman ^
 7zip.7zip

set apps_name=^
 Whatsapp

:: Loop through the app id's
for %%a in (%apps_id%) do (
    echo.
    echo Installing: %%a
    winget install -e --id %%a --accept-package-agreements --accept-source-agreements --silent
)

:: Loop through the app names
for %%a in (%apps_name%) do (
    echo.
    echo Installing: %%a
    winget install %%a --accept-package-agreements --accept-source-agreements --silent
)

echo ---------------------------------------
echo All tasks complete!
pause