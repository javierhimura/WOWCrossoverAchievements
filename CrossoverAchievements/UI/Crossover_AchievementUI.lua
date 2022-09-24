local CrossoverAchievements = LibStub("AceAddon-3.0"):GetAddon("CrossoverAchievements");

UIPanelWindows["CrossoverAchievementFrame"] = { area = "doublewide", pushable = 0, xoffset = 80, whileDead = 1 };

local GetAchievementInfo = CrossoverAchievements.API.GetAchievementInfo;
local GetPreviousAchievement = CrossoverAchievements.API.GetPreviousAchievement;
local GetNextAchievement = CrossoverAchievements.API.GetNextAchievement;
local GetCategoryInfo = GetCategoryInfo;
local GetCategoryNumAchievements = CrossoverAchievements.API.GetCategoryNumAchievements;
local GetTotalAchievementPoints = CrossoverAchievements.API.GetTotalAchievementPoints;
local GetLatestCompletedAchievements = CrossoverAchievements.API.GetLatestCompletedAchievements;
local GetAchievementLink = GetAchievementLink; 
local GetAchievementCategory = CrossoverAchievements.API.GetAchievementCategory;
local GetNumCompletedAchievements = CrossoverAchievements.API.GetNumCompletedAchievements;

local ACHIEVEMENTUI_CATEGORIES = {};

local ACHIEVEMENT_GOLD_BORDER_COLOR	= CreateColor(1, 0.675, 0.125);
local ACHIEVEMENT_RED_BORDER_COLOR	= CreateColor(0.7, 0.15, 0.05);
local ACHIEVEMENT_BLUE_BORDER_COLOR	= CreateColor(0.129, 0.671, 0.875);
local ACHIEVEMENT_YELLOW_BORDER_COLOR = CreateColor(0.4, 0.2, 0.0);

local ACHIEVEMENTUI_CATEGORIESWIDTH = 175;

local ACHIEVEMENTUI_PROGRESSIVEHEIGHT = 50;
local ACHIEVEMENTUI_PROGRESSIVEWIDTH = 42;

local ACHIEVEMENTUI_MAX_SUMMARY_ACHIEVEMENTS = 4;

local ACHIEVEMENTUI_MAXCONTENTWIDTH = 330;
local ACHIEVEMENTUI_CRITERIACHECKWIDTH = 20;
local ACHIEVEMENTUI_FONTHEIGHT;						-- set in CrossoverAchievementButton_OnLoad
local ACHIEVEMENTUI_MAX_LINES_COLLAPSED = 3;		-- can show 3 lines of text when achievement is collapsed

local ACHIEVEMENTUI_DEFAULTSUMMARYACHIEVEMENTS = {6, 503, 116, 545, 1017};
local ACHIEVEMENTUI_SUMMARYCATEGORIES = {92, 96, 97, 95, 168, 169, 201, 155, 15117, 15246};
if GetCategoryInfo(15117) == nil or GetCategoryInfo(15246) == nil then
    ACHIEVEMENTUI_SUMMARYCATEGORIES = {92, 96, 97, 95, 168, 169, 201, 155};
end
local ACHIEVEMENTUI_DEFAULTGUILDSUMMARYACHIEVEMENTS = {5362, 4860, 4989, 4947};
local ACHIEVEMENTUI_GUILDSUMMARYCATEGORIES = {15088, 15077, 15078, 15079, 15080, 15089};

local ACHIEVEMENT_CATEGORY_NORMAL_R = 0;
local ACHIEVEMENT_CATEGORY_NORMAL_G = 0;
local ACHIEVEMENT_CATEGORY_NORMAL_B = 0;
local ACHIEVEMENT_CATEGORY_NORMAL_A = .9;

local ACHIEVEMENT_CATEGORY_HIGHLIGHT_R = 0;
local ACHIEVEMENT_CATEGORY_HIGHLIGHT_G = .6;
local ACHIEVEMENT_CATEGORY_HIGHLIGHT_B = 0;
local ACHIEVEMENT_CATEGORY_HIGHLIGHT_A = .65;

local ACHIEVEMENTBUTTON_LABELWIDTH = 320;

local ACHIEVEMENT_COMPARISON_SUMMARY_ID = -1
local ACHIEVEMENT_COMPARISON_STATS_SUMMARY_ID = -2

local ACHIEVEMENT_FILTER_ALL = 1;
local ACHIEVEMENT_FILTER_COMPLETE = 2;
local ACHIEVEMENT_FILTER_INCOMPLETE = 3;

local FORCE_COLUMNS_MAX_WIDTH = 220;				-- if no columns normally, force 2 if max criteria width is <= this and number of criteria >= MIN_CRITERIA
local FORCE_COLUMNS_MIN_CRITERIA = 20;
local FORCE_COLUMNS_LEFT_OFFSET = -10;				-- offset for left column
local FORCE_COLUMNS_RIGHT_OFFSET = 24;				-- offset for right column
local FORCE_COLUMNS_RIGHT_COLUMN_SPACE = 150;		-- max room for first entry of the right column due to achievement shield

local CrossoverAchievementFrameFilterStrings = {ACHIEVEMENT_FILTER_ALL_EXPLANATION,
ACHIEVEMENT_FILTER_COMPLETE_EXPLANATION, ACHIEVEMENT_FILTER_INCOMPLETE_EXPLANATION};

local FEAT_OF_STRENGTH_ID = 81;
local GUILD_FEAT_OF_STRENGTH_ID = 15093;
local GUILD_CATEGORY_ID = 15076;
local IN_GUILD_VIEW;
local TEXTURES_OFFSET = 0;		-- 0.5 when in guild view

local ACHIEVEMENT_FRAME_NUM_SEARCH_PREVIEWS = 5;
local ACHIEVEMENT_FRAME_SHOW_ALL_RESULTS_INDEX = ACHIEVEMENT_FRAME_NUM_SEARCH_PREVIEWS + 1;

local displayStatCategories = {};

local guildMemberRequestFrame;

local trackedAchievements = {};
local Crossover_achievementFunctions;
local function updateTrackedAchievements (...)
	local count = select("#", ...);

	for i = 1, count do
		trackedAchievements[select(i, ...)] = true;
	end
end

local function GetSafeScrollChildBottom(scrollChild)
	return scrollChild:GetBottom() or 0;
end

-- [[ CrossoverAchievementFrame ]] --

function CrossoverAchievementFrame_ToggleAchievementFrame(toggleStatFrame, toggleGuildView)
	if not CrossoverAchievements.IsLoaded then
		return;
	end
	CrossoverAchievementFrameComparison:Hide();
	CrossoverAchievementFrameTab_OnClick = CrossoverAchievementFrameBaseTab_OnClick;
	if ( not toggleStatFrame ) then
		if ( CrossoverAchievementFrame:IsShown() and CrossoverAchievementFrame.selectedTab == 1 ) then
			HideUIPanel(CrossoverAchievementFrame);
		else
			CrossoverAchievementFrame_SetTabs();
			ShowUIPanel(CrossoverAchievementFrame);
			if ( toggleGuildView ) then
				CrossoverAchievementFrameTab_OnClick(2);
			else
				CrossoverAchievementFrameTab_OnClick(1);
			end
		end
		return;
	end
	if ( CrossoverAchievementFrame:IsShown() and CrossoverAchievementFrame.selectedTab == 3 ) then
		HideUIPanel(CrossoverAchievementFrame);
	else
		ShowUIPanel(CrossoverAchievementFrame);
		CrossoverAchievementFrame_SetTabs();
		CrossoverAchievementFrameTab_OnClick(3);
	end
end

function CrossoverAchievementFrame_DisplayComparison (unit)
	CrossoverAchievementFrame.wasShown = nil;
	CrossoverAchievementFrameTab_OnClick = CrossoverAchievementFrameComparisonTab_OnClick;
	CrossoverAchievementFrameTab_OnClick(1);
	CrossoverAchievementFrame_SetTabs();
	ShowUIPanel(CrossoverAchievementFrame);
	--CrossoverAchievementFrame_ShowSubFrame(CrossoverAchievementFrameComparison, CrossoverAchievementFrameSummary);
	CrossoverAchievementFrameComparison_SetUnit(unit);
	CrossoverAchievementFrameComparison_ForceUpdate();
end

function CrossoverAchievementFrame_OnLoad (self)
	PanelTemplates_SetNumTabs(self, 3);
	self.selectedTab = 1;
	PanelTemplates_UpdateTabs(self);

	CrossoverAchievementFrameSummary.forceOnShow = CrossoverAchievementFrameSummary_OnShow;
	CrossoverAchievementFrameAchievements.forceOnShow = CrossoverAchievementFrameAchievements_OnShow;

	self.searchResults.scrollFrame.update = CrossoverAchievementFrame_UpdateFullSearchResults;
	self.searchResults.scrollFrame.scrollBar.doNotHide = true;
	HybridScrollFrame_CreateButtons(self.searchResults.scrollFrame, "CrossoverAchievementFullSearchResultsButton", 0, 0);
end

function CrossoverAchievementFrame_OnShow (self)
	PlaySound(SOUNDKIT.ACHIEVEMENT_MENU_OPEN);
	CrossoverAchievementFrameHeaderPoints:SetText(BreakUpLargeNumbers(GetTotalAchievementPoints()));
	if ( not CrossoverAchievementFrame.wasShown ) then
		CrossoverAchievementFrame.wasShown = true;
		CrossoverAchievementCategoryButton_OnClick(CrossoverAchievementFrameCategoriesContainerButton1);
	end
	UpdateMicroButtons();
	CrossoverAchievementFrame_LoadTextures();
end

function CrossoverAchievementFrame_OnHide (self)
	PlaySound(SOUNDKIT.ACHIEVEMENT_MENU_CLOSE);
	CrossoverAchievementFrame_HideSearchPreview();
	self.searchResults:Hide();
	self.searchBox:SetText("");
	UpdateMicroButtons();
	CrossoverAchievementFrame_ClearTextures();
end

function CrossoverAchievementFrame_ForceUpdate ()
	if ( CrossoverAchievementFrameAchievements:IsShown() ) then
		CrossoverAchievementFrameAchievements_ForceUpdate();
	elseif ( CrossoverAchievementFrameStats:IsShown() ) then
		CrossoverAchievementFrameStats_Update();
	elseif ( CrossoverAchievementFrameComparison:IsShown() ) then
		CrossoverAchievementFrameComparison_ForceUpdate();
	end
end

function CrossoverAchievementFrame_SetTabs()
    if CrossoverAchievements.Helpers.GameVersionHelper:HasGuildAchievements() then
        CrossoverAchievementFrameTab2:Show();
        CrossoverAchievementFrameTab3:SetPoint("LEFT", CrossoverAchievementFrameTab2, "RIGHT", -5, 0);
    else
        CrossoverAchievementFrameTab2:Hide();
        CrossoverAchievementFrameTab2.text = "";
        CrossoverAchievementFrameTab3:SetPoint("LEFT", CrossoverAchievementFrameTab1, "RIGHT", -5, 0);
    end
    if not SetAchievementSearchString then
        CrossoverAchievementFrameSearchBox:Hide();
        CrossoverAchievementFrameSearchPreviewContainer:Hide();
    end
end

function CrossoverAchievementFrame_UpdateTabs(clickedTab)
    if clickedTab == 2 and not CrossoverAchievements.Helpers.GameVersionHelper:HasGuildAchievements() then
        return;
    end
	CrossoverAchievementFrame.searchResults:Hide();
	PanelTemplates_Tab_OnClick(_G["CrossoverAchievementFrameTab"..clickedTab], CrossoverAchievementFrame);
	local tab;
	for i = 1, 3 do
        if i ~= 2 or CrossoverAchievements.Helpers.GameVersionHelper:HasGuildAchievements() then
            tab = _G["CrossoverAchievementFrameTab"..i];
            if ( i == clickedTab ) then
                tab.text:SetPoint("CENTER", 0, -5);
            else
                tab.text:SetPoint("CENTER", 0, -3);
            end
        end
	end
end

function CrossoverAchievementFrame_ToggleView()
	-- summary and scrollframes get toggled in their respective OnShow
	if ( IN_GUILD_VIEW ) then
		IN_GUILD_VIEW = nil;
		TEXTURES_OFFSET = 0;
		-- container backgrounds
		CrossoverAchievementFrameAchievementsBackground:SetTexCoord(0, 1, 0, 0.5);
		CrossoverAchievementFrameSummaryBackground:SetTexCoord(0, 1, 0, 0.5);
		-- header
		CrossoverAchievementFrameHeaderPoints:SetVertexColor(1, 1, 1);
		CrossoverAchievementFrameHeaderTitle:SetText(ACHIEVEMENT_TITLE);
		local shield = CrossoverAchievementFrameHeaderShield;
		shield:SetTexture("Interface\\AchievementFrame\\UI-Achievement-TinyShield");
		shield:SetTexCoord(0, 0.625, 0, 0.625);
		shield:SetHeight(20);
	else
		IN_GUILD_VIEW = true;
		TEXTURES_OFFSET = 0.5;
		-- container background
		CrossoverAchievementFrameAchievementsBackground:SetTexCoord(0, 1, 0.5, 1);
		CrossoverAchievementFrameSummaryBackground:SetTexCoord(0, 1, 0.5, 1);
		-- header
		CrossoverAchievementFrameHeaderPoints:SetVertexColor(0, 1, 0);
		CrossoverAchievementFrameHeaderTitle:SetText(GUILD_ACHIEVEMENTS_TITLE);
		local shield = CrossoverAchievementFrameHeaderShield;
		shield:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Guild");
		shield:SetTexCoord(0.63281250, 0.67187500, 0.13085938, 0.16601563);
		shield:SetHeight(18);
		-- guild emblem
		local bkgR, bkgG, bkgB, borderR, borderG, borderB, emblemR, emblemG, emblemB, emblemFilename = GetGuildLogoInfo();
		if ( emblemFilename ) then
			CrossoverAchievementFrameGuildEmblemLeft:SetTexture(emblemFilename);
			CrossoverAchievementFrameGuildEmblemRight:SetTexture(emblemFilename);
			local r, g, b = ACHIEVEMENT_YELLOW_BORDER_COLOR:GetRGB();
			CrossoverAchievementFrameGuildEmblemLeft:SetVertexColor(r, g, b, 0.5);
			CrossoverAchievementFrameGuildEmblemRight:SetVertexColor(r, g, b, 0.5);
		end
	end
	CrossoverAchievementFrameHeaderPoints:SetText(BreakUpLargeNumbers(GetTotalAchievementPoints(IN_GUILD_VIEW)));
end

function CrossoverAchievementFrameBaseTab_OnClick (id)
	CrossoverAchievementFrame_UpdateTabs(id);

	local isSummary = false;
	local swappedView = false;
	if ( id == 1 ) then
		if ( IN_GUILD_VIEW ) then
			CrossoverAchievementFrame_ToggleView();
		end
		Crossover_achievementFunctions = CROSSOVER_ACHIEVEMENT_FUNCTIONS;
		CrossoverAchievementFrameCategories_GetCategoryList(ACHIEVEMENTUI_CATEGORIES); -- This needs to happen before CrossoverAchievementFrame_ShowSubFrame (fix for bug 157885)
		if ( Crossover_achievementFunctions.selectedCategory == "summary" ) then
			isSummary = true;
			CrossoverAchievementFrame_ShowSubFrame(CrossoverAchievementFrameSummary);
		else
			CrossoverAchievementFrame_ShowSubFrame(CrossoverAchievementFrameAchievements);
		end
		CrossoverAchievementFrameWaterMark:SetTexture("Interface\\AchievementFrame\\UI-Achievement-AchievementWatermark");
		CrossoverAchievementFrameCategoriesBG:SetTexCoord(0, 0.5, 0, 1);
		CrossoverAchievementFrameGuildEmblemLeft:Hide();
		CrossoverAchievementFrameGuildEmblemRight:Hide();
	elseif ( id == 2 and CrossoverAchievements.Helpers.GameVersionHelper:HasGuildAchievements() ) then
		if ( not IN_GUILD_VIEW ) then
			CrossoverAchievementFrame_ToggleView();
		end
		Crossover_achievementFunctions = CROSSOVER_GUILD_ACHIEVEMENT_FUNCTIONS;
		CrossoverAchievementFrameCategories_GetCategoryList(ACHIEVEMENTUI_CATEGORIES); -- This needs to happen before CrossoverAchievementFrame_ShowSubFrame (fix for bug 157885)
		if ( Crossover_achievementFunctions.selectedCategory == "summary" ) then
			isSummary = true;
			CrossoverAchievementFrame_ShowSubFrame(CrossoverAchievementFrameSummary);
		else
			CrossoverAchievementFrame_ShowSubFrame(CrossoverAchievementFrameAchievements);
		end
		CrossoverAchievementFrameWaterMark:SetTexture();
		CrossoverAchievementFrameCategoriesBG:SetTexCoord(0.5, 1, 0, 1);
		CrossoverAchievementFrameGuildEmblemLeft:Show();
		CrossoverAchievementFrameGuildEmblemRight:Show();
	else
		Crossover_achievementFunctions = CROSSOVER_STAT_FUNCTIONS;
		CrossoverAchievementFrameCategories_GetCategoryList(ACHIEVEMENTUI_CATEGORIES); -- This needs to happen before CrossoverAchievementFrame_ShowSubFrame (fix for bug 157885)
		if ( Crossover_achievementFunctions.selectedCategory == "summary" ) then
			CrossoverAchievementFrame_ShowSubFrame(CrossoverAchievementFrameStats);
			Crossover_achievementFunctions.selectedCategory = ACHIEVEMENT_COMPARISON_STATS_SUMMARY_ID;
			CrossoverAchievementFrameStatsContainerScrollBar:SetValue(0);
		else
			CrossoverAchievementFrame_ShowSubFrame(CrossoverAchievementFrameStats);
		end
		CrossoverAchievementFrameWaterMark:SetTexture("Interface\\AchievementFrame\\UI-Achievement-StatWatermark");
		CrossoverAchievementFrameCategoriesBG:SetTexCoord(0, 0.5, 0, 1);
		CrossoverAchievementFrameGuildEmblemLeft:Hide();
		CrossoverAchievementFrameGuildEmblemRight:Hide();
	end

	CrossoverAchievementFrameCategories_Update();

	if ( not isSummary ) then
		Crossover_achievementFunctions.updateFunc();
	end

	CrossoverAchievementSwitchAchievementSearchTab(id);
end

CrossoverAchievementFrameTab_OnClick = CrossoverAchievementFrameBaseTab_OnClick;

function CrossoverAchievementFrameComparisonTab_OnClick (id)
	if ( IN_GUILD_VIEW ) then
		CrossoverAchievementFrame_ToggleView();
		CrossoverAchievementFrameGuildEmblemLeft:Hide();
		CrossoverAchievementFrameGuildEmblemRight:Hide();
	end
	if ( id == 1 ) then
		Crossover_achievementFunctions = CROSSOVER_COMPARISON_ACHIEVEMENT_FUNCTIONS;
		CrossoverAchievementFrame_ShowSubFrame(CrossoverAchievementFrameComparison, CrossoverAchievementFrameComparisonContainer);
		CrossoverAchievementFrameWaterMark:SetTexture("Interface\\AchievementFrame\\UI-Achievement-AchievementWatermark");
	elseif ( id == 2 and CrossoverAchievements.Helpers.GameVersionHelper:HasGuildAchievements() ) then
		-- We don't have support for guild achievement comparison.  Just open up the non-comparison guild achievement tab.
		CrossoverAchievementFrameTab_OnClick = CrossoverAchievementFrameBaseTab_OnClick;
		CrossoverAchievementFrameTab_OnClick(2);
	else
		Crossover_achievementFunctions = COMPARISON_STAT_FUNCTIONS;
		CrossoverAchievementFrame_ShowSubFrame(CrossoverAchievementFrameComparison, CrossoverAchievementFrameComparisonStatsContainer);
		CrossoverAchievementFrameWaterMark:SetTexture("Interface\\AchievementFrame\\UI-Achievement-StatWatermark");
	end
	CrossoverAchievementFrameCategoriesBG:SetTexCoord(0, 0.5, 0, 1);
	CrossoverAchievementFrameCategories_GetCategoryList(ACHIEVEMENTUI_CATEGORIES);
	CrossoverAchievementFrameCategories_Update();
	CrossoverAchievementFrame_UpdateTabs(id);

	Crossover_achievementFunctions.updateFunc();
	CrossoverAchievementSwitchAchievementSearchTab(id);
end

function CrossoverAchievementSwitchAchievementSearchTab(id)
    if SwitchAchievementSearchTab then
        SwitchAchievementSearchTab(id);
    end
end

CrossoverAchievementFrame_SUBFRAMES = {
	"CrossoverAchievementFrameSummary",
	"CrossoverAchievementFrameAchievements",
	"CrossoverAchievementFrameStats",
	"CrossoverAchievementFrameComparison",
	"CrossoverAchievementFrameComparisonContainer",
	"CrossoverAchievementFrameComparisonStatsContainer"
};

function CrossoverAchievementFrame_ShowSubFrame(...)
	local subFrame, show;
	for _, name in next, CrossoverAchievementFrame_SUBFRAMES  do
		subFrame = _G[name];
		show = false;
		for i=1, select("#", ...) do
			if ( subFrame ==  select(i, ...)) then
				show = true
			end
		end
		if ( show ) then
			-- force the OnShow to run if we need to swap views on the subFrame
			if ( subFrame.forceOnShow and subFrame.guildView ~= IN_GUILD_VIEW and subFrame:IsShown() ) then
				subFrame.forceOnShow();
			else
				subFrame:Show();
			end
		else
			subFrame:Hide();
		end
	end
end

-- [[ CrossoverAchievementFrameCategories ]] --

function CrossoverAchievementFrameCategories_OnLoad (self)
	self.buttons = {};
	self:RegisterEvent("ADDON_LOADED");
	self:SetScript("OnEvent", CrossoverAchievementFrameCategories_OnEvent);
end

