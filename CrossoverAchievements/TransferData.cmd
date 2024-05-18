@echo off

IF NOT EXIST ..\..\..\..\_classic_\WTF\Account goto classicnotfound
IF NOT EXIST ..\..\..\..\_retail_\WTF\Account goto retailnotfound
goto classicretailfound

:classicnotfound
echo Cataclysm Classic WTF folder not found.
IF NOT EXIST ..\..\..\..\_retail_\WTF\Account goto retailnotfound
goto end

:retailnotfound
echo Retail WTF folder not found.
goto end


:classicretailfound
for /d %%F in ("..\..\..\..\_retail_\WTF\Account\*") do (
    IF EXIST %%F\"SavedVariables\CrossoverAchievements - Cataclysm.lua" (
        echo Exporting Cataclysm Classic Data file to Retail
        copy "..\..\..\..\_classic_\WTF\Account\%%~nF\SavedVariables\CrossoverAchievements - Cataclysm.lua" "..\..\..\..\_retail_\WTF\Account\%%~nF\SavedVariables\CrossoverAchievements - Cataclysm.lua"
    )
)

for /d %%F in ("..\..\..\..\_retail_\WTF\Account\*") do (
    IF EXIST %%F\"SavedVariables\CrossoverAchievements - Retail.lua" (
        echo Exporting Retail Data file to Cataclysm Classic
        copy "..\..\..\..\_retail_\WTF\Account\%%~nF\SavedVariables\CrossoverAchievements - Retail.lua" "..\..\..\..\_classic_\WTF\Account\%%~nF\SavedVariables\CrossoverAchievements - Retail.lua"
    )
)

:end
