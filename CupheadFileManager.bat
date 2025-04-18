:: Author - BlxxdLxst_SR
:: Date - 17/04/2025
:: Source - CupheadFileManager.bat

:: Purpose - This program enables and disables Cuphead's BepInEx rendition of the Debug Mode

:: Possible exit codes for this program:
::      0 - Program ran successfully
::      1 - The path provided was not accessible
::      2 - The Debug Mode folder (either disabled or enabled) was not found

:: Start of CupheadFileManager.bat

@echo off

:: Setting the window title
title Cuphead File Manager by BlxxdLxst_SR

echo Note: For file paths using directories or files with spaces, 
echo please use quotes around the full path.
echo Ex. Input "C:\Program Files (x86)" and not C:\Program Files (x86)

echo Press any key to continue...
pause >nul

:: Set the path for the Steam folder and .exe file of Cuphead
:: The path for the Steam folder is based on user input
:: The game's .exe file should be located in the folder they provide
set /p steam_path=Enter the path of the Cuphead folder for Steam: 
set game_path=%steam_path%\Cuphead.exe

:: Move into the newly located directory if it exists
if exist %steam_path% (

    cd /d %steam_path%

) else (

    :: Print out an error message stating that the given file path cannot be found.
    echo Your input did not correspond to an accessible file path.

    :: Wait for user input before exiting the program
    echo Press any key to exit the program...
    pause >nul
    exit 1
)

 
:: Check the name of the BepInEx folder, if it exists
:: Change the name either to/from BepInEx based on the folder's current name
if exist "BepInEx" (

    :: Change the directory name and inform the user that the change was made without errors.
    ren "BepInEx" "Mods"
    echo Debug Mode disabled successfully.

) else (

    if exist "Mods" (

        :: Change the directory name and inform the user that the change was made without errors.
        ren "Mods" "BepInEx"
        echo Debug Mode enabled successfully.

    ) else (

        :: Print out an error message to the user informing them that any Debug Mode folder was not found
        :: Exit the program with a value of 2 after the user has 
        echo Debug Mode has not installed at the directory path previously specified. 
        
        :: Wait for user input before exiting the program
        echo Press any key to exit the program...
        pause >nul
        exit 2

    )
)

:: Wait for user input before continuing with the progra,
echo Press any key to continue...
pause >nul 

:: Allow the user to remotely start Cuphead.exe
echo Press any key to launch Cuphead.exe ...
pause >nul

:: Run Cuphead.exe and end the program
start "" %game_path%

:: End of CupheadFileManager.bat
