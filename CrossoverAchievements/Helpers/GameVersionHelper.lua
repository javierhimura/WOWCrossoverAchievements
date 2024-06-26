local CrossoverAchievements = LibStub("AceAddon-3.0"):GetAddon("CrossoverAchievements");

local GameVersion_ClassicEra = "Classic Era";
local GameVersion_ClassicTBC = "Classic TBC";
local GameVersion_ClassicWOTLK = "Classic Wotlk";
local GameVersion_ClassicCataclysm = "Classic Cataclysm";
local GameVersion_Retail = "Retail";

local GameVersion_ClassicEra_PTR = "Classic Era PTR";
local GameVersion_ClassicTBC_PTR = "Classic TBC PTR";
local GameVersion_ClassicWOTLK_PTR = "Classic Wotlk PTR";
local GameVersion_ClassicCataclysm_PTR = "Classic Cataclysm PTR";
local GameVersion_Retail_PTR = "Retail PTR";

CrossoverAchievements.Helpers = CrossoverAchievements.Helpers or {};
CrossoverAchievements.Helpers.GameVersionHelper = CrossoverAchievements.Helpers.GameVersionHelper or {};
CrossoverAchievements.Helpers.GameVersionHelper.GameVersion_ClassicWOTLK = GameVersion_ClassicWOTLK;
CrossoverAchievements.Helpers.GameVersionHelper.GameVersion_ClassicCataclysm = GameVersion_ClassicCataclysm;
CrossoverAchievements.Helpers.GameVersionHelper.GameVersion_Retail = GameVersion_Retail;
local GameVersionHelper = CrossoverAchievements.Helpers.GameVersionHelper;

CrossoverAchievements.Helpers.GameVersionHelper.GameVersionsWithAchievements = {
    GameVersion_ClassicWOTLK,
    GameVersion_ClassicCataclysm,
    GameVersion_Retail
};

CrossoverAchievements.Helpers.GameVersionHelper.PreviousClassicGameVersions = {
    [GameVersion_ClassicCataclysm] = { GameVersion_ClassicWOTLK },
};


CrossoverAchievements.Helpers.GameVersionHelper.NextClassicGameVersions = {
    [GameVersion_ClassicWOTLK] = { GameVersion_ClassicCataclysm },
};

function GameVersionHelper:IsPTRorBeta()
    return C_CVar.GetCVar("portal") == "test";
end

function GameVersionHelper:CanImportData(GameVersion)
    if self:IsClassic()  then
        if self:IsPTRorBeta() then
            return GameVersion == GameVersion_Retail or GameVersion == GameVersion_Retail_PTR;
        else
            return GameVersion == GameVersion_Retail;
        end
    end
    if self:IsRetail()  then
        if self:IsPTRorBeta() then
            return GameVersion == GameVersion_ClassicWOTLK_PTR or
                   GameVersion == GameVersion_ClassicCataclysm_PTR;
        else
            return GameVersion == GameVersion_ClassicWOTLK or
                   GameVersion == GameVersion_ClassicCataclysm;
        end
    end
    return false;
end

function GameVersionHelper:IsValidVersion()
    return self:IsRetail() or self:IsClassic();
end

function GameVersionHelper:IsRetail(GameVersion)
    if GameVersion == nil then
        GameVersion = self:GetCurrentVersion();
    end
    return GameVersion == GameVersion_Retail or GameVersion == GameVersion_Retail_PTR;
end

function GameVersionHelper:IsClassic(GameVersion)
    return self:IsWOTLK(GameVersion) or self:IsCataclysm(GameVersion);
end

function GameVersionHelper:IsCataclysm(GameVersion)
    if GameVersion == nil then
        GameVersion = self:GetCurrentVersion();
    end
    return GameVersion == GameVersion_ClassicCataclysm or GameVersion == GameVersion_ClassicCataclysm_PTR;
end

function GameVersionHelper:IsWOTLK(GameVersion)
    if GameVersion == nil then
        GameVersion = self:GetCurrentVersion();
    end
    return GameVersion == GameVersion_ClassicWOTLK or GameVersion == GameVersion_ClassicWOTLK_PTR;
end

function GameVersionHelper:HasClassicAchievements(GameVersion)
    return self:IsClassic(GameVersion);
end

function GameVersionHelper:GetClassicAchievementsDataType(GameVersion)
    if not self:HasClassicAchievements(GameVersion) then
	    return nil;
	end
    return self:GetAchievementsDataType(GameVersion);
end

function GameVersionHelper:HasGuildReputation()
    return GetExpansionLevel() >= LE_EXPANSION_CATACLYSM;
end

function GameVersionHelper:HasGuildAchievements()
    return GetExpansionLevel() >= LE_EXPANSION_CATACLYSM;
end

