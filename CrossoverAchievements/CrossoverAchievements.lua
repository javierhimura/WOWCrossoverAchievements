local CrossoverAchievements = LibStub("AceAddon-3.0"):NewAddon("CrossoverAchievements", "AceTimer-3.0");
_G["CrossoverAchievements"] = CrossoverAchievements;

local frame = CreateFrame('frame');

local frame = CreateFrame("FRAME", "CrossoverAchievements", UIParent);
frame:SetScript("OnEvent", function(self, e, ...) (self.events[e] or print)(...); end);
frame:SetScript('OnUpdate', function(self, elapsed)
    CrossoverAchievements:OnUpdate()
end)
frame:SetPoint("BOTTOMLEFT", UIParent, "TOPLEFT", 0, 0);
frame.refreshDataForce = true;
frame.events = {};
frame:SetSize(1, 1);
frame:Show();
frame:RegisterEvent("ACHIEVEMENT_EARNED");

frame.events.ACHIEVEMENT_EARNED = function(achievementid)
    CrossoverAchievements:OnAchievementEarned(achievementid);
end

CrossoverAchievements.AddonDataVersion = 2;

local Blz_AchievementFrame_ToggleAchievementFrame = nil;
local GetAchievementInfo = GetAchievementInfo;
local ClearWTFData = false;
local CharacterNames = nil;
local SaveCharacterNamesWTF = false;
local playerGUID = UnitGUID("PLAYER");
	
function CrossoverAchievements:OnInitialize()
    if not self.Helpers.GameVersionHelper:IsValidVersion() then
        print('CrossoverAchievements not compatible with this game version');
        return;
    end
    self:ReplaceBlizzardFrame();
    self:ScheduleTimer(
	    function()
		    self:Initialize();
	    end, 1
	);
end

function CrossoverAchievements:OnEnable()
    self:OnInitialize();
end

function CrossoverAchievements:OnDisable()
    self:ExportData();
end

function CrossoverAchievements:CheckClearWTFData()
    if not CrossoverAchievements_AccountData then
	    return;
	end
    local WTFDataVersion = CrossoverAchievements_AccountData.DataVersion;
    self:InitializeAccountData();
    local GameVersionTable = self:GetCurrentGameVersionTable();
    if ClearWTFData or 
	   not WTFDataVersion or
	   WTFDataVersion < self.AddonDataVersion
	then
        CrossoverAchievements_AccountData = nil;
        print('CrossoverAchievements Data found from a previous incompatible version.');
		print('You will need to login with all of your characters.');

        if not self.Helpers.GameVersionHelper:IsRetail() and
		   LoadAddOn("CrossoverAchievements - Retail") and
           CrossoverAchievements_Retail ~= nil and
		   CrossoverAchievements_WOTLK.DataVersion < self.AddonDataVersion
		then
            CrossoverAchievements_Retail = nil;
		    print('You will need to import updated achievements data from Retail');
		end

        if not self.Helpers.GameVersionHelper:IsWOTLK() and 
		   LoadAddOn("CrossoverAchievements - WOTLK") and
		   CrossoverAchievements_WOTLK ~= nil and
		   CrossoverAchievements_WOTLK.DataVersion < self.AddonDataVersion
		then
            CrossoverAchievements_WOTLK = nil;
		    print('You will need to import updated achievements data from WOTLK');
		end	
	end
end 

function CrossoverAchievements:Initialize()
    if not self.IsLoaded and not self.IsLoading then
   
        --print('Start '.. date("%a %b %d %H:%M:%S %Y"));
        self.IsLoading = true;
        self:CheckClearWTFData();
        self:InitializeAccountData();
        self:ExportAchievements();
        --self.Extract:ExtractAchievementsInfo();
        self:ExportData();
        self:ImportData();
        self.Account:ProcessCompletedAchievements();
        self.Data.Categories:SortCategories();
        self.IsLoading = false;
        self.IsLoaded = true;
        self.Data.LastAchievements:SetLastAchievements()
        --print('End '.. date("%a %b %d %H:%M:%S %Y"));
	end
