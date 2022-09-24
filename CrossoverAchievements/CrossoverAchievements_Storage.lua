local CrossoverAchievements = LibStub("AceAddon-3.0"):GetAddon("CrossoverAchievements");

local Storage = {};
CrossoverAchievements.Storage = Storage;

local playerGUID = UnitGUID("PLAYER");
local playerName = UnitName("player");
local realmName = GetRealmName();

local AccountData = {};
local ClearWTFData = false;

Storage.AddonDataVersion = 3;

function Storage:InitializeAccountData()
    AccountData = {};
    AccountData.DataVersion = self.AddonDataVersion;
    local AchievementsDataType = CrossoverAchievements.Helpers.GameVersionHelper:GetAchievementsDataType();
    AccountData[AchievementsDataType] = {};
    AccountData[AchievementsDataType].DataVersion = self.AddonDataVersion;
    AccountData[AchievementsDataType].Characters = AccountData[AchievementsDataType].Characters or {};
    if CrossoverAchievements.Helpers.GameVersionHelper:HasBlizzardAccountAchievements(AchievementsDataType)  then
        AccountData[AchievementsDataType].Achievements = AccountData[AchievementsDataType].Achievements or {};
        AccountData[AchievementsDataType].Total = AccountData[AchievementsDataType].Total or 0;
	end
    AccountData[AchievementsDataType].GameVersion = CrossoverAchievements.Helpers.GameVersionHelper:GetCurrentVersion();
    if CrossoverAchievements_AccountData == nil then
        CrossoverAchievements_AccountData = {};
    end
    CrossoverAchievements_AccountData.AccountData = AccountData;
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
		   CrossoverAchievements_Retail.DataVersion ~= nil and
		   CrossoverAchievements_Retail.DataVersion < self.AddonDataVersion
		then
            CrossoverAchievements_Retail = nil;
		    print('You will need to import updated achievements data from Retail');
		end

        if not CrossoverAchievements.Helpers.GameVersionHelper:IsWOTLK() and 
		   LoadAddOn("CrossoverAchievements - WOTLK") and
		   CrossoverAchievements_WOTLK ~= nil and
		   CrossoverAchievements_WOTLK.DataVersion ~= nil and
		   CrossoverAchievements_WOTLK.DataVersion < self.AddonDataVersion
		then
            CrossoverAchievements_WOTLK = nil;
		    print('You will need to import updated achievements data from WOTLK');
		end	
        self:InitializeAccountData();
	end
    if CrossoverAchievements_AccountData == nil then
	    CrossoverAchievements_AccountData = {};
	end

    local GameVersionsWithAchievements = CrossoverAchievements.Helpers.GameVersionHelper.GameVersionsWithAchievements;
    for _,GameVersion in pairs(GameVersionsWithAchievements) do
        Storage:ImportVersionData(GameVersion);
	end
end

function Storage:GetAccountData()
    return AccountData;
end

function Storage:GetCurrentGameVersionTable()
    local CurrentGameVersion = CrossoverAchievements.Helpers.GameVersionHelper:GetAchievementsDataType();
    local CurrentGameVersionTable = AccountData[CurrentGameVersion];
    if CurrentGameVersionTable == nil then
        CurrentGameVersionTable.Achievements = {};
        CurrentGameVersionTable.Total = 0;
        CurrentGameVersionTable.Time = time();
        CurrentGameVersionTable.GameVersion = CurrentGameVersion;
	    AccountData[CurrentGameVersion] = CurrentGameVersionTable;
	end
    return CurrentGameVersionTable;
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
  local CompressDataTable = {}
  CompressDataTable.DataVersion = self.AddonDataVersion;
  CompressDataTable.Export = CompressData;
  CompressDataTable.GameVersion = GameVersionTable.GameVersion;
  CompressDataTable.Time = GameVersionTable.Time;
  CrossoverAchievements_AccountData[GameVersionTable.GameVersion] = CompressDataTable;
  CrossoverAchievements_AccountData.DataVersion = self.AddonDataVersion;
  CrossoverAchievements_AccountData.Time = time();
  if CrossoverAchievements.Helpers.GameVersionHelper:IsRetail() then
    if not LoadAddOn("CrossoverAchievements - Retail") then
        return;
    end
    CrossoverAchievements_Retail = CompressDataTable;
  end
  if CrossoverAchievements.Helpers.GameVersionHelper:IsWOTLK() then
    if not LoadAddOn("CrossoverAchievements - WOTLK") then
        return;
    end
    CrossoverAchievements_WOTLK = CompressDataTable;
  end
