local CrossoverAchievements = LibStub("AceAddon-3.0"):GetAddon("CrossoverAchievements");

CrossoverAchievements.Data = CrossoverAchievements.Data or {};
CrossoverAchievements.Data.LastAchievements = CrossoverAchievements.Data.LastAchievements or {};

local LastAchievements = CrossoverAchievements.Data.LastAchievements;
local GetCategoryList = GetCategoryList;
 
local AchievementList = {};
local AchievedTimeList = {};
local Total = 0;
local MaxLastAchievements = 5;
local LastTime = nil;

function LastAchievements:SetLastAchievement(achievementid, achievementime)
	if Total == MaxLastAchievements and achievementime < LastTime then
		return;
	end
	if Total < MaxLastAchievements then
		Total = Total + 1;

	end
	if Total == MaxLastAchievements then
		table.remove(AchievementList, MaxLastAchievements + 1);
		table.remove(AchievedTimeList, MaxLastAchievements + 1);
	end
	for position = 1, MaxLastAchievements do
		if position == Total or AchievedTimeList[position] <= achievementime then
			table.insert(AchievementList, position, achievementid);
			table.insert(AchievedTimeList, position, achievementime);
			LastTime = AchievedTimeList[Total];
			return;
		end
	end
end

function LastAchievements:SetLastAchievements()
    AchievementList = {};
    AchievedTimeList = {};
    Total = 0;
    LastTime = nil;
	for _,categoryid in pairs(GetCategoryList()) do
		for index = 1, CrossoverAchievements.API.GetCategoryNumAchievements(categoryid) do
			local achievementid = CrossoverAchievements.API.GetAchievementInfo(categoryid, index);
			local AccountInfo = CrossoverAchievements.Account:GetCompletedAchievementInfo(achievementid);
			if AccountInfo then 
				self:SetLastAchievement(achievementid, AccountInfo.AchievementTime);
			end
		end
	end
    AchievedTimeList = nil;
end

function LastAchievements:GetLastAchievements()
	return unpack(AchievementList);
end