end

function CrossoverAchievements:OnUpdate()
    if not self.Helpers.GameVersionHelper:IsValidVersion() then
        return;
    end
    if self.IsLoaded then
        -- It won't actually sort all categories on every update, only the ones that are pending sorting
        -- after earning one achievement it should sort only the category of the new achievements
        -- all other categories are sorted on initialize
        self.Data.Categories:SortCategories();
	end
end

function CrossoverAchievements:ExportData()
  local GameVersionTable = self:GetCurrentGameVersionTable();
  local ExportTable = {};
  ExportTable.GameVersion = GameVersionTable.GameVersion;
  ExportTable.Time = GameVersionTable.Time;
  ExportTable.Characters = GameVersionTable.Characters;
  ExportTable.DataVersion = self.AddonDataVersion;
  if self.Helpers.GameVersionHelper:HasBlizzardAccountAchievements(GameVersionTable.GameVersion) then
    ExportTable.Achievements = GameVersionTable.Achievements;
  end
  local CompressData = self.Helpers.CompressHelper:CompressEncodeData(ExportTable);
  if self.Helpers.GameVersionHelper:IsRetail() then
    if not LoadAddOn("CrossoverAchievements - Retail") then
        --print("Can Load CrossoverAchievements - Retail Export Addon");
        return;
    end
    CrossoverAchievements_Retail.DataVersion = self.AddonDataVersion;
    CrossoverAchievements_Retail.Export = CompressData;
    CrossoverAchievements_Retail.GameVersion = GameVersionTable.GameVersion;
    CrossoverAchievements_Retail.Time = GameVersionTable.Time;
  end
  if self.Helpers.GameVersionHelper:IsWOTLK() then
    if not LoadAddOn("CrossoverAchievements - WOTLK") then
        return;
    end
    CrossoverAchievements_WOTLK.DataVersion = self.AddonDataVersion;
    CrossoverAchievements_WOTLK.Export = CompressData;
    CrossoverAchievements_WOTLK.GameVersion = GameVersionTable.GameVersion;
    CrossoverAchievements_WOTLK.Time = GameVersionTable.Time;
  end
end

function CrossoverAchievements:ImportData()
  local CompressData;
  if self.Helpers.GameVersionHelper:IsRetail() then
    if not LoadAddOn("CrossoverAchievements - WOTLK") then
        return;
    end
    if not CrossoverAchievements_WOTLK then
        return;
    end
    CompressData = CrossoverAchievements_WOTLK;
    -- Data from a newer version
    if CompressData and CompressData.DataVersion then
        if CompressData.DataVersion > self.AddonDataVersion then
            print('Please upgrade CrossoverAchievements addon to be able to Import WOTLK data');
            CrossoverAchievements_WOTLK = nil;
            return;
		end
        if CompressData.DataVersion < self.AddonDataVersion then
            print('Please Export WOTLK data with the last version of CrossoverAchievements addon');
            CrossoverAchievements_WOTLK = nil;
            return;
		end
    end
  end
  if self.Helpers.GameVersionHelper:IsWOTLK() then
    if not LoadAddOn("CrossoverAchievements - Retail") then
        return;
    end
    if not CrossoverAchievements_Retail then
        return;
    end
    CompressData = CrossoverAchievements_Retail;
    -- Data from a newer version
    if CompressData and CompressData.DataVersion then
        if CompressData.DataVersion < self.AddonDataVersion then
            print('Please upgrade CrossoverAchievements addon to be able to Import Retail data');
            CrossoverAchievements_Retail = nil;
            return;
        end
        if CompressData.DataVersion < self.AddonDataVersion then
            print('Please Export Retail data with the last version of CrossoverAchievements addon');
            CrossoverAchievements_Retail = nil;
            return;
		end
    end
  end
  -- Not data exported from the other version, or invalid data
  if not CompressData or 
     not CompressData.Export or 
     not CompressData.GameVersion or 
     not CompressData.Time or 
     not CompressData.DataVersion or 
     not self.Helpers.GameVersionHelper:CanImportData(CompressData.GameVersion) then
    return;
  end
  
  -- Data exported from the other version already processed
  if CrossoverAchievements_AccountData[CompressData.GameVersion] and 
     CrossoverAchievements_AccountData[CompressData.GameVersion].Time >= CompressData.Time then
    return;
  end
 
  local ImportData = self.Helpers.CompressHelper:DecompressDecodeData(CompressData.Export);
  -- Data exported cant be decompressed
  if not ImportData then
    return;
  end
  
  if ImportData.GameVersion ~= CompressData.GameVersion or
     ImportData.Time ~= CompressData.Time or
     ImportData.DataVersion ~= CompressData.DataVersion  then
    -- Invalid data, it should have the same information compressed and decompressed
    return;
  end
  
  if ImportData.Achievements and not self.Helpers.GameVersionHelper:HasBlizzardAccountAchievements(ImportData.GameVersion) then
    -- WOTLK Classic data can't have account achievements
    return;
  end
  
  CrossoverAchievements_AccountData[ImportData.GameVersion] = ImportData;
