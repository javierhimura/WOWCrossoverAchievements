local CrossoverAchievements = LibStub("AceAddon-3.0"):GetAddon("CrossoverAchievements");

local Extract = {};
CrossoverAchievements.Extract = Extract;

local GetCategoryInfo = nil;
local GetAchievementCategory = nil;
local GetNextAchievement = nil;
local GetPreviousAchievement = nil;
local GetAchievementInfo = nil;
local CurrentGameVersionExpansionLevel = GetExpansionLevel();

function Extract:Initialize()
    GetCategoryInfo = CrossoverAchievements.API.Blz_GetCategoryInfo;
    GetAchievementCategory = CrossoverAchievements.API.Blz_GetAchievementCategory;
    GetNextAchievement = CrossoverAchievements.API.Blz_GetNextAchievement;
    GetPreviousAchievement = CrossoverAchievements.API.Blz_GetPreviousAchievement;
    GetAchievementInfo = CrossoverAchievements.API.Blz_GetAchievementInfo;
end

function Extract:ClearExtractedAchievementsInfo()
    CrossoverAchievements_AccountData.AchievementsInfo = nil;
    CrossoverAchievements_AccountData.CategoriesInfo = nil;
end

function Extract:ExtractAchievementsInfo()
    self:Initialize();
    for achievementid = 1, 20000 do
        self:ExtractAchievementInfo(achievementid)
    end
    self:ExtractCategoriesInfo();
    self:ExtractRemovedAchievementsInfo();
end

function Extract:ExtractAchievementInfo(achievementid)
    CrossoverAchievements_AccountData.AchievementsInfo = CrossoverAchievements_AccountData.AchievementsInfo or {};
    local id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuild, wasEarnedByMe, earnedBy, isStatistic = GetAchievementInfo(achievementid)
    if not id then
        CrossoverAchievements_AccountData.AchievementsInfo[achievementid] = nil;
        return;
    end
    local previousid = GetPreviousAchievement(achievementid);
    local nextid = GetNextAchievement(achievementid);
    local categoryid = GetAchievementCategory(achievementid)
    CrossoverAchievements_AccountData.AchievementsInfo[achievementid] = {
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

function Extract:ExtractCategoriesInfo()
    CrossoverAchievements_AccountData.CategoriesInfo = CrossoverAchievements_AccountData.CategoriesInfo or {};
    local categories = GetCategoryList();
    for categoryindex,categoryid in ipairs(categories) do
        local title, parentCategoryid, flags = GetCategoryInfo(categoryid);
        CrossoverAchievements_AccountData.CategoriesInfo[categoryid]= {
                                                     id = categoryid,
                                                     title = title,
                                                     parentCategoryid = parentCategoryid,
                                                     flags = flags,
                                                     };
    end
    for achievementid, _ in pairs(CrossoverAchievements_AccountData.AchievementsInfo) do 
        local categoryid = CrossoverAchievements_AccountData.AchievementsInfo[achievementid].categoryid;
        if not CrossoverAchievements_AccountData.CategoriesInfo[categoryid] then
            local title, parentCategoryid, flags = GetCategoryInfo(categoryid);
            if title then
                CrossoverAchievements_AccountData.CategoriesInfo[categoryid]= {
                                                             id = categoryid,
                                                             title = title,
                                                             parentCategoryid = parentCategoryid,
                                                             flags = flags,
                                                             };
            else
                CrossoverAchievements_AccountData.CategoriesInfo[categoryid]= {
                                                             id = categoryid,
                                                             title = "HIDDEN_CATEGORY",
                                                             parentCategoryid = 0,
                                                             flags = 0,
                                                             };
            end
        end
    end
end


function Extract:ExtractRemovedAchievementsInfo()
    if not CrossoverAchievements.Helpers.GameVersionHelper:IsWOTLK() then
        return;
	end
    local CurrentGameVersionAchievementsDataType = CrossoverAchievements.Helpers.GameVersionHelper:GetClassicAchievementsDataType();
    local ImportAchievementsDataGlobal = CrossoverAchievements.Data.Achievements[CurrentGameVersionAchievementsDataType];

    CrossoverAchievements_AccountData.RemovedAchievements = CrossoverAchievements_AccountData.RemovedAchievements or {};
    for achievementid, _ in pairs(CrossoverAchievements_AccountData.AchievementsInfo) do 
		local data = ImportAchievementsDataGlobal.List[achievementid];
        if data ~= nil and (data.ClassicOnly or data.Removed ~= nil and CurrentGameVersionExpansionLevel < data.Removed) then
            local _, name, points, _, _, _, _, description, flags, icon, rewardText, isGuild, _, _, isStatistic = CrossoverAchievements.API.Blz_GetAchievementInfo(achievementid);
            if not isGuild and not isStatistic then
			    local RemovedAchievement = {};
                RemovedAchievement.Name = name;
                RemovedAchievement.Description = description;
                RemovedAchievement.Flags = flags;
                RemovedAchievement.Icon = icon;
                RemovedAchievement.RewardText = rewardText;
                local numCriteria = CrossoverAchievements.API.Blz_GetAchievementNumCriteria(achievementid);
                RemovedAchievement.NumCriteria = numCriteria;
                if RemovedAchievement.NumCriteria > 0 then
                    RemovedAchievement.Criterias = {};
                    for currCritera = 1, numCriteria do
                        local criterianame, criteriaType, _, quantity, reqQuantity, _, criteriaFlags, assetID, quantityString, criteriaID, _ = CrossoverAchievements.API.Blz_GetAchievementCriteriaInfo(achievementid, currCritera);
                        local Criteria = {};
                        Criteria.Name = criterianame;
                        Criteria.CriteriaType = criteriaType;
                        Criteria.Quantity = quantity;
                        Criteria.CriteriaFlags = criteriaFlags;
                        Criteria.AssetID = assetID;
                        Criteria.QuantityDescription = quantityString;
                        Criteria.CriteriaID = criteriaID;
                        RemovedAchievement.Criterias[currCritera] = Criteria;
					end
				end
                CrossoverAchievements_AccountData.RemovedAchievements[achievementid] = RemovedAchievement;
			end
		end
    end
end