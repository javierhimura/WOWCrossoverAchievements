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
		local id, flags;
		id, _, points, _, _, _, _, _, flags, _, _, _, _, _, _ = GetAchievementInfo(achievementid);
		if id ~= nil then
			accountwide = bit.band(flags, ACHIEVEMENT_FLAGS_ACCOUNT) == ACHIEVEMENT_FLAGS_ACCOUNT;
		else
			points = 0;
			accountwide = false;
		end
  	end;
	Achievements.List[achievementid] = {};
	Achievements.List[achievementid].Points = points;
	Achievements.List[achievementid].AccountWide = accountwide;
	Achievements.List[achievementid].NextID = GetNextAchievement(achievementid);
	Achievements.List[achievementid].PreviousID = GetPreviousAchievement(achievementid);
	local categoryid = GetAchievementCategory(achievementid);
	if categoryid ~= nil then
		Achievements.List[achievementid].CategoryID = categoryid;
		CrossoverAchievements.Data.Categories:SetCategoryAchievement(categoryid, achievementid);
	end
end

function Achievements:GetAchievementData(achievementid) 
	if not Achievements.List[achievementid] then
		Achievements:SetAchievementData(achievementid);
	end;
	return Achievements.List[achievementid] 
end