end

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
    CrossoverAchievements_AccountData.DataVersion = self.AddonDataVersion;
    local AchievementsDataType = self.Helpers.GameVersionHelper:GetAchievementsDataType();
    CrossoverAchievements_AccountData[AchievementsDataType] = CrossoverAchievements_AccountData[AchievementsDataType] or {};
    CrossoverAchievements_AccountData[AchievementsDataType].DataVersion = self.AddonDataVersion;
    CrossoverAchievements_AccountData[AchievementsDataType].Characters = CrossoverAchievements_AccountData[AchievementsDataType].Characters or {};
    if self.Helpers.GameVersionHelper:HasBlizzardAccountAchievements(AchievementsDataType)  then
        CrossoverAchievements_AccountData[AchievementsDataType].Achievements = CrossoverAchievements_AccountData[AchievementsDataType].Achievements or {};
        CrossoverAchievements_AccountData[AchievementsDataType].Total = CrossoverAchievements_AccountData[AchievementsDataType].Total or 0;
	end
    CrossoverAchievements_AccountData[AchievementsDataType].GameVersion = self.Helpers.GameVersionHelper:GetCurrentVersion();
end

function CrossoverAchievements:GetCurrentGameVersionTable()
    return CrossoverAchievements_AccountData[self.Helpers.GameVersionHelper:GetAchievementsDataType()];
end

function CrossoverAchievements:GetCurrentCharacterTable()
    local CurrentGameVersionTable = self:GetCurrentGameVersionTable();
    local CharacterTable = CurrentGameVersionTable.Characters[playerGUID];
    
    if CharacterTable == nil then
        CharacterTable = {};
    	CharacterTable.Time = time();
        CharacterTable.Achievements = {};
        CharacterTable.Total = 0;
        CharacterTable.GUID = playerGUID;
        CharacterTable.Realm = GetRealmName();
        CharacterTable.Name = UnitName("player");
        CurrentGameVersionTable.Characters[playerGUID] = CharacterTable;
    end

    return CurrentGameVersionTable.Characters[playerGUID];
end

function CrossoverAchievements:ExportAchievements()
    local CurrentGameVersionTable = self:GetCurrentGameVersionTable();
    local CurrentCharacterTable = self:GetCurrentCharacterTable();
    local categories = GetCategoryList();
    self:GroupCharactersByName(CurrentGameVersionTable);
    for categoryindex,categoryID in ipairs(categories) do
        local numAchievements = GetCategoryNumAchievements(categoryID);
        for index = 1, numAchievements do
            local achievementid = select(1, GetAchievementInfo(categoryID, index));
            self:ExportAchievement(CurrentGameVersionTable, CurrentCharacterTable, achievementid);
            local previousid = GetPreviousAchievement(achievementid)
            while previousid ~= nil do
                self:ExportAchievement(CurrentGameVersionTable, CurrentCharacterTable, previousid);
                previousid = GetPreviousAchievement(previousid)
            end
        end
    end