function CrossoverAchievementFrameCategories_OnEvent (self, event, ...)
	if ( event == "ADDON_LOADED" ) then
		local addonName = ...;
		if ( addonName and addonName ~= "Blizzard_AchievementUI" ) then
			return;
		end

		CrossoverAchievementFrameCategories_GetCategoryList(ACHIEVEMENTUI_CATEGORIES);

		CrossoverAchievementFrameCategoriesContainerScrollBar.Show =
			function (self)
				ACHIEVEMENTUI_CATEGORIESWIDTH = 175;
				CrossoverAchievementFrameCategories:SetWidth(175);
				CrossoverAchievementFrameCategoriesContainer:GetScrollChild():SetWidth(175);
				CrossoverAchievementFrameAchievements:SetPoint("TOPLEFT", "$parentCategories", "TOPRIGHT", 22, 0);
				CrossoverAchievementFrameStats:SetPoint("TOPLEFT", "$parentCategories", "TOPRIGHT", 22, 0);
				CrossoverAchievementFrameComparison:SetPoint("TOPLEFT", "$parentCategories", "TOPRIGHT", 22, 0)
				CrossoverAchievementFrameWaterMark:SetWidth(145);
				CrossoverAchievementFrameWaterMark:SetTexCoord(0, 145/256, 0, 1);
				for _, button in next, CrossoverAchievementFrameCategoriesContainer.buttons do
					CrossoverAchievementFrameCategories_DisplayButton(button, button.element)
				end
				getmetatable(self).__index.Show(self);
			end

		CrossoverAchievementFrameCategoriesContainerScrollBar.Hide =
			function (self)
				ACHIEVEMENTUI_CATEGORIESWIDTH = 197;
				CrossoverAchievementFrameCategories:SetWidth(197);
				CrossoverAchievementFrameCategoriesContainer:GetScrollChild():SetWidth(197);
				CrossoverAchievementFrameAchievements:SetPoint("TOPLEFT", "$parentCategories", "TOPRIGHT", 0, 0);
				CrossoverAchievementFrameStats:SetPoint("TOPLEFT", "$parentCategories", "TOPRIGHT", 0, 0);
				CrossoverAchievementFrameComparison:SetPoint("TOPLEFT", "$parentCategories", "TOPRIGHT", 0, 0)
				CrossoverAchievementFrameWaterMark:SetWidth(167);
				CrossoverAchievementFrameWaterMark:SetTexCoord(0, 167/256, 0, 1);
				for _, button in next, CrossoverAchievementFrameCategoriesContainer.buttons do
					CrossoverAchievementFrameCategories_DisplayButton(button, button.element);
				end
				getmetatable(self).__index.Hide(self);
			end

		CrossoverAchievementFrameCategoriesContainerScrollBarBG:Show();
		CrossoverAchievementFrameCategoriesContainer.update = CrossoverAchievementFrameCategories_Update;
		HybridScrollFrame_CreateButtons(CrossoverAchievementFrameCategoriesContainer, "CrossoverAchievementCategoryTemplate", 0, 0, "TOP", "TOP", 0, 0, "TOP", "BOTTOM");
		CrossoverAchievementFrameCategories_Update();
		self:UnregisterEvent(event)
	end
end

function CrossoverAchievementFrameCategories_OnShow (self)
	CrossoverAchievementFrameCategories_Update();
end

function CrossoverAchievementFrameCategories_GetCategoryList (categories)
	local cats = Crossover_achievementFunctions.categoryAccessor();

	for i in next, categories do
		categories[i] = nil;
	end
	if ( not Crossover_achievementFunctions.noSummary or CrossoverAchievements.Helpers.GameVersionHelper:HasStadisticSummary() ) then
		-- Insert the fake Summary category
		tinsert(categories, { ["id"] = "summary" });
	end

	for i, id in next, cats do
		local _, parent = GetCategoryInfo(id);
		if ( parent == -1 or parent == GUILD_CATEGORY_ID ) then
			tinsert(categories, { ["id"] = id });
		end
	end

	local _, parent;
	for i = #cats, 1, -1 do
		_, parent = GetCategoryInfo(cats[i]);
		for j, category in next, categories do
			if ( category.id == parent ) then
				category.parent = true;
				category.collapsed = true;
				tinsert(categories, j+1, { ["id"] = cats[i], ["parent"] = category.id, ["hidden"] = true});
			end
		end
	end
end

local displayCategories = {};
function CrossoverAchievementFrameCategories_Update ()
	local scrollFrame = CrossoverAchievementFrameCategoriesContainer

	local categories = ACHIEVEMENTUI_CATEGORIES;
	local offset = HybridScrollFrame_GetOffset(scrollFrame);
	local buttons = scrollFrame.buttons;

	local displayCategories = displayCategories;

	for i in next, displayCategories do
		displayCategories[i] = nil;
	end

	local selection = Crossover_achievementFunctions.selectedCategory;
	if ( selection == ACHIEVEMENT_COMPARISON_SUMMARY_ID or selection == ACHIEVEMENT_COMPARISON_STATS_SUMMARY_ID ) then
		selection = "summary";
	end

	local parent;
	if ( selection ) then
		for i, category in next, categories do
			if ( category.id == selection ) then
				parent = category.parent;
			end
		end
	end

	for i, category in next, categories do
		if ( not category.hidden ) then
			tinsert(displayCategories, category);
		elseif ( parent and category.id == parent ) then
			category.collapsed = false;
			tinsert(displayCategories, category);
		elseif ( parent and category.parent and category.parent == parent ) then
			category.hidden = false;
			tinsert(displayCategories, category);
		end
	end

	local numCategories = #displayCategories;
	local numButtons = #buttons;

	local totalHeight = numCategories * buttons[1]:GetHeight();
	local displayedHeight = 0;

	local element
	for i = 1, numButtons do
		element = displayCategories[i + offset];
		displayedHeight = displayedHeight + buttons[i]:GetHeight();
		if ( element ) then
			CrossoverAchievementFrameCategories_DisplayButton(buttons[i], element);
			if ( selection and element.id == selection ) then
				buttons[i]:LockHighlight();
			else
				buttons[i]:UnlockHighlight();
			end
			buttons[i]:Show();
		else
			buttons[i].element = nil;
			buttons[i]:Hide();
		end
	end

	HybridScrollFrame_Update(scrollFrame, totalHeight, displayedHeight);

	return displayCategories;
end

function CrossoverAchievementFrameCategories_DisplayButton (button, element)
	if ( not element ) then
		button.element = nil;
		button:Hide();
		return;
	end

	button:Show();
	if ( type(element.parent) == "number" ) then
		button:SetWidth(ACHIEVEMENTUI_CATEGORIESWIDTH - 25);
		button.label:SetFontObject("GameFontHighlight");
		button.parentID = element.parent;
		button.background:SetVertexColor(0.6, 0.6, 0.6);
	else
		button:SetWidth(ACHIEVEMENTUI_CATEGORIESWIDTH - 10);
		button.label:SetFontObject("GameFontNormal");
		button.parentID = element.parent;
		button.background:SetVertexColor(1, 1, 1);
	end

	local categoryName, parentID, flags;
	local numAchievements, numCompleted;

	local id = element.id;

	-- kind of janky
	if ( id == "summary" ) then
		categoryName = ACHIEVEMENT_SUMMARY_CATEGORY;
		numAchievements, numCompleted = GetNumCompletedAchievements(IN_GUILD_VIEW);
	else
		categoryName, parentID, flags = GetCategoryInfo(id);
		numAchievements, numCompleted = CrossoverAchievementFrame_GetCategoryTotalNumAchievements(id, true);
	end
	button.label:SetText(categoryName);
	button.categoryID = id;
	button.flags = flags;
	button.element = element;

	-- For the tooltip
	button.name = categoryName;
	if ( id == FEAT_OF_STRENGTH_ID ) then
		-- This is the feat of strength category since it's sorted to the end of the list
		button.text = FEAT_OF_STRENGTH_DESCRIPTION;
		button.showTooltipFunc = CrossoverAchievementFrameCategory_FeatOfStrengthTooltip;
	elseif ( id == GUILD_FEAT_OF_STRENGTH_ID ) then
		button.text = GUILD_FEAT_OF_STRENGTH_DESCRIPTION;
		button.showTooltipFunc = CrossoverAchievementFrameCategory_FeatOfStrengthTooltip;
	elseif ( CrossoverAchievementFrame.selectedTab == 1 or CrossoverAchievementFrame.selectedTab == 2 ) then
		button.text = nil;
		button.numAchievements = numAchievements;
		button.numCompleted = numCompleted;
		button.numCompletedText = numCompleted.."/"..numAchievements;
		button.showTooltipFunc = CrossoverAchievementFrameCategory_StatusBarTooltip;
	else
		button.showTooltipFunc = nil;
	end
end

function CrossoverAchievementFrameCategory_StatusBarTooltip(self)
	GameTooltip_SetDefaultAnchor(GameTooltip, self);
	GameTooltip:SetMinimumWidth(128, true);
	GameTooltip:SetText(self.name, 1, 1, 1, nil, true);
	GameTooltip_ShowStatusBar(GameTooltip, 0, self.numAchievements, self.numCompleted, self.numCompletedText);
	GameTooltip:Show();
end

function CrossoverAchievementFrameCategory_FeatOfStrengthTooltip(self)
	GameTooltip_SetDefaultAnchor(GameTooltip, self);
	GameTooltip:SetText(self.name, 1, 1, 1);
	GameTooltip:AddLine(self.text, nil, nil, nil, true);
	GameTooltip:Show();
end

function CrossoverAchievementFrameCategories_UpdateTooltip()
	local container = CrossoverAchievementFrameCategoriesContainer;
	if ( not container:IsVisible() or not container.buttons ) then
		return;
	end

	for _, button in next, CrossoverAchievementFrameCategoriesContainer.buttons do
		if ( button:IsMouseOver() and button.showTooltipFunc ) then
			button:showTooltipFunc();
			break;
		end
	end
end

function CrossoverAchievementFrameCategories_SelectButton (button)
	local id = button.element.id;

	if ( type(button.element.parent) ~= "number" ) then
		-- Is top level category (can expand/contract)
		if ( button.isSelected and button.element.collapsed == false ) then
			button.element.collapsed = true;
			for i, category in next, ACHIEVEMENTUI_CATEGORIES do
				if ( category.parent == id ) then
					category.hidden = true;
				end
			end
		else
			for i, category in next, ACHIEVEMENTUI_CATEGORIES do
				if ( category.parent == id ) then
					category.hidden = false;
				elseif ( category.parent == true ) then
					category.collapsed = true;
				elseif ( category.parent ) then
					category.hidden = true;
				end
			end
			button.element.collapsed = false;
		end
	end

	local buttons = CrossoverAchievementFrameCategoriesContainer.buttons;
	for _, button in next, buttons do
		button.isSelected = nil;
	end

	button.isSelected = true;

	if ( id == Crossover_achievementFunctions.selectedCategory ) then
		-- If this category was selected already, bail after changing collapsed states
		return
	end

	--Intercept "summary" category
	if ( id == "summary" ) then
		if ( Crossover_achievementFunctions == CROSSOVER_ACHIEVEMENT_FUNCTIONS or Crossover_achievementFunctions == CROSSOVER_GUILD_ACHIEVEMENT_FUNCTIONS ) then
			CrossoverAchievementFrame_ShowSubFrame(CrossoverAchievementFrameSummary);
			Crossover_achievementFunctions.selectedCategory = id;
			return;
		elseif (  Crossover_achievementFunctions == CROSSOVER_STAT_FUNCTIONS ) then
			CrossoverAchievementFrame_ShowSubFrame(CrossoverAchievementFrameStats);
			Crossover_achievementFunctions.selectedCategory = ACHIEVEMENT_COMPARISON_STATS_SUMMARY_ID;
			CrossoverAchievementFrameStatsContainerScrollBar:SetValue(0);
		elseif ( Crossover_achievementFunctions == CROSSOVER_COMPARISON_ACHIEVEMENT_FUNCTIONS ) then
			-- Put the summary stuff for comparison here, Derek!
			CrossoverAchievementFrame_ShowSubFrame(CrossoverAchievementFrameComparison, CrossoverAchievementFrameComparisonContainer);
			Crossover_achievementFunctions.selectedCategory = ACHIEVEMENT_COMPARISON_SUMMARY_ID;
			CrossoverAchievementFrameComparisonContainerScrollBar:SetValue(0);
			CrossoverAchievementFrameComparison_UpdateStatusBars(ACHIEVEMENT_COMPARISON_SUMMARY_ID);
		elseif ( Crossover_achievementFunctions == CROSSOVER_COMPARISON_STAT_FUNCTIONS ) then
			CrossoverAchievementFrame_ShowSubFrame(CrossoverAchievementFrameComparison, CrossoverAchievementFrameComparisonStatsContainer);
			Crossover_achievementFunctions.selectedCategory = ACHIEVEMENT_COMPARISON_STATS_SUMMARY_ID;
			CrossoverAchievementFrameComparisonStatsContainerScrollBar:SetValue(0);
		end

	else
		if ( Crossover_achievementFunctions == CROSSOVER_STAT_FUNCTIONS ) then
			CrossoverAchievementFrame_ShowSubFrame(CrossoverAchievementFrameStats);
		elseif ( Crossover_achievementFunctions == CROSSOVER_ACHIEVEMENT_FUNCTIONS or Crossover_achievementFunctions == CROSSOVER_GUILD_ACHIEVEMENT_FUNCTIONS ) then
			CrossoverAchievementFrame_ShowSubFrame(CrossoverAchievementFrameAchievements);
			if ( id == FEAT_OF_STRENGTH_ID or id == GUILD_FEAT_OF_STRENGTH_ID ) then
				CrossoverAchievementFrameFilterDropDown:Hide();
				CrossoverAchievementFrameHeaderSearchChangeDLLInset(false);
			else
				CrossoverAchievementFrameFilterDropDown:Show();
				CrossoverAchievementFrameHeaderSearchChangeDLLInset(true);
			end
		elseif ( Crossover_achievementFunctions == CROSSOVER_COMPARISON_ACHIEVEMENT_FUNCTIONS ) then
			CrossoverAchievementFrame_ShowSubFrame(CrossoverAchievementFrameComparison, CrossoverAchievementFrameComparisonContainer);
			CrossoverAchievementFrameComparisonContainerScrollBar:SetValue(0);
			CrossoverAchievementFrameComparison_UpdateStatusBars(id);
		else
			CrossoverAchievementFrame_ShowSubFrame(CrossoverAchievementFrameComparison, CrossoverAchievementFrameComparisonStatsContainer);
			CrossoverAchievementFrameComparisonStatsContainerScrollBar:SetValue(0);
		end
		Crossover_achievementFunctions.selectedCategory = id;
	end

	if ( Crossover_achievementFunctions.clearFunc ) then
		Crossover_achievementFunctions.clearFunc();
	end
	CrossoverAchievementFrameAchievementsContainerScrollBar:SetValue(0);
	Crossover_achievementFunctions.updateFunc();
end

function CrossoverAchievementFrameAchievements_OnShow()
	if ( CrossoverAchievementFrameAchievements.guildView ~= IN_GUILD_VIEW ) then
		CrossoverAchievementFrameAchievements_ToggleView();
	end
	if ( Crossover_achievementFunctions.selectedCategory == FEAT_OF_STRENGTH_ID or Crossover_achievementFunctions.selectedCategory == GUILD_FEAT_OF_STRENGTH_ID ) then
		CrossoverAchievementFrameFilterDropDown:Hide();
		CrossoverAchievementFrameHeaderSearchChangeDLLInset(false);
	else
		CrossoverAchievementFrameFilterDropDown:Show();
		CrossoverAchievementFrameHeaderSearchChangeDLLInset(true);
	end
end

function CrossoverAchievementFrameHeaderSearchChangeDLLInset(show)
    if SetAchievementSearchString then
        if show then
            CrossoverAchievementFrameHeaderLeftDDLInset:Show();
        else 
            CrossoverAchievementFrameHeaderLeftDDLInset:Hide();
        end
    else
        if show then
            CrossoverAchievementFrameHeaderRightDDLInset:Show();
        else 
            CrossoverAchievementFrameHeaderRightDDLInset:Hide();
        end
    end
end

function CrossoverAchievementFrameCategories_ClearSelection ()
	local buttons = CrossoverAchievementFrameCategoriesContainer.buttons;
	for _, button in next, buttons do
		button.isSelected = nil;
		button:UnlockHighlight();
	end

	for i, category in next, ACHIEVEMENTUI_CATEGORIES do
		if ( category.parent == true ) then
			category.collapsed = true;
		elseif ( category.parent ) then
			category.hidden = true;
		end
	end
end

function CrossoverAchievementFrameComparison_UpdateStatusBars (id)
	local numAchievements, numCompleted = GetCategoryNumAchievements(id);
	local name = GetCategoryInfo(id);

	if ( id == ACHIEVEMENT_COMPARISON_SUMMARY_ID ) then
		name = ACHIEVEMENT_SUMMARY_CATEGORY;
	end

	local statusBar = CrossoverAchievementFrameComparisonSummaryPlayerStatusBar;
	statusBar:SetMinMaxValues(0, numAchievements);
	statusBar:SetValue(numCompleted);
	statusBar.title:SetText(string.format(ACHIEVEMENTS_COMPLETED_CATEGORY, name));
	statusBar.text:SetText(numCompleted.."/"..numAchievements);

	local friendCompleted = GetComparisonCategoryNumAchievements(id);

	statusBar = CrossoverAchievementFrameComparisonSummaryFriendStatusBar;
	statusBar:SetMinMaxValues(0, numAchievements);
	statusBar:SetValue(friendCompleted);
	statusBar.text:SetText(friendCompleted.."/"..numAchievements);
end

-- [[ CrossoverAchievementCategoryButton ]] --

function CrossoverAchievementCategoryButton_OnLoad (button)
	button:EnableMouse(true);
	button:EnableMouseWheel(true);
	CrossoverAchievementCategoryButton_Localize(button);
end

function CrossoverAchievementCategoryButton_OnClick (button)
	CrossoverAchievementFrameCategories_SelectButton(button);
	CrossoverAchievementFrameCategories_Update();
end

-- [[ CrossoverAchievementFrameAchievements ]] --

function CrossoverAchievementFrameAchievements_OnLoad (self)
	CrossoverAchievementFrameAchievementsContainerScrollBar.Show =
		function (self)
			CrossoverAchievementFrameAchievements:SetWidth(504);
			for _, button in next, CrossoverAchievementFrameAchievementsContainer.buttons do
				button:SetWidth(496);
			end
			getmetatable(self).__index.Show(self);
		end

	CrossoverAchievementFrameAchievementsContainerScrollBar.Hide =
		function (self)
			CrossoverAchievementFrameAchievements:SetWidth(530);
			for _, button in next, CrossoverAchievementFrameAchievementsContainer.buttons do
				button:SetWidth(522);
			end
			getmetatable(self).__index.Hide(self);
		end

	self:RegisterEvent("ADDON_LOADED");
	CrossoverAchievementFrameAchievementsContainerScrollBarBG:Show();
	CrossoverAchievementFrameAchievementsContainer.update = CrossoverAchievementFrameAchievements_Update;
	HybridScrollFrame_CreateButtons(CrossoverAchievementFrameAchievementsContainer, "CrossoverAchievementTemplate", 0, -2);
end

function CrossoverAchievementFrameAchievements_OnEvent (self, event, ...)
	if (Kiosk.IsEnabled()) then
		return;
	end
	if ( event == "ADDON_LOADED" ) then
		self:RegisterEvent("ACHIEVEMENT_EARNED");
		self:RegisterEvent("CRITERIA_UPDATE");
		self:RegisterEvent("TRACKED_ACHIEVEMENT_LIST_CHANGED");
		self:RegisterEvent("RECEIVED_ACHIEVEMENT_MEMBER_LIST");
		self:RegisterEvent("ACHIEVEMENT_SEARCH_UPDATED");

		updateTrackedAchievements(GetTrackedAchievements());
	elseif ( event == "ACHIEVEMENT_EARNED" ) then
		local achievementID = ...;
		CrossoverAchievementFrameCategories_GetCategoryList(ACHIEVEMENTUI_CATEGORIES);
		CrossoverAchievementFrameCategories_Update();
		CrossoverAchievementFrameCategories_UpdateTooltip();
		-- This has to happen before CrossoverAchievementFrameAchievements_ForceUpdate() in order to achieve the behavior we want, since it clears the selection for progressive achievements.
		local selection = CrossoverAchievementFrameAchievements.selection;
		CrossoverAchievementFrameAchievements_ForceUpdate();
		if ( CrossoverAchievementFrameAchievementsContainer:IsVisible() and selection == achievementID ) then
			CrossoverAchievementFrame_SelectAchievement(selection, true);
		end
		CrossoverAchievementFrameHeaderPoints:SetText(BreakUpLargeNumbers(GetTotalAchievementPoints(IN_GUILD_VIEW)));

	elseif ( event == "CRITERIA_UPDATE" ) then
		if ( CrossoverAchievementFrameAchievements.selection ) then
			local id = CrossoverAchievementFrameAchievementsObjectives.id;
			local button = CrossoverAchievementFrameAchievementsObjectives:GetParent();
			CrossoverAchievementFrameAchievementsObjectives.id = nil;
			if ( self:IsVisible() ) then
				CrossoverAchievementButton_DisplayObjectives(button, id, button.completed);
				CrossoverAchievementFrameAchievements_Update();
			end
		else
			CrossoverAchievementFrameAchievementsObjectives.id = nil; -- Force redraw
		end
	elseif ( event == "TRACKED_ACHIEVEMENT_LIST_CHANGED" ) then
		for k, v in next, trackedAchievements do
			trackedAchievements[k] = nil;
		end

		updateTrackedAchievements(GetTrackedAchievements());
	elseif ( event == "RECEIVED_ACHIEVEMENT_MEMBER_LIST" ) then
		local achievementID = ...;
		-- check if we initiated the request from a meta criteria and we're still over it
		if ( guildMemberRequestFrame and guildMemberRequestFrame.id == achievementID ) then
			-- update the tooltip
			local func = guildMemberRequestFrame:GetScript("OnEnter");
			if ( func ) then
				func(guildMemberRequestFrame);
			end
		end
	elseif ( event == "ACHIEVEMENT_SEARCH_UPDATED" ) then
		CrossoverAchievementFrame.searchBox.fullSearchFinished = true;
		CrossoverAchievementFrame_UpdateSearch(self);
	end
end

function CrossoverAchievementFrameAchievementsBackdrop_OnLoad (self)
	self:SetFrameLevel(self:GetFrameLevel()+1);
end

