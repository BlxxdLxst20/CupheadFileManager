@echo off

:: Setting the window title
title Cuphead File Manager by BlxxdLxst_SR

:: Set the path for the Steam folder and .exe file of Cuphead
:: Paths are set as global variables
set steam_path="C:\Program Files (x86)\Steam\steamapps\common\Cuphead"
set game_path=%steam_path%\Cuphead.exe



:: Move into the newly located directory if it exists
cd /d %steam_path%
 



if exist "BepInEx" (

    ren "BepInEx" "Mods"
    echo Debug Mode disabled successfully.
    echo Press any key to continue...
    pause >nul 

) else (

    if exist "Mods" (
        ren "Mods" "BepInEx"
        echo Debug Mode enabled successfully.
        echo Press any key to continue...
        pause >nul 
    )
)

echo Press any key to launch Cuphead.exe ...
pause >nul

start "" %game_path%