function GameVersionHelper:GetVersionExpansionLevel(GameVersion)
    if not GameVersion then
	    return GetExpansionLevel();
    elseif GameVersion == GameVersion_ClassicEra or GameVersion == GameVersion_ClassicEra_PTR then
        -- vanilla
        return LE_EXPANSION_CLASSIC;
    elseif GameVersion == GameVersion_ClassicTBC or GameVersion == GameVersion_ClassicTBC_PTR then
        -- tbc
        return LE_EXPANSION_BURNING_CRUSADE;
    elseif GameVersion == GameVersion_ClassicWOTLK or GameVersion == GameVersion_ClassicWOTLK_PTR then
        -- wotlk
        return LE_EXPANSION_WRATH_OF_THE_LICH_KING;
    elseif GameVersion == GameVersion_ClassicCataclysm or GameVersion == GameVersion_ClassicCataclysm_PTR then
        -- wotlk
        return LE_EXPANSION_CATACLYSM;
    elseif GameVersion == GameVersion_Retail or GameVersion == GameVersion_Retail_PTR then
        -- mainline
        return LE_EXPANSION_DRAGONFLIGHT;
    else 
        -- future Classic versions, Cataclysm for now
        return LE_EXPANSION_CATACLYSM;
    end
end

function GameVersionHelper:HasBlizzardAccountAchievements(GameVersion)
    if not GameVersion then
        GameVersion = self:GetCurrentVersion();
    end
     return not self:IsWOTLK(GameVersion);
end

function GameVersionHelper:HasClassicQuestFrame()
    return GameVersionHelper:IsWOTLK();
end

function GameVersionHelper:HasStatisticSummary()
    return GameVersionHelper:IsWOTLK();
end

function GameVersionHelper:GetAchievementsDataType(GameVersion)
    if GameVersion == nil then
        GameVersion = self:GetCurrentVersion();
    end
    if GameVersion == GameVersion_ClassicEra or GameVersion == GameVersion_ClassicEra_PTR then
        -- vanilla
        return nil;
    elseif GameVersion == GameVersion_ClassicTBC or GameVersion == GameVersion_ClassicTBC_PTR then
        -- tbc
        return nil;
    elseif GameVersion == GameVersion_ClassicWOTLK or GameVersion == GameVersion_ClassicWOTLK_PTR then
        -- wotlk
        return GameVersion_ClassicWOTLK;
    elseif GameVersion == GameVersion_ClassicCataclysm or GameVersion == GameVersion_ClassicCataclysm_PTR then
        -- wotlk
        return GameVersion_ClassicCataclysm;
    elseif GameVersion == GameVersion_Retail or GameVersion == GameVersion_Retail_PTR then
        -- mainline
        return GameVersion_Retail;
    else 
        -- future Classic versions, Cataclysm for now
        return GameVersion_ClassicCataclysm;
    end
end

function GameVersionHelper:GetCurrentVersion()
    if self:IsPTRorBeta() then
        if WOW_PROJECT_ID == WOW_PROJECT_CLASSIC then
            -- vanilla
            return GameVersion_ClassicEra_PTR;
        elseif WOW_PROJECT_ID == WOW_PROJECT_BURNING_CRUSADE_CLASSIC then
            -- tbc
            return GameVersion_ClassicTBC_PTR;
        elseif WOW_PROJECT_ID == WOW_PROJECT_WRATH_CLASSIC then
            -- wotlk
            return GameVersion_ClassicWOTLK_PTR;
        elseif WOW_PROJECT_ID == WOW_PROJECT_CATACLYSM_CLASSIC then
            -- wotlk
            return GameVersion_ClassicCataclysm_PTR;
        elseif WOW_PROJECT_ID == WOW_PROJECT_MAINLINE then
            -- mainline
            return GameVersion_Retail_PTR;
        else 
            -- future Classic PTR and Beta versions, Cataclysm PTR for now
            return GameVersion_ClassicCataclysm_PTR;
        end
    else 
        if WOW_PROJECT_ID == WOW_PROJECT_CLASSIC then
            -- vanilla
            return GameVersion_ClassicEra;
        elseif WOW_PROJECT_ID == WOW_PROJECT_BURNING_CRUSADE_CLASSIC then
            -- tbc
            return GameVersion_ClassicTBC;
        elseif WOW_PROJECT_ID == WOW_PROJECT_WRATH_CLASSIC then
            -- wotlk
            return GameVersion_ClassicWOTLK;
        elseif WOW_PROJECT_ID == WOW_PROJECT_CATACLYSM_CLASSIC_CLASSIC then
            -- wotlk
            return GameVersion_ClassicCataclysm;
        elseif WOW_PROJECT_ID == WOW_PROJECT_MAINLINE then
            -- mainline
            return GameVersion_Retail;
        else 
            -- future Classic versions, Cataclysm for now
            return GameVersion_ClassicCataclysm;
        end
    end 
end