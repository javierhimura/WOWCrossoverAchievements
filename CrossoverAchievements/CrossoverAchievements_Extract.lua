local _, CrossoverAchievements = ...

local Extract = {};
CrossoverAchievements.Extract = Extract;

function Extract:ExtractAchievementsInfo()
    local GameVersionTable = CrossoverAchievements:GetCurrentGameVersionTable();
    if not GameVersionTable then
        return;
    end
    for achievementid = 1, 20000 do
        self:ExtractAchievementInfo(GameVersionTable, achievementid)
    end
    self:ExtractCategoriesInfo(GameVersionTable);
end

function Extract:ExtractAchievementInfo(GameVersionTable, achievementid)
    GameVersionTable.AchievementsInfo = GameVersionTable.AchievementsInfo or {};
    local id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuild, wasEarnedByMe, earnedBy, isStatistic = GetAchievementInfo(achievementid)
    if not id then
        GameVersionTable.AchievementsInfo[achievementid] = nil;
        return;
    end
    local previousid = GetPreviousAchievement(achievementid);
    local nextid = GetNextAchievement(achievementid);
    local categoryid = GetAchievementCategory(achievementid)
    GameVersionTable.AchievementsInfo[achievementid] = {
                                                       id = id,
                                                       name = name,
                                                       points = points,
                                                       description = description,
                                                       flags = flags,
                                                       icon = icon,
                                                       rewardText = rewardText,
                                                       isGuild = isGuild,
                                                       isStatistic = isStatistic,
                                                       previousid = previousid,
                                                       nextid = nextid,
                                                       categoryid = categoryid
                                                       };
end

function Extract:ExtractCategoriesInfo(GameVersionTable)
    GameVersionTable.CategoriesInfo = GameVersionTable.CategoriesInfo or {};
    local categories = GetCategoryList();
    for categoryindex,categoryid in ipairs(categories) do
        local title, parentCategoryid, flags = GetCategoryInfo(categoryid);
        GameVersionTable.CategoriesInfo[categoryid]= {
                                                     id = categoryid,
                                                     title = title,
                                                     parentCategoryid = parentCategoryid,
                                                     flags = flags,
                                                     };
    end
end