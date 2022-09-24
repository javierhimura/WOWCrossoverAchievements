local CrossoverAchievements = LibStub("AceAddon-3.0"):GetAddon("CrossoverAchievements");

local Storage = {};
CrossoverAchievements.Storage = Storage;

local playerGUID = UnitGUID("PLAYER");
local playerName = UnitName("player");
local realmName = GetRealmName();

local AccountData = {};
local ClearWTFData = false;

Storage.AddonDataVersion = 2;

function Storage:InitializeAccountData()
    CrossoverAchievements_AccountData = CrossoverAchievements_AccountData or {};
    CrossoverAchievements_AccountData.DataVersion = self.AddonDataVersion;
    local AchievementsDataType = CrossoverAchievements.Helpers.GameVersionHelper:GetAchievementsDataType();
    CrossoverAchievements_AccountData[AchievementsDataType] = CrossoverAchievements_AccountData[AchievementsDataType] or {};
    CrossoverAchievements_AccountData[AchievementsDataType].DataVersion = self.AddonDataVersion;
    CrossoverAchievements_AccountData[AchievementsDataType].Characters = CrossoverAchievements_AccountData[AchievementsDataType].Characters or {};
    if CrossoverAchievements.Helpers.GameVersionHelper:HasBlizzardAccountAchievements(AchievementsDataType)  then
        CrossoverAchievements_AccountData[AchievementsDataType].Achievements = CrossoverAchievements_AccountData[AchievementsDataType].Achievements or {};
        CrossoverAchievements_AccountData[AchievementsDataType].Total = CrossoverAchievements_AccountData[AchievementsDataType].Total or 0;
	end
    CrossoverAchievements_AccountData[AchievementsDataType].GameVersion = CrossoverAchievements.Helpers.GameVersionHelper:GetCurrentVersion();
    AccountData = CrossoverAchievements_AccountData;
end

function Storage:OnInitialize()
    if not CrossoverAchievements_AccountData then
        self:InitializeAccountData();
	    return;
	end
    local WTFDataVersion = CrossoverAchievements_AccountData.DataVersion;
    self:InitializeAccountData();
    local GameVersionTable = self:GetCurrentGameVersionTable();
    if ClearWTFData or 
	   not WTFDataVersion or
	   WTFDataVersion < self.AddonDataVersion
	then
        CrossoverAchievements_AccountData = nil;
        print('CrossoverAchievements Data found from a previous incompatible version.');
		print('You will need to login with all of your characters.');

        if not CrossoverAchievements.Helpers.GameVersionHelper:IsRetail() and
		   LoadAddOn("CrossoverAchievements - Retail") and
           CrossoverAchievements_Retail ~= nil and
		   CrossoverAchievements_WOTLK.DataVersion < self.AddonDataVersion
		then
            CrossoverAchievements_Retail = nil;
		    print('You will need to import updated achievements data from Retail');
		end

        if not CrossoverAchievements.Helpers.GameVersionHelper:IsWOTLK() and 
		   LoadAddOn("CrossoverAchievements - WOTLK") and
		   CrossoverAchievements_WOTLK ~= nil and
		   CrossoverAchievements_WOTLK.DataVersion < self.AddonDataVersion
		then
            CrossoverAchievements_WOTLK = nil;
		    print('You will need to import updated achievements data from WOTLK');
		end	
	end
    if CrossoverAchievements_AccountData == nil then
	    CrossoverAchievements_AccountData = {};
	end
    AccountData = CrossoverAchievements_AccountData;
end

function Storage:GetAccountData()
    return AccountData;
end

function Storage:GetCurrentGameVersionTable()
    return AccountData[CrossoverAchievements.Helpers.GameVersionHelper:GetAchievementsDataType()];
end

function Storage:GetGameVersionTable(GameVersion)
    return AccountData[GameVersion];
end

function Storage:GetCurrentCharacterTable()
    local CurrentGameVersionTable = self:GetCurrentGameVersionTable();
    local CharacterTable = CurrentGameVersionTable.Characters[playerGUID];
    
    if CharacterTable == nil then
        CharacterTable = {};
    	CharacterTable.Time = time();
        CharacterTable.Achievements = {};
        CharacterTable.Total = 0;
        CharacterTable.GUID = playerGUID;
        CharacterTable.Realm = realmName;
        CharacterTable.Name = playerName;
        CurrentGameVersionTable.Characters[playerGUID] = CharacterTable;
    end

    return CurrentGameVersionTable.Characters[playerGUID];
end

