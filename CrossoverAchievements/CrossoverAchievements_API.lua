local _, CrossoverAchievements = ...

local API = {};
CrossoverAchievements.API = API;

local Blz_GetAchievementInfo = GetAchievementInfo;
local Blz_GetPreviousAchievement = GetPreviousAchievement;
local Blz_GetNextAchievement = GetNextAchievement;
local Blz_GetCategoryNumAchievements = GetCategoryNumAchievements;

function API.GetAchievementInfo(categoryid, index)
    local achievementid, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuild, wasEarnedByMe, earnedBy = Blz_GetAchievementInfo(categoryid, index);
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

--/script print(GetAchievementInfo(13));
--/script print(CrossoverAchievements.API.GetAchievementInfo(13));
--/script print(CrossoverAchievements.API.GetAchievementInfo(645));
--/script print( CrossoverAchievements.Account.GetCompletedAchievementInfo(13));