function CrossoverAchievementFrameAchievements_Update ()
	local category = Crossover_achievementFunctions.selectedCategory;
	if ( category == "summary" ) then
		return;
	end
	local scrollFrame = CrossoverAchievementFrameAchievementsContainer

	local offset = HybridScrollFrame_GetOffset(scrollFrame);
	local buttons = scrollFrame.buttons;
	local numAchievements, numCompleted, completedOffset = CROSSOVER_ACHIEVEMENTUI_SELECTEDFILTER(category);
	local numButtons = #buttons;

	-- If the current category is feats of strength and there are no entries then show the explanation text
	if ( CrossoverAchievementFrame_IsFeatOfStrength() and numAchievements == 0 ) then
		if ( CrossoverAchievementFrame.selectedTab == 1 ) then
			CrossoverAchievementFrameAchievementsFeatOfStrengthText:SetText(FEAT_OF_STRENGTH_DESCRIPTION);
		else
			CrossoverAchievementFrameAchievementsFeatOfStrengthText:SetText(GUILD_FEAT_OF_STRENGTH_DESCRIPTION);
		end
		CrossoverAchievementFrameAchievementsFeatOfStrengthText:Show();
	else
		CrossoverAchievementFrameAchievementsFeatOfStrengthText:Hide();
	end

	local selection = CrossoverAchievementFrameAchievements.selection;
	if ( selection ) then
		CrossoverAchievementButton_ResetObjectives();
	end

	local extraHeight = scrollFrame.largeButtonHeight or CrossoverAchievementButton_COLLAPSEDHEIGHT

	local achievementIndex;
	local displayedHeight = 0;
	for i = 1, numButtons do
		achievementIndex = i + offset + completedOffset;
		if ( achievementIndex > numAchievements + completedOffset ) then
			buttons[i]:Hide();
		else
			CrossoverAchievementButton_DisplayAchievement(buttons[i], category, achievementIndex, selection);
			displayedHeight = displayedHeight + buttons[i]:GetHeight();
		end
	end

	local totalHeight = numAchievements * CrossoverAchievementButton_COLLAPSEDHEIGHT;
	totalHeight = totalHeight + (extraHeight - CrossoverAchievementButton_COLLAPSEDHEIGHT);

	HybridScrollFrame_Update(scrollFrame, totalHeight, displayedHeight);

	if ( selection ) then
		CrossoverAchievementFrameAchievements.selection = selection;
	else
		HybridScrollFrame_CollapseButton(scrollFrame);
	end
end

function CrossoverAchievementFrameAchievements_ForceUpdate ()
	if ( CrossoverAchievementFrameAchievements.selection ) then
		local nextID = GetNextAchievement(CrossoverAchievementFrameAchievements.selection);
		local id, _, _, completed = GetAchievementInfo(CrossoverAchievementFrameAchievements.selection);
		if ( nextID and completed ) then
			CrossoverAchievementFrameAchievements.selection = nil;
		end
	end
	CrossoverAchievementFrameAchievementsObjectives:Hide();
	CrossoverAchievementFrameAchievementsObjectives.id = nil;

	local buttons = CrossoverAchievementFrameAchievementsContainer.buttons;
	for i, button in next, buttons do
		button.id = nil;
	end

	CrossoverAchievementFrameAchievements_Update();
end

function CrossoverAchievementFrameAchievements_ClearSelection ()
	CrossoverAchievementButton_ResetObjectives();
	for _, button in next, CrossoverAchievementFrameAchievementsContainer.buttons do
		button:Collapse();
		if ( not button:IsMouseOver() ) then
			button.highlight:Hide();
		end
		button.selected = nil;
		if ( not button.tracked:GetChecked() ) then
			button.tracked:Hide();
		end
		button.description:Show();
		button.hiddenDescription:Hide();
	end

	CrossoverAchievementFrameAchievements.selection = nil;
end

function CrossoverAchievementFrameAchievements_SetupButton(button)
	local name = button:GetName();
	-- reset button info to get proper saturation/desaturation
	button.completed = nil;
	button.id = nil;
	-- title
	button.titleBar:SetAlpha(0.8);
	-- icon frame
	button.icon.frame:SetTexture("Interface\\AchievementFrame\\UI-Achievement-IconFrame");
	button.icon.frame:SetTexCoord(0, 0.5625, 0, 0.5625);
	button.icon.frame:SetPoint("CENTER", -1, 2);
	-- tsunami
	local tsunami = _G[name.."BottomTsunami1"];
	tsunami:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Borders");
	tsunami:SetTexCoord(0, 0.72265, 0.51953125, 0.58203125);
	tsunami:SetAlpha(0.35);
	local tsunami = _G[name.."TopTsunami1"];
	tsunami:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Borders");
	tsunami:SetTexCoord(0.72265, 0, 0.58203125, 0.51953125);
	tsunami:SetAlpha(0.3);
	-- glow
	button.glow:SetTexCoord(0, 1, 0.00390625, 0.25390625);
end

function CrossoverAchievementFrameAchievements_ToggleView()
	if ( CrossoverAchievementFrameAchievements.guildView ) then
		CrossoverAchievementFrameAchievements.guildView = nil;
		for _, button in next, CrossoverAchievementFrameAchievementsContainer.buttons do
			CrossoverAchievementFrameAchievements_SetupButton(button);
		end
	else
		CrossoverAchievementFrameAchievements.guildView = true;
		for _, button in next, CrossoverAchievementFrameAchievementsContainer.buttons do
			local name = button:GetName();
			-- reset button info to get proper saturation/desaturation
			button.completed = nil;
			button.id = nil;
			-- title
			button.titleBar:SetAlpha(1);
			-- icon frame
			button.icon.frame:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Guild");
			button.icon.frame:SetTexCoord(0.25976563, 0.40820313, 0.50000000, 0.64453125);
			button.icon.frame:SetPoint("CENTER", 2, 2);
			-- tsunami
			local tsunami = _G[name.."BottomTsunami1"];
			tsunami:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Borders");
			tsunami:SetTexCoord(0, 0.72265, 0.58984375, 0.65234375);
			tsunami:SetAlpha(0.2);
			local tsunami = _G[name.."TopTsunami1"];
			tsunami:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Borders");
			tsunami:SetTexCoord(0.72265, 0, 0.65234375, 0.58984375);
			tsunami:SetAlpha(0.15);
			-- glow
			button.glow:SetTexCoord(0, 1, 0.26171875, 0.51171875);
		end
	end
	CrossoverAchievementFrameAchievementsContainerScrollBar:SetValue(0);
	CrossoverAchievementFrameAchievements_Update();
end

-- [[ Achievement Icon ]] --

function CrossoverAchievementIcon_Desaturate (self)
	self.bling:SetVertexColor(.6, .6, .6, 1);
	self.frame:SetVertexColor(.75, .75, .75, 1);
	self.texture:SetVertexColor(.55, .55, .55, 1);
end

function CrossoverAchievementIcon_Saturate (self)
	self.bling:SetVertexColor(1, 1, 1, 1);
	self.frame:SetVertexColor(1, 1, 1, 1);
	self.texture:SetVertexColor(1, 1, 1, 1);
end

function CrossoverAchievementIcon_OnLoad (self)
	self.Desaturate = CrossoverAchievementIcon_Desaturate;
	self.Saturate = CrossoverAchievementIcon_Saturate;
end

-- [[ Achievement Shield ]] --

function CrossoverAchievementShield_Desaturate (self)
	self.icon:SetTexCoord(.5, 1, TEXTURES_OFFSET, TEXTURES_OFFSET + 0.5);
end

function CrossoverAchievementShield_Saturate (self)
	self.icon:SetTexCoord(0, .5, TEXTURES_OFFSET, TEXTURES_OFFSET + 0.5);
end

function CrossoverAchievementShield_OnLoad (self)
	self.Desaturate = CrossoverAchievementShield_Desaturate;
	self.Saturate = CrossoverAchievementShield_Saturate;
end

-- [[ CrossoverAchievementButton ]] --

CrossoverAchievementButton_DESCRIPTIONHEIGHT = 20;
CrossoverAchievementButton_COLLAPSEDHEIGHT = 84;
CrossoverAchievementButton_CRITERIAROWHEIGHT = 15;
CrossoverAchievementButton_METAROWHEIGHT = 28;
CrossoverAchievementButton_MAXHEIGHT = 232;
CrossoverAchievementButton_TEXTUREHEIGHT = 128;
GUILDCrossoverAchievementButton_MINHEIGHT = 128;

function CrossoverAchievementButton_UpdatePlusMinusTexture(button)
    if CrossoverAchievements.Helpers.GameVersionHelper:IsWOTLK() then
        CrossoverAchievementButton_UpdatePlusMinusTexture_WOTLK(button);
    else
        CrossoverAchievementButton_UpdatePlusMinusTexture_Retail(button);
    end
end

function CrossoverAchievementButton_UpdatePlusMinusTexture_WOTLK (button)
	local id = button.id;
	if ( not id ) then
		return; -- This happens when we create buttons
	end

	local display = false;
	if ( GetAchievementNumCriteria(id) ~= 0 ) then
		display = true;
	elseif ( GetPreviousAchievement(id) and button.completed ) then
		display = true;
	end
	
	if ( display ) then
		button.plusMinus:Show();			
		if ( button.collapsed and button.saturated ) then
			button.plusMinus:SetTexCoord(0, .5, 0, .5);
		elseif ( button.collapsed ) then
			button.plusMinus:SetTexCoord(.5, 1, 0, .5);
		elseif ( button.saturated ) then
			button.plusMinus:SetTexCoord(0, .5, .5, 1);
		else
			button.plusMinus:SetTexCoord(.5, 1, .5, 1);
		end
	else
		button.plusMinus:Hide();
	end
end

function CrossoverAchievementButton_UpdatePlusMinusTexture_Retail (button)
	local id = button.id;
	if ( not id ) then
		return; -- This happens when we create buttons
	end

	local display = false;
	if ( GetAchievementNumCriteria(id) ~= 0 ) then
		display = true;
	elseif ( button.completed and GetPreviousAchievement(id) ) then
		display = true;
	elseif ( not button.completed and GetAchievementGuildRep(id) ) then
		display = true;
	end

	if ( display ) then
		button.plusMinus:Show();
		if ( button.collapsed and button.saturatedStyle ) then
			button.plusMinus:SetTexCoord(0, .5, TEXTURES_OFFSET, TEXTURES_OFFSET + 0.25);
		elseif ( button.collapsed ) then
			button.plusMinus:SetTexCoord(.5, 1, TEXTURES_OFFSET, TEXTURES_OFFSET + 0.25);
		elseif ( button.saturatedStyle ) then
			button.plusMinus:SetTexCoord(0, .5, TEXTURES_OFFSET + 0.25, TEXTURES_OFFSET + 0.50);
		else
			button.plusMinus:SetTexCoord(.5, 1, TEXTURES_OFFSET + 0.25, TEXTURES_OFFSET + 0.50);
		end
	else
		button.plusMinus:Hide();
	end
end

function CrossoverAchievementButton_Collapse (self)
	if ( self.collapsed ) then
		return;
	end

	self.collapsed = true;
	CrossoverAchievementButton_UpdatePlusMinusTexture(self);
	self:SetHeight(CrossoverAchievementButton_COLLAPSEDHEIGHT);
	self.background:SetTexCoord(0, 1, 1-(CrossoverAchievementButton_COLLAPSEDHEIGHT / 256), 1);
	if ( not self.tracked:GetChecked() ) then
		self.tracked:Hide();
	end
	self.tabard:Hide();
	self.guildCornerL:Hide();
	self.guildCornerR:Hide();
end

function CrossoverAchievementButton_Expand (self, height)
	if ( not self.collapsed and self:GetHeight() == height ) then
		return;
	end

	self.collapsed = nil;
	CrossoverAchievementButton_UpdatePlusMinusTexture(self);
	if ( IN_GUILD_VIEW ) then
		if ( height < GUILDCrossoverAchievementButton_MINHEIGHT ) then
			height = GUILDCrossoverAchievementButton_MINHEIGHT;
		end
		if ( self.completed ) then
			self.tabard:Show();
			self.shield:SetFrameLevel(self.tabard:GetFrameLevel() + 1);
			SetLargeGuildTabardTextures("player", self.tabard.emblem, self.tabard.background, self.tabard.border);
		end
		self.guildCornerL:Show();
		self.guildCornerR:Show();
	end
	self:SetHeight(height);
	self.background:SetTexCoord(0, 1, max(0, 1-(height / 256)), 1);
end

function CrossoverAchievementButton_Saturate (self)
	if ( IN_GUILD_VIEW ) then
		self.background:SetTexture("Interface\\AchievementFrame\\UI-GuildAchievement-Parchment-Horizontal");
		self.titleBar:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Borders");
		self.titleBar:SetTexCoord(0, 1, 0.83203125, 0.91015625);
		self:SetBackdropBorderColor(ACHIEVEMENT_RED_BORDER_COLOR:GetRGB());
		self.shield.points:SetVertexColor(0, 1, 0);
		self.saturatedStyle = "guild";
	else
		self.background:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Parchment-Horizontal");
		if ( self.accountWide ) then
			self.titleBar:SetTexture("Interface\\AchievementFrame\\AccountLevel-AchievementHeader");
			self.titleBar:SetTexCoord(0, 1, 0, 0.375);
			self:SetBackdropBorderColor(ACHIEVEMENT_BLUE_BORDER_COLOR:GetRGB());
			self.saturatedStyle = "account";
		else
			self.titleBar:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Borders");
			self.titleBar:SetTexCoord(0, 1, 0.66015625, 0.73828125);
			self:SetBackdropBorderColor(ACHIEVEMENT_RED_BORDER_COLOR:GetRGB());
			self.saturatedStyle = "normal";
		end
		self.shield.points:SetVertexColor(1, 1, 1);
	end
	self.glow:SetVertexColor(1.0, 1.0, 1.0);
	self.icon:Saturate();
	self.shield:Saturate();
	self.reward:SetVertexColor(1, .82, 0);
	self.label:SetVertexColor(1, 1, 1);
	self.description:SetTextColor(0, 0, 0, 1);
	self.description:SetShadowOffset(0, 0);
	CrossoverAchievementButton_UpdatePlusMinusTexture(self);
end

function CrossoverAchievementButton_Desaturate (self)
	self.saturatedStyle = nil;
	if ( IN_GUILD_VIEW ) then
		self.background:SetTexture("Interface\\AchievementFrame\\UI-GuildAchievement-Parchment-Horizontal-Desaturated");
		self.titleBar:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Borders");
		self.titleBar:SetTexCoord(0, 1, 0.74609375, 0.82421875);
	else
		self.background:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Parchment-Horizontal-Desaturated");
		if ( self.accountWide ) then
			self.titleBar:SetTexture("Interface\\AchievementFrame\\AccountLevel-AchievementHeader");
			self.titleBar:SetTexCoord(0, 1, 0.40625, 0.78125);
		else
			self.titleBar:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Borders");
			self.titleBar:SetTexCoord(0, 1, 0.91796875, 0.99609375);
		end
	end
	self.glow:SetVertexColor(.22, .17, .13);
	self.icon:Desaturate();
	self.shield:Desaturate();
	self.shield.points:SetVertexColor(.65, .65, .65);
	self.reward:SetVertexColor(.8, .8, .8);
	self.label:SetVertexColor(.65, .65, .65);
	self.description:SetTextColor(1, 1, 1, 1);
	self.description:SetShadowOffset(1, -1);
	CrossoverAchievementButton_UpdatePlusMinusTexture(self);
	self:SetBackdropBorderColor(.5, .5, .5);
end

function CrossoverAchievementButton_OnLoad (self)
	self.dateCompleted = self.shield.dateCompleted;
	if ( not ACHIEVEMENTUI_FONTHEIGHT ) then
		local _, fontHeight = self.description:GetFont();
		ACHIEVEMENTUI_FONTHEIGHT = fontHeight;
	end
	self.description:SetHeight(ACHIEVEMENTUI_FONTHEIGHT * ACHIEVEMENTUI_MAX_LINES_COLLAPSED);
	self.description:SetWidth(ACHIEVEMENTUI_MAXCONTENTWIDTH);
	self.hiddenDescription:SetWidth(ACHIEVEMENTUI_MAXCONTENTWIDTH);

	self.Collapse = CrossoverAchievementButton_Collapse;
	self.Expand = CrossoverAchievementButton_Expand;
	self.Saturate = CrossoverAchievementButton_Saturate;
	self.Desaturate = CrossoverAchievementButton_Desaturate;

	self:Collapse();
end

function CrossoverAchievementButton_OnClick (self, button, down, ignoreModifiers)
	if(IsModifiedClick() and not ignoreModifiers) then
		local handled = nil;
		if ( IsModifiedClick("CHATLINK") ) then
			local achievementLink = GetAchievementLink(self.id);
			if ( achievementLink ) then
				handled = ChatEdit_InsertLink(achievementLink);
				if ( not handled and SocialPostFrame and Social_IsShown() ) then
					Social_InsertLink(achievementLink);
					handled = true;
				end
			end
		end
		if ( not handled and IsModifiedClick("QUESTWATCHTOGGLE") ) then
			CrossoverAchievementButton_ToggleTracking(self.id);
		end
		return;
	end

	if ( self.selected ) then
		if ( not self:IsMouseOver() ) then
			self.highlight:Hide();
		end
		CrossoverAchievementFrameAchievements_ClearSelection()
		HybridScrollFrame_CollapseButton(CrossoverAchievementFrameAchievementsContainer);
		CrossoverAchievementFrameAchievements_Update();
		return;
	end
	CrossoverAchievementFrameAchievements_ClearSelection()
	CrossoverAchievementFrameAchievements_SelectButton(self);
	CrossoverAchievementButton_DisplayAchievement(self, Crossover_achievementFunctions.selectedCategory, self.index, self.id);
	HybridScrollFrame_ExpandButton(CrossoverAchievementFrameAchievementsContainer, ((self.index - 1) * CrossoverAchievementButton_COLLAPSEDHEIGHT), self:GetHeight());
	CrossoverAchievementFrameAchievements_Update();
	if ( not ignoreModifiers ) then
		CrossoverAchievementFrameAchievements_AdjustSelection();
	end
end

function CrossoverAchievementButton_ToggleTracking (id)
	if ( trackedAchievements[id] ) then
		RemoveTrackedAchievement(id);
		CrossoverAchievementFrameAchievements_ForceUpdate();
		return;
	end

	local count = GetNumTrackedAchievements();

	if ( count >= MAX_TRACKED_ACHIEVEMENTS ) then
		UIErrorsFrame:AddMessage(format(ACHIEVEMENT_WATCH_TOO_MANY, MAX_TRACKED_ACHIEVEMENTS), 1.0, 0.1, 0.1, 1.0);
		return;
	end

	local _, _, _, completed, _, _, _, _, _, _, _, isGuild, wasEarnedByMe = GetAchievementInfo(id)
	if ( (completed and isGuild) or wasEarnedByMe ) then
		UIErrorsFrame:AddMessage(ERR_ACHIEVEMENT_WATCH_COMPLETED, 1.0, 0.1, 0.1, 1.0);
		return;
	end

	AddTrackedAchievement(id);
	CrossoverAchievementFrameAchievements_ForceUpdate();

	return true;
end

function CrossoverAchievementButton_DisplayAchievement (button, category, achievement, selectionID, renderOffScreen)
	local id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuild, wasEarnedByMe, earnedBy = GetAchievementInfo(category, achievement);

	if ( not id ) then
		button:Hide();
		return;
	else
		button:Show();
	end

	button.index = achievement;
	button.element = true;

	if ( button.id ~= id ) then
		local saturatedStyle;
		if ( bit.band(flags, ACHIEVEMENT_FLAGS_ACCOUNT) == ACHIEVEMENT_FLAGS_ACCOUNT ) then
			button.accountWide = true;
			saturatedStyle = "account";
		else
			button.accountWide = nil;
			if ( IN_GUILD_VIEW ) then
				saturatedStyle = "guild";
			else
				saturatedStyle = "normal";
			end
		end
		button.id = id;
		button.label:SetWidth(ACHIEVEMENTBUTTON_LABELWIDTH);
		button.label:SetText(name)

		if ( GetPreviousAchievement(id) ) then
			-- If this is a progressive achievement, show the total score.
			CrossoverAchievementShield_SetPoints(CrossoverAchievementButton_GetProgressivePoints(id), button.shield.points, AchievementPointsFont, AchievementPointsFontSmall);
		else
			CrossoverAchievementShield_SetPoints(points, button.shield.points, AchievementPointsFont, AchievementPointsFontSmall);
		end

		if ( points > 0 ) then
			button.shield.icon:SetTexture([[Interface\Addons\CrossoverAchievements\Textures\UI-Achievement-Shields]]);
		else
			button.shield.icon:SetTexture([[Interface\Addons\CrossoverAchievements\Textures\UI-Achievement-Shields-NoPoints]]);
		end

		if ( isGuild ) then
			button.shield.points:Show();
			button.shield.wasEarnedByMe = nil;
			button.shield.earnedBy = nil;
		else
			button.shield.wasEarnedByMe = not (completed and not wasEarnedByMe);
			button.shield.earnedBy = earnedBy;
		end

		button.shield.id = id;
		button.description:SetText(description);
		button.hiddenDescription:SetText(description);
		button.numLines = ceil(button.hiddenDescription:GetHeight() / ACHIEVEMENTUI_FONTHEIGHT);
		button.icon.texture:SetTexture(icon);
		if ( completed or wasEarnedByMe ) then
			button.completed = true;
			button.dateCompleted:SetText(FormatShortDate(day, month, year));
			button.dateCompleted:Show();
			if ( button.saturatedStyle ~= saturatedStyle ) then
				button:Saturate();
			end
		else
			button.completed = nil;
			button.dateCompleted:Hide();
			button:Desaturate();
		end

		if ( rewardText == "" ) then
			button.reward:Hide();
			button.rewardBackground:Hide();
		else
			button.reward:SetText(rewardText);
			button.reward:Show();
			button.rewardBackground:Show();
			if ( button.completed ) then
				button.rewardBackground:SetVertexColor(1, 1, 1);
			else
				button.rewardBackground:SetVertexColor(0.35, 0.35, 0.35);
			end
		end

		if ( IsTrackedAchievement(id) ) then
			button.check:Show();
			button.label:SetWidth(button.label:GetStringWidth() + 4); -- This +4 here is to fudge around any string width issues that arize from resizing a string set to its string width. See bug 144418 for an example.
			button.tracked:SetChecked(true);
			button.tracked:Show();
		else
			button.check:Hide();
			button.tracked:SetChecked(false);
			button.tracked:Hide();
		end

		CrossoverAchievementButton_UpdatePlusMinusTexture(button);
	end

	if ( id == selectionID ) then
		local achievements = CrossoverAchievementFrameAchievements;

		achievements.selection = button.id;
		achievements.selectionIndex = button.index;
		button.selected = true;
		button.highlight:Show();
		local height = CrossoverAchievementButton_DisplayObjectives(button, button.id, button.completed, renderOffScreen);
		if ( height == CrossoverAchievementButton_COLLAPSEDHEIGHT ) then
			button:Collapse();
		else
			button:Expand(height);
		end
		if ( not completed or (not wasEarnedByMe and not isGuild) ) then
			button.tracked:Show();
		end
	elseif ( button.selected ) then
		button.selected = nil;
		if ( not button:IsMouseOver() ) then
			button.highlight:Hide();
		end
		button:Collapse();
		button.description:Show();
		button.hiddenDescription:Hide();
	end

	return id;
