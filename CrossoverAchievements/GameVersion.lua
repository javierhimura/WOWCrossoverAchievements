local _, CrossoverAchievements = ...

local ServerType_ClassicEra = "Classic Era";
local ServerType_ClassicTBC = "Classic TBC";
local ServerType_ClassicWOTLK = "Classic Wotlk";
local ServerType_Retail = "Retail";

local ServerType_ClassicEra_PTR = "Classic Era PTR";
local ServerType_ClassicTBC_PTR = "Classic TBC PTR";
local ServerType_ClassicWOTLK_PTR = "Classic Wotlk PTR";
local ServerType_Retail_PTR = "Retail PTR";

function CrossoverAchievements:IsPTRorBeta()
    --print('Enter IsPTRorBeta');
    --if not self then print('self is nil'); end;
    return C_CVar.GetCVar("portal") == "test";
end

function CrossoverAchievements:IsRetail()
    --print('Enter IsRetail');
    --if not self then print('self is nil'); end;
    return self:GetServerType() == ServerType_Retail or self:GetServerType() == ServerType_Retail_PTR;
end

function CrossoverAchievements:IsWOTLK()
    --print('Enter IsWOTLK');
    --if not self then print('self is nil'); end;
    return self:GetServerType() == ServerType_ClassicWOTLK or self:GetServerType() == ServerType_ClassicWOTLK_PTR;
end

function CrossoverAchievements:GetServerType()
    --print('Enter GetServerType');
    --if not self then print('self is nil'); end;
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
        else
            -- mainline
            return ServerType_Retail_PTR;
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
        else
            -- mainline
            return ServerType_Retail;
        end
    end 
end