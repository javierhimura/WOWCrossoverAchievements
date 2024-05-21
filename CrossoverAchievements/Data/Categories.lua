local CrossoverAchievements = LibStub("AceAddon-3.0"):GetAddon("CrossoverAchievements");

CrossoverAchievements.Data = CrossoverAchievements.Data or {};
CrossoverAchievements.Data.Categories = CrossoverAchievements.Data.Categories or {};
local Categories = CrossoverAchievements.Data.Categories;

local CategoryList = {};
local GuildCategoryList = {};
local StatisticsCategoryList = {};
local FOSLegacyCategoryList = {};

local LegacyAchievementCategoryID = 15234;
local FOSCategoryID = 81;
local SaveCategoriesWFT = false;

local GetCategoryNumAchievements = nil;
local GetAchievementInfo = nil;
local GetCategoryList = nil;
local GetGuildCategoryList = nil;
local GetStatisticsCategoryList = nil;
local BlzCategoryOrder = {};

function Categories:Initialize()
	GetCategoryNumAchievements = CrossoverAchievements.API.Blz_GetCategoryNumAchievements;
	GetAchievementInfo = CrossoverAchievements.API.Blz_GetAchievementInfo;
    GetCategoryList = CrossoverAchievements.API.Blz_GetCategoryList;
    GetGuildCategoryList = CrossoverAchievements.API.Blz_GetGuildCategoryList;
	GetStatisticsCategoryList = CrossoverAchievements.API.Blz_GetStatisticsCategoryList;
	self:SetCategoryGuildList();
	self:SetCategoryStatisticsList();
end

function Categories:SetCategoryGuildList()
	if not CrossoverAchievements.Helpers.GameVersionHelper:HasGuildAchievements() then
		return;
	end
    local categories = GetGuildCategoryList();
    for _,categoryid in ipairs(categories) do
		GuildCategoryList[categoryid] = true;
	end
end

function Categories:SetCategoryStatisticsList()
    local categories = GetStatisticsCategoryList();
    for _,categoryid in ipairs(categories) do
		StatisticsCategoryList[categoryid] = true;
	end
end

function Categories:IsGuildCategory(categoryid)
	return GuildCategoryList[categoryid];
end

function Categories:IsStatisticsCategory(categoryid)
	return StatisticsCategoryList[categoryid];
end

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

function Categories:RefreshSortCategory(categoryid)
	CategoryList[categoryid].IsSorted = false;
	CategoryList[categoryid].IsSorting = false;
	CategoryList[categoryid].SortedAchievements = {};
	CategoryList[categoryid].VisibleAchievements = {};
	CategoryList[categoryid].Visible = 0;
	CategoryList[categoryid].VisibleCompleted = 0;
	CategoryList[categoryid].Total = 0;
	CategoryList[categoryid].TotalCompleted = 0;
end

function Categories:IsFOSLegacyAchievement(categoryid)
	return FOSLegacyCategoryList[categoryid];
end

function Categories:GetAllCategoriesTotalAchievements()
	local Total = 0;
	for categoryid,_ in pairs(CategoryList) do  
		if CategoryList[categoryid].Total ~= nil then
			Total = Total + CategoryList[categoryid].Total;
		end
	end
	return Total;
end

function Categories:GetCategoryTotalAchievements(categoryid)
	if not CategoryList[categoryid] then
		return 0;
	end
	if not CategoryList[categoryid].IsSorted then
		self:SortCategory(categoryid);
	end
	return CategoryList[categoryid].Total;
end

function Categories:GetCategoryVisibleAchievements(categoryid)
	if not CategoryList[categoryid] then
		return 0;
	end
	if not CategoryList[categoryid].IsSorted then
		self:SortCategory(categoryid);
	end
	return CategoryList[categoryid].Visible;
end

function Categories:GetCategoryCompletedAchievements(categoryid)
	if not CategoryList[categoryid] then
		return 0;
	end
	if not CategoryList[categoryid].IsSorted then
		self:SortCategory(categoryid);
	end
	return CategoryList[categoryid].TotalCompleted;
end

function Categories:GetCategoryCompletedVisibleAchievements(categoryid)
	if not CategoryList[categoryid] then
		return 0;
	end
	if not CategoryList[categoryid].IsSorted then
		self:SortCategory(categoryid);
	end
	return CategoryList[categoryid].VisibleCompleted;
