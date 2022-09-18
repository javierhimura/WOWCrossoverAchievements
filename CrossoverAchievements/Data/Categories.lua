local _, CrossoverAchievements = ...

CrossoverAchievements.Data = CrossoverAchievements.Data or {};
CrossoverAchievements.Data.Categories = CrossoverAchievements.Data.Categories or {};
local Categories = CrossoverAchievements.Data.Categories;

local CategoryList = {};
local FOSLegacyCategoryList = {};

local LegacyAchievementCategoryID = 15234;
local FOSCategoryID = 81;

local GetCategoryNumAchievements = GetCategoryNumAchievements;
local GetAchievementInfo = GetAchievementInfo;

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
end

function Categories:IsFOSLegacyAchievement(categoryid)
	return FOSLegacyCategoryList[categoryid];
end

function Categories:GetCategoryCompletedAchievements(categoryid)
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
	return table.getn(CategoryList[categoryid].SortedAchievements);
end

function Categories:GetCategoryCompletedVisibleAchievements(categoryid)
	if not CategoryList[categoryid] then
		return 0;
	end
	if not CategoryList[categoryid].IsSorted then
		self:SortCategory(categoryid);
	end
	return CategoryList[categoryid].CompletedVisible;
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
	
	CategoryList[categoryid].IsSorting = true;
	CategoryList[categoryid].SortedAchievements = {};
	CategoryList[categoryid].VisibleAchievements = {};
	CategoryList[categoryid].Total = 0;
	CategoryList[categoryid].CompletedVisible = 0;
	local blztotal = GetCategoryNumAchievements(categoryid);
	for index = 1,blztotal  do
		local achievementid = GetAchievementInfo(categoryid, index);
		local lastid = achievementid;
		local data = CrossoverAchievements.Data.Achievements:GetAchievementData(lastid);
		local completed = CrossoverAchievements.Account:GetCompletedAchievementInfo(lastid);
		if completed then
			-- Get last achievement in chain completed
			while (data.NextId and CrossoverAchievements.Account:GetCompletedAchievementInfo(data.NextId)) do
				lastid = data.NextId;
				data = CrossoverAchievements.Data.Achievements:GetAchievementData(lastid);
				completed = CrossoverAchievements.Account:GetCompletedAchievementInfo(lastid);
			end
			CategoryList[categoryid].CompletedVisible = CategoryList[categoryid].CompletedVisible + 1;
		end
		if not CategoryList[categoryid].VisibleAchievements[lastid] then
			CategoryList[categoryid].VisibleAchievements[lastid] = true;
			CategoryList[categoryid].Total = CategoryList[categoryid].Total + 1;
			CategoryList[categoryid].SortedAchievements[CategoryList[categoryid].Total] = lastid;
		end
		if completed and data.NextId then
			-- if not in FOS nor Legacy add next uncompleted achievement in chain
			if not CategoryList[categoryid].VisibleAchievements[data.NextId] then
				CategoryList[categoryid].VisibleAchievements[data.NextId] = true;
				CategoryList[categoryid].Total = CategoryList[categoryid].Total + 1;
				CategoryList[categoryid].SortedAchievements[CategoryList[categoryid].Total] = data.NextId;
			end
		end
	end
	table.sort(CategoryList[categoryid].SortedAchievements, OrderAchievements);
	
	CategoryList[categoryid].IsSorting = false;
	CategoryList[categoryid].IsSorted = true;
end

function Categories:SortCategoryFOS(categoryid)
	if not CategoryList[categoryid] or CategoryList[categoryid].SortedAchievement then
		return;
	end
	CategoryList[categoryid].SortedAchievements = {};
	CategoryList[categoryid].VisibleAchievements = {};
	CategoryList[categoryid].Total = 0;
	CategoryList[categoryid].CompletedVisible = 0;
	for achievementid,_ in pairs(CategoryList[categoryid].Achievements) do
		local lastid = achievementid;
		local data = CrossoverAchievements.Data.Achievements:GetAchievementData(lastid);
		local completed = CrossoverAchievements.Account:GetCompletedAchievementInfo(lastid);
		if completed then
			-- Get last achievement in chain completed
			while (data.NextId and CrossoverAchievements.Account:GetCompletedAchievementInfo(data.NextId)) do
				lastid = data.NextId;
				data = CrossoverAchievements.Data.Achievements:GetAchievementData(lastid);
				completed = CrossoverAchievements.Account:GetCompletedAchievementInfo(lastid);
			end
			CategoryList[categoryid].CompletedVisible = CategoryList[categoryid].CompletedVisible + 1;
		end
		if not CategoryList[categoryid].VisibleAchievements[lastid] then
			CategoryList[categoryid].VisibleAchievements[lastid] = true;
			CategoryList[categoryid].Total = CategoryList[categoryid].Total + 1;
			CategoryList[categoryid].SortedAchievements[CategoryList[categoryid].Total] = lastid;
		end
	end
	table.sort(CategoryList[categoryid].SortedAchievements, OrderAchievements);
end

function OrderAchievements(achievementA, achievementB)
	local DataA = CrossoverAchievements.Account:GetCompletedAchievementInfo(achievementA); 
	local DataB = CrossoverAchievements.Account:GetCompletedAchievementInfo(achievementB);
	local CompletedA = DataA ~= nil;
	local CompletedB = DataB ~= nil;
	
	if CompletedA ~= CompletedB then
		--completed achievement first
		return CompletedA;
	end

	if not CompletedA and not CompletedB then
		-- Incompleted achievements in id order
		return achievementA < achievementB;
	end

	if DataA.Account ~= DataB.Account then
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

	-- If nothing else thenAchievement id order
	return achievementA < achievementB;
end