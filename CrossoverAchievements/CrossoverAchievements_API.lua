local _, CrossoverAchievements = ...

local API = {};
CrossoverAchievements.API = API;

local Blz_GetAchievementInfo = GetAchievementInfo;

function API.GetAchievementInfo(categoryid, index)
    local achievementid, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuild, wasEarnedByMe, earnedBy = Blz_GetAchievementInfo(categoryid, index);
    local AccountInfo = CrossoverAchievements.Account:GetCompletedAchievementInfo(achievementid);
    if not AccountInfo then
        return achievementid, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuild, wasEarnedByMe, earnedBy;
    else
        return achievementid, name, points, true     , month, day, year, description, flags, icon, rewardText, isGuild, AccountInfo.WasEarnedByMe, AccountInfo.EarnedBy;
    end
end

--/script print(GetAchievementInfo(13));
--/script print(CrossoverAchievements.API:GetAchievementInfo(13));
--/script print(CrossoverAchievements.API:GetAchievementInfo(645));
--/script print( CrossoverAchievements.Account:GetCompletedAchievementInfo(13));