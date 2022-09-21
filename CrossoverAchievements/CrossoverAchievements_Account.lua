local CrossoverAchievements = LibStub("AceAddon-3.0"):GetAddon("CrossoverAchievements");

local Account = {};
CrossoverAchievements.Account = Account;

local CompletedAchievements = {};
local TotalPoints = 0;
local SaveCompletedAchievementsWTF = false;

local playerGUID = UnitGUID('PLAYER');
local playerFaction = UnitFactionGroup('PLAYER');
local factionBoth = 'Both';
local CurrentGameVersionExpansionLevel = GetExpansionLevel();

function Account:GetCompletedAchievementInfo(AchievementID)
    return CompletedAchievements[AchievementID];
end

function Account:GetTotalPoints()
    return TotalPoints;
end

function Account:ConvertAchievementVersion(AchievementID, ImportAchievementsData)
    if ImportAchievementsData == nil then
        -- There is no import data table for achievements between Retail and Retail, every achievement is returned valid without transformation
	    return AchievementID;
	end
    if not ImportAchievementsData.List[AchievementID] then
        -- Achievement doesn't exits in this version
	    return nil;
	end
    local data = ImportAchievementsData.List[AchievementID];
    if data.ClassicOnly and not CrossoverAchievements.Helpers.GameVersionHelper:HasClassicAchievements() then
        -- Classic achievement but current version is not Classic
        -- Achievement that doesn't exits on a version will be added in the future
	    return nil;
	end
    if data.Removed ~= nil and data.Removed >= CurrentGameVersionExpansionLevel then
        -- Achievement removed before current version
        -- Achievement that doesn't exits on a version will be added in the future
	    return nil;
	end
    if data.Faction ~= factionBoth then
        if data.Merged ~= nil and data.Merged <= CurrentGameVersionExpansionLevel then
            -- Faction split achievement merged before current version
            -- Return merged version of the achievement
	        return data.MergedId;
        elseif playerFaction ~= data.Faction then
            return data.OtherSide;
	    end
        return AchievementID;
	end

    return AchievementID;
end

function Account:ProcessCompletedAchievement(AchievementID, AchievementTime, Account, WasEarnedByMe, WasEarnedHere, EarnedBy, Realm, GameVersion, ImportAchievementsData)
    local ConvertedAchievementID = self:ConvertAchievementVersion(AchievementID, ImportAchievementsData);
    if ConvertedAchievementID == nil then
	    return;
	end
	if not CompletedAchievements[ConvertedAchievementID] then
        CompletedAchievements[ConvertedAchievementID] = { 
                                 AchievementID = ConvertedAchievementID,
                                 AchievementTime = AchievementTime,
                                 Account = Account,
                                 WasEarnedByMe = WasEarnedByMe,
                                 WasEarnedHere = WasEarnedHere,
                                 EarnedBy = EarnedBy,
                                 Realm = Realm,
                                 GameVersion = GameVersion
                                 };
        TotalPoints = TotalPoints + CrossoverAchievements.Data.Achievements:GetAchievementData(ConvertedAchievementID).Points;
    elseif AchievementTime <  CompletedAchievements[ConvertedAchievementID].AchievementTime then -- Oldest achievement prevail
        if CompletedAchievements[ConvertedAchievementID].WasEarnedByMe and not WasEarnedByMe then
            return;  -- Current Character Achievements prevail over other characters
        end
        if CompletedAchievements[ConvertedAchievementID].WasEarnedHere and not WasEarnedHere then
            return;  -- Current Version Achievements prevail over other versions
        end
        CompletedAchievements[ConvertedAchievementID].AchievementTime = AchievementTime;
        CompletedAchievements[ConvertedAchievementID].Account = Account;
        CompletedAchievements[ConvertedAchievementID].WasEarnedByMe = WasEarnedByMe;
        CompletedAchievements[ConvertedAchievementID].EarnedBy = EarnedBy;
        CompletedAchievements[ConvertedAchievementID].Realm = Realm;
        CompletedAchievements[ConvertedAchievementID].GameVersion = GameVersion;
    end
end

function Account:ReprocessCompletedAchievements()
    CompletedAchievements = {};
    TotalPoints = 0;
    self:ProcessCompletedAchievements();
end