end

function CrossoverAchievements:OnAchievementEarned(achievementid)
    local CurrentGameVersionTable = self:GetCurrentGameVersionTable();
    local CurrentCharacterTable = self:GetCurrentCharacterTable();
    self:ExportAchievement(CurrentGameVersionTable, CurrentCharacterTable, achievementid);
    local accountachievement = self.API.IsAccountWideAchievement(achievementid);
	self.Account:ProcessCompletedAchievement(achievementid, time(), accountachievement, true, true, CurrentCharacterTable.Name,  CurrentCharacterTable.Realm, CurrentCharacterTable.GameVersion);
    self.Data.Achievements:RefreshSortAchievement(achievementid);
    self.Data.LastAchievements:SetLastAchievement(achievementid, time());
end

function CrossoverAchievements:ExportAchievement(CurrentGameVersionTable, CurrentCharacterTable, achievementid)
    local _, achname, points, completed, achivementmonth, achivementday, achivementyear, _, flags, _, _, isGuild, wasEarnedByMe, earnedBy, isStatistic = GetAchievementInfo(achievementid);
    if completed and not isGuild and not isStatistic then
        local achievementtime = time({year = 2000 + achivementyear, month = achivementmonth, day = achivementday});
        if ( bit.band(flags, ACHIEVEMENT_FLAGS_ACCOUNT) == ACHIEVEMENT_FLAGS_ACCOUNT ) then
            -- Account achievement added directly to the game version table
            self.Data.Achievements:SetAchievementData(achievementid, points, true);
			if not CurrentGameVersionTable.Achievements[achievementid] or CurrentGameVersionTable.Achievements[achievementid] ~= achievementtime then
                CurrentGameVersionTable.Achievements[achievementid] = achievementtime;
                CurrentGameVersionTable.Total = CurrentGameVersionTable.Total + 1;
                CurrentGameVersionTable.Time = time();
            end
        elseif wasEarnedByMe then
            -- Character achievement earned by the current character
            self.Data.Achievements:SetAchievementData(achievementid, points, false);
            if not CurrentCharacterTable.Achievements[achievementid] or CurrentCharacterTable.Achievements[achievementid] ~= achievementtime then
                CurrentCharacterTable.Achievements[achievementid] = achievementtime;
                CurrentCharacterTable.Total = CurrentCharacterTable.Total + 1;
                CurrentCharacterTable.Time = time();
                CurrentGameVersionTable.Time = time();

                -- We check if the achievement was added before to a table indexed by name in the else case 
                self:RemoveAchievementByName(CurrentGameVersionTable, CurrentCharacterTable, achievementid, achievementtime);
            end
        else
            -- Character achievement earned by the another character
            -- we don't know guid nor realm so we search for an already tracked character with that achievement
            -- in case we don't know the character we add the data to a temporal table indexed by character name
            -- it will be removed in the wasEarnedByMe condition once the player login with that character
            self.Data.Achievements:SetAchievementData(achievementid, points, false);
            self:ExportAchievementByName(CurrentGameVersionTable, CurrentCharacterTable, achievementid, earnedBy, achievementtime); 
        end
    end
end