end

function Categories:GetCategoryAchievement(categoryid, index)
	if not CategoryList[categoryid] then
		return nil;
	end
	if not CategoryList[categoryid].IsSorted then
		self:SortCategory(categoryid);
	end
	local total = self:GetCategoryVisibleAchievements(categoryid);
	if total < index then
		return nil;
	end 
	return CategoryList[categoryid].SortedAchievements[index];
end

function Categories:SortCategories()
	for categoryid,_ in pairs(CategoryList) do  
		self:SortCategory(categoryid);
	end
end

function Categories:PrintDebug(active,message)
    if active then
        print(message);
    end
end

function Categories:SortCategory(categoryid)
	if not CategoryList[categoryid] then
		return;
	end
	if CategoryList[categoryid].IsSorting or CategoryList[categoryid].IsSorted then
		return;
	end
	if self:IsFOSLegacyAchievement(categoryid) then
		self:SortCategoryFOS(categoryid);
		return;
	end
	
	if SaveCategoriesWFT then
		local title, parentCategoryid, flags = GetCategoryInfo(categoryid);
		CategoryList[categoryid].Title = title;
	end

	CategoryList[categoryid].IsSorting = true;
	CategoryList[categoryid].SortedAchievements = {};
	CategoryList[categoryid].VisibleAchievements = {};
	CategoryList[categoryid].Visible = 0;
	CategoryList[categoryid].VisibleCompleted = 0;
	CategoryList[categoryid].Total = 0;
	CategoryList[categoryid].TotalCompleted = 0;
	local blztotal = GetCategoryNumAchievements(categoryid);
	for index = 1,blztotal  do
		local achievementid = GetAchievementInfo(categoryid, index);
		local lastid = achievementid;
		local data = CrossoverAchievements.Data.Achievements:GetAchievementData(lastid);
		local completed = CrossoverAchievements.Account:GetCompletedAchievementInfo(lastid);
        BlzCategoryOrder[lastid] = index;
		if completed then
			-- Get last achievement in chain completed
            while data.NextId and CrossoverAchievements.Account:GetCompletedAchievementInfo(data.NextId) do
				lastid = data.NextId;
                BlzCategoryOrder[lastid] = index;
				data = CrossoverAchievements.Data.Achievements:GetAchievementData(lastid);
			end
		end
        
		if not CategoryList[categoryid].VisibleAchievements[lastid] then
			CategoryList[categoryid].VisibleAchievements[lastid] = true;
			CategoryList[categoryid].Visible = CategoryList[categoryid].Visible + 1;
			if completed then
				CategoryList[categoryid].VisibleCompleted = CategoryList[categoryid].VisibleCompleted + 1;
			end
			local numtotal, numcompleted = CrossoverAchievements.Data.Achievements:GetTotalAchievementsFromId(lastid);
			CategoryList[categoryid].Total = CategoryList[categoryid].Total + numtotal;
			CategoryList[categoryid].TotalCompleted = CategoryList[categoryid].TotalCompleted + numcompleted;
			CategoryList[categoryid].SortedAchievements[CategoryList[categoryid].Visible] = lastid;
		end
		if completed and data.NextId then
			-- if not in FOS nor Legacy add next uncompleted achievement in chain
			if not CategoryList[categoryid].VisibleAchievements[data.NextId] then
				CategoryList[categoryid].VisibleAchievements[data.NextId] = true;
				CategoryList[categoryid].Visible = CategoryList[categoryid].Visible + 1;
				CategoryList[categoryid].SortedAchievements[CategoryList[categoryid].Visible] = data.NextId;
			end
		end
	end
	table.sort(CategoryList[categoryid].SortedAchievements, OrderAchievements);
	
	CategoryList[categoryid].IsSorting = false;
	CategoryList[categoryid].IsSorted = true;
	if SaveCategoriesWFT then
        CrossoverAchievements_AccountData.CategoryList = CategoryList;
    else
        CrossoverAchievements_AccountData.CategoryList = nil;
	end
end

