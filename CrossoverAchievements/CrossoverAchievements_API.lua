local _, CrossoverAchievements = ...

local API = {};
CrossoverAchievements.API = API;

local Blz_GetAchievementInfo = GetAchievementInfo;
local Blz_GetPreviousAchievement = GetPreviousAchievement;
local Blz_GetNextAchievement = GetNextAchievement;
local Blz_GetCategoryNumAchievements = GetCategoryNumAchievements;

function API.GetAchievementInfo(categoryid, index)
    local achievementid, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuild, wasEarnedByMe, earnedBy;
    if index then
        -- search achievementid by index category in addon data
	    achievementid = CrossoverAchievements.Data.Categories:GetCategoryAchievement(categoryid, index);
    else
        achievementid = categoryid;
	end
	if achievementid then
        -- achievementid received by parameter or found in category data, search additional data
		_, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuild, wasEarnedByMe, earnedBy = Blz_GetAchievementInfo(achievementid);
    else
        -- statistic or guild achievement don't exits in categories data, search in blizzard data
        achievementid, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuild, wasEarnedByMe, earnedBy = Blz_GetAchievementInfo(categoryid, index);
	end
    local AccountInfo = CrossoverAchievements.Account:GetCompletedAchievementInfo(achievementid);
    if not AccountInfo then
        return achievementid, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuild, wasEarnedByMe, earnedBy;
    else
        year = date("%y", AccountInfo.AchievementTime)
        month = date("%m", AccountInfo.AchievementTime)
        day = date("%d", AccountInfo.AchievementTime)
        return achievementid, name, points, true, month, day, year, description, flags, icon, rewardText, isGuild, AccountInfo.WasEarnedByMe, AccountInfo.EarnedBy;
    end
end

function API.IsAccountWideAchievement(achievementid)
    local data = CrossoverAchievements.Data.Achievements:GetAchievementData(achievementid);
    if not data then
	    return nil;
	end
    return data.AccountWide;
end

function API.GetPreviousAchievement(achievementid)
    local data = CrossoverAchievements.Data.Achievements:GetAchievementData(achievementid);
    if not data then
	    return Blz_GetPreviousAchievement(achievementid);
	end
    return data.PreviousId;
end

function API.GetNextAchievement(achievementid)
    local data = CrossoverAchievements.Data.Achievements:GetAchievementData(achievementid);
    if not data then
	    return Blz_GetNextAchievement(achievementid);
	end
    return data.NextId;
end

function API.GetCategoryNumAchievements(categoryId, includeAll)
    local total, completed, incompleted = 0;
    if CrossoverAchievements.Data.Categories:IsFOSLegacyAchievement(categoryId) then
        completed = CrossoverAchievements.Data.Categories:GetCategoryCompletedAchievements(categoryId);
        total = completed;
    elseif includeAll then
        total, completed, incompleted = Blz_GetCategoryNumAchievements(categoryId);
        completed = CrossoverAchievements.Data.Categories:GetCategoryCompletedAchievements(categoryId);
    else
        total = CrossoverAchievements.Data.Categories:GetCategoryVisibleAchievements(categoryId);
        completed = CrossoverAchievements.Data.Categories:GetCategoryCompletedVisibleAchievements(categoryId);
	end
    incompleted = total - completed;
    return total, completed, incompleted;
end