end

function CrossoverAchievementFrameAchievements_SelectButton (button)
	local achievements = CrossoverAchievementFrameAchievements;

	achievements.selection = button.id;
	achievements.selectionIndex = button.index;
	button.selected = true;

    if SetFocusedAchievement then
        SetFocusedAchievement(button.id);
    end
end

function CrossoverAchievementButton_ResetObjectives ()
	CrossoverAchievementFrameAchievementsObjectives:Hide();
end

function CrossoverAchievementButton_DisplayObjectives (button, id, completed, renderOffScreen)
	local objectives = CrossoverAchievementFrameAchievementsObjectives;
	if (renderOffScreen) then
		objectives = CrossoverAchievementFrameAchievementsObjectivesOffScreen;
	end
	local topAnchor = button.hiddenDescription;
	objectives:ClearAllPoints();
	objectives:SetParent(button);
	objectives:Show();
	objectives.completed = completed;
	local height = CrossoverAchievementButton_COLLAPSEDHEIGHT;
	if ( objectives.id == id and not renderOffScreen ) then
		local ACHIEVEMENTMODE_CRITERIA = 1;
		if ( objectives.mode == ACHIEVEMENTMODE_CRITERIA ) then
			if ( objectives:GetHeight() > 0 ) then
				objectives:SetPoint("TOP", topAnchor, "BOTTOM", 0, -8);
				objectives:SetPoint("LEFT", "$parentIcon", "RIGHT", -5, 0);
				objectives:SetPoint("RIGHT", "$parentShield", "LEFT", -10, 0);
			end
		else
			objectives:SetPoint("TOP", topAnchor, "BOTTOM", 0, -8);
		end
	elseif ( completed and GetPreviousAchievement(id) ) then
		objectives:SetHeight(0);
		CrossoverAchievementButton_ResetCriteria(renderOffScreen);
		CrossoverAchievementButton_ResetProgressBars(renderOffScreen);
		CrossoverAchievementButton_ResetMiniAchievements(renderOffScreen);
		CrossoverAchievementButton_ResetMetas(renderOffScreen);
		-- Don't show previous achievements when we render this offscreeen
		if ( not renderOffScreen ) then
			CrossoverAchievementObjectives_DisplayProgressiveAchievement(objectives, id);
		end
		objectives:SetPoint("TOP", topAnchor, "BOTTOM", 0, -8);
	else
		objectives:SetHeight(0);
		CrossoverAchievementButton_ResetCriteria(renderOffScreen);
		CrossoverAchievementButton_ResetProgressBars(renderOffScreen);
		CrossoverAchievementButton_ResetMiniAchievements(renderOffScreen);
		CrossoverAchievementButton_ResetMetas(renderOffScreen);
		CrossoverAchievementObjectives_DisplayCriteria(objectives, id, renderOffScreen);
		if ( objectives:GetHeight() > 0 ) then
			objectives:SetPoint("TOP", topAnchor, "BOTTOM", 0, -8);
			objectives:SetPoint("LEFT", "$parentIcon", "RIGHT", -5, -25);
			objectives:SetPoint("RIGHT", "$parentShield", "LEFT", -10, 0);
		end
	end
	height = height + objectives:GetHeight();

	if ( height ~= CrossoverAchievementButton_COLLAPSEDHEIGHT or button.numLines > ACHIEVEMENTUI_MAX_LINES_COLLAPSED ) then
		button.hiddenDescription:Show();
		button.description:Hide();
		local descriptionHeight = button.hiddenDescription:GetHeight();
		height = height + descriptionHeight - CrossoverAchievementButton_DESCRIPTIONHEIGHT;
		if ( button.reward:IsShown() ) then
			height = height + 4;
		end
	end

	-- Don't cache if we are rendering offscreen
	if (not renderOffScreen) then
		objectives.id = id;
	end
	return height;
end

function CrossoverAchievementShield_SetPoints(points, pointString, normalFont, smallFont)
	if ( points == 0 ) then
		pointString:SetText("");
		return;
	end
	if ( points < 100 ) then
		pointString:SetFontObject(normalFont);
	else
		pointString:SetFontObject(smallFont);
	end
	pointString:SetText(points);
end

function CrossoverAchievementButton_ResetTable (t)
	for k, v in next, t do
		v:Hide();
	end
end

local criteriaTable = {}
local criteriaTableOffScreen = {};

function CrossoverAchievementButton_ResetCriteria (renderOffScreen)
	if (renderOffScreen) then
		CrossoverAchievementFrameAchievementsObjectivesOffScreen.repCriteria:Hide();
		CrossoverAchievementButton_ResetTable(criteriaTableOffScreen);
	else
		CrossoverAchievementFrameAchievementsObjectives.repCriteria:Hide();
		CrossoverAchievementButton_ResetTable(criteriaTable);
	end
end

function CrossoverAchievementButton_GetCriteria (index, renderOffScreen)
	local criTable = criteriaTable;
	local offscreenName = "";
	if (renderOffScreen) then
		criTable = criteriaTableOffScreen;
		offscreenName = "OffScreen";
	end

	if ( criTable[index] ) then
		return criTable[index];
	end

	local frame = CreateFrame("FRAME", "CrossoverAchievementFrameCriteria" .. offscreenName .. index, CrossoverAchievementFrameAchievements, "CrossoverAchievementCriteriaTemplate");
	CrossoverAchievementFrame_LocalizeCriteria(frame);
	criTable[index] = frame;

	return frame;
end

-- The smallest table in WoW.
local miniTable = {}

function CrossoverAchievementButton_ResetMiniAchievements (renderOffScreen)
	-- We don't render mini achievements offscreen, so don't reset it if renderOffScreen is true
	if (not renderOffScreen) then
		CrossoverAchievementButton_ResetTable(miniTable);
	end
end

function CrossoverAchievementButton_GetMiniAchievement (index)
	local miniTable = miniTable;
	if ( miniTable[index] ) then
		return miniTable[index];
	end

	local frame = CreateFrame("FRAME", "CrossoverAchievementFrameMiniAchievement" .. index, CrossoverAchievementFrameAchievements, "CrossoverMiniAchievementTemplate");
	CrossoverAchievementButton_LocalizeMiniAchievement(frame);
	miniTable[index] = frame;

	return frame;
end

local progressBarTable = {};
local progressBarTableOffScreen = {};

function CrossoverAchievementButton_ResetProgressBars (renderOffScreen)
	if (renderOffScreen) then
		CrossoverAchievementButton_ResetTable(progressBarTableOffScreen);
	else
		CrossoverAchievementButton_ResetTable(progressBarTable);
	end
end

function CrossoverAchievementButton_GetProgressBar (index, renderOffScreen)
	local pgTable = progressBarTable;
	local offscreenName = "";
	if (renderOffScreen) then
		pgTable = progressBarTableOffScreen;
		offscreenName = "OffScreen";
	end
	if ( pgTable[index] ) then
		return pgTable[index];
	end

	local frame = CreateFrame("STATUSBAR", "CrossoverAchievementFrameProgressBar" .. offscreenName .. index, CrossoverAchievementFrameAchievements, "CrossoverAchievementProgressBarTemplate");
	CrossoverAchievementButton_LocalizeProgressBar(frame);
	pgTable[index] = frame;

	return frame;
end

local metaCriteriaTable = {};
local metaCriteriaTableOffScreen = {};

function CrossoverAchievementButton_ResetMetas (renderOffScreen)
	if (renderOffScreen) then
		CrossoverAchievementButton_ResetTable(metaCriteriaTableOffScreen);
	else
		CrossoverAchievementButton_ResetTable(metaCriteriaTable);
	end
end

function CrossoverAchievementButton_GetMeta (index, renderOffScreen)
	local mcTable = metaCriteriaTable;
	local offscreenName = "";
	if (renderOffScreen) then
		mcTable = metaCriteriaTableOffScreen;
		offscreenName = "OffScreen";
	end
	if ( not mcTable[index] ) then
		local frame = CreateFrame("BUTTON", "CrossoverAchievementFrameMeta" .. offscreenName .. index, CrossoverAchievementFrameAchievements, "CrossoverMetaCriteriaTemplate");
		CrossoverAchievementButton_LocalizeMetaAchievement(frame);
		mcTable[index] = frame;
	end

	if ( mcTable[index].guildView ~= IN_GUILD_VIEW ) then
		CrossoverAchievementButton_ToggleMetaView(mcTable[index]);
	end
	return mcTable[index];
end

function CrossoverAchievementButton_ToggleMetaView(frame)
	if ( IN_GUILD_VIEW ) then
		frame.border:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Guild");
		frame.border:SetTexCoord(0.89062500, 0.97070313, 0.00195313, 0.08203125);
	else
		frame.border:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Progressive-IconBorder");
		frame.border:SetTexCoord(0, 0.65625, 0, 0.65625);
	end
	frame.guildView = IN_GUILD_VIEW;
end

function CrossoverAchievementButton_GetProgressivePoints(achievementID)
	local points;
	local _, _, progressivePoints, completed = GetAchievementInfo(achievementID);

	while GetPreviousAchievement(achievementID) do
		achievementID = GetPreviousAchievement(achievementID);
		_, _, points, completed = GetAchievementInfo(achievementID);
		progressivePoints = progressivePoints+points;
	end

	if ( progressivePoints ) then
		return progressivePoints;
	else
		return 0;
	end
end

local achievementList = {};

function CrossoverAchievementObjectives_DisplayProgressiveAchievement (objectivesFrame, id)
	local ACHIEVEMENTMODE_PROGRESSIVE = 2;
	local achievementID = id;

	local achievementList = achievementList;
	for i in next, achievementList do
		achievementList[i] = nil;
	end

	tinsert(achievementList, 1, achievementID);
	while GetPreviousAchievement(achievementID) do
		tinsert(achievementList, 1, GetPreviousAchievement(achievementID));
		achievementID = GetPreviousAchievement(achievementID);
	end

	local i = 0;
	for index, achievementID in ipairs(achievementList) do
		local _, achievementName, points, completed, month, day, year, description, flags, iconpath = GetAchievementInfo(achievementID);
		flags = flags or 0;		-- bug 360115
		local miniAchievement = CrossoverAchievementButton_GetMiniAchievement(index);

		miniAchievement:Show();
		miniAchievement:SetParent(objectivesFrame);
		miniAchievement.icon:SetTexture(iconpath);
		if ( index == 1 ) then
			miniAchievement:SetPoint("TOPLEFT", objectivesFrame, "TOPLEFT", -4, -4);
		elseif ( mod(index, 6) == 1 ) then
			miniAchievement:SetPoint("TOPLEFT", miniTable[index - 6], "BOTTOMLEFT", 0, -8);
		else
			miniAchievement:SetPoint("TOPLEFT", miniTable[index-1], "TOPRIGHT", 4, 0);
		end

		if ( points > 0 ) then
			miniAchievement.points:SetText(points);
			miniAchievement.points:Show();
			miniAchievement.shield:SetTexture([[Interface\AchievementFrame\UI-Achievement-Progressive-Shield]]);
		else
			miniAchievement.points:Hide();
			miniAchievement.shield:SetTexture([[Interface\AchievementFrame\UI-Achievement-Progressive-Shield-NoPoints]]);
		end

		miniAchievement.numCriteria = 0;
		if ( not ( bit.band(flags, ACHIEVEMENT_FLAGS_HAS_PROGRESS_BAR) == ACHIEVEMENT_FLAGS_HAS_PROGRESS_BAR ) ) then
			for i = 1, GetAchievementNumCriteria(achievementID) do
				local criteriaString, criteriaType, completed = GetAchievementCriteriaInfo(achievementID, i);
				if ( completed == false ) then
					criteriaString = "|CFF808080 - " .. criteriaString .. "|r";
				else
					criteriaString = "|CFF00FF00 - " .. criteriaString .. "|r";
				end
				miniAchievement["criteria" .. i] = criteriaString;
				miniAchievement.numCriteria = i;
			end
		end
		miniAchievement.name = achievementName;
		miniAchievement.desc = description;
		if ( month ) then
			miniAchievement.date = FormatShortDate(day, month, year);
		end
		i = index;
	end

	objectivesFrame:SetHeight(math.ceil(i/6) * ACHIEVEMENTUI_PROGRESSIVEHEIGHT);
	objectivesFrame:SetWidth(min(i, 6) * ACHIEVEMENTUI_PROGRESSIVEWIDTH);
	objectivesFrame.mode = ACHIEVEMENTMODE_PROGRESSIVE;
end

function CrossoverAchievementFrame_GetCategoryNumAchievements_All (categoryID)
	local numAchievements, numCompleted, numIncomplete = GetCategoryNumAchievements(categoryID);

	return numAchievements, numCompleted, 0;
end

function CrossoverAchievementFrame_GetCategoryNumAchievements_Complete (categoryID)
	local numAchievements, numCompleted, numIncomplete = GetCategoryNumAchievements(categoryID);

	return numCompleted, numCompleted, 0;
end

function CrossoverAchievementFrame_GetCategoryNumAchievements_Incomplete (categoryID)
	local numAchievements, numCompleted, numIncomplete = GetCategoryNumAchievements(categoryID);

	return numIncomplete, 0, numAchievements-numIncomplete;
end

CROSSOVER_ACHIEVEMENTUI_SELECTEDFILTER = CrossoverAchievementFrame_GetCategoryNumAchievements_All;

CrossoverAchievementFrameFilters = { {text=ACHIEVEMENTFRAME_FILTER_ALL, func= CrossoverAchievementFrame_GetCategoryNumAchievements_All},
 {text=ACHIEVEMENTFRAME_FILTER_COMPLETED, func=CrossoverAchievementFrame_GetCategoryNumAchievements_Complete},
{text=ACHIEVEMENTFRAME_FILTER_INCOMPLETE, func=CrossoverAchievementFrame_GetCategoryNumAchievements_Incomplete} };

function CrossoverAchievementFrameFilterDropDown_OnLoad (self)
	self.relativeTo = "CrossoverAchievementFrameFilterDropDown"
	self.xOffset = -14;
	self.yOffset = 10;
	UIDropDownMenu_Initialize(self, CrossoverAchievementFrameFilterDropDown_Initialize);
end

function CrossoverAchievementFrameFilterDropDown_Initialize (self)
	local info = UIDropDownMenu_CreateInfo();
	for i, filter in ipairs(CrossoverAchievementFrameFilters) do
		info.text = filter.text;
		info.value = i;
		info.func = CrossoverAchievementFrameFilterDropDownButton_OnClick;
		info.tooltipOnButton = 1;
		info.tooltipTitle = ACHIEVEMENT_FILTER_TITLE;
		info.tooltipText = CrossoverAchievementFrameFilterStrings[i];
		if ( filter.func == CROSSOVER_ACHIEVEMENTUI_SELECTEDFILTER ) then
			info.checked = 1;
			UIDropDownMenu_SetText(self, filter.text);
			self.value =  i;
		else
			info.checked = nil;
		end
		UIDropDownMenu_AddButton(info);
	end
end

function CrossoverAchievementFrameFilterDropDownButton_OnClick (self)
	CrossoverAchievementFrame_SetFilter(self.value);
end

function CrossoverAchievementFrame_SetFilter(value)
	local func = CrossoverAchievementFrameFilters[value].func;
	if ( func ~= CROSSOVER_ACHIEVEMENTUI_SELECTEDFILTER ) then
		CROSSOVER_ACHIEVEMENTUI_SELECTEDFILTER = func;
		UIDropDownMenu_SetText(CrossoverAchievementFrameFilterDropDown, CrossoverAchievementFrameFilters[value].text)
		CrossoverAchievementFrameAchievementsContainerScrollBar:SetValue(0);
		CrossoverAchievementFrameAchievements_ForceUpdate();
		CrossoverAchievementFrameFilterDropDown.value = value;
	end
end