function Account:ProcessCompletedAchievements()
    local CurrentGameVersionTable = CrossoverAchievements:GetCurrentGameVersionTable();
    local CurrentCharacterTable = CurrentGameVersionTable.Characters[playerGUID];
    local GameVersionsWithAchievements = CrossoverAchievements.Helpers.GameVersionHelper.GameVersionsWithAchievements;

    -- If current Game Version is WOTLK use WOTLK Achievements data for both WOTLK and Retail achievements
    -- to translate retail achievements to WOTLK and also to translate WOTLK achievements between factions
    local CurrentGameVersionAchievementsDataType = CrossoverAchievements.Helpers.GameVersionHelper:GetClassicAchievementsDataType();
    local ImportAchievementsDataGlobal = CrossoverAchievements.Data.Achievements[CurrentGameVersionAchievementsDataType];
    local CurrentGameVersionExpansionLevel = CrossoverAchievements.Helpers.GameVersionHelper:GetVersionExpansionLevel();
    -- Load account achievements from current version and achievements from current character first, they have priority
    self:ProcessCompletedAchievementsVersion(CurrentGameVersionTable, true, ImportAchievementsDataGlobal);
    self:ProcessCompletedAchievementsCharacter(CurrentCharacterTable, true, true, ImportAchievementsDataGlobal);

    for _,GameVersion in pairs(GameVersionsWithAchievements) do 
        local GameVersionTable = CrossoverAchievements_AccountData[GameVersion];
        local WasEarnedHere = (CurrentGameVersionTable == GameVersionTable); 
        if GameVersionTable then
		    local ImportAchievementsDataVersion = ImportAchievementsDataGlobal;
            -- If current Game Version is Retail use WOTLK Achievements data for both WOTLK only
            -- Between Retail character translation is not needed, every achievement is consider valid to avoid problems in future updates
            -- There are no problems in WOTLK having an achievement database because is a closed version with all future achievements already in game
            -- Future Classic versions will require an update
            local GameVersion = GameVersionTable.GameVersion;
            local GameVersionExpansionLevel = CrossoverAchievements.Helpers.GameVersionHelper:GetVersionExpansionLevel(GameVersion);
            if ImportAchievementsDataVersion == nil or GameVersionExpansionLevel < CurrentGameVersionExpansionLevel then
                local AchievementsDataType = CrossoverAchievements.Helpers.GameVersionHelper:GetClassicAchievementsDataType(GameVersion);
                ImportAchievementsDataVersion = CrossoverAchievements.Data.Achievements[AchievementsDataType];
            end

            if GameVersionTable ~= CurrentGameVersionTable then
                self:ProcessCompletedAchievementsVersion(CrossoverAchievements_AccountData[GameVersion], WasEarnedHere, ImportAchievementsDataVersion);
			end
            for _,CharacterTable in pairs(CrossoverAchievements_AccountData[GameVersion].Characters) do 
                if CharacterTable and CharacterTable ~= CurrentCharacterTable then
                    local WasEarnedByMe = (CurrentCharacterTable == CharacterTable);
                    self:ProcessCompletedAchievementsCharacter(CharacterTable, WasEarnedByMe, WasEarnedHere, ImportAchievementsDataVersion);
				end
            end
        end
    end
    if SaveCompletedAchievementsWTF then
        CrossoverAchievements_AccountData.AllAchievements = CompletedAchievements;
    else
        CrossoverAchievements_AccountData.AllAchievements = nil;
	end
end

function Account:ProcessCompletedAchievementsVersion(GameVersionTable, WasEarnedHere, ImportAchievementsData)
    if GameVersionTable.Achievements then
        for AchievementID, AchievementTime in pairs(GameVersionTable.Achievements) do
            self:ProcessCompletedAchievement(AchievementID, AchievementTime, true, WasEarnedHere, WasEarnedHere, GameVersionTable.GameVersion, GameVersionTable.GameVersion, GameVersionTable.GameVersion, ImportAchievementsData);
        end
    end
end

function Account:ProcessCompletedAchievementsCharacter(CharacterTable, WasEarnedByMe, WasEarnedHere, ImportAchievementsData)
    if CharacterTable.Achievements then
        for AchievementID, AchievementTime in pairs(CharacterTable.Achievements) do 
            self:ProcessCompletedAchievement(AchievementID, AchievementTime, false, WasEarnedByMe, WasEarnedHere, CharacterTable.Name, CharacterTable.Realm, CharacterTable.GameVersion, ImportAchievementsData);
        end
    end
end