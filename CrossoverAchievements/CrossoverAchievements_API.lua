local CrossoverAchievements = LibStub("AceAddon-3.0"):GetAddon("CrossoverAchievements");

local API = {};
CrossoverAchievements.API = API;

local playerGUID = UnitGUID('PLAYER');

API.Blz_GetAchievementInfo = GetAchievementInfo;
API.Blz_GetPreviousAchievement = GetPreviousAchievement;
API.Blz_GetNextAchievement = GetNextAchievement;
API.Blz_GetCategoryNumAchievements = GetCategoryNumAchievements;
API.Blz_GetTotalAchievementPoints = GetTotalAchievementPoints;
API.Blz_GetLatestCompletedAchievements = GetLatestCompletedAchievements;
API.Blz_GetAchievementCategory = GetAchievementCategory;
API.Blz_GetNumCompletedAchievements = GetNumCompletedAchievements;
API.Blz_GetCategoryInfo = GetCategoryInfo;
API.Blz_GetAchievementNumCriteria = GetAchievementNumCriteria;
API.Blz_GetAchievementCriteriaInfo = GetAchievementCriteriaInfo;
API.Blz_GetAchievementLink = GetAchievementLink;
API.Blz_HasCompletedAnyAchievement = HasCompletedAnyAchievement;
API.Blz_GetCategoryList = GetCategoryList;
API.Blz_GetGuildCategoryList = GetGuildCategoryList;
API.Blz_GetStatisticsCategoryList = GetStatisticsCategoryList;

function API.GetAchievementCompleted(categoryid, index, ByMe)
    local Position = 4; -- Completed achievement return parameter position
    if ByMe then
	    Position = 13; -- Completed by me achievement return parameter position
	end
    if CrossoverAchievements.IsLoading then
	    return select(Position, API.Blz_GetAchievementInfo(categoryid, index));
	end
    local achievementid, completed;
    if index then
        if CrossoverAchievements.Data.Categories:IsGuildCategory(categoryid) 
		or CrossoverAchievements.Data.Categories:IsStatisticsCategory(categoryid) then
	        return select(Position, API.Blz_GetAchievementInfo(categoryid, index));
        end
        -- search achievementid by index category in addon data
	    achievementid = CrossoverAchievements.Data.Categories:GetCategoryAchievement(categoryid, index);
    else
        achievementid = categoryid;
	end
	if not achievementid then
        -- statistic or guild achievement don't exits in categories data, search in blizzard data
       return select(Position, API.Blz_GetAchievementInfo(categoryid, index));
	end

    local AccountInfo = CrossoverAchievements.Account:GetCompletedAchievementInfo(achievementid);
    if not AccountInfo then
       -- Achievement not stored as collected, return collected information from Blizzard
       return select(Position, API.Blz_GetAchievementInfo(categoryid, index));
	end
    if ByMe then
	    return AccountInfo.WasEarnedByMe;
	end
    return true;
end

function API.GetAchievementCompletedAny(categoryid, index)
    return API.GetAchievementCompleted(categoryid, index, false);
end

function API.GetAchievementCompletedByMe(categoryid, index)
    return API.GetAchievementCompleted(categoryid, index, true);
end

function API.GetAchievementInfo(categoryid, index)
    if CrossoverAchievements.IsLoading then
	    return API.Blz_GetAchievementInfo(categoryid, index);
	end
    local achievementid, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuild, wasEarnedByMe, earnedBy;
    if index then
        if CrossoverAchievements.Data.Categories:IsGuildCategory(categoryid) 
		or CrossoverAchievements.Data.Categories:IsStatisticsCategory(categoryid) then
	        return API.Blz_GetAchievementInfo(categoryid, index);
        end
        -- search achievementid by index category in addon data
	    achievementid = CrossoverAchievements.Data.Categories:GetCategoryAchievement(categoryid, index);
    else
        achievementid = categoryid;
	end
	if achievementid then
        -- achievementid received by parameter or found in category data, search additional data
		_, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuild, wasEarnedByMe, earnedBy = API.Blz_GetAchievementInfo(achievementid);
    else
        -- statistic or guild achievement don't exits in categories data, search in blizzard data
        achievementid, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuild, wasEarnedByMe, earnedBy = API.Blz_GetAchievementInfo(categoryid, index);
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
	    return API.Blz_GetPreviousAchievement(achievementid);
	end
    local data = CrossoverAchievements.Data.Achievements:GetAchievementData(achievementid);
    if not data then
	    return Blz_GetPreviousAchievement(achievementid);
	end
    return data.PreviousId;
end

function API.GetNextAchievement(achievementid)
    if CrossoverAchievements.IsLoading then
	    return API.Blz_GetNextAchievement(achievementid);
	end
    local data = CrossoverAchievements.Data.Achievements:GetAchievementData(achievementid);
    if not data then
	    return API.Blz_GetNextAchievement(achievementid);
	end
    return data.NextId;