function CrossoverAchievementObjectives_DisplayCriteria (objectivesFrame, id, renderOffScreen)
	if ( not id ) then
		return;
	end

	local yOffset = 0;
	local ACHIEVEMENTMODE_CRITERIA = 1;
	local numMetaRows = 0;
	local numCriteriaRows = 0;
	local numExtraCriteriaRows = 0;

    local function AddExtraCriteriaRow()
        numExtraCriteriaRows = numExtraCriteriaRows + 1;
        yOffset = -numExtraCriteriaRows * CrossoverAchievementButton_CRITERIAROWHEIGHT;
    end
    if CrossoverAchievements.Helpers.GameVersionHelper:HasGuildReputation() then

        local requiresRep, hasRep, repLevel;
        if ( not objectivesFrame.completed ) then
            requiresRep, hasRep, repLevel = GetAchievementGuildRep(id);
            if ( requiresRep ) then
                local gender = UnitSex("player");
                local factionStandingtext = GetText("FACTION_STANDING_LABEL"..repLevel, gender);
                objectivesFrame.repCriteria:SetFormattedText(ACHIEVEMENT_REQUIRES_GUILD_REPUTATION, factionStandingtext);
                if ( hasRep ) then
                    objectivesFrame.repCriteria:SetTextColor(0, 1, 0);
                else
                    objectivesFrame.repCriteria:SetTextColor(1, 0, 0);
                end
                objectivesFrame.repCriteria:Show();
                AddExtraCriteriaRow();
            end
        end
    end

	local numCriteria = GetAchievementNumCriteria(id);
	if ( numCriteria == 0 and not requiresRep ) then
		objectivesFrame.mode = ACHIEVEMENTMODE_CRITERIA;
		objectivesFrame:SetHeight(0);
		return;
	end

	-- text check width
	if ( not objectivesFrame.textCheckWidth ) then
		local criteria = CrossoverAchievementButton_GetCriteria(1, renderOffScreen);
		criteria.name:SetText("- ");
		objectivesFrame.textCheckWidth = criteria.name:GetStringWidth();
	end

	local frameLevel = objectivesFrame:GetFrameLevel() + 1;

	-- Why textStrings? You try naming anything just "string" and see how happy you are.
	local textStrings, progressBars, metas = 0, 0, 0;
	local firstMetaCriteria;

	local maxCriteriaWidth = 0;
	local yPos;
	for i = 1, numCriteria do
		local criteriaString, criteriaType, completed, quantity, reqQuantity, charName, flags, assetID, quantityString = GetAchievementCriteriaInfo(id, i);

		if ( criteriaType == CRITERIA_TYPE_ACHIEVEMENT and assetID ) then
			metas = metas + 1;
			local metaCriteria = CrossoverAchievementButton_GetMeta(metas, renderOffScreen);
			metaCriteria:ClearAllPoints();

			if ( metas == 1 ) then
				-- this will be anchored below, we need to know how many text criteria there are
				firstMetaCriteria = metaCriteria;
				numMetaRows = numMetaRows + 1;
			elseif ( math.fmod(metas, 2) == 0 ) then
				local anchorMeta = CrossoverAchievementButton_GetMeta(metas-1, renderOffScreen);
				metaCriteria:SetPoint("LEFT", anchorMeta, "RIGHT", 35, 0);
			else
				local anchorMeta = CrossoverAchievementButton_GetMeta(metas-2, renderOffScreen);
				metaCriteria:SetPoint("TOPLEFT", anchorMeta, "BOTTOMLEFT", -0, 2);
				numMetaRows = numMetaRows + 1;
			end

			local id, achievementName, points, achievementCompleted, month, day, year, description, flags, iconpath = GetAchievementInfo(assetID);

			if ( month ) then
				metaCriteria.date = FormatShortDate(day, month, year)
			else
				metaCriteria.date = nil;
			end

			metaCriteria.id = id;
			metaCriteria.label:SetText(achievementName);
			metaCriteria.icon:SetTexture(iconpath);

			-- have to check if criteria is completed here, can't just check if achievement is completed.
			-- This is because the criteria could have modifiers on it that prevent completion even though the achievement is earned.
			if ( objectivesFrame.completed and completed ) then
				metaCriteria.check:Show();
				metaCriteria.border:SetVertexColor(1, 1, 1, 1);
				metaCriteria.icon:SetVertexColor(1, 1, 1, 1);
				metaCriteria.label:SetShadowOffset(0, 0)
				metaCriteria.label:SetTextColor(0, 0, 0, 1);
			elseif ( completed ) then
				metaCriteria.check:Show();
				metaCriteria.border:SetVertexColor(1, 1, 1, 1);
				metaCriteria.icon:SetVertexColor(1, 1, 1, 1);
				metaCriteria.label:SetShadowOffset(1, -1)
				metaCriteria.label:SetTextColor(0, 1, 0, 1);
			else
				metaCriteria.check:Hide();
				metaCriteria.border:SetVertexColor(.75, .75, .75, 1);
				metaCriteria.icon:SetVertexColor(.55, .55, .55, 1);
				metaCriteria.label:SetShadowOffset(1, -1)
				metaCriteria.label:SetTextColor(.6, .6, .6, 1);
			end

			metaCriteria:SetParent(objectivesFrame);
			metaCriteria:Show();
		elseif ( bit.band(flags, EVALUATION_TREE_FLAG_PROGRESS_BAR) == EVALUATION_TREE_FLAG_PROGRESS_BAR ) then
			-- Display this criteria as a progress bar!
			progressBars = progressBars + 1;
			local progressBar = CrossoverAchievementButton_GetProgressBar(progressBars, renderOffScreen);

			if ( progressBars == 1 ) then
				progressBar:SetPoint("TOP", objectivesFrame, "TOP", 4, -4 + yOffset);
			else
				progressBar:SetPoint("TOP", CrossoverAchievementButton_GetProgressBar(progressBars-1, renderOffScreen), "BOTTOM", 0, 0);
			end

			progressBar.text:SetText(string.format("%s", quantityString));
			progressBar:SetMinMaxValues(0, reqQuantity);
			progressBar:SetValue(quantity);

			progressBar:SetParent(objectivesFrame);
			progressBar:Show();

			numCriteriaRows = numCriteriaRows + 1;
		else
			textStrings = textStrings + 1;
			local criteria = CrossoverAchievementButton_GetCriteria(textStrings, renderOffScreen);
			criteria:ClearAllPoints();
			if ( textStrings == 1 ) then
				if ( numCriteria == 1 ) then
					criteria:SetPoint("TOP", objectivesFrame, "TOP", -14, yOffset);
				else
					criteria:SetPoint("TOPLEFT", objectivesFrame, "TOPLEFT", 0, yOffset);
				end

			else
				criteria:SetPoint("TOPLEFT", CrossoverAchievementButton_GetCriteria(textStrings-1, renderOffScreen), "BOTTOMLEFT", 0, 0);
			end

			if ( objectivesFrame.completed and completed ) then
				criteria.name:SetTextColor(0, 0, 0, 1);
				criteria.name:SetShadowOffset(0, 0);
			elseif ( completed ) then
				criteria.name:SetTextColor(0, 1, 0, 1);
				criteria.name:SetShadowOffset(1, -1);
			else
				criteria.name:SetTextColor(.6, .6, .6, 1);
				criteria.name:SetShadowOffset(1, -1);
			end

			local stringWidth = 0;
			local maxCriteriaContentWidth;
			if ( completed ) then
				maxCriteriaContentWidth = ACHIEVEMENTUI_MAXCONTENTWIDTH - ACHIEVEMENTUI_CRITERIACHECKWIDTH;
				criteria.check:SetPoint("LEFT", 18, -3);
				criteria.name:SetPoint("LEFT", criteria.check, "RIGHT", 0, 2);
				criteria.check:Show();
				criteria.name:SetText(criteriaString);
				stringWidth = min(criteria.name:GetStringWidth(),maxCriteriaContentWidth);
			else
				maxCriteriaContentWidth = ACHIEVEMENTUI_MAXCONTENTWIDTH - objectivesFrame.textCheckWidth;
				criteria.check:SetPoint("LEFT", 0, -3);
				criteria.name:SetPoint("LEFT", criteria.check, "RIGHT", 5, 2);
				criteria.check:Hide();
				criteria.name:SetText("- "..criteriaString);
				stringWidth = min(criteria.name:GetStringWidth() - objectivesFrame.textCheckWidth,maxCriteriaContentWidth);	-- don't want the "- " to be included in the width
			end
			if ( criteria.name:GetWidth() > maxCriteriaContentWidth ) then
				criteria.name:SetWidth(maxCriteriaContentWidth);
			end
			criteria:SetParent(objectivesFrame);
			criteria:Show();
			criteria:SetWidth(stringWidth + ACHIEVEMENTUI_CRITERIACHECKWIDTH);
			maxCriteriaWidth = max(maxCriteriaWidth, stringWidth + ACHIEVEMENTUI_CRITERIACHECKWIDTH);

			numCriteriaRows = numCriteriaRows + 1;
		end
	end

	if ( textStrings > 0 and progressBars > 0 ) then
		-- If we have text criteria and progressBar criteria, display the progressBar criteria first and position the textStrings under them.
		local criTable = CrossoverAchievementButton_GetCriteria(1, renderOffScreen);
		criTable:ClearAllPoints();
		if ( textStrings == 1 ) then
			criTable:SetPoint("TOP", CrossoverAchievementButton_GetProgressBar(progressBars, renderOffScreen), "BOTTOM", -14, -4);
		else
			criTable:SetPoint("TOP", CrossoverAchievementButton_GetProgressBar(progressBars, renderOffScreen), "BOTTOM", 0, -4);
			criTable:SetPoint("LEFT", objectivesFrame, "LEFT", 0, 0);
		end
	elseif ( textStrings > 1 ) then
		-- Figure out if we can make multiple columns worth of criteria instead of one long one
		local numColumns = floor(ACHIEVEMENTUI_MAXCONTENTWIDTH/maxCriteriaWidth);
		-- But if we have a lot of criteria, force 2 columns
		local forceColumns = false;
		if ( numColumns == 1 and textStrings >= FORCE_COLUMNS_MIN_CRITERIA and maxCriteriaWidth <= FORCE_COLUMNS_MAX_WIDTH ) then
			numColumns = 2;
			forceColumns = true;
			-- if top right criteria would run into the achievement shield, move them all down 1 row
			-- this assumes description is 1 or 2 lines, otherwise this wouldn't be a problem
			if ( CrossoverAchievementButton_GetCriteria(2, renderOffScreen).name:GetStringWidth() > FORCE_COLUMNS_RIGHT_COLUMN_SPACE and progressBars == 0 ) then
				AddExtraCriteriaRow();
			end
		end
		if ( numColumns > 1 ) then
			local step;
			local rows = 1;
			local position = 0;
			local criTable = criteriaTable;
			if (renderOffScreen) then
				criTable = criteriaTableOffScreen;
			end
			for i=1, #criTable do
				position = position + 1;
				if ( position > numColumns ) then
					position = position - numColumns;
					rows = rows + 1;
				end

				if ( rows == 1 ) then
					criTable[i]:ClearAllPoints();
					local xOffset = 0;
					if ( forceColumns ) then
						if ( position == 1 ) then
							xOffset = FORCE_COLUMNS_LEFT_OFFSET;
						elseif ( position == 2 ) then
							xOffset = FORCE_COLUMNS_RIGHT_OFFSET;
						end
					end
					criTable[i]:SetPoint("TOPLEFT", objectivesFrame, "TOPLEFT", (position - 1)*(ACHIEVEMENTUI_MAXCONTENTWIDTH/numColumns) + xOffset, yOffset);
				else
					criTable[i]:ClearAllPoints();
					criTable[i]:SetPoint("TOPLEFT", criTable[position + ((rows - 2) * numColumns)], "BOTTOMLEFT", 0, 0);
				end
			end
			numCriteriaRows = ceil(numCriteriaRows/numColumns);
		end
	end

	numCriteriaRows = numCriteriaRows + numExtraCriteriaRows;

	if ( firstMetaCriteria ) then
		local yOffsetMeta = -8 - numCriteriaRows * CrossoverAchievementButton_CRITERIAROWHEIGHT;
		if ( metas == 1 ) then
			firstMetaCriteria:SetPoint("TOP", objectivesFrame, "TOP", 0, yOffsetMeta);
		else
			firstMetaCriteria:SetPoint("TOPLEFT", objectivesFrame, "TOPLEFT", 20, yOffsetMeta);
		end
	end

	local height = numMetaRows * CrossoverAchievementButton_METAROWHEIGHT + numCriteriaRows * CrossoverAchievementButton_CRITERIAROWHEIGHT;
	if ( metas > 0 or progressBars > 0 ) then
		height = height + 10;
	end
	objectivesFrame:SetHeight(height);
	objectivesFrame.mode = ACHIEVEMENTMODE_CRITERIA;
end

-- [[ StatsFrames ]]--

function CrossoverAchievementFrameStats_OnEvent (self, event, ...)
	if ( event == "CRITERIA_UPDATE" and self:IsVisible() ) then
		CrossoverAchievementFrameStats_Update();
	end
end

function CrossoverAchievementFrameStats_OnLoad (self)
	CrossoverAchievementFrameStatsContainerScrollBar.Show =
		function (self)
			CrossoverAchievementFrameStats:SetWidth(504);
			for _, button in next, CrossoverAchievementFrameStats.buttons do
				button:SetWidth(496);
			end
			getmetatable(self).__index.Show(self);
		end

	CrossoverAchievementFrameStatsContainerScrollBar.Hide =
		function (self)
			CrossoverAchievementFrameStats:SetWidth(530);
			for _, button in next, CrossoverAchievementFrameStats.buttons do
				button:SetWidth(522);
			end
			getmetatable(self).__index.Hide(self);
		end

	self:RegisterEvent("CRITERIA_UPDATE");
	CrossoverAchievementFrameStatsContainerScrollBarBG:Show();
	CrossoverAchievementFrameStatsContainer.update = CrossoverAchievementFrameStats_Update;
	HybridScrollFrame_CreateButtons(CrossoverAchievementFrameStatsContainer, "CrossoverStatTemplate");
end


function CrossoverAchievementFrameStats_Update ()
	local category = Crossover_achievementFunctions.selectedCategory;
	local scrollFrame = CrossoverAchievementFrameStatsContainer;
	local offset = HybridScrollFrame_GetOffset(scrollFrame);
	local buttons = scrollFrame.buttons;
	local numButtons = #buttons;
	local statHeight = 24;

	local numStats, numCompleted = GetCategoryNumAchievements(category);

	local categories = ACHIEVEMENTUI_CATEGORIES;
	-- clear out table
	if ( Crossover_achievementFunctions.lastCategory ~= category ) then
		local statCat;
		for i in next, displayStatCategories do
			displayStatCategories[i] = nil;
		end
		-- build a list of shown category and stat id's

		tinsert(displayStatCategories, {id = category, header = true});
		for i=1, numStats do
			local quantity, skip, id = GetStatistic(category, i);
			if ( not skip ) then
				tinsert(displayStatCategories, {id = id});
			end
		end
		-- add all the subcategories and their stat id's
		for i, cat in next, categories do
			if ( cat.parent == category ) then
				tinsert(displayStatCategories, {id = cat.id, header = true});
				numStats = GetCategoryNumAchievements(cat.id);
				for k=1, numStats do
					local quantity, skip, id = GetStatistic(cat.id, k);
					if ( not skip ) then
						tinsert(displayStatCategories, {id = id});
					end
				end
			end
		end
		Crossover_achievementFunctions.lastCategory = category;
	end

	-- iterate through the displayStatCategories and display them
	local selection = CrossoverAchievementFrameStats.selection;
	local statCount = #displayStatCategories;
	local statIndex, id, button;
	local stat;

	local totalHeight = statCount * statHeight;
	local displayedHeight = numButtons * statHeight;
	for i = 1, numButtons do
		button = buttons[i];
		statIndex = offset + i;
		if ( statIndex <= statCount ) then
			stat = displayStatCategories[statIndex];
			if ( stat.header ) then
				CrossoverAchievementFrameStats_SetHeader(button, stat.id);
			else
				CrossoverAchievementFrameStats_SetStat(button, stat.id, nil, statIndex)
			end
			button:Show();
		else
			button:Hide();
		end
	end
	HybridScrollFrame_Update(scrollFrame, totalHeight, displayedHeight);
end

function CrossoverAchievementFrameStats_SetStat(button, category, index, colorIndex, isSummary)
	--Remove these variables when we know for sure we don't need them
	local id, name, points, completed, month, day, year, description, flags, icon;
	if ( not isSummary ) then
		if ( not index ) then
			id, name, points, completed, month, day, year, description, flags, icon = GetAchievementInfo(category);
		else
			id, name, points, completed, month, day, year, description, flags, icon = GetAchievementInfo(category, index);
		end

	else
		-- This is on the summary page
		id, name, points, completed, month, day, year, description, flags, icon = GetAchievementInfoFromCriteria(category);
	end

	if (not id) then
		return;
	end

	button.id = id;

	if ( not colorIndex ) then
		if ( not index ) then
			message("Error, need a color index or index");
		end
		colorIndex = index;
	end
	button:SetText(name);
	button.background:Show();
	-- Color every other line yellow
	if ( mod(colorIndex, 2) == 1 ) then
		button.background:SetTexCoord(0, 1, 0.1875, 0.3671875);
		button.background:SetBlendMode("BLEND");
		button.background:SetAlpha(1.0);
		button:SetHeight(24);
	else
		button.background:SetTexCoord(0, 1, 0.375, 0.5390625);
		button.background:SetBlendMode("ADD");
		button.background:SetAlpha(0.5);
		button:SetHeight(24);
	end

	-- Figure out the criteria
	local numCriteria = GetAchievementNumCriteria(id);
	if ( numCriteria == 0 ) then
		-- This is no good!
	end
	-- Just show the first criteria for now
	local criteriaString, criteriaType, completed, quantityNumber, reqQuantity, charName, flags, assetID, quantity;
	if ( not isSummary ) then
		quantity = GetStatistic(id);
	else
		criteriaString, criteriaType, completed, quantityNumber, reqQuantity, charName, flags, assetID, quantity = GetAchievementCriteriaInfo(category);
	end
	if ( not quantity ) then
		quantity = "--";
	end
	button.value:SetText(quantity);

	-- Hide the header images
	button.title:Hide();
	button.left:Hide();
	button.middle:Hide();
	button.right:Hide();
	button.isHeader = false;
end

function CrossoverAchievementFrameStats_SetHeader(button, id)
	-- show header
	button.left:Show();
	button.middle:Show();
	button.right:Show();
	local text;
	if ( id == ACHIEVEMENT_COMPARISON_STATS_SUMMARY_ID ) then
		text = ACHIEVEMENT_SUMMARY_CATEGORY;
	else
		text = GetCategoryInfo(id);
	end
	button.title:SetText(text);
	button.title:Show();
	button.value:SetText("");
	button:SetText("");
	button:SetHeight(24);
	button.background:Hide();
	button.isHeader = true;
	button.id = id;
end

function CrossoverAchievementStatButton_OnLoad(self, parentFrame)
	self.value:SetVertexColor(1, 0.97, 0.6);
	parentFrame.buttons = parentFrame.buttons or {};
	tinsert(parentFrame.buttons, self);
end

function CrossoverAchievementStatButton_OnClick(self)
	if ( self.isHeader ) then
		Crossover_achievementFunctions.selectedCategory = self.id;
		CrossoverAchievementFrameCategories_Update();
		CrossoverAchievementFrameStats_Update();
	elseif ( self.summary ) then
		CrossoverAchievementFrame_SelectSummaryStatistic(self.id);
	end
end

function CrossoverAchievementStatButton_OnEnter(self)
	if ( self.text:IsTruncated() ) then
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
		GameTooltip:SetText(self.text:GetText(), 1, 1, 1, 1, true);
	end
end

function CrossoverAchievementFrameSummary_SetClassicPositions()
   local total = table.getn(ACHIEVEMENTUI_SUMMARYCATEGORIES);
   if total == 8 then
        local point, relativeTo, relativePoint, xOfs, yOfs = CrossoverAchievementFrameSummaryCategoriesCategory1:GetPoint(1);  
        CrossoverAchievementFrameSummaryCategoriesCategory1:SetPoint(point, relativeTo, relativePoint, xOfs, -24); -- -24 in Classic -13 in Retail
        point, relativeTo, relativePoint, xOfs, yOfs = CrossoverAchievementFrameSummaryCategoriesCategory3:GetPoint(1);  
        CrossoverAchievementFrameSummaryCategoriesCategory3:SetPoint(point, relativeTo, relativePoint, xOfs, -14); -- -14 in Classic -10 in Retail
        point, relativeTo, relativePoint, xOfs, yOfs = CrossoverAchievementFrameSummaryCategoriesCategory5:GetPoint(1);  
        CrossoverAchievementFrameSummaryCategoriesCategory5:SetPoint(point, relativeTo, relativePoint, xOfs, -14); -- -14 in Classic -10 in Retail
        point, relativeTo, relativePoint, xOfs, yOfs = CrossoverAchievementFrameSummaryCategoriesCategory7:GetPoint(1);  
        CrossoverAchievementFrameSummaryCategoriesCategory7:SetPoint(point, relativeTo, relativePoint, xOfs, -14); -- -14 in Classic -10 in Retail
        CrossoverAchievementFrameSummaryCategoriesCategory9:Hide(); -- Only visible in Retail
        CrossoverAchievementFrameSummaryCategoriesCategory10:Hide(); -- Only visible in Retail
        point, relativeTo, relativePoint, xOfs, yOfs = CrossoverAchievementFrameSummaryCategories:GetPoint(1);  
        CrossoverAchievementFrameSummaryCategories:SetPoint(point, relativeTo, relativePoint, xOfs, -8); -- -8 in Classic -6 in Retail
        point, relativeTo, relativePoint, xOfs, yOfs = CrossoverAchievementFrameSummaryAchievements:GetPoint(1);  
        CrossoverAchievementFrameSummaryAchievements:SetPoint(point, relativeTo, relativePoint, xOfs, -20); -- -20 in Classic -10 in Retail
        point, relativeTo, relativePoint, xOfs, yOfs = CrossoverAchievementFrameSummary:GetPoint(1);  
        CrossoverAchievementFrameSummary:SetPoint(point, relativeTo, relativePoint, xOfs, 0); -- 0 in Classic -1 in Retail
        point, relativeTo, relativePoint, xOfs, yOfs = CrossoverAchievementFrameFilterDropDown:GetPoint(1);  
        CrossoverAchievementFrameFilterDropDown:SetPoint(point, relativeTo, relativePoint, 558, yOfs); -- 558 in Classic -148 in Retail
   end
end

-- [[ Summary Frame ]] --
function CrossoverAchievementFrameSummary_OnShow()
	if ( Crossover_achievementFunctions ~= CROSSOVER_COMPARISON_ACHIEVEMENT_FUNCTIONS and Crossover_achievementFunctions ~= CROSSOVER_COMPARISON_STAT_FUNCTIONS ) then
		if ( CrossoverAchievementFrameSummary.guildView ~= IN_GUILD_VIEW ) then
			CrossoverAchievementFrameSummary_ToggleView();
		elseif ( CrossoverAchievementFrameSummary.guildView ) then
			CrossoverAchievementFrameSummary_UpdateSummaryCategories(ACHIEVEMENTUI_GUILDSUMMARYCATEGORIES);
		else
			CrossoverAchievementFrameSummary_UpdateSummaryCategories(ACHIEVEMENTUI_SUMMARYCATEGORIES);
		end
		CrossoverAchievementFrameSummary:SetWidth(530);
		CrossoverAchievementFrameSummary_Update();
	else
		CrossoverAchievementFrameComparisonDark:Hide();
		CrossoverAchievementFrameComparisonWatermark:Hide();
		CrossoverAchievementFrameComparison:SetWidth(650);
		CrossoverAchievementFrameSummary:SetWidth(650);
		CrossoverAchievementFrameSummary_Update(true);
	end
end

function CrossoverAchievementFrameSummary_Update(isCompare)
	CrossoverAchievementFrameSummaryCategoriesStatusBar_Update();
	CrossoverAchievementFrameSummary_UpdateAchievements(GetLatestCompletedAchievements(IN_GUILD_VIEW));
end