function Storage:ExportVersionData()
  local GameVersionTable = self:GetCurrentGameVersionTable();
  local ExportTable = {};
  ExportTable.GameVersion = GameVersionTable.GameVersion;
  ExportTable.Time = GameVersionTable.Time;
  ExportTable.Characters = GameVersionTable.Characters;
  ExportTable.DataVersion = self.AddonDataVersion;
  if CrossoverAchievements.Helpers.GameVersionHelper:HasBlizzardAccountAchievements(GameVersionTable.GameVersion) then
    ExportTable.Achievements = GameVersionTable.Achievements;
  end
  local CompressData = CrossoverAchievements.Helpers.CompressHelper:CompressEncodeData(ExportTable);
  if CrossoverAchievements.Helpers.GameVersionHelper:IsRetail() then
    if not LoadAddOn("CrossoverAchievements - Retail") then
        return;
    end
    CrossoverAchievements_Retail.DataVersion = self.AddonDataVersion;
    CrossoverAchievements_Retail.Export = CompressData;
    CrossoverAchievements_Retail.GameVersion = GameVersionTable.GameVersion;
    CrossoverAchievements_Retail.Time = GameVersionTable.Time;
  end
  if CrossoverAchievements.Helpers.GameVersionHelper:IsWOTLK() then
    if not LoadAddOn("CrossoverAchievements - WOTLK") then
        return;
    end
    CrossoverAchievements_WOTLK.DataVersion = self.AddonDataVersion;
    CrossoverAchievements_WOTLK.Export = CompressData;
    CrossoverAchievements_WOTLK.GameVersion = GameVersionTable.GameVersion;
    CrossoverAchievements_WOTLK.Time = GameVersionTable.Time;
  end
end

function Storage:ImportVersionData()
  local CompressData;
  if CrossoverAchievements.Helpers.GameVersionHelper:IsRetail() then
    if not LoadAddOn("CrossoverAchievements - WOTLK") then
        return;
    end
    if not CrossoverAchievements_WOTLK then
        return;
    end
    CompressData = CrossoverAchievements_WOTLK;
    -- Data from a newer version
    if CompressData and CompressData.DataVersion then
        if CompressData.DataVersion > self.AddonDataVersion then
            print('Please upgrade CrossoverAchievements addon to be able to Import WOTLK data');
            CrossoverAchievements_WOTLK = nil;
            return;
		end
        if CompressData.DataVersion < self.AddonDataVersion then
            print('Please Export WOTLK data with the last version of CrossoverAchievements addon');
            CrossoverAchievements_WOTLK = nil;
            return;
		end
    end
  end
  if CrossoverAchievements.Helpers.GameVersionHelper:IsWOTLK() then
    if not LoadAddOn("CrossoverAchievements - Retail") then
        return;
    end
    if not CrossoverAchievements_Retail then
        return;
    end
    CompressData = CrossoverAchievements_Retail;
    -- Data from a newer version
    if CompressData and CompressData.DataVersion then
        if CompressData.DataVersion < self.AddonDataVersion then
            print('Please upgrade CrossoverAchievements addon to be able to Import Retail data');
            CrossoverAchievements_Retail = nil;
            return;
        end
        if CompressData.DataVersion < self.AddonDataVersion then
            print('Please Export Retail data with the last version of CrossoverAchievements addon');
            CrossoverAchievements_Retail = nil;
            return;
		end
    end
  end
  -- Not data exported from the other version, or invalid data
  if not CompressData or 
     not CompressData.Export or 
     not CompressData.GameVersion or 
     not CompressData.Time or 
     not CompressData.DataVersion or 
     not CrossoverAchievements.Helpers.GameVersionHelper:CanImportData(CompressData.GameVersion) then
    return;
  end
  
  -- Data exported from the other version already processed
  if CrossoverAchievements_AccountData[CompressData.GameVersion] and 
     CrossoverAchievements_AccountData[CompressData.GameVersion].Time >= CompressData.Time then
    return;
  end
 
  local ImportData = CrossoverAchievements.Helpers.CompressHelper:DecompressDecodeData(CompressData.Export);
  -- Data exported cant be decompressed
  if not ImportData then
    return;
  end
  
  if ImportData.GameVersion ~= CompressData.GameVersion or
     ImportData.Time ~= CompressData.Time or
     ImportData.DataVersion ~= CompressData.DataVersion  then
    -- Invalid data, it should have the same information compressed and decompressed
    return;
  end
  
  if ImportData.Achievements and not CrossoverAchievements.Helpers.GameVersionHelper:HasBlizzardAccountAchievements(ImportData.GameVersion) then
    -- WOTLK Classic data can't have account achievements
    return;
  end
  
  CrossoverAchievements_AccountData[ImportData.GameVersion] = ImportData;
end
