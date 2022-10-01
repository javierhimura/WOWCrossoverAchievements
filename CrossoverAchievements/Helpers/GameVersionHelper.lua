local CrossoverAchievements = LibStub("AceAddon-3.0"):GetAddon("CrossoverAchievements");

local GameVersion_ClassicEra = "Classic Era";
local GameVersion_ClassicTBC = "Classic TBC";
local GameVersion_ClassicWOTLK = "Classic Wotlk";
local GameVersion_Retail = "Retail";

local GameVersion_ClassicEra_PTR = "Classic Era PTR";
local GameVersion_ClassicTBC_PTR = "Classic TBC PTR";
local GameVersion_ClassicWOTLK_PTR = "Classic Wotlk PTR";
local GameVersion_Retail_PTR = "Retail PTR";

CrossoverAchievements.Helpers = CrossoverAchievements.Helpers or {};
CrossoverAchievements.Helpers.GameVersionHelper = CrossoverAchievements.Helpers.GameVersionHelper or {};
local GameVersionHelper = CrossoverAchievements.Helpers.GameVersionHelper;

CrossoverAchievements.Helpers.GameVersionHelper.GameVersionsWithAchievements = {
    GameVersion_ClassicWOTLK,
    GameVersion_Retail
};

function GameVersionHelper:IsPTRorBeta()
    return C_CVar.GetCVar("portal") == "test";
end

function GameVersionHelper:CanImportData(GameVersion)
    if self:IsWOTLK()  then
        if self:IsPTRorBeta() then
            return GameVersion == GameVersion_Retail or GameVersion == GameVersion_Retail_PTR;
        else
            return GameVersion == GameVersion_Retail;
        end
    end
    if self:IsRetail()  then
        if self:IsPTRorBeta() then
            return GameVersion == GameVersion_ClassicWOTLK or GameVersion == GameVersion_ClassicWOTLK_PTR;
        else
            return GameVersion == GameVersion_ClassicWOTLK;
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
    return self:IsWOTLK(GameVersion);
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
    elseif GameVersion == GameVersion_Retail or GameVersion == GameVersion_Retail_PTR then
        -- mainline
        return LE_EXPANSION_SHADOWLANDS;
    else 
        -- future Classic versions, Cataclysm for now
        return LE_EXPANSION_CATACLYSM;
    end
end

function GameVersionHelper:HasBlizzardAccountAchievements(GameVersion)
    if not GameVersion then
        GameVersion = self:GetCurrentVersion();
    end
     return self:IsRetail(GameVersion);
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
    elseif GameVersion == GameVersion_Retail or GameVersion == GameVersion_Retail_PTR then
        -- mainline
        return GameVersion_Retail;
    else 
        -- future Classic versions, WOTLK for now
        return GameVersion_ClassicWOTLK;
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
        elseif WOW_PROJECT_ID == WOW_PROJECT_MAINLINE then
            -- mainline
            return GameVersion_Retail_PTR;
        else 
            -- future Classic PTR and Beta versions, WOTLK PTR for now
            return GameVersion_ClassicWOTLK_PTR;
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
        elseif WOW_PROJECT_ID == WOW_PROJECT_MAINLINE then
            -- mainline
            return GameVersion_Retail;
        else 
            -- future Classic versions, WOTLK for now
            return GameVersion_ClassicWOTLK;
        end
    end 
end