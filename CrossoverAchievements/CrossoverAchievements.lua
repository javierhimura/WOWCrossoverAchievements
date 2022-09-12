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
    if not self.GameVersion:IsValidVersion() then
        print('CrossoverAchievements not compatible with this game version');
        return;
    end
    --print('Start '.. date("%a %b %d %H:%M:%S %Y"));
    self:InitializeAccountData();
    self:ExportAchievements();
    self.Extract:ExtractAchievementsInfo();
    self:ReplaceBlizzardFrame();
    self:ExportData();
    self:ImportData();
    --print('End '.. date("%a %b %d %H:%M:%S %Y"));
end

function CrossoverAchievements:ExportData()
  local GameVersionTable = self:GetCurrentGameVersionTable();
  local ExportTable = {};
  ExportTable.GameVersion = GameVersionTable.GameVersion;
  ExportTable.Time = GameVersionTable.Time;
  ExportTable.Characters = GameVersionTable.Characters;
  if self.GameVersion:HasBlizzardAccountAchievements(GameVersionTable.GameVersion) then
    ExportTable.Achievements = GameVersionTable.Achievements;
  end
  local CompressData = self.CompressHelper:CompressEncodeData(ExportTable);
  if self.GameVersion:IsRetail() then
    if not LoadAddOn("CrossoverAchievements - Retail") then
        print("Can Load CrossoverAchievements - Retail Export Addon");
        return;
    end
    CrossoverAchievements_Retail.Export = CompressData;
    CrossoverAchievements_Retail.GameVersion = GameVersionTable.GameVersion;
    CrossoverAchievements_Retail.Time = GameVersionTable.Time;
    print('CrossoverAchievements_Retail Export');
  end
  if self.GameVersion:IsWOTLK() then
    if not LoadAddOn("CrossoverAchievements - WOTLK") then
        return;
    end
    CrossoverAchievements_WOTLK.Export = CompressData;
    CrossoverAchievements_WOTLK.GameVersion = GameVersionTable.GameVersion;
    CrossoverAchievements_WOTLK.Time = GameVersionTable.Time;
    print('CrossoverAchievements_WOTLK Export');
  end
end

function CrossoverAchievements:ImportData()
  local CompressData;
  if self.GameVersion:IsRetail() then
    if not LoadAddOn("CrossoverAchievements - WOTLK") then
        return;
    end
    if not CrossoverAchievements_WOTLK then
        return;
    end
    CompressData = CrossoverAchievements_WOTLK;
  end
  if self.GameVersion:IsWOTLK() then
    if not LoadAddOn("CrossoverAchievements - Retail") then
        return;
    end
    if not CrossoverAchievements_Retail then
        return;
    end
    CompressData = CrossoverAchievements_Retail;
  end
  -- Not data exported from the other version, or invalid data
  if not CompressData or 
     not CompressData.Export or 
     not CompressData.GameVersion or 
     not CompressData.Time or 
     not self.GameVersion:CanImportData(CompressData.GameVersion) then
    return;
  end
  
  -- Data exported from the other version already processed
  if CrossoverAchievements_AccountData[CompressData.GameVersion] and 
     CrossoverAchievements_AccountData[CompressData.GameVersion].Time >= CompressData.Time then
    return;
  end
 
  local ImportData = self.CompressHelper:DecompressDecodeData(CompressData.Export);
  -- Data exported cant be decompressed
  if not ImportData then
    return;
  end
  
  if ImportData.GameVersion ~= CompressData.GameVersion or
     ImportData.Time ~= CompressData.Time  then
    -- Invalid data, it should have the same information compressed and decompressed
    return;
  end
  
  if ImportData.Achievements and not self.GameVersion:HasBlizzardAccountAchievements(ImportData.GameVersion) then
    -- WOTLK Classic data can't have account achievements
    return;
  end
  
  CrossoverAchievements_AccountData[ImportData.GameVersion] = ImportData;
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
    local AchievementsDataType = self.GameVersion.GetAchievementsDataType();
    CrossoverAchievements_AccountData[AchievementsDataType] = CrossoverAchievements_AccountData[AchievementsDataType] or {};
    CrossoverAchievements_AccountData[AchievementsDataType].Characters = CrossoverAchievements_AccountData[AchievementsDataType].Characters or {};
    if self.GameVersion:HasBlizzardAccountAchievements(AchievementsDataType)  then
        CrossoverAchievements_AccountData[AchievementsDataType].Achievements = CrossoverAchievements_AccountData[AchievementsDataType].Achievements or {};
    end
    CrossoverAchievements_AccountData[AchievementsDataType].GameVersion = self.GameVersion:GetServerType(self);
end

function CrossoverAchievements:GetCurrentGameVersionTable()
    return CrossoverAchievements_AccountData[self.GameVersion.GetAchievementsDataType()];
end

function CrossoverAchievements:GetCurrentCharacterTable()
    local playerGUID = UnitGUID("player");
    local GameVersionTable = self:GetCurrentGameVersionTable();
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
                GameVersionTable.Time = time();
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