end

function Storage:IsCompressDataValid(GameVersion, CompressData)
    if not CompressData or 
       not CompressData.Export or 
       not CompressData.GameVersion or 
       not CompressData.Time or 
       not CompressData.DataVersion or
       CompressData.GameVersion ~= GameVersion or
       CompressData.DataVersion ~= self.AddonDataVersion then
        return false;
    end

    return true;
end

function Storage:GetImportVersionData(GameVersion)
  local CompressData;
  if CrossoverAchievements.Helpers.GameVersionHelper:IsRetail() then
    if CrossoverAchievements.Helpers.GameVersionHelper:IsRetail(GameVersion) then
        return nil;
    end 
    if not LoadAddOn("CrossoverAchievements - WOTLK") then
        return nil;
    end
    if not CrossoverAchievements_WOTLK then
        return nil;
    end
    CompressData = CrossoverAchievements_WOTLK;
    -- Data from a newer version
    if CompressData and CompressData.DataVersion then
        if CompressData.DataVersion > self.AddonDataVersion then
            print('Please upgrade CrossoverAchievements addon to be able to Import WOTLK data');
            CrossoverAchievements_WOTLK = nil;
            return nil;
		end
        if CompressData.DataVersion < self.AddonDataVersion then
            print('Please Export WOTLK data with the last version of CrossoverAchievements addon');
            CrossoverAchievements_WOTLK = nil;
            return nil;
		end
    end
  end
  if CrossoverAchievements.Helpers.GameVersionHelper:IsWOTLK() then
    if CrossoverAchievements.Helpers.GameVersionHelper:IsWOTLK(GameVersion) then
        return nil;
    end 
    if not LoadAddOn("CrossoverAchievements - Retail") then
        return nil;
    end
    if not CrossoverAchievements_Retail then
        return nil;
    end
    CompressData = CrossoverAchievements_Retail;
    -- Data from a newer version
    if CompressData and CompressData.DataVersion then
        if CompressData.DataVersion < self.AddonDataVersion then
            print('Please upgrade CrossoverAchievements addon to be able to Import Retail data');
            CrossoverAchievements_Retail = nil;
            return nil;
        end
        if CompressData.DataVersion < self.AddonDataVersion then
            print('Please Export Retail data with the last version of CrossoverAchievements addon');
            CrossoverAchievements_Retail = nil;
            return nil;
		end
    end
  end
  -- Not allow invalid data
  if not self:IsCompressDataValid(GameVersion, CompressData) then
    return nil;
  end
  -- Not data exported from the same version
  if not CrossoverAchievements.Helpers.GameVersionHelper:CanImportData(CompressData.GameVersion) then
    return nil;
  end

  -- Data exported from the other version already processed
  if CrossoverAchievements_AccountData[CompressData.GameVersion] and 
     CrossoverAchievements_AccountData[CompressData.GameVersion].Time >= CompressData.Time then
    return nil;
  end


  return CompressData;
end

function Storage:ImportVersionData(GameVersion)
  CompressData = self:GetImportVersionData(GameVersion);

  if CompressData == nil then
    CompressData = CrossoverAchievements_AccountData[GameVersion];
  end

  if CompressData ~= nil and not self:DecompressVersionData(CompressData) then
    return false;
  end
  return true;
end

function Storage:DecompressVersionData(CompressData)
  local ImportData = CrossoverAchievements.Helpers.CompressHelper:DecompressDecodeData(CompressData.Export);
  -- Data exported cant be decompressed
  if not ImportData then
    return false;
  end
  
  if ImportData.GameVersion ~= CompressData.GameVersion or
     ImportData.Time ~= CompressData.Time or
     ImportData.DataVersion ~= CompressData.DataVersion  then
    -- Invalid data, it should have the same information compressed and decompressed
    return false;
  end
  
  if ImportData.Achievements and not CrossoverAchievements.Helpers.GameVersionHelper:HasBlizzardAccountAchievements(ImportData.GameVersion) then
    -- WOTLK Classic data can't have account achievements
    return false;
  end

  CrossoverAchievements_AccountData[ImportData.GameVersion] = CompressData;
  CrossoverAchievements_AccountData.DataVersion = self.AddonDataVersion;
  CrossoverAchievements_AccountData.Time = time();
  AccountData[ImportData.GameVersion] = ImportData;
  return true;
end