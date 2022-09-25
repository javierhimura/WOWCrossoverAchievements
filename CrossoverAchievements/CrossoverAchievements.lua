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

local Blz_AchievementFrame_ToggleAchievementFrame = nil;
local Blz_AchievementFrameCategories_Update = nil;
local Blz_ToggleAchievementFrame = nil;
local Blz_AchievementMicroButton_Update = nil;
	
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
    self.Storage:ExportVersionData();
end

function CrossoverAchievements:Initialize()
    if not self.IsLoaded and not self.IsLoading then
        --print('Start '.. date("%a %b %d %H:%M:%S %Y"));
        self.IsLoading = true;

        self.Storage:OnInitialize();
        self.Data.Categories:Initialize();
        self.Data.Achievements:Initialize();
        self.Character:Initialize();
        self.Character:ProcessBlizzardAchievementsData();
        self.Extract:ExtractAchievementsInfo();
        self.Storage:ExportVersionData();
        self.Account:ProcessCompletedAchievements();
        self.Data.Categories:SortCategories();
        self.IsLoading = false;
        self.IsLoaded = true;
        self.Data.LastAchievements:SetLastAchievements();
        CrossoverAchievements.EnableAchievementMicroButton()
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
    self.Blz_AchievementFrame_ToggleAchievementFrame();
end

function CrossoverAchievements.EnableAchievementMicroButton()
	if CrossoverAchievements.API.HasCompletedAnyAchievement() and CanShowAchievementUI() and not Kiosk.IsEnabled()  then
        AchievementMicroButton.minLevel = nil;
		AchievementMicroButton:Enable();
		AchievementMicroButton:SetButtonState("NORMAL");
	end
end

function CrossoverAchievements.AchievementMicroButton_Update(...)
    CrossoverAchievements.Blz_AchievementMicroButton_Update(...)
    CrossoverAchievements.EnableAchievementMicroButton();
end

function CrossoverAchievements.ToggleAchievementFrame(stats)
	if (Kiosk.IsEnabled()) then
		return;
	end

	if (CrossoverAchievements.API.HasCompletedAnyAchievement() or IsInGuild() ) and CanShowAchievementUI() then
		AchievementFrame_LoadUI();
		CrossoverAchievementFrame_ToggleAchievementFrame(stats);
	end
end

function CrossoverAchievements:ReplaceBlizzardFrame()
    LoadAddOn("Blizzard_AchievementUI");
    self.Blz_AchievementFrame_ToggleAchievementFrame = AchievementFrame_ToggleAchievementFrame;
    self.Blz_AchievementFrameCategories_Update = CrossoverAchievementFrameCategories_Update;
    self.Blz_ToggleAchievementFrame = ToggleAchievementFrame;
    self.Blz_AchievementMicroButton_Update = AchievementMicroButton_Update;
    AchievementFrame_ToggleAchievementFrame = CrossoverAchievementFrame_ToggleAchievementFrame;
    AchievementFrameCategories_Update = CrossoverAchievementFrameCategories_Update;
    ToggleAchievementFrame = CrossoverAchievements.ToggleAchievementFrame;
end

function CrossoverAchievements:OnAchievementEarned(achievementid)
    local CurrentGameVersionTable = self.Storage:GetCurrentGameVersionTable();
    local CurrentCharacterTable = self.Storage:GetCurrentCharacterTable();
    self.Character:ProcessBlizzardAchievementData(CurrentGameVersionTable, CurrentCharacterTable, achievementid);
    local accountachievement = self.API.IsAccountWideAchievement(achievementid);
	self.Account:ProcessCompletedAchievement(achievementid, time(), accountachievement, true, true, CurrentCharacterTable.Name,  CurrentCharacterTable.Realm, CurrentCharacterTable.GameVersion);
    self.Data.Achievements:RefreshSortAchievement(achievementid);
    self.Data.LastAchievements:SetLastAchievement(achievementid, time());
    self.Storage:ExportVersionData();
end