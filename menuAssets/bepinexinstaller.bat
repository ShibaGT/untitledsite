@echo off
setlocal enabledelayedexpansion
chcp ANSI

cls
title BepInEx Installer // [#---------] Locating Gorilla Tag
color 0e

set steamPath1="C:/Program Files (x86)/Steam/steamapps/common/Gorilla Tag"
set steamPath2="D:/SteamLibrary/steamapps/common/Gorilla Tag"
set steamPath3="C:/Program Files/Oculus/Software/Software/another-axiom-gorilla-tag"
set steamPath4="D:/Steam/steamapps/common/Gorilla Tag"

if exist %steamPath1% (
    set gamePath=%steamPath1%
) else if exist %steamPath2% (
    set gamePath=%steamPath2%
) else if exist %steamPath3% (
    set gamePath=%steamPath3%
) else if exist %steamPath4% (
    set gamePath=%steamPath4%
) else (
    color 0c
    echo Gorilla Tag directory not found.
    pause
    exit /b
)

color 0e
cls
title BepInEx Installer // [###-------] Downloading BepInEx
curl -L "https://github.com/BepInEx/BepInEx/releases/download/v5.4.23.4/BepInEx_win_x64_5.4.23.4.zip" -o BepInEx.zip

powershell -command "Expand-Archive -Path 'BepInEx.zip' -DestinationPath '%gamePath%' -Force"

cls
title BepInEx Installer // [#####-----] Creating directories
mkdir "%gamePath%/BepInEx/config" 2>nul
mkdir "%gamePath%/BepInEx/plugins" 2>nul

cls
title BepInEx Installer // [##########] Finished
echo BepInEx has been installed successfully!

del "BepInEx.zip"

pause