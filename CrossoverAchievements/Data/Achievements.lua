local _, CrossoverAchievements = ...

local GetAchievementInfo = GetAchievementInfo;
local GetNextAchievement = GetNextAchievement;
local GetPreviousAchievement = GetPreviousAchievement;
local GetAchievementCategory = GetAchievementCategory;

CrossoverAchievements.Data = CrossoverAchievements.Data or {};
CrossoverAchievements.Data.Achievements = CrossoverAchievements.Data.Categories or {};
local Achievements = CrossoverAchievements.Data.Achievements;

Achievements.List = {}

function Achievements:SetAchievementData(achievementid, points, accountwide)
	if Achievements.List[achievementid] then
		return;
	end;
	if not points and not accountwide then
		local flags;
		_, _, points, _, _, _, _, _, flags, _, _, _, _, _, _ = GetAchievementInfo(achievementid);
		accountwide = bit.band(flags, ACHIEVEMENT_FLAGS_ACCOUNT) == ACHIEVEMENT_FLAGS_ACCOUNT;
  	end;
	Achievements.List[achievementid] = {};
	Achievements.List[achievementid].Points = points;
	Achievements.List[achievementid].AccountWide = accountwide;
	Achievements.List[achievementid].NextID = GetNextAchievement(achievementid);
	Achievements.List[achievementid].PreviousID = GetPreviousAchievement(achievementid);
	local categoryid = GetAchievementCategory(achievementid);
    Achievements.List[achievementid].CategoryID = categoryid;
	CrossoverAchievements.Data.Categories:SetCategoryAchievement(categoryid, achievementid);
end

function Achievements:GetAchievementData(achievementid) 
	if Achievements.List[achievementid] then
		Achievements:SetAchievementData(achievementid);
	end;
	return Achievements.List[achievementid];
end
