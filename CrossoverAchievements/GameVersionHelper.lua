local CrossoverAchievements = LibStub("AceAddon-3.0"):GetAddon("CrossoverAchievements");

local ServerType_ClassicEra = "Classic Era";
local ServerType_ClassicTBC = "Classic TBC";
local ServerType_ClassicWOTLK = "Classic Wotlk";
local ServerType_Retail = "Retail";

local ServerType_ClassicEra_PTR = "Classic Era PTR";
local ServerType_ClassicTBC_PTR = "Classic TBC PTR";
local ServerType_ClassicWOTLK_PTR = "Classic Wotlk PTR";
local ServerType_Retail_PTR = "Retail PTR";

local GameVersion = {};
CrossoverAchievements.GameVersion = GameVersion;

CrossoverAchievements.GameVersion.GameVersionsWithAchievements = {
    ServerType_ClassicWOTLK,
    ServerType_Retail
};

function GameVersion:IsPTRorBeta()
    return C_CVar.GetCVar("portal") == "test";
end

function GameVersion:CanImportData(ImportServerType)
    if self:IsWOTLK()  then
        if self:IsPTRorBeta() then
            return ImportServerType == ServerType_Retail or ImportServerType == ServerType_Retail_PTR;
        else
            return ImportServerType == ServerType_Retail;
        end
    end
    if self:IsRetail()  then
        if self:IsPTRorBeta() then
            return ImportServerType == ServerType_ClassicWOTLK or ImportServerType == ServerType_ClassicWOTLK_PTR;
        else
            return ImportServerType == ServerType_ClassicWOTLK;
        end
    end
    return false;
end

function GameVersion:IsValidVersion()
    return self:IsRetail() or self:IsWOTLK();
end

function GameVersion:IsRetail()
    return self:GetServerType() == ServerType_Retail or self:GetServerType() == ServerType_Retail_PTR;
end

function GameVersion:IsWOTLK()
    return self:GetServerType() == ServerType_ClassicWOTLK or self:GetServerType() == ServerType_ClassicWOTLK_PTR;
end

function GameVersion:HasGuildReputation()
    return GetExpansionLevel() >= LE_EXPANSION_CATACLYSM;
end

function GameVersion:HasGuildAchievements()
    return GetExpansionLevel() >= LE_EXPANSION_CATACLYSM;
end

function GameVersion:HasBlizzardAccountAchievements(ServerType)
    if not ServerType then
        ServerType = self:GetServerType();
    end
     return ServerType == ServerType_Retail or ServerType == ServerType_Retail_PTR;
end

function GameVersion:HasStadisticSummary()
    return GameVersion:IsWOTLK();
end

function GameVersion:GetAchievementsDataType()
    if WOW_PROJECT_ID == WOW_PROJECT_CLASSIC then
        -- vanilla
        return nil;
    elseif WOW_PROJECT_ID == WOW_PROJECT_BURNING_CRUSADE_CLASSIC then
        -- tbc
        return nil;
    elseif WOW_PROJECT_ID == WOW_PROJECT_WRATH_CLASSIC then
        -- wotlk
        return ServerType_ClassicWOTLK;
    elseif WOW_PROJECT_ID == WOW_PROJECT_MAINLINE then
        -- mainline
        return ServerType_Retail;
    else 
        -- future Classic versions, WOTLK for now
        return ServerType_ClassicWOTLK;
    end
end

function GameVersion:GetServerType()
    if self:IsPTRorBeta() then
        if WOW_PROJECT_ID == WOW_PROJECT_CLASSIC then
            -- vanilla
            return ServerType_ClassicEra_PTR;
        elseif WOW_PROJECT_ID == WOW_PROJECT_BURNING_CRUSADE_CLASSIC then
            -- tbc
            return ServerType_ClassicTBC_PTR;
        elseif WOW_PROJECT_ID == WOW_PROJECT_WRATH_CLASSIC then
            -- wotlk
            return ServerType_ClassicWOTLK_PTR;
        elseif WOW_PROJECT_ID == WOW_PROJECT_MAINLINE then
            -- mainline
            return ServerType_Retail_PTR;
        else 
            -- future Classic PTR and Beta versions, WOTLK PTR for now
            return ServerType_ClassicWOTLK_PTR;
        end
    else 
        if WOW_PROJECT_ID == WOW_PROJECT_CLASSIC then
            -- vanilla
            return ServerType_ClassicEra;
        elseif WOW_PROJECT_ID == WOW_PROJECT_BURNING_CRUSADE_CLASSIC then
            -- tbc
            return ServerType_ClassicTBC;
        elseif WOW_PROJECT_ID == WOW_PROJECT_WRATH_CLASSIC then
            -- wotlk
            return ServerType_ClassicWOTLK;
        elseif WOW_PROJECT_ID == WOW_PROJECT_MAINLINE then
            -- mainline
            return ServerType_Retail;
        else 
            -- future Classic versions, WOTLK for now
            return ServerType_ClassicWOTLK;
        end
    end 
end