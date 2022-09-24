local CrossoverAchievements = LibStub("AceAddon-3.0"):GetAddon("CrossoverAchievements");

local API = {};
CrossoverAchievements.API = API;

local Blz_GetAchievementInfo = GetAchievementInfo;
local Blz_GetPreviousAchievement = GetPreviousAchievement;
local Blz_GetNextAchievement = GetNextAchievement;
local Blz_GetCategoryNumAchievements = GetCategoryNumAchievements;
local Blz_GetTotalAchievementPoints = GetTotalAchievementPoints;
local Blz_GetLatestCompletedAchievements = GetLatestCompletedAchievements;
local Blz_GetAchievementCategory = GetAchievementCategory;
local Blz_GetNumCompletedAchievements = GetNumCompletedAchievements;

function API.GetAchievementInfo(categoryid, index)
    if CrossoverAchievements.IsLoading then
	    return Blz_GetAchievementInfo(categoryid, index);
	end
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
    if CrossoverAchievements.IsLoading then
	    return Blz_GetPreviousAchievement(achievementid);
	end
    local data = CrossoverAchievements.Data.Achievements:GetAchievementData(achievementid);
    if not data then
	    return Blz_GetPreviousAchievement(achievementid);
	end
    return data.PreviousId;
end

function API.GetNextAchievement(achievementid)
    if CrossoverAchievements.IsLoading then
	    return Blz_GetNextAchievement(achievementid);
	end
    local data = CrossoverAchievements.Data.Achievements:GetAchievementData(achievementid);
    if not data then
	    return Blz_GetNextAchievement(achievementid);
	end
    return data.NextId;
end

function API.GetCategoryNumAchievements(categoryId, includeAll)
    if CrossoverAchievements.IsLoading then
	    return Blz_GetCategoryNumAchievements(categoryId, includeAll);
	end
    local total, completed, incompleted = 0;
    if CrossoverAchievements.Data.Categories:IsFOSLegacyAchievement(categoryId) then
        completed = CrossoverAchievements.Data.Categories:GetCategoryCompletedAchievements(categoryId);
        total = completed;
    elseif includeAll then
        total  = CrossoverAchievements.Data.Categories:GetCategoryTotalAchievements(categoryId);
        completed = CrossoverAchievements.Data.Categories:GetCategoryCompletedAchievements(categoryId);
    else
        total = CrossoverAchievements.Data.Categories:GetCategoryVisibleAchievements(categoryId);
        completed = CrossoverAchievements.Data.Categories:GetCategoryCompletedVisibleAchievements(categoryId);
	end
    incompleted = total - completed;
    return total, completed, incompleted;
end

function API.GetTotalAchievementPoints(guildOnly)
    if CrossoverAchievements.IsLoading or guildOnly then
	    return Blz_GetTotalAchievementPoints(guildOnly);
	end
    return CrossoverAchievements.Account:GetTotalPoints();
end

function API.GetLatestCompletedAchievements()
    if CrossoverAchievements.IsLoading then
	    return Blz_GetLatestCompletedAchievements();
	end
    return Blz_GetLatestCompletedAchievements();
    --return CrossoverAchievements.Data.LastAchievements:GetLastAchievements();
end

function API.GetAchievementCategory(achievementid)
    if CrossoverAchievements.IsLoading then
	    return Blz_GetAchievementCategory(achievementid);
	end
    local data = CrossoverAchievements.Data.Achievements:GetAchievementData(achievementid);
    if not data then
	    return Blz_GetAchievementCategory(achievementid);
	end
    return data.CategoryId;
end

function API.GetNumCompletedAchievements(IN_GUILD_VIEW)
    if CrossoverAchievements.IsLoading or IN_GUILD_VIEW then
	    return Blz_GetNumCompletedAchievements(IN_GUILD_VIEW);
	end
    local total, _ = Blz_GetNumCompletedAchievements(IN_GUILD_VIEW);
    local numcompleted = CrossoverAchievements.Account:GetNumCompletedAchievements();
    return total, numcompleted;
end

