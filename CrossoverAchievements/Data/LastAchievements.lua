local CrossoverAchievements = LibStub("AceAddon-3.0"):GetAddon("CrossoverAchievements");

CrossoverAchievements.Data = CrossoverAchievements.Data or {};
CrossoverAchievements.Data.LastAchievements = CrossoverAchievements.Data.LastAchievements or {};

local LastAchievements = CrossoverAchievements.Data.LastAchievements;
local GetCategoryList = GetCategoryList;
 
local AchievementList = {};
local AchievementBlzList = {};
local AchievedTimeList = {};
local Total = 0;
local MaxLastAchievements = 5;
local LastTime = nil;

function LastAchievements:SetLastAchievement(achievementid, achievementime)
	if AchievementBlzList[achievementid] or (Total == MaxLastAchievements and achievementime < LastTime) then
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
		if position == Total or AchievedTimeList[position] < achievementime then
			table.insert(AchievementList, position, achievementid);
			table.insert(AchievedTimeList, position, achievementime);
			LastTime = AchievedTimeList[Total];
			return;
		end
	end
end

function LastAchievements:InitializeBlzData(...)
	local numAchievements = select("#", ...);
	for position = 1, numAchievements do
		achievementid = select(position, ...);
		local AccountInfo = CrossoverAchievements.Account:GetCompletedAchievementInfo(achievementid);
		if AccountInfo then 
			table.insert(AchievementList, position, achievementid);
			table.insert(AchievedTimeList, position, AccountInfo.AchievementTime);
			AchievementBlzList[achievementid] = true;
			LastTime = AchievedTimeList[position];
		end
		Total = position;
	end
end

function LastAchievements:SetLastAchievements()
    AchievementList = {};
    AchievedTimeList = {};
	AchievementBlzList = {};
    Total = 0;
    LastTime = nil;
	-- Load first last achievements list from Blizzard, so in case the achievements from that list and the addon list  have the same achievements
	-- addon list will preserve blizzard list order
	LastAchievements:InitializeBlzData(CrossoverAchievements.API.Blz_GetLatestCompletedAchievements());

	local NowDateTime = time();
	local NowDateTable = {
		year = date("%y", NowDateTime),
		month = date("%m", NowDateTime),
		day = date("%d", NowDateTime)
	}
	-- get current time value with hour, minutes and seconds, to compare with achievements year, month, day completion date
	local TodayDateTime = time(NowDateTable);
	if Total == MaxLastAchievements and LastTime == TodayDateTime then
		-- If the list is completed with every achievement from today there is no need to check more
		return;
	end
	
	-- Add to the list any achievement flagged as completed by the addon, only if they have a more recent completion date 
	-- and are not already in blizzar's list
	for _,categoryid in pairs(GetCategoryList()) do
		for index = 1, CrossoverAchievements.API.GetCategoryNumAchievements(categoryid) do
			local achievementid = CrossoverAchievements.API.GetAchievementInfo(categoryid, index);
			local AccountInfo = CrossoverAchievements.Account:GetCompletedAchievementInfo(achievementid);
			if AccountInfo then 
				self:SetLastAchievement(achievementid, AccountInfo.AchievementTime);
			end
		end
	end
end

function LastAchievements:GetLastAchievements()
	return unpack(AchievementList);
end