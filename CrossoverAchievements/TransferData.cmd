@echo off

set "classicpath=..\..\..\..\_classic_\WTF\Account"
set "retailpath=..\..\..\..\_retail_\WTF\Account"
IF NOT EXIST %classicpath% goto classicnotfound
IF NOT EXIST %retailpath% goto retailnotfound
goto classicretailfound

:retailnotfound
echo Retail WTF folder not found.
goto end

:classicnotfound
echo WOTLK Classic WTF folder not found.
goto end

:classicretailfound
set "wotlkluafile=SavedVariables\CrossoverAchievements - WOTLK.lua"
for /d %%F in ("%classicpath%\*") do (
    IF EXIST %%F\"%wotlkluafile%" (
        echo Exporting WOTLK Classic Data file to Retail
        copy "%classicpath%\%%~nF\%wotlkluafile%" "%retailpath%\%%~nF\%wotlkluafile%"
    )
)

set "retailluafile=SavedVariables\CrossoverAchievements - Retail.lua"
for /d %%F in ("%retailpath%\*") do (
    IF EXIST %%F\"%retailluafile%" (
        echo Exporting Retail Data file to WOTLK Classic
        copy "%retailpath%\%%~nF\%retailluafile%" "%classicpath%\%%~nF\%retailluafile%"
    )
)

:end
