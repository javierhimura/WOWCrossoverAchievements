local CrossoverAchievements = LibStub("AceAddon-3.0"):GetAddon("CrossoverAchievements");

local Extract = {};
CrossoverAchievements.Extract = Extract;

local GetCategoryInfo = nil;
local GetAchievementCategory = nil;
local GetNextAchievement = nil;
local GetPreviousAchievement = nil;
local GetAchievementInfo = nil;

function Extract:Initialize()
    GetCategoryInfo = CrossoverAchievements.API.Blz_GetCategoryInfo;
    GetAchievementCategory = CrossoverAchievements.API.Blz_GetAchievementCategory;
    GetNextAchievement = CrossoverAchievements.API.Blz_GetNextAchievement;
    GetPreviousAchievement = CrossoverAchievements.API.Blz_GetPreviousAchievement;
    GetAchievementInfo = CrossoverAchievements.API.Blz_GetAchievementInfo;
end

function Extract:ExtractAchievementsInfo()
    self:Initialize();
    local GameVersionTable = CrossoverAchievements.Storage:GetCurrentGameVersionTable();
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
    for achievementid, _ in pairs(GameVersionTable.AchievementsInfo) do 
        local categoryid = GameVersionTable.AchievementsInfo[achievementid].categoryid;
        if not GameVersionTable.CategoriesInfo[categoryid] then
            local title, parentCategoryid, flags = GetCategoryInfo(categoryid);
            if title then
                GameVersionTable.CategoriesInfo[categoryid]= {
                                                             id = categoryid,
                                                             title = title,
                                                             parentCategoryid = parentCategoryid,
                                                             flags = flags,
                                                             };
            else
                GameVersionTable.CategoriesInfo[categoryid]= {
                                                             id = categoryid,
                                                             title = "HIDDEN_CATEGORY",
                                                             parentCategoryid = 0,
                                                             flags = 0,
                                                             };
            end
        end
    end
end