end

function API.GetCategoryNumAchievements(categoryId, includeAll)
    if CrossoverAchievements.IsLoading then
	    return API.Blz_GetCategoryNumAchievements(categoryId, includeAll);
	end
    if CrossoverAchievements.Data.Categories:IsGuildCategory(categoryid) 
	or CrossoverAchievements.Data.Categories:IsStatisticsCategory(categoryid) then
	    return API.Blz_GetCategoryNumAchievements(categoryId, includeAll);
    end
    if categoryId == -1 then --summary achievements
	    return API.GetNumCompletedAchievements();
	end
    local total, completed, incompleted = 0;
    if CrossoverAchievements.Data.Categories:IsFOSLegacyAchievement(categoryId) then
        completed = CrossoverAchievements.Data.Categories:GetCategoryVisibleAchievements(categoryId);
        total = completed;
    elseif includeAll then
        total  = CrossoverAchievements.Data.Categories:GetCategoryTotalAchievements(categoryId);
        completed = CrossoverAchievements.Data.Categories:GetCategoryCompletedAchievements(categoryId);
    else
        total = CrossoverAchievements.Data.Categories:GetCategoryVisibleAchievements(categoryId);
        completed = CrossoverAchievements.Data.Categories:GetCategoryCompletedVisibleAchievements(categoryId);
	end
    incompleted = total - completed;
    if total == 0 then
	    return API.Blz_GetCategoryNumAchievements(categoryId, includeAll);
	end
    return total, completed, incompleted;
end

function API.GetTotalAchievementPoints(guildOnly)
    if CrossoverAchievements.IsLoading or guildOnly then
	    return API.Blz_GetTotalAchievementPoints(guildOnly);
	end
    return CrossoverAchievements.Account:GetTotalPoints();
end

function API.GetLatestCompletedAchievements(IN_GUILD_VIEW)
    if CrossoverAchievements.IsLoading or IN_GUILD_VIEW then
	    return API.Blz_GetLatestCompletedAchievements(IN_GUILD_VIEW);
	end
    return CrossoverAchievements.Data.LastAchievements:GetLastAchievements();
end

function API.GetAchievementCategory(achievementid)
    if CrossoverAchievements.IsLoading then
	    return API.Blz_GetAchievementCategory(achievementid);
	end
    local data = CrossoverAchievements.Data.Achievements:GetAchievementData(achievementid);
    if not data then
	    return API.Blz_GetAchievementCategory(achievementid);
	end
    return data.CategoryId;
end

function API.GetNumCompletedAchievements(IN_GUILD_VIEW)
    if CrossoverAchievements.IsLoading or IN_GUILD_VIEW then
	    return API.Blz_GetNumCompletedAchievements(IN_GUILD_VIEW);
	end
    local total, _ = API.Blz_GetNumCompletedAchievements(IN_GUILD_VIEW);
    local numcompleted = CrossoverAchievements.Account:GetNumCompletedAchievements();
    return total, numcompleted;
end

function API.GetAchievementLink(achievementid)
    if CrossoverAchievements.IsLoading or not CrossoverAchievements.Helpers.GameVersionHelper:IsWOTLK() then
        -- Achievements links can't be modified in Retail
	    return API.Blz_GetAchievementLink(achievementid);
	end
    local link = API.Blz_GetAchievementLink(achievementid);
    local AccountInfo = CrossoverAchievements.Account:GetCompletedAchievementInfo(achievementid);
    if not AccountInfo or AccountInfo.WasEarnedByMe then
        -- Uncompleted achievement or achievement earned by current character
        -- Blizzard link is the same as the one we could generate so return Blizzard's instead
	    return API.Blz_GetAchievementLink(achievementid);
	end
    -- Create an achievement link with addon achievement time
    local year = date("%y", AccountInfo.AchievementTime)
    local month = date("%m", AccountInfo.AchievementTime)
    local day = date("%d", AccountInfo.AchievementTime)
    local name = select(2, API.Blz_GetAchievementInfo(achievementid));
	local linkguid = string.gsub(playerGUID, '0x', '');
    local addonlink = "|cffffff00|Hachievement:".. achievementid ..":"..linkguid..":1:"..month..":"..day..":"..year..":4294967295:4294967295:4294967295:4294967295|h["..name.."]|h|r"
	return addonlink;
end

function API.HasCompletedAnyAchievement()
    if CrossoverAchievements.IsLoading then
	    return API.Blz_HasCompletedAnyAchievement();
	end
    local numcompleted = CrossoverAchievements.Account:GetNumCompletedAchievements();
    return numcompleted > 0;
end
