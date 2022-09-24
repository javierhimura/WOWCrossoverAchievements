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
    self.Storage:ExportData();
end

function CrossoverAchievements:Initialize()
    if not self.IsLoaded and not self.IsLoading then
   
        --print('Start '.. date("%a %b %d %H:%M:%S %Y"));
        self.IsLoading = true;
        self.Storage:OnInitialize();
        self:ExportAchievements();
        --self.Extract:ExtractAchievementsInfo();
        self.Storage:ExportData();
        self.Storage:ImportData();
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

function CrossoverAchievements:ShowBlizFrame()
    CrossoverAchievements:Blz_AchievementFrame_ToggleAchievementFrame();
end

function CrossoverAchievements:ReplaceBlizzardFrame()
    LoadAddOn("Blizzard_AchievementUI");
    self.Blz_AchievementFrame_ToggleAchievementFrame = AchievementFrame_ToggleAchievementFrame;
    AchievementFrame_ToggleAchievementFrame = CrossoverAchievementFrame_ToggleAchievementFrame;
end

function CrossoverAchievements:ExportAchievements()
    local CurrentGameVersionTable = self.Storage:GetCurrentGameVersionTable();
    local CurrentCharacterTable = self.Storage:GetCurrentCharacterTable();
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
    local CurrentGameVersionTable = self.Storage:GetCurrentGameVersionTable();
    local CurrentCharacterTable = self.Storage:GetCurrentCharacterTable();
    self:ExportAchievement(CurrentGameVersionTable, CurrentCharacterTable, achievementid);
    local accountachievement = self.API.IsAccountWideAchievement(achievementid);
	self.Account:ProcessCompletedAchievement(achievementid, time(), accountachievement, true, true, CurrentCharacterTable.Name,  CurrentCharacterTable.Realm, CurrentCharacterTable.GameVersion);
    self.Data.Achievements:RefreshSortAchievement(achievementid);
    self.Data.LastAchievements:SetLastAchievement(achievementid, time());
    self.Storage:ExportData();
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