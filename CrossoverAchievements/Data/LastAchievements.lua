local CrossoverAchievements = LibStub("AceAddon-3.0"):GetAddon("CrossoverAchievements");

CrossoverAchievements.Data = CrossoverAchievements.Data or {};
CrossoverAchievements.Data.LastAchievements = CrossoverAchievements.Data.LastAchievements or {};

local LastAchievements = CrossoverAchievements.Data.LastAchievements;
local List = {};
local Total = 0;
local LastTime = nil;
local MaxLastAchievements = 5;

function LastAchievements:SetLastAchievement(achievementid, achievementime)
	if LastTime and achievementime < LastTime then
		return;
	end
	table.insert(List, 1, achievementid);
	LastTime = achievementime;
	if Total == MaxLastAchievements then
		table.remove(List, MaxLastAchievements + 1);
	else
		Total = Total + 1;
	end
end

function LastAchievements:GetLastAchievements()
	return unpack(List);
end