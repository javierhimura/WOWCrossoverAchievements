local _, CrossoverAchievements = ...

CrossoverAchievements.Data = CrossoverAchievements.Data or {};
CrossoverAchievements.Data.Categories = CrossoverAchievements.Data.Categories or {};
local Categories = CrossoverAchievements.Data.Categories;

local CategoryList = {};
local FOSLegacyCategoryList = {};

local LegacyAchievementCategoryID = 15234;
local FOSCategoryID = 81;

function Categories:SetCategoryAchievement(categoryid, achievementid)
    if not CategoryList[categoryid] then
	    CategoryList[categoryid] = {};
	    CategoryList[categoryid].Achievements = {};
		local _, parentCategoryID, _ = GetCategoryInfo(categoryid);
	    CategoryList[categoryid].Parent = parentCategoryID;
		if categoryid == LegacyAchievementCategoryID or
		   categoryid == FOSCategoryID or
		   parentCategoryID == LegacyAchievementCategoryID or
		   parentCategoryID == FOSCategoryID then
		   FOSLegacyCategoryList[categoryid] = true;
		end
	end
    CategoryList[categoryid].Achievements[achievementid] = true;
end