function Categories:SortCategoryFOS(categoryid)
	if not CategoryList[categoryid] or CategoryList[categoryid].IsSorted then
		return;
	end
	
	if SaveCategoriesWFT then
		local title, parentCategoryid, flags = GetCategoryInfo(categoryid);
		CategoryList[categoryid].Title = title;
	end

	CategoryList[categoryid].SortedAchievements = {};
	CategoryList[categoryid].VisibleAchievements = {};
	CategoryList[categoryid].Visible = 0;
	CategoryList[categoryid].VisibleCompleted = 0;
	CategoryList[categoryid].Total = 0;
	CategoryList[categoryid].TotalCompleted = 0;
	for achievementid,_ in pairs(CategoryList[categoryid].Achievements) do
		local lastid = achievementid;
		local data = CrossoverAchievements.Data.Achievements:GetAchievementData(lastid);
		local completed = CrossoverAchievements.Account:GetCompletedAchievementInfo(lastid);
        BlzCategoryOrder[lastid] = index;
		if completed then
			-- Get last achievement in chain completed
			while data.NextId and CrossoverAchievements.Account:GetCompletedAchievementInfo(data.NextId)
			do
				lastid = data.NextId;
				data = CrossoverAchievements.Data.Achievements:GetAchievementData(lastid);
				BlzCategoryOrder[lastid] = index;
			end
			if not CategoryList[categoryid].VisibleAchievements[lastid] then
				CategoryList[categoryid].VisibleAchievements[lastid] = true;
				CategoryList[categoryid].Visible = CategoryList[categoryid].Visible + 1;
				CategoryList[categoryid].VisibleCompleted = CategoryList[categoryid].VisibleCompleted + 1;
				local numtotal, numcompleted = CrossoverAchievements.Data.Achievements:GetTotalAchievementsFromId(lastid);
				CategoryList[categoryid].Total = CategoryList[categoryid].Total + numtotal;
				CategoryList[categoryid].TotalCompleted = CategoryList[categoryid].TotalCompleted + numcompleted;
				CategoryList[categoryid].SortedAchievements[CategoryList[categoryid].Visible] = lastid;
			end
		end
	end
	if SaveCategoriesWFT then
        CrossoverAchievements_AccountData.CategoryList = CategoryList;
    else
        CrossoverAchievements_AccountData.CategoryList = nil;
	end

	if CategoryList[categoryid].Visible > 0 then
		table.sort(CategoryList[categoryid].SortedAchievements, OrderAchievements);
	end
	CategoryList[categoryid].IsSorting = false;
	CategoryList[categoryid].IsSorted = true;
end

function OrderAchievements(achievementA, achievementB)
	local DataA = CrossoverAchievements.Account:GetCompletedAchievementInfo(achievementA); 
	local DataB = CrossoverAchievements.Account:GetCompletedAchievementInfo(achievementB);
	local CompletedA = DataA ~= nil;
	local CompletedB = DataB ~= nil;
    local BlzOrderA = BlzCategoryOrder[achievementA];
    local BlzOrderB = BlzCategoryOrder[achievementB];
    if not BlzOrderA or not BlzOrderB or BlzOrderA == BlzOrderB then
        -- if we can not determine blizzard order, use achievement id order instead
        BlzOrderA = achievementA;
        BlzOrderB = achievementB;
    end
	
	if CompletedA ~= CompletedB then
		--completed achievement first
		return CompletedA;
	end

	if not CompletedA and not CompletedB then
		-- Incompleted achievements in blizzard order
		return BlzOrderA < BlzOrderB;
	end

	if CrossoverAchievements.Helpers.GameVersionHelper:HasBlizzardAccountAchievements() and DataA.Account ~= DataB.Account then
		--account achievement first
		return DataA.Account;
	end

	if DataA.WasEarnedByMe ~= DataB.WasEarnedByMe then
		--completed by this character achievements before completed by other character achievements
		return DataA.WasEarnedByMe;
	end

	if DataA.WasEarnedHere ~= DataB.WasEarnedHere then
		--completed in this version achievements before completed in other versions achievements
		return DataA.WasEarnedHere;
	end

	if DataA.AchievementTime ~= DataB.AchievementTime then
		 -- Newer achievement first
		return DataA.AchievementTime > DataB.AchievementTime;
	end

	-- If nothing else thenAchievement blizzard order
	return BlzOrderA < BlzOrderB;
end