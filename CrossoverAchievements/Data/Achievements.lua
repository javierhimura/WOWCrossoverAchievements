local CrossoverAchievements = LibStub("AceAddon-3.0"):GetAddon("CrossoverAchievements");

local GetAchievementInfo = nil;
local GetNextAchievement = nil;
local GetPreviousAchievement = nil;
local GetAchievementCategory = nil;

CrossoverAchievements.Data = CrossoverAchievements.Data or {};
CrossoverAchievements.Data.Achievements = CrossoverAchievements.Data.Achievements or {};
local Achievements = CrossoverAchievements.Data.Achievements;

Achievements.List = {}

function Achievements:Initialize()
	GetAchievementInfo = CrossoverAchievements.API.Blz_GetAchievementInfo;
	GetNextAchievement = CrossoverAchievements.API.Blz_GetNextAchievement;
	GetPreviousAchievement = CrossoverAchievements.API.Blz_GetPreviousAchievement;
	GetAchievementCategory = CrossoverAchievements.API.Blz_GetAchievementCategory;
end

function Achievements:SetAchievementData(achievementid, points, accountwide)
	if Achievements.List[achievementid] then
		return;
	end;
	if not points and not accountwide then
		local id, flags;
		id, _, points, _, _, _, _, _, flags, _, _, _, _, _, _ = GetAchievementInfo(achievementid);
		if id ~= nil then
			accountwide = bit.band(flags, ACHIEVEMENT_FLAGS_ACCOUNT) == ACHIEVEMENT_FLAGS_ACCOUNT;
		else
			points = 0;
			accountwide = false;
		end
  	end;
    if not accountwide then
        accountwide = CrossoverAchievements.Account:IsForceAccountAchievement(achievementid, accountwide);
    end;
	Achievements.List[achievementid] = {};
	Achievements.List[achievementid].Points = points;
	Achievements.List[achievementid].AccountWide = accountwide;
    local NextAchievementId = GetNextAchievement(achievementid);
    local CurrentGameVersionAchievementsDataType = CrossoverAchievements.Helpers.GameVersionHelper:GetClassicAchievementsDataType();
    local ImportAchievementsDataGlobal = CrossoverAchievements.Data.Achievements[CurrentGameVersionAchievementsDataType];
    local ConvertedNextAchievementID = CrossoverAchievements.Account:ConvertAchievementVersion(NextAchievementId, ImportAchievementsDataGlobal);
	Achievements.List[achievementid].NextId = ConvertedNextAchievementID;
	Achievements.List[achievementid].PreviousId = GetPreviousAchievement(achievementid);
	local categoryid = GetAchievementCategory(achievementid);
	if categoryid ~= nil then
		Achievements.List[achievementid].CategoryId = categoryid;
		CrossoverAchievements.Data.Categories:SetCategoryAchievement(categoryid, achievementid);
	end
end

function Achievements:GetAchievementData(achievementid) 
	if not Achievements.List[achievementid] then
		Achievements:SetAchievementData(achievementid);
	end;
	return Achievements.List[achievementid] 
end

function Achievements:RefreshSortAchievement(achievementid)
	local data = self:GetAchievementData(achievementid);
	if data and data.CategoryId then
		CrossoverAchievements.Data.Categories:RefreshSortCategory(data.CategoryId);
	end
end

function Achievements:GetTotalAchievementsFromId(achievementid)
	local previousid = achievementid;
	local numtotal = 1;
	local numcompleted = 0;
	local data = CrossoverAchievements.Data.Achievements:GetAchievementData(previousid);
	local completed = CrossoverAchievements.Account:GetCompletedAchievementInfo(previousid);
	if completed then
		numcompleted = numcompleted + 1;
	end

	while data.PreviousId do
		previousid = data.PreviousId;
		data = CrossoverAchievements.Data.Achievements:GetAchievementData(previousid);
		completed = CrossoverAchievements.Account:GetCompletedAchievementInfo(previousid);
		numtotal = numtotal + 1;
		if completed then
			numcompleted = numcompleted + 1;
		end
	end

	return numtotal, numcompleted;
end