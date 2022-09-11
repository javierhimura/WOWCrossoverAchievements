local _, app = ...

CrossoverAchievements = app;

local frame = CreateFrame('frame');

local frame = CreateFrame("FRAME", "CrossoverAchievements", UIParent);
frame:SetScript("OnEvent", function(self, e, ...) (self.events[e] or print)(...); end);
frame:SetPoint("BOTTOMLEFT", UIParent, "TOPLEFT", 0, 0);
frame.refreshDataForce = true;
frame.events = {};
frame:SetSize(1, 1);
frame:Show();
frame:RegisterEvent("PLAYER_ENTERING_WORLD");
frame:RegisterEvent("ACHIEVEMENT_EARNED");

local AddonDataVersion = 1;

function wrap_with(obj, func)
    return function(...)
        return func(obj, ...)
    end
end

frame.events.PLAYER_ENTERING_WORLD = function(...)
    CrossoverAchievements:OnPlayerEnteringWorld();
end

frame.events.ACHIEVEMENT_EARNED = function(achievementid)
    CrossoverAchievements:OnAchievementEarned(achievementid);

end

local Blz_AchievementFrame_ToggleAchievementFrame = nil;

function CrossoverAchievements:OnPlayerEnteringWorld()
    --print('Start '.. date("%a %b %d %H:%M:%S %Y"));
    self:InitializeAccountData();
    self:ExportAchievements();
    self.Extract:ExtractAchievementsInfo();
    --print('End '.. date("%a %b %d %H:%M:%S %Y"));
    self:ReplaceBlizzardFrame();
    LoadAddOn("Blizzard_AchievementUI");
end

--/script CrossoverAchievements.ShowBlizFrame();
function CrossoverAchievements:ShowBlizFrame()
    CrossoverAchievements:Blz_AchievementFrame_ToggleAchievementFrame();
end

function CrossoverAchievements:ReplaceBlizzardFrame()
    LoadAddOn("Blizzard_AchievementUI");
    self.Blz_AchievementFrame_ToggleAchievementFrame = AchievementFrame_ToggleAchievementFrame;
    AchievementFrame_ToggleAchievementFrame = CrossoverAchievementFrame_ToggleAchievementFrame;
end

function CrossoverAchievements:InitializeAccountData()
    CrossoverAchievements_AccountData = CrossoverAchievements_AccountData or {};
    if (self.GameVersion:IsRetail()) then
        CrossoverAchievements_AccountData.Retail = CrossoverAchievements_AccountData.Retail or {};
        CrossoverAchievements_AccountData.Retail.Characters = CrossoverAchievements_AccountData.Retail.Characters or {};
        CrossoverAchievements_AccountData.Retail.Achievements = CrossoverAchievements_AccountData.Retail.Achievements or {};
        CrossoverAchievements_AccountData.Retail.GameVersion = self.GameVersion:GetServerType(self);
    end
    if (self.GameVersion:IsWOTLK()) then
        CrossoverAchievements_AccountData.WOTLK = CrossoverAchievements_AccountData.WOTLK or {};
        CrossoverAchievements_AccountData.WOTLK.Characters = CrossoverAchievements_AccountData.WOTLK.Characters or {};
        CrossoverAchievements_AccountData.WOTLK.Achievements = CrossoverAchievements_AccountData.WOTLK.Achievements or {};
        CrossoverAchievements_AccountData.WOTLK.GameVersion = self.GameVersion:GetServerType();
    end
end

function CrossoverAchievements:GetCurrentGameVersionTable()
    if (self.GameVersion:IsRetail()) then
        return CrossoverAchievements_AccountData.Retail;
    elseif (self.GameVersion:IsWOTLK()) then
        return CrossoverAchievements_AccountData.WOTLK;
    end
end

function CrossoverAchievements:GetCurrentCharacterTable()
    local playerGUID = UnitGUID("player");
    local GameVersionTable = self:GetCurrentGameVersionTable();
    if not GameVersionTable then
        return;
    end
    local CharacterTable = GameVersionTable.Characters[playerGUID];
    
    if CharacterTable == nil then
        CharacterTable = {};
    	CharacterTable.Time = time();
        CharacterTable.Achievements = CharacterTable.Achievements or {};
        CharacterTable.version = AddonDataVersion;
        CharacterTable.GUID = playerGuid;
        CharacterTable.Realm = GetRealmName();
        CharacterTable.Name = UnitName("player");
        CharacterTable.GameVersion = self.GameVersion:GetServerType();
        GameVersionTable.Characters[playerGUID] = CharacterTable;
    end

    return GameVersionTable.Characters[playerGUID];
end

function CrossoverAchievements:ExportAchievements()
    local GameVersionTable = self:GetCurrentGameVersionTable();
    if not GameVersionTable then
        return;
    end
    local CharacterTable = self:GetCurrentCharacterTable();
    local categories = GetCategoryList();
    for categoryindex,categoryID in ipairs(categories) do
        local numAchievements = GetCategoryNumAchievements(categoryID);
        for index = 1, numAchievements do
            local achievementid = select(1, GetAchievementInfo(categoryID, index));
            self:ExportAchievement(GameVersionTable, CharacterTable, achievementid);
            local previousid = GetPreviousAchievement(achievementid)
            while previousid ~= nil do
                self:ExportAchievement(GameVersionTable, CharacterTable, previousid);
                previousid = GetPreviousAchievement(previousid)
            end
        end
    end
end

function CrossoverAchievements:OnAchievementEarned(achievementid)
    local GameVersionTable = self:GetCurrentGameVersionTable();
    if not GameVersionTable then
        return;
    end
    local CharacterTable = self:GetCurrentCharacterTable();
    self:ExportAchievement(GameVersionTable, CharacterTable, achievementid);
end

function CrossoverAchievements:ExportAchievement(GameVersionTable, CharacterTable, achievementid)
    local _, achname, _, completed, achivementmonth, achivementday, achivementyear, _, flags, _, _, isGuild, wasEarnedByMe, earnedBy, isStatistic = GetAchievementInfo(achievementid);
    if completed and not isGuild and not isStatistic then
        local achievementtime = time({year = 2000 + achivementyear, month = achivementmonth, day = achivementday});
        if ( bit.band(flags, ACHIEVEMENT_FLAGS_ACCOUNT) == ACHIEVEMENT_FLAGS_ACCOUNT ) then
            if not GameVersionTable.Achievements[achievementid] or GameVersionTable.Achievements[achievementid] ~= achievementtime then
                GameVersionTable.Achievements[achievementid] = achievementtime;
                GameVersionTable.Time = time()
            end
        elseif wasEarnedByMe then
            if not CharacterTable.Achievements[achievementid] or CharacterTable.Achievements[achievementid] ~= achievementtime then
                CharacterTable.Achievements[achievementid] = achievementtime;
                CharacterTable.Time = time();
                GameVersionTable.Time = time();
            end
        else 
            --print('Achievement ' .. achname .. ' earned by ' .. earnedBy);
        end
    end
end