function CrossoverAchievementFrameSummary_UpdateSummaryCategories(categories)
	for i = 1, 12 do
		local statusBar = _G["CrossoverAchievementFrameSummaryCategoriesCategory"..i];
		if ( i <= #categories ) then
			local categoryName = GetCategoryInfo(categories[i]);
			statusBar.label:SetText(categoryName);
			statusBar:Show();
			statusBar:SetID(categories[i]);
			CrossoverAchievementFrameSummaryCategory_OnShow(statusBar);	-- to calculate progress
		else
			statusBar:Hide();
		end
	end
end

function CrossoverAchievementFrameSummary_ToggleView()
	local tCategories;
 	if ( CrossoverAchievementFrameSummary.guildView ) then
		CrossoverAchievementFrameSummary.guildView = nil;
		tCategories = ACHIEVEMENTUI_SUMMARYCATEGORIES;
		-- recent achievements
		for i = 1, ACHIEVEMENTUI_MAX_SUMMARY_ACHIEVEMENTS do
			local button = _G["CrossoverAchievementFrameSummaryAchievement"..i];
			button.icon.frame:SetTexture("Interface\\AchievementFrame\\UI-Achievement-IconFrame");
			button.icon.frame:SetTexCoord(0, 0.5625, 0, 0.5625);
			button.icon.frame:SetPoint("CENTER", -1, 2);
			button.glow:SetTexCoord(0, 1, 0.00390625, 0.25390625);
			button.titleBar:SetAlpha(0.5);
		end
	else
		CrossoverAchievementFrameSummary.guildView = true;
		tCategories = ACHIEVEMENTUI_GUILDSUMMARYCATEGORIES;
		-- recent achievements
		for i = 1, ACHIEVEMENTUI_MAX_SUMMARY_ACHIEVEMENTS do
			local button = _G["CrossoverAchievementFrameSummaryAchievement"..i];
			if ( button ) then
				CrossoverAchievementFrameSummaryAchievement_SetGuildTextures(button)
			end
		end
	end
	CrossoverAchievementFrameSummary_UpdateSummaryCategories(tCategories);
end

function CrossoverAchievementFrameSummary_UpdateAchievements(...)
	local numAchievements = select("#", ...);
	local id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuild, wasEarnedByMe, earnedBy;
	local buttons = CrossoverAchievementFrameSummaryAchievements.buttons;
	local button, anchorTo, achievementID;
	local defaultAchievementCount = 1;

	for i=1, ACHIEVEMENTUI_MAX_SUMMARY_ACHIEVEMENTS do
		if ( buttons ) then
			button = buttons[i];
		end
		if ( not button ) then
			button = CreateFrame("Button", "CrossoverAchievementFrameSummaryAchievement"..i, CrossoverAchievementFrameSummaryAchievements, "CrossoverSummaryAchievementTemplate");
			if ( i == 1 ) then
				button:SetPoint("TOPLEFT",CrossoverAchievementFrameSummaryAchievementsHeader, "BOTTOMLEFT", 18, 2 );
				button:SetPoint("TOPRIGHT",CrossoverAchievementFrameSummaryAchievementsHeader, "BOTTOMRIGHT", -18, 2 );
			else
				anchorTo = _G["CrossoverAchievementFrameSummaryAchievement"..i-1];
				button:SetPoint("TOPLEFT",anchorTo, "BOTTOMLEFT", 0, 3 );
				button:SetPoint("TOPRIGHT",anchorTo, "BOTTOMRIGHT", 0, 3 );
			end
			if ( CrossoverAchievementFrameSummary.guildView ) then
				CrossoverAchievementFrameSummaryAchievement_SetGuildTextures(button);
			end
			if ( not buttons ) then
				buttons = CrossoverAchievementFrameSummaryAchievements.buttons;
			end
			button.isSummary = true;
			CrossoverAchievementFrameSummary_LocalizeButton(button);
		end;

		if ( i <= numAchievements ) then
			achievementID = select(i, ...);
			id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuild, wasEarnedByMe, earnedBy = GetAchievementInfo(achievementID);

			local saturatedStyle;
			if ( bit.band(flags, ACHIEVEMENT_FLAGS_ACCOUNT) == ACHIEVEMENT_FLAGS_ACCOUNT ) then
				button.accountWide = true;
				saturatedStyle = "account";
			else
				button.accountWide = nil;
				if ( IN_GUILD_VIEW ) then
					saturatedStyle = "guild";
				else
					saturatedStyle = "normal";
				end
			end

			button.label:SetText(name);
			button.description:SetText(description);
			CrossoverAchievementShield_SetPoints(points, button.shield.points, GameFontNormal, GameFontNormalSmall);
			if ( points > 0 ) then
				button.shield.icon:SetTexture([[Interface\Addons\CrossoverAchievements\Textures\UI-Achievement-Shields]]);
			else
				button.shield.icon:SetTexture([[Interface\Addons\CrossoverAchievements\Textures\UI-Achievement-Shields-NoPoints]]);
			end

			if ( isGuild ) then
				button.shield.wasEarnedByMe = nil;
				button.shield.earnedBy = nil;
			else
				button.shield.wasEarnedByMe = not (completed and not wasEarnedByMe);
				button.shield.earnedBy = earnedBy;
			end

			button.icon.texture:SetTexture(icon);
			button.id = id;

			if ( completed ) then
				button.dateCompleted:SetText(FormatShortDate(day, month, year));
			else
				button.dateCompleted:SetText("");
			end

			if ( button.saturatedStyle ~= saturatedStyle ) then
				button:Saturate();
			end
			button.tooltipTitle = nil;
			button:Show();
		else
			local tAchievements;
			if ( IN_GUILD_VIEW ) then
				tAchievements = ACHIEVEMENTUI_DEFAULTGUILDSUMMARYACHIEVEMENTS;
			else
				tAchievements = ACHIEVEMENTUI_DEFAULTSUMMARYACHIEVEMENTS;
			end
			for i=defaultAchievementCount, ACHIEVEMENTUI_MAX_SUMMARY_ACHIEVEMENTS do
				achievementID = tAchievements[defaultAchievementCount];
				if ( not achievementID ) then
					break;
				end
				id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuild, wasEarnedByMe, earnedBy = GetAchievementInfo(achievementID);
				if ( completed ) then
					defaultAchievementCount = defaultAchievementCount+1;
				else
					button.label:SetText(name);
					button.description:SetText(description);
					CrossoverAchievementShield_SetPoints(points, button.shield.points, GameFontNormal, GameFontNormalSmall);
					if ( points > 0 ) then
						button.shield.icon:SetTexture([[Interface\Addons\CrossoverAchievements\Textures\UI-Achievement-Shields]]);
					else
						button.shield.icon:SetTexture([[Interface\Addons\CrossoverAchievements\Textures\UI-Achievement-Shields-NoPoints]]);
					end
					button.shield.wasEarnedByMe = not (completed and not wasEarnedByMe);
					button.shield.earnedBy = earnedBy;
					button.icon.texture:SetTexture(icon);
					button.id = id;
					if ( month ) then
						button.dateCompleted:SetText(FormatShortDate(day, month, year));
					else
						button.dateCompleted:SetText("");
					end
					button:Show();
					defaultAchievementCount = defaultAchievementCount+1;
					button:Desaturate();
					button.tooltipTitle = SUMMARY_ACHIEVEMENT_INCOMPLETE;
					button.tooltip = SUMMARY_ACHIEVEMENT_INCOMPLETE_TEXT;
					break;
				end
			end
		end
	end
	if ( numAchievements == 0 ) then
		CrossoverAchievementFrameSummaryAchievementsEmptyText:Show();
	else
		CrossoverAchievementFrameSummaryAchievementsEmptyText:Hide();
	end
end

function CrossoverAchievementFrameSummaryCategoriesStatusBar_Update()
	local total, completed = GetNumCompletedAchievements(IN_GUILD_VIEW);
	CrossoverAchievementFrameSummaryCategoriesStatusBar:SetMinMaxValues(0, total);
	CrossoverAchievementFrameSummaryCategoriesStatusBar:SetValue(completed);
	CrossoverAchievementFrameSummaryCategoriesStatusBarText:SetText(BreakUpLargeNumbers(completed).."/"..BreakUpLargeNumbers(total));
end

function CrossoverAchievementFrameSummaryAchievement_OnLoad(self)
	CrossoverAchievementComparisonPlayerButton_OnLoad(self);
	CrossoverAchievementFrameSummaryAchievements.buttons = CrossoverAchievementFrameSummaryAchievements.buttons or {};
	tinsert(CrossoverAchievementFrameSummaryAchievements.buttons, self);
	self.titleBar:SetVertexColor(1,1,1,0.5);
	self.dateCompleted:Show();
end

function CrossoverAchievementFrameSummaryAchievement_SetGuildTextures(button)
	button.icon.frame:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Guild");
	button.icon.frame:SetTexCoord(0.25976563, 0.40820313, 0.50000000, 0.64453125);
	button.icon.frame:SetPoint("CENTER", 0, 2);
	button.glow:SetTexCoord(0, 1, 0.26171875, 0.51171875);
	button.titleBar:SetAlpha(1);
end

function CrossoverAchievementFrameSummaryAchievement_OnClick(self)
	if ( IsModifiedClick("CHATLINK") ) then
		local achievementLink = GetAchievementLink(self.id);
		if ( achievementLink ) then
			if ( ChatEdit_InsertLink(achievementLink) ) then
				return;
			elseif ( SocialPostFrame and Social_IsShown() ) then
				Social_InsertLink(achievementLink);
				return;
			end
		end
	end

	local id = self.id
	local nextID, completed = GetNextAchievement(id);
	if ( nextID and completed ) then
		local newID;
		while ( nextID and completed ) do
			newID, completed = GetNextAchievement(nextID);
			if ( completed ) then
				nextID = newID;
			end
		end
		id = nextID;
	end

	CrossoverAchievementFrame_SelectAchievement(id);
end

function CrossoverAchievementFrameSummaryAchievement_OnEnter(self)
	self.highlight:Show();
	if ( self.tooltipTitle ) then
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
		GameTooltip:SetText(self.tooltipTitle,1,1,1);
		GameTooltip:AddLine(self.tooltip, nil, nil, nil, true);
		GameTooltip:Show();
	end
end

function CrossoverAchievementFrameSummaryCategoryButton_OnClick (self)
	local id = self:GetParent():GetID();
	for _, button in next, CrossoverAchievementFrameCategoriesContainer.buttons do
		if ( button.categoryID == id ) then
			button:Click();
			return;
		end
	end
end

function CrossoverAchievementFrameSummaryCategory_OnLoad (self)
	self:SetMinMaxValues(0, 100);
	self:SetValue(0);
end

function CrossoverAchievementFrame_GetCategoryTotalNumAchievements (id, showAll)
	-- Not recursive because we only have one deep and this saves time.
	local totalAchievements, totalCompleted = 0, 0;
	local numAchievements, numCompleted = GetCategoryNumAchievements(id, showAll);
	totalAchievements = totalAchievements + numAchievements;
	totalCompleted = totalCompleted + numCompleted;

	for _, category in next, ACHIEVEMENTUI_CATEGORIES do
		if ( category.parent == id ) then
			numAchievements, numCompleted = GetCategoryNumAchievements(category.id, showAll);
			totalAchievements = totalAchievements + numAchievements;
			totalCompleted = totalCompleted + numCompleted;
		end
	end

	return totalAchievements, totalCompleted;
end

function CrossoverAchievementFrameSummaryCategory_OnEvent (self, event, ...)
	CrossoverAchievementFrameSummaryCategory_OnShow(self);
end

function CrossoverAchievementFrameSummaryCategory_OnShow (self)
	local totalAchievements, totalCompleted = CrossoverAchievementFrame_GetCategoryTotalNumAchievements(self:GetID(), true);

	self.text:SetText(string.format("%d/%d", totalCompleted, totalAchievements));
	self:SetMinMaxValues(0, totalAchievements);
	self:SetValue(totalCompleted);
	self:RegisterEvent("ACHIEVEMENT_EARNED");
    
    CrossoverAchievementFrameSummary_SetClassicPositions();
end

function CrossoverAchievementFrameSummaryCategory_OnHide (self)
	self:UnregisterEvent("ACHIEVEMENT_EARNED");
end

function CrossoverAchievementFrame_SelectAchievement(id, forceSelect, isComparison)
	if ( (not CrossoverAchievementFrame:IsShown() and not forceSelect) or (not C_AchievementInfo.IsValidAchievement(id)) ) then
		return;
	end

	local _, _, _, achCompleted, _, _, _, _, flags = GetAchievementInfo(id);

	if ( achCompleted and (CROSSOVER_ACHIEVEMENTUI_SELECTEDFILTER == CrossoverAchievementFrameFilters[ACHIEVEMENT_FILTER_INCOMPLETE].func) ) then
		CrossoverAchievementFrame_SetFilter(ACHIEVEMENT_FILTER_ALL);
	elseif ( (not achCompleted) and (CROSSOVER_ACHIEVEMENTUI_SELECTEDFILTER == CrossoverAchievementFrameFilters[ACHIEVEMENT_FILTER_COMPLETE].func) ) then
		CrossoverAchievementFrame_SetFilter(ACHIEVEMENT_FILTER_ALL);
	end

	local tabIndex = 1;
	local category = GetAchievementCategory(id);
	if ( bit.band(flags, ACHIEVEMENT_FLAGS_GUILD) == ACHIEVEMENT_FLAGS_GUILD ) then
		tabIndex = 2;
	end

	if ( isComparison ) then
		CrossoverAchievementFrameTab_OnClick = CrossoverAchievementFrameComparisonTab_OnClick;
	else
		CrossoverAchievementFrameTab_OnClick = CrossoverAchievementFrameBaseTab_OnClick;
	end

	CrossoverAchievementFrameTab_OnClick(tabIndex);
	CrossoverAchievementFrameSummary:Hide();

	if ( not isComparison ) then
		CrossoverAchievementFrameAchievements:Show();
	end

	-- Figure out if this is part of a progressive achievement; if it is and it's incomplete, make sure the previous level was completed. If not, find the first incomplete achievement in the chain and display that instead.
	id = CrossoverAchievementFrame_FindDisplayedAchievement(id);

	CrossoverAchievementFrameCategories_ClearSelection();

	local categoryIndex, parent, hidden = 0;
	for i, entry in next, ACHIEVEMENTUI_CATEGORIES do
		if ( entry.id == category ) then
			parent = entry.parent;
		end
	end

	for i, entry in next, ACHIEVEMENTUI_CATEGORIES do
		if ( entry.id == parent ) then
			entry.collapsed = false;
		elseif ( entry.parent == parent ) then
			entry.hidden = false;
		elseif ( entry.parent == true ) then
			entry.collapsed = true;
		elseif ( entry.parent ) then
			entry.hidden = true;
		end
	end

	Crossover_achievementFunctions.selectedCategory = category;
	CrossoverAchievementFrameCategoriesContainerScrollBar:SetValue(0);
	CrossoverAchievementFrameCategories_Update();

	local shown = false;
	local found = false;
	while ( not shown ) do
		found = false;
		for _, button in next, CrossoverAchievementFrameCategoriesContainer.buttons do
			if ( button.categoryID == category ) then
				found = true;
			end
			if ( button.categoryID == category and math.ceil(button:GetBottom()) >= math.ceil(GetSafeScrollChildBottom(CrossoverAchievementFrameAchievementsContainerScrollChild)) ) then
				shown = true;
			end
		end

		if ( not shown ) then
			local _, maxVal = CrossoverAchievementFrameCategoriesContainerScrollBar:GetMinMaxValues();
			if ( CrossoverAchievementFrameCategoriesContainerScrollBar:GetValue() == maxVal ) then
				--assert(false)
				if ( not found ) then
					return;
				else
					shown = true;
				end
			elseif CrossoverAchievementFrameCategoriesContainerScrollBar:IsVisible() then
				HybridScrollFrame_OnMouseWheel(CrossoverAchievementFrameCategoriesContainer, -1);
			else
				break;
			end
		end
	end

	local container, child, scrollBar = CrossoverAchievementFrameAchievementsContainer, CrossoverAchievementFrameAchievementsContainerScrollChild, CrossoverAchievementFrameAchievementsContainerScrollBar;
	if ( isComparison ) then
		container = CrossoverAchievementFrameComparisonContainer;
		child = CrossoverAchievementFrameComparisonContainerScrollChild;
		scrollBar = CrossoverAchievementFrameComparisonContainerScrollBar;
	end

	Crossover_achievementFunctions.clearFunc();
	scrollBar:SetValue(0);
	Crossover_achievementFunctions.updateFunc();

	local shown = false;
	local previousScrollValue;
	while ( not shown ) do
		for _, button in next, container.buttons do
			if ( button.id == id and math.ceil(button:GetTop()) >= math.ceil(GetSafeScrollChildBottom(child)) ) then
				if ( not isComparison ) then
					-- The "True" here ignores modifiers, so you don't accidentally track or link this achievement. :P
					CrossoverAchievementButton_OnClick(button, nil, nil, true);
				end

				-- We found the button!
				shown = button;
				break;
			end
		end

		local _, maxVal = scrollBar:GetMinMaxValues();
		if ( shown ) then
			-- If we can, move the achievement we're scrolling to to the top of the screen.
			local newHeight = scrollBar:GetValue() + container:GetTop() - shown:GetTop();
			newHeight = min(newHeight, maxVal);
			scrollBar:SetValue(newHeight);
		else
			local scrollValue = scrollBar:GetValue();
			if ( scrollValue == maxVal or scrollValue == previousScrollValue ) then
				--assert(false, "Failed to find achievement " .. id .. " while jumping!")
				return;
			else
				previousScrollValue = scrollValue;
				HybridScrollFrame_OnMouseWheel(container, -1);
			end
		end
	end
end

function CrossoverAchievementFrameAchievements_FindSelection()
	local _, maxVal = CrossoverAchievementFrameAchievementsContainerScrollBar:GetMinMaxValues();
	local scrollHeight = CrossoverAchievementFrameAchievementsContainer:GetHeight();
	local newHeight = 0;
	CrossoverAchievementFrameAchievementsContainerScrollBar:SetValue(0);
	while ( true ) do
		for _, button in next, CrossoverAchievementFrameAchievementsContainer.buttons do
			if ( button.selected ) then
				newHeight = CrossoverAchievementFrameAchievementsContainerScrollBar:GetValue() + CrossoverAchievementFrameAchievementsContainer:GetTop() - button:GetTop();
				newHeight = min(newHeight, maxVal);
				CrossoverAchievementFrameAchievementsContainerScrollBar:SetValue(newHeight);
				return;
			end
		end
		if ( not CrossoverAchievementFrameAchievementsContainerScrollBar:IsVisible() or CrossoverAchievementFrameAchievementsContainerScrollBar:GetValue() == maxVal ) then
			return;
		else
			newHeight = newHeight + scrollHeight;
			newHeight = min(newHeight, maxVal);
			CrossoverAchievementFrameAchievementsContainerScrollBar:SetValue(newHeight);
		end
	end
end

function CrossoverAchievementFrameAchievements_AdjustSelection()
	local selectedButton;
	-- check if selection is visible
	for _, button in next, CrossoverAchievementFrameAchievementsContainer.buttons do
		if ( button.selected ) then
			selectedButton = button;
			break;
		end
	end

	if ( not selectedButton ) then
		CrossoverAchievementFrameAchievements_FindSelection();
	else
		local newHeight;
		if ( selectedButton:GetTop() > CrossoverAchievementFrameAchievementsContainer:GetTop() ) then
			newHeight = CrossoverAchievementFrameAchievementsContainerScrollBar:GetValue() + CrossoverAchievementFrameAchievementsContainer:GetTop() - selectedButton:GetTop();
		elseif ( selectedButton:GetBottom() < CrossoverAchievementFrameAchievementsContainer:GetBottom() ) then
			if ( selectedButton:GetHeight() > CrossoverAchievementFrameAchievementsContainer:GetHeight() ) then
				newHeight = CrossoverAchievementFrameAchievementsContainerScrollBar:GetValue() + CrossoverAchievementFrameAchievementsContainer:GetTop() - selectedButton:GetTop();
			else
				newHeight = CrossoverAchievementFrameAchievementsContainerScrollBar:GetValue() + CrossoverAchievementFrameAchievementsContainer:GetBottom() - selectedButton:GetBottom();
			end
		end
		if ( newHeight ) then
			local _, maxVal = CrossoverAchievementFrameAchievementsContainerScrollBar:GetMinMaxValues();
			newHeight = min(newHeight, maxVal);
			CrossoverAchievementFrameAchievementsContainerScrollBar:SetValue(newHeight);
		end
	end
end

function CrossoverAchievementFrame_SelectSummaryStatistic (criteriaId, isComparison)
	local id = GetAchievementInfoFromCriteria(criteriaId);
	CrossoverAchievementFrame_SelectStatisticByAchievementID(id, isComparison);
end

function CrossoverAchievementFrame_SelectStatisticByAchievementID(achievementID, isComparison)
	if ( isComparison ) then
		CrossoverAchievementFrameTab_OnClick = CrossoverAchievementFrameComparisonTab_OnClick;
		CrossoverAchievementFrameComparisonStatsContainer:Show();
		CrossoverAchievementFrameComparisonSummary:Hide();
	else
		CrossoverAchievementFrameTab_OnClick = CrossoverAchievementFrameBaseTab_OnClick;
		CrossoverAchievementFrameStats:Show();
		CrossoverAchievementFrameSummary:Hide();
	end

	CrossoverAchievementFrameTab_OnClick(3);

	CrossoverAchievementFrameCategories_ClearSelection();


	local category = GetAchievementCategory(achievementID);

	local categoryIndex, parent, hidden = 0;

	local categoryIndex, parent, hidden = 0;
	for i, entry in next, ACHIEVEMENTUI_CATEGORIES do
		if ( entry.id == category ) then
			parent = entry.parent;
		end
	end

	for i, entry in next, ACHIEVEMENTUI_CATEGORIES do
		if ( entry.id == parent ) then
			entry.collapsed = false;
		elseif ( entry.parent == parent ) then
			entry.hidden = false;
		elseif ( entry.parent == true ) then
			entry.collapsed = true;
		elseif ( entry.parent ) then
			entry.hidden = true;
		end
	end

	Crossover_achievementFunctions.selectedCategory = category;
	CrossoverAchievementFrameCategories_Update();
	CrossoverAchievementFrameCategoriesContainerScrollBar:SetValue(0);

	local shown = false;
	while ( not shown ) do
		for _, button in next, CrossoverAchievementFrameCategoriesContainer.buttons do
			if ( button.categoryID == category and math.ceil(button:GetBottom()) >= math.ceil(GetSafeScrollChildBottom(CrossoverAchievementFrameAchievementsContainerScrollChild)) ) then
				shown = true;
			end
		end

		if ( not shown ) then
			local _, maxVal = CrossoverAchievementFrameCategoriesContainerScrollBar:GetMinMaxValues();
			if ( CrossoverAchievementFrameCategoriesContainerScrollBar:GetValue() == maxVal ) then
				assert(false)
			elseif CrossoverAchievementFrameCategoriesContainerScrollBar:IsVisible() then
				HybridScrollFrame_OnMouseWheel(CrossoverAchievementFrameCategoriesContainer, -1);
			else
				break;
			end
		end
	end

	local container, child, scrollBar = CrossoverAchievementFrameStatsContainer, CrossoverAchievementFrameStatsContainerScrollChild, CrossoverAchievementFrameStatsContainerScrollBar;
	if ( isComparison ) then
		container = CrossoverAchievementFrameComparisonStatsContainer;
		child = CrossoverAchievementFrameComparisonStatsContainerScrollChild;
		scrollBar = CrossoverAchievementFrameComparisonStatsContainerScrollBar;
	end

	Crossover_achievementFunctions.updateFunc();
	scrollBar:SetValue(0);

	local shown = false;
	while ( not shown ) do
		for _, button in next, container.buttons do
			if ( button.id == achievementID and math.ceil(button:GetBottom()) >= math.ceil(GetSafeScrollChildBottom(child)) ) then
				if ( not isComparison ) then
					CrossoverAchievementStatButton_OnClick(button);
				end

				-- We found the button! MAKE IT SHOWN ZOMG!
				shown = button;
			end
		end

		if ( shown and scrollBar:IsShown() ) then
			-- If we can, move the achievement we're scrolling to to the top of the screen.
			scrollBar:SetValue(scrollBar:GetValue() + container:GetTop() - shown:GetTop());
		elseif ( not shown ) then
			local _, maxVal = scrollBar:GetMinMaxValues();
			if ( scrollBar:GetValue() == maxVal ) then
				assert(false)
			elseif scrollBar:IsVisible() then
				HybridScrollFrame_OnMouseWheel(container, -1);
			else
				break;
			end
		end
	end
end

function CrossoverAchievementFrameComparison_OnLoad (self)
	CrossoverAchievementFrameComparisonContainer_OnLoad(self);
	CrossoverAchievementFrameComparisonStatsContainer_OnLoad(self);
	self:RegisterEvent("ACHIEVEMENT_EARNED");
	self:RegisterEvent("INSPECT_ACHIEVEMENT_READY");
	self:RegisterEvent("UNIT_PORTRAIT_UPDATE");
	self:RegisterEvent("PORTRAITS_UPDATED");
	self:RegisterEvent("DISPLAY_SIZE_CHANGED");
end

function CrossoverAchievementFrameComparisonContainer_OnLoad (parent)
	CrossoverAchievementFrameComparisonContainerScrollBar.Show =
		function (self)
			CrossoverAchievementFrameComparison:SetWidth(626);
			CrossoverAchievementFrameComparisonSummaryPlayer:SetWidth(498);
			for _, button in next, CrossoverAchievementFrameComparisonContainer.buttons do
				button:SetWidth(616);
				button.player:SetWidth(498);
			end
			getmetatable(self).__index.Show(self);
		end

	CrossoverAchievementFrameComparisonContainerScrollBar.Hide =
		function (self)
			CrossoverAchievementFrameComparison:SetWidth(650);
			CrossoverAchievementFrameComparisonSummaryPlayer:SetWidth(522);
			for _, button in next, CrossoverAchievementFrameComparisonContainer.buttons do
				button:SetWidth(640);
				button.player:SetWidth(522);
			end
			getmetatable(self).__index.Hide(self);
		end

	CrossoverAchievementFrameComparisonContainerScrollBarBG:Show();
	CrossoverAchievementFrameComparisonContainer.update = CrossoverAchievementFrameComparison_Update;
	HybridScrollFrame_CreateButtons(CrossoverAchievementFrameComparisonContainer, "CrossoverComparisonTemplate", 0, -2);
end

function CrossoverAchievementFrameComparisonStatsContainer_OnLoad (parent)
	CrossoverAchievementFrameComparisonStatsContainerScrollBar.Show =
		function (self)
			CrossoverAchievementFrameComparison:SetWidth(626);
			for _, button in next, CrossoverAchievementFrameComparisonStatsContainer.buttons do
				button:SetWidth(616);
			end
			getmetatable(self).__index.Show(self);
		end

	CrossoverAchievementFrameComparisonStatsContainerScrollBar.Hide =
		function (self)
			CrossoverAchievementFrameComparison:SetWidth(650);
			for _, button in next, CrossoverAchievementFrameComparisonStatsContainer.buttons do
				button:SetWidth(640);
			end
			getmetatable(self).__index.Hide(self);
		end

	CrossoverAchievementFrameComparisonStatsContainerScrollBarBG:Show();
	CrossoverAchievementFrameComparisonStatsContainer.update = CrossoverAchievementFrameComparison_UpdateStats;
	HybridScrollFrame_CreateButtons(CrossoverAchievementFrameComparisonStatsContainer, "CrossoverComparisonStatTemplate", 0, -2);
end

function CrossoverAchievementFrameComparison_OnShow ()
	CrossoverAchievementFrameStats:Hide();
	CrossoverAchievementFrameAchievements:Hide();
	CrossoverAchievementFrame:SetWidth(890);
	SetUIPanelAttribute(CrossoverAchievementFrame, "xOffset", 38);
	UpdateUIPanelPositions(CrossoverAchievementFrame);
	CrossoverAchievementFrame.isComparison = true;
end

function CrossoverAchievementFrameComparison_OnHide ()
	CrossoverAchievementFrame.selectedTab = nil;
	CrossoverAchievementFrame:SetWidth(768);
	SetUIPanelAttribute(CrossoverAchievementFrame, "xOffset", 80);
	UpdateUIPanelPositions(CrossoverAchievementFrame);
	CrossoverAchievementFrame.isComparison = false;
	ClearAchievementComparisonUnit();
end

function CrossoverAchievementFrameComparison_OnEvent (self, event, ...)
	if event == "INSPECT_ACHIEVEMENT_READY" then
		CrossoverAchievementFrameComparisonHeaderPoints:SetText(GetComparisonAchievementPoints());
		CrossoverAchievementFrameComparison_UpdateStatusBars(Crossover_achievementFunctions.selectedCategory)
	elseif event == "DISPLAY_SIZE_CHANGED" then
		C_AchievementInfo.SetPortraitTexture(CrossoverAchievementFrameComparisonHeaderPortrait);
	elseif event == "PORTRAITS_UPDATED" then
		C_AchievementInfo.SetPortraitTexture(CrossoverAchievementFrameComparisonHeaderPortrait);
	elseif event == "UNIT_PORTRAIT_UPDATE" then
		local updateUnit = ...;
		if UnitName(updateUnit) == CrossoverAchievementFrameComparisonHeaderName:GetText() then
			C_AchievementInfo.SetPortraitTexture(CrossoverAchievementFrameComparisonHeaderPortrait);
		end
	end

	CrossoverAchievementFrameComparison_ForceUpdate();
end

function CrossoverAchievementFrameComparison_SetUnit (unit)
	ClearAchievementComparisonUnit();
	SetAchievementComparisonUnit(unit);

	CrossoverAchievementFrameComparisonHeaderPoints:SetText(GetComparisonAchievementPoints());
	CrossoverAchievementFrameComparisonHeaderName:SetText(GetUnitName(unit));
	C_AchievementInfo.SetPortraitTexture(CrossoverAchievementFrameComparisonHeaderPortrait);
	CrossoverAchievementFrameComparisonHeaderPortrait.unit = unit;
	CrossoverAchievementFrameComparisonHeaderPortrait.race = UnitRace(unit);
	CrossoverAchievementFrameComparisonHeaderPortrait.sex = UnitSex(unit);
end

function CrossoverAchievementFrameComparison_ClearSelection ()
	-- Doesn't do anything WHEE~!
end

function CrossoverAchievementFrameComparison_ForceUpdate ()
	if ( Crossover_achievementFunctions == CROSSOVER_COMPARISON_ACHIEVEMENT_FUNCTIONS ) then
		local buttons = CrossoverAchievementFrameComparisonContainer.buttons;
		for i, button in next, buttons do
			button.id = nil;
		end

		CrossoverAchievementFrameComparison_Update();
	elseif ( Crossover_achievementFunctions == CROSSOVER_COMPARISON_STAT_FUNCTIONS ) then
		CrossoverAchievementFrameComparison_UpdateStats();
	end
end

function CrossoverAchievementFrameComparison_Update ()
	local category = Crossover_achievementFunctions.selectedCategory;
	if ( not category or category == "summary" ) then
		return;
	end
	local scrollFrame = CrossoverAchievementFrameComparisonContainer

	local offset = HybridScrollFrame_GetOffset(scrollFrame);
	local buttons = scrollFrame.buttons;
	local numAchievements, numCompleted = GetCategoryNumAchievements(category);
	local numButtons = #buttons;

	local achievementIndex;
	local buttonHeight = buttons[1]:GetHeight();
	for i = 1, numButtons do
		achievementIndex = i + offset;
		CrossoverAchievementFrameComparison_DisplayAchievement(buttons[i], category, achievementIndex);
	end

	HybridScrollFrame_Update(scrollFrame, buttonHeight*numAchievements, buttonHeight*numButtons);
end

ACHIEVEMENTCOMPARISON_PLAYERSHIELDFONT1 = GameFontNormal;
ACHIEVEMENTCOMPARISON_PLAYERSHIELDFONT2 = GameFontNormalSmall;
ACHIEVEMENTCOMPARISON_FRIENDSHIELDFONT1 = GameFontNormalSmall;
ACHIEVEMENTCOMPARISON_FRIENDSHIELDFONT2 = GameFontNormalSmall;

function CrossoverAchievementFrameComparison_DisplayAchievement (button, category, index)
	local id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuild, wasEarnedByMe, earnedBy = GetAchievementInfo(category, index);
	if ( not id ) then
		button:Hide();
		return;
	else
		button:Show();
	end

	if ( GetPreviousAchievement(id) ) then
		-- If this is a progressive achievement, show the total score.
		points = CrossoverAchievementButton_GetProgressivePoints(id);
	end

	if ( button.id ~= id ) then
		button.id = id;

		local player = button.player;
		local friend = button.friend;

		local saturatedStyle = "normal";
		if ( bit.band(flags, ACHIEVEMENT_FLAGS_ACCOUNT) == ACHIEVEMENT_FLAGS_ACCOUNT ) then
			player.accountWide = true;
			friend.accountWide = true;
			saturatedStyle = "account";
		else
			player.accountWide = nil;
			friend.accountWide = nil;
		end

		local friendCompleted, friendMonth, friendDay, friendYear = GetAchievementComparisonInfo(id);
		player.label:SetText(name);

		player.description:SetText(description);

		player.icon.texture:SetTexture(icon);
		friend.icon.texture:SetTexture(icon);

		if ( points > 0 ) then
			player.shield.icon:SetTexture([[Interface\Addons\CrossoverAchievements\Textures\UI-Achievement-Shields]]);
			friend.shield.icon:SetTexture([[Interface\Addons\CrossoverAchievements\Textures\UI-Achievement-Shields]]);
		else
			player.shield.icon:SetTexture([[Interface\Addons\CrossoverAchievements\Textures\UI-Achievement-Shields-NoPoints]]);
			friend.shield.icon:SetTexture([[Interface\Addons\CrossoverAchievements\Textures\UI-Achievement-Shields-NoPoints]]);
		end
		CrossoverAchievementShield_SetPoints(points, player.shield.points, ACHIEVEMENTCOMPARISON_PLAYERSHIELDFONT1, ACHIEVEMENTCOMPARISON_PLAYERSHIELDFONT2);
		CrossoverAchievementShield_SetPoints(points, friend.shield.points, ACHIEVEMENTCOMPARISON_FRIENDSHIELDFONT1, ACHIEVEMENTCOMPARISON_FRIENDSHIELDFONT2);

		player.shield.wasEarnedByMe = not (completed and not wasEarnedByMe);
		player.shield.earnedBy = earnedBy;

		if ( completed ) then
			player.completed = true;
			player.dateCompleted:SetText(FormatShortDate(day, month, year));
			player.dateCompleted:Show();
			if ( player.saturatedStyle ~= saturatedStyle ) then
				player:Saturate();
			end
		else
			player.completed = nil;
			player.dateCompleted:Hide();
			player:Desaturate();
		end

		if ( friendCompleted ) then
			friend.completed = true;
			friend.status:SetText(FormatShortDate(friendDay, friendMonth, friendYear));
			if ( friend.saturatedStyle ~= saturatedStyle ) then
				friend:Saturate();
			end
		else
			friend.completed = nil;
			friend.status:SetText(INCOMPLETE);
			friend:Desaturate();
		end
	end
end

function CrossoverAchievementFrameComparison_UpdateStats ()
	local category = Crossover_achievementFunctions.selectedCategory;
	local scrollFrame = CrossoverAchievementFrameComparisonStatsContainer;
	local offset = HybridScrollFrame_GetOffset(scrollFrame);
	local buttons = scrollFrame.buttons;
	local numButtons = #buttons;
	local headerHeight = 24;
	local statHeight = 24;
	local totalHeight = 0;
	local numStats, numCompleted = GetCategoryNumAchievements(category);

	local categories = ACHIEVEMENTUI_CATEGORIES;
	-- clear out table
	if ( Crossover_achievementFunctions.lastCategory ~= category ) then
		local statCat;
		for i in next, displayStatCategories do
			displayStatCategories[i] = nil;
		end
		-- build a list of shown category and stat id's

		tinsert(displayStatCategories, {id = category, header = true});
		totalHeight = totalHeight+headerHeight;

		for i=1, numStats do
			tinsert(displayStatCategories, {id = GetAchievementInfo(category, i)});
			totalHeight = totalHeight+statHeight;
		end
		Crossover_achievementFunctions.lastCategory = category;
		Crossover_achievementFunctions.lastHeight = totalHeight;
	else
		totalHeight = Crossover_achievementFunctions.lastHeight;
	end

	-- add all the subcategories and their stat id's
	for i, cat in next, categories do
		if ( cat.parent == category ) then
			tinsert(displayStatCategories, {id = cat.id, header = true});
			totalHeight = totalHeight+headerHeight;
			numStats = GetCategoryNumAchievements(cat.id);
			for k=1, numStats do
				tinsert(displayStatCategories, {id = GetAchievementInfo(cat.id, k)});
				totalHeight = totalHeight+statHeight;
			end
		end
	end

	-- iterate through the displayStatCategories and display them
	local statCount = #displayStatCategories;
	local statIndex, id, button;
	local stat;
	local displayedHeight = 0;
	for i = 1, numButtons do
		button = buttons[i];
		statIndex = offset + i;
		if ( statIndex <= statCount ) then
			stat = displayStatCategories[statIndex];
			if ( stat.header ) then
				CrossoverAchievementFrameComparisonStats_SetHeader(button, stat.id);
			else
				CrossoverAchievementFrameComparisonStats_SetStat(button, stat.id, nil, statIndex);
			end
			button:Show();
		else
			button:Hide();
		end
		displayedHeight = displayedHeight+button:GetHeight();
	end
	HybridScrollFrame_Update(scrollFrame, totalHeight, displayedHeight);
end

function CrossoverAchievementFrameComparisonStat_OnLoad (self)
	self.value:SetVertexColor(1, 0.97, 0.6);
	self.friendValue:SetVertexColor(1, 0.97, 0.6);
end

function CrossoverAchievementFrameComparisonStats_SetStat (button, category, index, colorIndex, isSummary)
--Remove these variables when we know for sure we don't need them
	local id, name, points, completed, month, day, year, description, flags, icon;
	if ( not isSummary ) then
		if ( not index ) then
			id, name, points, completed, month, day, year, description, flags, icon = GetAchievementInfo(category);
		else
			id, name, points, completed, month, day, year, description, flags, icon = GetAchievementInfo(category, index);
		end

	else
		-- This is on the summary page
		id, name, points, completed, month, day, year, description, flags, icon = GetAchievementInfoFromCriteria(category);
	end

	button.id = id;

	if ( not colorIndex ) then
		if ( not index ) then
			message("Error, need a color index or index");
		end
		colorIndex = index;
	end

	button.background:Show();
	-- Color every other line yellow
	if ( mod(colorIndex, 2) == 1 ) then
		button.background:SetTexCoord(0, 1, 0.1875, 0.3671875);
		button.background:SetBlendMode("BLEND");
		button.background:SetAlpha(1.0);
		button:SetHeight(24);
	else
		button.background:SetTexCoord(0, 1, 0.375, 0.5390625);
		button.background:SetBlendMode("ADD");
		button.background:SetAlpha(0.5);
		button:SetHeight(24);
	end

	-- Figure out the criteria
	local numCriteria = GetAchievementNumCriteria(id);
	if ( numCriteria == 0 ) then
		-- This is no good!
	end
	-- Just show the first criteria for now
	local criteriaString, criteriaType, completed, quantityNumber, reqQuantity, charName, flags, assetID, quantity, friendQuantity;
	if ( not isSummary ) then
		friendQuantity = GetComparisonStatistic(id);
		quantity = GetStatistic(id);
	else
		criteriaString, criteriaType, completed, quantityNumber, reqQuantity, charName, flags, assetID, quantity = GetAchievementCriteriaInfo(category);
	end
	if ( not quantity ) then
		quantity = "--";
	end
	if ( not friendQuantity ) then
		friendQuantity = "--";
	end

	button.value:SetText(quantity);

	-- We're gonna use button.text here to measure string width for friendQuantity. This saves us many strings!
	button.text:SetText(friendQuantity);
	local width = button.text:GetStringWidth();
	if ( width > button.friendValue:GetWidth() ) then
		button.friendValue:SetFontObject("AchievementFont_Small");
		button.mouseover:Show();
		button.mouseover.tooltip = friendQuantity;
	else
		button.friendValue:SetFontObject("GameFontHighlightRight");
		button.mouseover:Hide();
		button.mouseover.tooltip = nil;
	end

	button.text:SetText(name);
	button.friendValue:SetText(friendQuantity);


	-- Hide the header images
	button.title:Hide();
	button.left:Hide();
	button.middle:Hide();
	button.right:Hide();
	button.left2:Hide();
	button.middle2:Hide();
	button.right2:Hide();
	button.isHeader = false;
end

function CrossoverAchievementFrameComparisonStats_SetHeader(button, id)
	-- show header
	button.left:Show();
	button.middle:Show();
	button.right:Show();
	button.left2:Show();
	button.middle2:Show();
	button.right2:Show();
	button.title:SetText(GetCategoryInfo(id));
	button.title:Show();
	button.friendValue:SetText("");
	button.value:SetText("");
	button.text:SetText("");
	button:SetHeight(24);
	button.background:Hide();
	button.isHeader = true;
	button.id = id;
end

function CrossoverAchievementComparisonPlayerButton_Saturate (self)
	local name = self:GetName();
	if ( IN_GUILD_VIEW ) then
		self.background:SetTexture("Interface\\AchievementFrame\\UI-GuildAchievement-Parchment-Horizontal");
		self.titleBar:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Borders");
		self.titleBar:SetTexCoord(0, 1, 0.83203125, 0.91015625);
		self:SetBackdropBorderColor(ACHIEVEMENT_RED_BORDER_COLOR:GetRGB());
		self.shield.points:SetVertexColor(0, 1, 0);
		self.saturatedStyle = "guild";
	else
		self.background:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Parchment-Horizontal");
		self.shield.points:SetVertexColor(1, 1, 1);
		if ( self.accountWide ) then
			self.titleBar:SetTexture("Interface\\AchievementFrame\\AccountLevel-AchievementHeader");
			self.titleBar:SetTexCoord(0, 1, 0, 0.375);
			self:SetBackdropBorderColor(ACHIEVEMENT_BLUE_BORDER_COLOR:GetRGB());
			self.saturatedStyle = "account";
		else
			self.titleBar:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Borders");
			self.titleBar:SetTexCoord(0, 1, 0.66015625, 0.73828125);
			self:SetBackdropBorderColor(ACHIEVEMENT_RED_BORDER_COLOR:GetRGB());
			self.saturatedStyle = "normal";
		end
	end
	if ( self.isSummary ) then
		if ( self.accountWide ) then
			self.titleBar:SetAlpha(1);
		else
			self.titleBar:SetAlpha(0.5);
		end
	end
	self.glow:SetVertexColor(1.0, 1.0, 1.0);
	self.icon:Saturate();
	self.shield:Saturate();
	self.label:SetVertexColor(1, 1, 1);
	self.description:SetTextColor(0, 0, 0, 1);
	self.description:SetShadowOffset(0, 0);
end

function CrossoverAchievementComparisonPlayerButton_Desaturate (self)
	self.saturatedStyle = nil;
	local name = self:GetName();
	if ( IN_GUILD_VIEW ) then
		self.background:SetTexture("Interface\\AchievementFrame\\UI-GuildAchievement-Parchment-Horizontal-Desaturated");
		self.titleBar:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Borders");
		self.titleBar:SetTexCoord(0, 1, 0.74609375, 0.82421875);
	else
		self.background:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Parchment-Horizontal-Desaturated");
		if ( self.accountWide ) then
			self.titleBar:SetTexture("Interface\\AchievementFrame\\AccountLevel-AchievementHeader");
			self.titleBar:SetTexCoord(0, 1, 0.40625, 0.78125);
		else
			self.titleBar:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Borders");
			self.titleBar:SetTexCoord(0, 1, 0.91796875, 0.99609375);
		end
	end
	if ( self.isSummary ) then
		if ( self.accountWide ) then
			self.titleBar:SetAlpha(1);
		else
			self.titleBar:SetAlpha(0.5);
		end
	end
	self.glow:SetVertexColor(.22, .17, .13);
	self.icon:Desaturate();
	self.shield:Desaturate();
	self.shield.points:SetVertexColor(.65, .65, .65);
	self.label:SetVertexColor(.65, .65, .65);
	self.description:SetTextColor(1, 1, 1, 1);
	self.description:SetShadowOffset(1, -1);
	self:SetBackdropBorderColor(.5, .5, .5);
end

function CrossoverAchievementComparisonPlayerButton_OnLoad (self)
	self.Saturate = CrossoverAchievementComparisonPlayerButton_Saturate;
	self.Desaturate = CrossoverAchievementComparisonPlayerButton_Desaturate;

	self:Desaturate();

	-- CrossoverAchievementFrameComparison.buttons = CrossoverAchievementFrameComparison.buttons or {};
	-- tinsert(CrossoverAchievementFrameComparison.buttons, self);
end

function CrossoverAchievementComparisonFriendButton_Saturate (self)
	if ( self.accountWide ) then
		self.titleBar:SetTexture("Interface\\AchievementFrame\\AccountLevel-AchievementHeader");
		self.titleBar:SetTexCoord(0.3, 0.575, 0, 0.375);
		self.saturatedStyle = "account";
		self:SetBackdropBorderColor(ACHIEVEMENT_BLUE_BORDER_COLOR:GetRGB());
	else
		self.titleBar:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Borders");
		self.titleBar:SetTexCoord(0.3, 0.575, 0.66015625, 0.73828125);
		self.saturatedStyle = "normal";
		self:SetBackdropBorderColor(ACHIEVEMENT_RED_BORDER_COLOR:GetRGB());
	end
	self.background:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Parchment-Horizontal");
	self.glow:SetVertexColor(1.0, 1.0, 1.0);
	self.icon:Saturate();
	self.shield:Saturate();
	self.shield.points:SetVertexColor(1, 1, 1);
	self.status:SetVertexColor(1, .82, 0);
end

function CrossoverAchievementComparisonFriendButton_Desaturate (self)
	self.saturatedStyle = nil;
	if ( self.accountWide ) then
		self.titleBar:SetTexture("Interface\\AchievementFrame\\AccountLevel-AchievementHeader");
		self.titleBar:SetTexCoord(0.3, 0.575, 0.40625, 0.78125);
	else
		self.titleBar:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Borders");
		self.titleBar:SetTexCoord(0.3, 0.575, 0.74609375, 0.82421875);
	end
	self.background:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Parchment-Horizontal-Desaturated");
	self.glow:SetVertexColor(.22, .17, .13);
	self.icon:Desaturate();
	self.shield:Desaturate();
	self.shield.points:SetVertexColor(.65, .65, .65);
	self.status:SetVertexColor(.65, .65, .65);
	self:SetBackdropBorderColor(.5, .5, .5);
end

function CrossoverAchievementComparisonFriendButton_OnLoad (self)
	self.Saturate = CrossoverAchievementComparisonFriendButton_Saturate;
	self.Desaturate = CrossoverAchievementComparisonFriendButton_Desaturate;

	self:Desaturate();
end

function CrossoverAchievementFrame_IsComparison()
	return CrossoverAchievementFrame.isComparison;
end

function CrossoverAchievementFrame_IsFeatOfStrength()
	if ( ( CrossoverAchievementFrame.selectedTab == 1 or CrossoverAchievementFrame.selectedTab == 2 ) and Crossover_achievementFunctions.selectedCategory == displayCategories[#displayCategories].id ) then
		return true;
	end
	return false;
end

CROSSOVER_ACHIEVEMENT_FUNCTIONS = {
	categoryAccessor = GetCategoryList,
	clearFunc = CrossoverAchievementFrameAchievements_ClearSelection,
	updateFunc = CrossoverAchievementFrameAchievements_Update,
	selectedCategory = "summary";
}

CROSSOVER_GUILD_ACHIEVEMENT_FUNCTIONS = {
	categoryAccessor = GetGuildCategoryList,
	clearFunc = CrossoverAchievementFrameAchievements_ClearSelection,
	updateFunc = CrossoverAchievementFrameAchievements_Update,
	selectedCategory = "summary";
}

CROSSOVER_STAT_FUNCTIONS = {
	categoryAccessor = GetStatisticsCategoryList,
	clearFunc = nil,
	updateFunc = CrossoverAchievementFrameStats_Update,
	selectedCategory = 130;
	noSummary = true;
}

CROSSOVER_COMPARISON_ACHIEVEMENT_FUNCTIONS = {
	categoryAccessor = GetCategoryList,
	clearFunc = CrossoverAchievementFrameComparison_ClearSelection,
	updateFunc = CrossoverAchievementFrameComparison_Update,
	selectedCategory = -1,
}

CROSSOVER_COMPARISON_STAT_FUNCTIONS = {
	categoryAccessor = GetStatisticsCategoryList,
	clearFunc = CrossoverAchievementFrameComparison_ClearSelection,
	updateFunc = CrossoverAchievementFrameComparison_UpdateStats,
	selectedCategory = -2,
}

Crossover_achievementFunctions = CROSSOVER_ACHIEVEMENT_FUNCTIONS;


CROSSOVER_ACHIEVEMENT_TEXTURES_TO_LOAD = {
	{
		name="AchievementFrameAchievementsBackground",
		file="Interface\\AchievementFrame\\UI-Achievement-AchievementBackground",
	},
	{
		name="AchievementFrameSummaryBackground",
		file="Interface\\AchievementFrame\\UI-Achievement-AchievementBackground",
	},
	{
		name="AchievementFrameComparisonBackground",
		file="Interface\\AchievementFrame\\UI-Achievement-AchievementBackground",
	},
	{
		name="AchievementFrameCategoriesBG",
		file="Interface\\AchievementFrame\\UI-Achievement-Parchment",
	},
	{
		name="AchievementFrameWaterMark",
	},
	{
		name="AchievementFrameHeaderLeft",
		file="Interface\\AchievementFrame\\UI-Achievement-Header",
	},
	{
		name="AchievementFrameHeaderRight",
		file="Interface\\AchievementFrame\\UI-Achievement-Header",
	},
	{
		name="AchievementFrameHeaderPointBorder",
		file="Interface\\AchievementFrame\\UI-Achievement-Header",
	},
	{
		name="AchievementFrameComparisonWatermark",
		file="Interface\\AchievementFrame\\UI-Achievement-StatsComparisonBackground",
	},
}

function CrossoverAchievementFrame_ClearTextures()
	for k, v in pairs(CROSSOVER_ACHIEVEMENT_TEXTURES_TO_LOAD) do
		_G[v.name]:SetTexture(nil);
	end
end

function CrossoverAchievementFrame_LoadTextures()
	for k, v in pairs(CROSSOVER_ACHIEVEMENT_TEXTURES_TO_LOAD) do
		if ( v.file ) then
			_G[v.name]:SetTexture(v.file);
		end
	end
end

--
-- Guild Members Display
--

function CrossoverAchievementMeta_OnEnter(self)
	if ( self.date ) then
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
		GameTooltip:AddLine(string.format(ACHIEVEMENT_META_COMPLETED_DATE, self.date), 1, 1, true);
		CrossoverAchievementFrameAchievements_CheckGuildMembersTooltip(self);
		GameTooltip:Show();
	end
end

function CrossoverAchievementMeta_OnLeave(self)
	GameTooltip:Hide();
	guildMemberRequestFrame = nil;
end

function CrossoverAchievementShield_OnEnter(self)
	local parent = self:GetParent();
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
	if ( parent.accountWide ) then
		if ( parent.completed ) then
			GameTooltip:AddLine(ACCOUNT_WIDE_ACHIEVEMENT_COMPLETED);
		else
			GameTooltip:AddLine(ACCOUNT_WIDE_ACHIEVEMENT);
		end
		GameTooltip:Show();
		return;
	end
	if ( self.earnedBy ) then
		GameTooltip:AddLine(format(ACHIEVEMENT_EARNED_BY,self.earnedBy));
		local me = UnitName("player")
		if ( not self.wasEarnedByMe ) then
			GameTooltip:AddLine(format(ACHIEVEMENT_NOT_COMPLETED_BY, me));
		elseif ( me ~= self.earnedBy ) then
			GameTooltip:AddLine(format(ACHIEVEMENT_COMPLETED_BY, me));
		end
		GameTooltip:Show();
		return;
	end
	-- pass-through to the achievement button
	local func = parent:GetScript("OnEnter");
	if ( func ) then
		func(parent);
	end

	CrossoverAchievementFrameAchievements_CheckGuildMembersTooltip(self);
	GameTooltip:Show();
end

function CrossoverAchievementShield_OnLeave(self)
	-- pass-through to the achievement button
	local parent = self:GetParent();
	local func = parent:GetScript("OnLeave");
	if ( func ) then
		func(parent);
	end
	GameTooltip:Hide();
	guildMemberRequestFrame = nil;
end


function CrossoverAchievementFrameFilterDropDown_OnEnter(self)
	local currentFilter = CrossoverAchievementFrameFilterDropDown.value;
	GameTooltip:SetOwner(CrossoverAchievementFrameFilterDropDown, "ANCHOR_RIGHT", -18, 0);
	GameTooltip:AddLine(CrossoverAchievementFrameFilterStrings[currentFilter]);
	GameTooltip:Show();
end

function CrossoverAchievementFrameAchievements_CheckGuildMembersTooltip(requestFrame)
	if ( IN_GUILD_VIEW ) then
		local achievementId = requestFrame.id;
		local _, achievementName, points, achievementCompleted, month, day, year, description, flags, iconpath = GetAchievementInfo(achievementId);
		-- check if achievement has names, only if completed
		if ( achievementCompleted and bit.band(flags, ACHIEVEMENT_FLAGS_SHOW_GUILD_MEMBERS) == ACHIEVEMENT_FLAGS_SHOW_GUILD_MEMBERS ) then
			local numMembers = GetGuildAchievementNumMembers(achievementId);
			if ( numMembers == 0 ) then
				-- we may not have the members from the server yet
				guildMemberRequestFrame = requestFrame;
				GetGuildAchievementMembers(achievementId);
			else
				-- add a line break if the tooltip shows completed date (meta tooltip)
				if ( GameTooltip:NumLines() > 0 ) then
					GameTooltip:AddLine(" ");
				end
				GameTooltip:AddLine(GUILD_ACHIEVEMENT_EARNED_BY, 1, 1, 1);
				local leftMemberName;
				for i = 1, numMembers do
					if ( leftMemberName ) then
						GameTooltip:AddDoubleLine(leftMemberName, GetGuildAchievementMemberInfo(achievementId, i));
						leftMemberName = nil;
					else
						leftMemberName = GetGuildAchievementMemberInfo(achievementId, i);
					end
				end
				-- check for leftover name
				if ( leftMemberName ) then
					GameTooltip:AddLine(leftMemberName);
				end
			end
		-- otherwise check if criteria has names
		elseif ( bit.band(flags, ACHIEVEMENT_FLAGS_SHOW_CRITERIA_MEMBERS) == ACHIEVEMENT_FLAGS_SHOW_CRITERIA_MEMBERS ) then
			local numCriteria = GetAchievementNumCriteria(achievementId);
			local firstName = true;
			for i = 1, numCriteria do
				local criteriaString, _, completed, _, _, charName = GetAchievementCriteriaInfo(achievementId, i);
				if ( completed and charName ) then
					if ( firstName ) then
						if ( achievementCompleted ) then
							GameTooltip:AddLine(GUILD_ACHIEVEMENT_EARNED_BY, 1, 1, 1);
						else
							GameTooltip:AddLine(INCOMPLETE, 1, 1, 1);
						end
						firstName = false;
					end
					GameTooltip:AddDoubleLine(criteriaString, charName, 0, 1, 0);
				end
			end
		end
	end
end

-- If this achievement is part of a chain, find the first incomplete achievement in the chain.
function CrossoverAchievementFrame_FindDisplayedAchievement(baseAchievementID)
	local id = baseAchievementID;
	local _, _, _, completed = GetAchievementInfo(id);
	if ( not completed and GetPreviousAchievement(id) ) then
		local prevID = GetPreviousAchievement(id);
		_, _, _, completed = GetAchievementInfo(prevID);
		while ( prevID and not completed ) do
			id = prevID;
			prevID = GetPreviousAchievement(id);
			if ( prevID ) then
				_, _, _, completed = GetAchievementInfo(prevID);
			end
		end
	elseif ( completed ) then
		local nextID, completed = GetNextAchievement(id);
		if ( nextID and completed ) then
			local newID
			while ( nextID and completed ) do
				newID, completed = GetNextAchievement(nextID);
				if ( completed ) then
					nextID = newID;
				end
			end
			id = nextID;
		end
	end

	return id;
end

function CrossoverAchievementFrame_HideSearchPreview()
	local searchPreviewContainer = CrossoverAchievementFrame.searchPreviewContainer;
	local searchPreviews = searchPreviewContainer.searchPreviews;
	searchPreviewContainer:Hide();

	for index = 1, ACHIEVEMENT_FRAME_NUM_SEARCH_PREVIEWS do
		searchPreviews[index]:Hide();
	end

	searchPreviewContainer.showAllSearchResults:Hide();
	CrossoverAchievementFrame.searchProgressBar:Hide();
end

function CrossoverAchievementFrame_UpdateSearchPreview()
	if ( not CrossoverAchievementFrame.searchBox:HasFocus() or strlen(CrossoverAchievementFrame.searchBox:GetText()) < MIN_CHARACTER_SEARCH) then
		CrossoverAchievementFrame_HideSearchPreview();
		return;
	end

	CrossoverAchievementFrame.searchBox.searchPreviewUpdateDelay = 0;

	if ( CrossoverAchievementFrame.searchBox:GetScript("OnUpdate") == nil ) then
		CrossoverAchievementFrame.searchBox:SetScript("OnUpdate", CrossoverAchievementFrameSearchBox_OnUpdate);
	end
end

-- There is a delay before the search is updated to avoid a search progress bar if the search
-- completes within the grace period.
local ACHIEVEMENT_SEARCH_PREVIEW_UPDATE_DELAY = 0.3;
function CrossoverAchievementFrameSearchBox_OnUpdate (self, elapsed)
	if ( self.fullSearchFinished ) then
		CrossoverAchievementFrame_ShowSearchPreviewResults();
		self.searchPreviewUpdateDelay = 0;
		self:SetScript("OnUpdate", nil);
		return;
	end

	self.searchPreviewUpdateDelay = self.searchPreviewUpdateDelay + elapsed;

	if ( self.searchPreviewUpdateDelay > ACHIEVEMENT_SEARCH_PREVIEW_UPDATE_DELAY ) then
		self.searchPreviewUpdateDelay = 0;
		self:SetScript("OnUpdate", nil);

		if ( CrossoverAchievementFrame.searchProgressBar:GetScript("OnUpdate") == nil ) then
			CrossoverAchievementFrame.searchProgressBar:SetScript("OnUpdate", CrossoverAchievementFrameSearchProgressBar_OnUpdate);

			local searchPreviewContainer = CrossoverAchievementFrame.searchPreviewContainer;
			local searchPreviews = searchPreviewContainer.searchPreviews;
			for index = 1, ACHIEVEMENT_FRAME_NUM_SEARCH_PREVIEWS do
				searchPreviews[index]:Hide();
			end

			searchPreviewContainer.showAllSearchResults:Hide();

			searchPreviewContainer.borderAnchor:SetPoint("BOTTOM", 0, -5);
			searchPreviewContainer.background:Show();
			searchPreviewContainer:Show();

			CrossoverAchievementFrame.searchProgressBar:Show();
			return;
		end
	end
end

-- If the searcher does not finish within the update delay then a search progress bar is displayed that
-- will fill until the search is finished and then display the search preview results.
function CrossoverAchievementFrameSearchProgressBar_OnUpdate(self, elapsed)
	local _, maxValue = self:GetMinMaxValues();
	local actualProgress = GetAchievementSearchProgress() / GetAchievementSearchSize() * maxValue;
	local displayedProgress = self:GetValue();

	self:SetValue(actualProgress);

	if ( self:GetValue() >= maxValue ) then
		self:SetScript("OnUpdate", nil);
		self:SetValue(0);
		CrossoverAchievementFrame_ShowSearchPreviewResults();
	end
end

function CrossoverAchievementFrame_ShowSearchPreviewResults()
	CrossoverAchievementFrame.searchProgressBar:Hide();

	local numResults = GetNumFilteredAchievements();

	if ( numResults > 0 ) then
		CrossoverAchievementFrame_SetSearchPreviewSelection(1);
	end

	local searchPreviewContainer = CrossoverAchievementFrame.searchPreviewContainer;
	local searchPreviews = searchPreviewContainer.searchPreviews;
	local lastButton;
	for index = 1, ACHIEVEMENT_FRAME_NUM_SEARCH_PREVIEWS do
		local searchPreview = searchPreviews[index];
		if ( index <= numResults ) then
			local achievementID = GetFilteredAchievementID(index);
			local _, name, _, _, _, _, _, description, _, icon, _, _, _, _ = GetAchievementInfo(achievementID);
			searchPreview.name:SetText(name);
			searchPreview.icon:SetTexture(icon);
			searchPreview.achievementID = achievementID;
			searchPreview:Show();
			lastButton = searchPreview;
		else
			searchPreview.achievementID = nil;
			searchPreview:Hide();
		end
	end

	if ( numResults > 5 ) then
		searchPreviewContainer.showAllSearchResults:Show();
		lastButton = searchPreviewContainer.showAllSearchResults;
		searchPreviewContainer.showAllSearchResults.text:SetText(string.format(ENCOUNTER_JOURNAL_SHOW_SEARCH_RESULTS, numResults));
	else
		searchPreviewContainer.showAllSearchResults:Hide();
	end

	if (lastButton) then
		searchPreviewContainer.borderAnchor:SetPoint("BOTTOM", lastButton, "BOTTOM", 0, -5);
		searchPreviewContainer.background:Hide();
		searchPreviewContainer:Show();
	else
		searchPreviewContainer:Hide();
	end
end

function CrossoverAchievementFrameSearchBox_OnTextChanged(self)
	SearchBoxTemplate_OnTextChanged(self);

	if ( strlen(self:GetText()) >= MIN_CHARACTER_SEARCH ) then
		CrossoverAchievementFrame.searchBox.fullSearchFinished = SetAchievementSearchString(self:GetText());
		if ( not CrossoverAchievementFrame.searchBox.fullSearchFinished ) then
			CrossoverAchievementFrame_UpdateSearchPreview();
		else
			CrossoverAchievementFrame_ShowSearchPreviewResults();
		end
	else
		CrossoverAchievementFrame_HideSearchPreview();
	end
end

function CrossoverAchievementFrameSearchBox_OnLoad(self)
	SearchBoxTemplate_OnLoad(self);
	self.HasStickyFocus = function()
		local ancestry = self:GetParent().searchPreviewContainer;
		return DoesAncestryInclude(ancestry, GetMouseFocus());
	end
end

function CrossoverAchievementFrameSearchBox_OnShow(self)
	self:SetFrameLevel(self:GetParent():GetFrameLevel() + 7);
	CrossoverAchievementFrame_SetSearchPreviewSelection(1);
	self.fullSearchFinished = false;
	self.searchPreviewUpdateDelay = 0;
end

function CrossoverAchievementFrameSearchBox_OnEnterPressed(self)
	-- If the search is not finished yet we have to wait to show the full search results.
	if ( not self.fullSearchFinished or strlen(self:GetText()) < MIN_CHARACTER_SEARCH ) then
		return;
	end

	local searchPreviewContainer = CrossoverAchievementFrame.searchPreviewContainer;
	if ( self.selectedIndex == ACHIEVEMENT_FRAME_SHOW_ALL_RESULTS_INDEX ) then
		if ( searchPreviewContainer.showAllSearchResults:IsShown() ) then
			searchPreviewContainer.showAllSearchResults:Click();
		end
	else
		local preview = searchPreviewContainer.searchPreviews[self.selectedIndex];
		if ( preview:IsShown() ) then
			preview:Click();
		end
	end
end

function CrossoverAchievementFrameSearchBox_OnFocusLost(self)
	SearchBoxTemplate_OnEditFocusLost(self);
	CrossoverAchievementFrame_HideSearchPreview();
end

function CrossoverAchievementFrameSearchBox_OnFocusGained(self)
	SearchBoxTemplate_OnEditFocusGained(self);
	CrossoverAchievementFrame.searchResults:Hide();
	CrossoverAchievementFrame_UpdateSearchPreview();
end

function CrossoverAchievementFrameSearchBox_OnKeyDown(self, key)
	if ( key == "UP" ) then
		CrossoverAchievementFrame_SetSearchPreviewSelection(CrossoverAchievementFrame.searchBox.selectedIndex - 1);
	elseif ( key == "DOWN" ) then
		CrossoverAchievementFrame_SetSearchPreviewSelection(CrossoverAchievementFrame.searchBox.selectedIndex + 1);
	end
end

function CrossoverAchievementFrame_SetSearchPreviewSelection(selectedIndex)
	local searchPreviewContainer = CrossoverAchievementFrame.searchPreviewContainer;
	local searchPreviews = searchPreviewContainer.searchPreviews;
	local numShown = 0;
	for index = 1, ACHIEVEMENT_FRAME_NUM_SEARCH_PREVIEWS do
		local searchPreview = searchPreviews[index];
		searchPreview.selectedTexture:Hide();

		if ( searchPreview:IsShown() ) then
			numShown = numShown + 1;
		end
	end

	if ( searchPreviewContainer.showAllSearchResults:IsShown() ) then
		numShown = numShown + 1;
	end

	searchPreviewContainer.showAllSearchResults.selectedTexture:Hide();
	
	if ( numShown <= 0 ) then
		-- Default to the first entry.
		selectedIndex = 1;
	else
		selectedIndex = (selectedIndex - 1) % numShown + 1;
	end

	CrossoverAchievementFrame.searchBox.selectedIndex = selectedIndex;

	if ( selectedIndex == ACHIEVEMENT_FRAME_SHOW_ALL_RESULTS_INDEX ) then
		searchPreviewContainer.showAllSearchResults.selectedTexture:Show();
	else
		searchPreviewContainer.searchPreviews[selectedIndex].selectedTexture:Show();
	end
end

function CrossoverAcheivementFullSearchResultsButton_OnClick(self)
	if (self.achievementID) then
		CrossoverAchievementFrame_SelectSearchItem(self.achievementID);
		CrossoverAchievementFrame.searchResults:Hide();
	end
end

function CrossoverAchievementFrame_ShowFullSearch()
	CrossoverAchievementFrame_UpdateFullSearchResults();

	if ( GetNumFilteredAchievements() == 0 ) then
		CrossoverAchievementFrame.searchResults:Hide();
		return;
	end

	CrossoverAchievementFrame_HideSearchPreview();
	CrossoverAchievementFrame.searchBox:ClearFocus();
	CrossoverAchievementFrame.searchResults:Show();
end

function CrossoverAchievementFrame_UpdateFullSearchResults()
	local numResults = GetNumFilteredAchievements();

	local scrollFrame = CrossoverAchievementFrame.searchResults.scrollFrame;
	local offset = HybridScrollFrame_GetOffset(scrollFrame);
	local results = scrollFrame.buttons;
	local result, index;

	for i = 1,#results do
		result = results[i];
		index = offset + i;
		if ( index <= numResults ) then
			local achievementID = GetFilteredAchievementID(index);
			local _, name, _, completed, _, _, _, description, _, icon, _, _, _, _ = GetAchievementInfo(achievementID);

			result.name:SetText(name);
			result.icon:SetTexture(icon);
			result.achievementID = achievementID;

			if ( completed ) then
				result.resultType:SetText(ACHIEVEMENTFRAME_FILTER_COMPLETED);
			else
				result.resultType:SetText(ACHIEVEMENTFRAME_FILTER_INCOMPLETE);
			end

			local categoryID = GetAchievementCategory(achievementID);
			local categoryName, parentCategoryID = GetCategoryInfo(categoryID);
			local path = categoryName;
			while ( not (parentCategoryID == -1) ) do
				categoryName, parentCategoryID = GetCategoryInfo(parentCategoryID);
				path = categoryName.." > "..path;
			end

			result.path:SetText(path);

			result:Show();
		else
			result:Hide();
		end
	end

	local totalHeight = numResults * 49;
	HybridScrollFrame_Update(scrollFrame, totalHeight, 270);

	CrossoverAchievementFrame.searchResults.titleText:SetText(string.format(ENCOUNTER_JOURNAL_SEARCH_RESULTS, CrossoverAchievementFrame.searchBox:GetText(), numResults));
end

function CrossoverAchievementFrame_SelectSearchItem(id)
	local isStatistic = select(15, GetAchievementInfo(id));
	if ( isStatistic ) then
		CrossoverAchievementFrame_SelectStatisticByAchievementID(id, CrossoverAchievementFrameComparison:IsShown());
	else
		CrossoverAchievementFrame_SelectAchievement(id, true, CrossoverAchievementFrameComparison:IsShown());
	end
end

function CrossoverAchievementSearchPreviewButton_OnShow(self)
	self:SetFrameLevel(self:GetParent():GetFrameLevel() + 10);
end

function CrossoverAchievementSearchPreviewButton_OnLoad(self)
	local searchPreviewContainer = CrossoverAchievementFrame.searchPreviewContainer;
	local searchPreviews = searchPreviewContainer.searchPreviews;
	for index = 1, ACHIEVEMENT_FRAME_NUM_SEARCH_PREVIEWS do
		if ( searchPreviews[index] == self ) then
			self.previewIndex = index;
			break;
		end
	end
end

function CrossoverAchievementSearchPreviewButton_OnEnter(self)
	CrossoverAchievementFrame_SetSearchPreviewSelection(self.previewIndex);
end

function CrossoverAchievementSearchPreviewButton_OnClick(self)
	if ( self.achievementID ) then
		CrossoverAchievementFrame_SelectSearchItem(self.achievementID);
		CrossoverAchievementFrame.searchResults:Hide();
		CrossoverAchievementFrame_HideSearchPreview();
		CrossoverAchievementFrame.searchBox:ClearFocus();
	end
end

function CrossoverAchievementFrameShowAllSearchResults_OnEnter()
	CrossoverAchievementFrame_SetSearchPreviewSelection(ACHIEVEMENT_FRAME_SHOW_ALL_RESULTS_INDEX);
end

function CrossoverAchievementFrame_UpdateSearch(self)
	if ( CrossoverAchievementFrame.searchResults:IsShown() ) then
		CrossoverAchievementFrame_UpdateFullSearchResults();
	else
		CrossoverAchievementFrame_UpdateSearchPreview();
	end
end