function CrossoverAchievements:GroupCharactersByName(CurrentGameVersionTable)
    if CharacterNames ~= nil then
	    return;
	end
    CharacterNames = {};
    -- Create a temporal table of characters grouped by name, to obtain any possible character that has earned an achievement
    -- when blizzard's data indicate an achievement was earnedBy a character without realm nor guid
    -- the player could have character with the same name on different realms

    for index,CharacterTable in pairs(CurrentGameVersionTable.Characters) do 
        if CharacterTable and CharacterTable.GUID then
            if CharacterNames[CharacterTable.Name] == nil then
                CharacterNames[CharacterTable.Name] = {};
                CharacterNames[CharacterTable.Name].Guids = {};
                CharacterNames[CharacterTable.Name].Total = 0;
			end
            CharacterNames[CharacterTable.Name].Total = CharacterNames[CharacterTable.Name].Total + 1;
            CharacterNames[CharacterTable.Name].Guids[CharacterNames[CharacterTable.Name].Total] = CharacterTable.GUID;
		end
    end
    if SaveCharacterNamesWTF then   
        CrossoverAchievements_AccountData.CharacterNames = CharacterNames;
	else
        CrossoverAchievements_AccountData.CharacterNames = nil;
	end
end

function CrossoverAchievements:ExportAchievementByName(CurrentGameVersionTable, CurrentCharacterTable, achievementid, earnedBy, achievementtime)
	-- Achievement from other character obtained from blizzard's data, we don't know character guid nor realm
	if earnedBy == nil or earnedBy == "" then
	    return;
	end
    -- Search through all characters with guid and the same name
	local CharacterByNameTable = CurrentGameVersionTable.Characters[earnedBy];
    if CharacterNames[earnedBy] ~= nil then
        for _,CharacterGuid in pairs(CharacterNames[earnedBy].Guids) do
            local CharacterGuidTable = CurrentGameVersionTable.Characters[CharacterGuid];
            if CharacterGuidTable and 
			   CharacterGuidTable.Achievements[achievementid] and 
			   CharacterGuidTable.Achievements[achievementid] == achievementtime then
                -- we have found the character by guid, so we don't need to add the achievement
                if CharacterByNameTable ~= nil then
                    -- if we already added the achievement to a character indexed by name we remove it
                    self:RemoveAchievementByName(CurrentGameVersionTable, CharacterByNameTable, achievementid, achievementtime);
				end
                return;
			end
        end
	end
    -- we haven't found the character that earned the achievement so we create a temporal table with character name instead of guid
    -- if player login with that character later the temporal table will be removed
    if CharacterByNameTable == nil then
        CharacterByNameTable = {};
    	CharacterByNameTable.Time = time();
        CharacterByNameTable.Achievements = {};
        CharacterByNameTable.Total = 0;
        CharacterByNameTable.Name = earnedBy;
        CharacterByNameTable.GameVersion = self.Helpers.GameVersionHelper:GetCurrentVersion();
        CurrentGameVersionTable.Characters[earnedBy] = CharacterByNameTable;
    end

    if not CharacterByNameTable.Achievements[achievementid] or CharacterByNameTable.Achievements[achievementid] ~= achievementtime then
		CharacterByNameTable.Achievements[achievementid] = achievementtime;
        CharacterByNameTable.Total = CharacterByNameTable.Total + 1;
        CharacterByNameTable.Time = time();
        CurrentGameVersionTable.Time = time();
    end
end

function CrossoverAchievements:RemoveAchievementByName(CurrentGameVersionTable, CurrentCharacterTable, achievementid, achievementtime)
    -- Remove achievement from temporal table by character name
    -- the name has been added in the table by character guid
	local CharacterByNameTable = CurrentGameVersionTable.Characters[CurrentCharacterTable.Name];
    if CharacterByNameTable and 
	   CharacterByNameTable.Achievements[achievementid] and 
       CharacterByNameTable.Achievements[achievementid] == achievementtime
	then
        CharacterByNameTable.Achievements[achievementid] = nil;
        CharacterByNameTable.Total = CharacterByNameTable.Total - 1;
	end
    if CharacterByNameTable and CharacterByNameTable.Total == 0 then
	    CurrentGameVersionTable.Characters[CurrentCharacterTable.Name] = nil;
	end
end