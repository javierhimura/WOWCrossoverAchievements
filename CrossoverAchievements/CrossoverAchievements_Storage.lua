local CrossoverAchievements = LibStub("AceAddon-3.0"):GetAddon("CrossoverAchievements");

local Storage = {};
CrossoverAchievements.Storage = Storage;

local playerGUID = UnitGUID("PLAYER");
local playerName = UnitName("player");
local realmName = GetRealmName();

local AccountData = {};
local ClearWTFData = false;
local DoKeepDecoded = false;
local DoCompressData = true;
local DoCompressImportData = true;
local DoCompressExportData = true;

local LoadAddOn = LoadAddOn;
if not LoadAddon then
 LoadAddOn = C_AddOns.LoadAddOn;
end

Storage.AddonDataVersion = 4;
--Storage.AddonDataVersionUpdate = 0;

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
end

function Storage:UpdateDataVersion()
    CrossoverAchievements_AccountData.DataVersion = self.AddonDataVersion;
    local GameVersionsWithAchievements = CrossoverAchievements.Helpers.GameVersionHelper.GameVersionsWithAchievements;
    for _,GameVersion in pairs(GameVersionsWithAchievements) do
        local ExportTable = {};
        local GameVersionTable = CrossoverAchievements_AccountData[GameVersion];
        if GameVersionTable ~= nil then
            ExportTable.GameVersion = GameVersionTable.GameVersion;
            ExportTable.Time = GameVersionTable.Time;
            ExportTable.Characters = GameVersionTable.Characters;
            ExportTable.Achievements = GameVersionTable.Achievements;
            ExportTable.DataVersion = self.AddonDataVersion;
            ExportTable.Export = CrossoverAchievements.Helpers.CompressHelper:CompressEncodeData(ExportTable);
            local CompressDataTable = {}
            CompressDataTable.DataVersion = self.AddonDataVersion;
            CompressDataTable.Export = ExportTable.Export;
            CompressDataTable.GameVersion = GameVersionTable.GameVersion;
            CompressDataTable.Time = ExportTable.Time;
			if DoKeepDecoded then
	            CompressDataTable.DecodedData = {};
	            CompressDataTable.DecodedData.GameVersion = GameVersionTable.GameVersion;
	            CompressDataTable.DecodedData.Time = ExportTable.Time;
	            CompressDataTable.DecodedData.Characters = GameVersionTable.Characters;
	            CompressDataTable.DecodedData.Achievements = GameVersionTable.Achievements;
	            CompressDataTable.DecodedData.DataVersion = self.AddonDataVersion;
            else
	            CompressDataTable.DecodedData = nil;
			end
            CrossoverAchievements_AccountData[GameVersion] = CompressDataTable;
		end
        --if not CrossoverAchievements.Helpers.GameVersionHelper:IsRetail() and
		--   LoadAddOn("CrossoverAchievements - Retail") and
        --   CrossoverAchievements_Retail ~= nil and
		--   CrossoverAchievements_Retail.DataVersion == self.AddonDataVersionUpdate
		--then
		--   CrossoverAchievements_Retail.DataVersion = self.AddonDataVersion;
		--end
        --
        --if not CrossoverAchievements.Helpers.GameVersionHelper:IsWOTLK() and 
		--   LoadAddOn("CrossoverAchievements - WOTLK") and
		--   CrossoverAchievements_WOTLK ~= nil and
		--   CrossoverAchievements_WOTLK.DataVersion == self.AddonDataVersionUpdate
		--then
		--   CrossoverAchievements_WOTLK.DataVersion = self.AddonDataVersion;
		--end	
        --
        --if not CrossoverAchievements.Helpers.GameVersionHelper:IsCataclysm() and 
		--   LoadAddOn("CrossoverAchievements - Cataclysm") and
		--   CrossoverAchievements_Cataclysm ~= nil and
		--   CrossoverAchievements_Cataclysm.DataVersion == self.AddonDataVersionUpdate
		--then
		--   CrossoverAchievements_Cataclysm.DataVersion = self.AddonDataVersion;
		--end	
	end
end

function Storage:CheckDataPreviousVersions()
    if not CrossoverAchievements_AccountData then
	    return true;
	end
    local WTFDataVersion = CrossoverAchievements_AccountData.DataVersion;
    if ClearWTFData or 
	   not WTFDataVersion
	   --or WTFDataVersion == self.AddonDataVersionUpdate
	then
        self:UpdateDataVersion();
	end
    
    WTFDataVersion = CrossoverAchievements_AccountData.DataVersion;
    if ClearWTFData or 
	   not WTFDataVersion or
	   WTFDataVersion < self.AddonDataVersion
	then
        CrossoverAchievements_AccountData = nil;
        print('CrossoverAchievements Data found from a previous incompatible version.');
        if CrossoverAchievements.Helpers.GameVersionHelper:IsRetail() and 
           LoadAddOn("CrossoverAchievements - Cataclysm") then
            print('You will need to export new data from Cataclysm.');
        elseif CrossoverAchievements.Helpers.GameVersionHelper:IsRetail() and 
               LoadAddOn("CrossoverAchievements - WOTLK") then
            print('You will need to export new data from WOTLK.');
        elseif not CrossoverAchievements.Helpers.GameVersionHelper:IsRetail() and 
               LoadAddOn("CrossoverAchievements - Retail") then
            print('You will need to export new data from Retail.');
        end
        
        return false;
    else
    
        if not CrossoverAchievements.Helpers.GameVersionHelper:IsRetail() and
		   LoadAddOn("CrossoverAchievements - Retail") and
           CrossoverAchievements_Retail ~= nil and
		   CrossoverAchievements_Retail.DataVersion ~= nil and
		   CrossoverAchievements_Retail.DataVersion < self.AddonDataVersion
		then
            CrossoverAchievements_Retail = nil;
		    print('You will need to import updated achievements data from Retail');
            return false;
		end

        if not CrossoverAchievements.Helpers.GameVersionHelper:IsWOTLK() and 
		   LoadAddOn("CrossoverAchievements - WOTLK") and
		   CrossoverAchievements_WOTLK ~= nil and
		   CrossoverAchievements_WOTLK.DataVersion ~= nil and
		   CrossoverAchievements_WOTLK.DataVersion < self.AddonDataVersion
		then
            CrossoverAchievements_WOTLK = nil;
		    print('You will need to import updated achievements data from WOTLK');
            return false;
		end
        
        if not CrossoverAchievements.Helpers.GameVersionHelper:IsCataclysm() and 
           LoadAddOn("CrossoverAchievements - Cataclysm") and
           CrossoverAchievements_Cataclysm ~= nil and
           CrossoverAchievements_Cataclysm.DataVersion ~= nil and
           CrossoverAchievements_Cataclysm.DataVersion < self.AddonDataVersion
        then
            CrossoverAchievements_Cataclysm = nil;
            print('You will need to import updated achievements data from Cataclysm');
            return false;
        end	
        
	end
    return true;
end

function Storage:OnInitialize()
    self:CheckDataPreviousVersions();
    self:InitializeAccountData();
    local GameVersionsWithAchievements = CrossoverAchievements.Helpers.GameVersionHelper.GameVersionsWithAchievements;
    for _,GameVersion in pairs(GameVersionsWithAchievements) do
        Storage:ImportVersionData(GameVersion);
	end
    Storage:ImportAccountData();
end

function Storage:GetAccountData()
    return AccountData;
end

function Storage:GetCurrentGameVersionTable()
    local CurrentGameVersion = CrossoverAchievements.Helpers.GameVersionHelper:GetAchievementsDataType();
    local CurrentGameVersionTable = AccountData[CurrentGameVersion];
    if CurrentGameVersionTable == nil then
        CurrentGameVersionTable = {};
	end
    if CrossoverAchievements.Helpers.GameVersionHelper:HasBlizzardAccountAchievements() then
        CurrentGameVersionTable.Achievements = CurrentGameVersionTable.Achievements or {};
	end
    CurrentGameVersionTable.Characters = CurrentGameVersionTable.Characters or {};
    CurrentGameVersionTable.Total = CurrentGameVersionTable.Total or  0;
    CurrentGameVersionTable.Time = CurrentGameVersionTable.Time or time();
    CurrentGameVersionTable.GameVersion = CurrentGameVersionTable.GameVersion or CurrentGameVersion;
	AccountData[CurrentGameVersion] = CurrentGameVersionTable;
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

function Storage:CopyVersionData(GameVersionTable, CompressData, ExportTable)
      local CrossoverAchievements_Version = {}
      CrossoverAchievements_Version.DataVersion = self.AddonDataVersion;
      CrossoverAchievements_Version.GameVersion = GameVersionTable.GameVersion;
      CrossoverAchievements_Version.Time = CrossoverAchievements_AccountData.Time;
      CrossoverAchievements_Version.AccountName = CrossoverAchievements_AccountData.AccountName;
      if DoCompressExportData then
        CrossoverAchievements_Version.Export = CompressData;
		if DoKeepDecoded then
        	CrossoverAchievements_Version.DecodedData = ExportTable;
        else
            CrossoverAchievements_Version.DecodedData = nil;
		end
      else
        CrossoverAchievements_Version.Export = ExportTable;
        CrossoverAchievements_Version.Clear = true;
      end
      return CrossoverAchievements_Version;
end

function Storage:ExportVersionData()
    local GameVersionTable = self:GetCurrentGameVersionTable();
    local ExportTable = {};
    ExportTable.GameVersion = GameVersionTable.GameVersion;
    ExportTable.Time = GameVersionTable.Time;
    ExportTable.Characters = GameVersionTable.Characters;
    ExportTable.DataVersion = self.AddonDataVersion;
    ExportTable.AccountName = CrossoverAchievements_AccountData.AccountName;
    if CrossoverAchievements.Helpers.GameVersionHelper:HasBlizzardAccountAchievements(GameVersionTable.GameVersion) then
      ExportTable.Achievements = GameVersionTable.Achievements;
    end
    local CompressData = CrossoverAchievements.Helpers.CompressHelper:CompressEncodeData(ExportTable);
    local CompressDataTable = {}
    CompressDataTable.DataVersion = self.AddonDataVersion;
    CompressDataTable.Export = CompressData;
    CompressDataTable.AccountName = CrossoverAchievements_AccountData.AccountName;
	if DoKeepDecoded then
    	CompressDataTable.DecodedData = ExportTable;
    else
        CompressDataTable.DecodedData = nil;
	end
    CompressDataTable.GameVersion = GameVersionTable.GameVersion;
    CompressDataTable.Time = ExportTable.Time;
    if not DoCompressData then
        CompressDataTable.Export = ExportTable;
        CompressDataTable.Clear = true;
    end 
    CrossoverAchievements_AccountData[GameVersionTable.GameVersion] = CompressDataTable;
    CrossoverAchievements_AccountData.DataVersion = self.AddonDataVersion;
    CrossoverAchievements_AccountData.Time = ExportTable.Time;
    if CrossoverAchievements.Helpers.GameVersionHelper:IsRetail() then
      if not LoadAddOn("CrossoverAchievements - Retail") then
          return;
      end
      CrossoverAchievements_Retail = self:CopyVersionData(GameVersionTable, CompressData, ExportTable);
    end
    if CrossoverAchievements.Helpers.GameVersionHelper:IsWOTLK() then
      if not LoadAddOn("CrossoverAchievements - WOTLK") then
          return;
      end
      CrossoverAchievements_WOTLK = self:CopyVersionData(GameVersionTable, CompressData, ExportTable);
    end
    if CrossoverAchievements.Helpers.GameVersionHelper:IsCataclysm() then
      if not LoadAddOn("CrossoverAchievements - Cataclysm") then
          return;
      end
      CrossoverAchievements_Cataclysm = self:CopyVersionData(GameVersionTable, CompressData, ExportTable);
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

function Storage:GetImportAccountData()
    local CompressData;
    local ModifyCompress = false;
    
    if not LoadAddOn("CrossoverAchievements - Account") then
        return
    end
    
    CompressData = CrossoverAchievements_OtherAccount;
    if CompressData and CompressData.DataVersion then
        if CrossoverAchievements_AccountData.AccountName == nil then
            print("Set AccountName before importing other accounts data");
            return nil;
        end
        if not DoCompressImportData and not CompressData.Clear then
            ModifyCompress = true;
        else
            --if CompressData.DataVersion == self.AddonDataVersionUpdate then
            --    CompressData.DataVersion = self.AddonDataVersion;
            --end
            if CompressData.DataVersion > self.AddonDataVersion then
                print('Please upgrade CrossoverAchievements addon to be able to Import Account data');
                CrossoverAchievements_OtherAccount = nil;
                return nil;
            end
            if CompressData.DataVersion < self.AddonDataVersion then
                print('Please Export Account data with the last version of CrossoverAchievements addon');
                CrossoverAchievements_OtherAccount = nil;
                return nil;
            end
        end
    end
    
    -- Not allow invalid data
    if not self:IsCompressDataValid(nil, CompressData) then
        return nil;
    end

    return CompressData;
end

function Storage:ClearImportVersion(ImportVersion)
    if ImportVersion == CrossoverAchievements.Helpers.GameVersionHelper.GameVersion_Retail then
        CrossoverAchievements_Retail = nil;
    elseif ImportVersion == CrossoverAchievements.Helpers.GameVersionHelper.GameVersion_ClassicWOTLK then
        CrossoverAchievements_WOTLK = nil;
    elseif ImportVersion == CrossoverAchievements.Helpers.GameVersionHelper.GameVersion_ClassicCataclysm then
        CrossoverAchievements_Cataclysm = nil;
    end
end

function Storage:GetImportVersionVariable(ImportVersion)
    if ImportVersion == CrossoverAchievements.Helpers.GameVersionHelper.GameVersion_Retail then
        return CrossoverAchievements_Retail;
    elseif ImportVersion == CrossoverAchievements.Helpers.GameVersionHelper.GameVersion_ClassicWOTLK then
        return CrossoverAchievements_WOTLK;
    elseif ImportVersion == CrossoverAchievements.Helpers.GameVersionHelper.GameVersion_ClassicCataclysm then
        return CrossoverAchievements_Cataclysm;
    end
end

function Storage:GetImportVersionAddon(ImportVersion)
    if ImportVersion == CrossoverAchievements.Helpers.GameVersionHelper.GameVersion_Retail then
        return "Retail";
    elseif ImportVersion == CrossoverAchievements.Helpers.GameVersionHelper.GameVersion_ClassicWOTLK then
        return "WOTLK";
    elseif ImportVersion == CrossoverAchievements.Helpers.GameVersionHelper.GameVersion_ClassicCataclysm then
        return "Cataclysm";
    end
end

function Storage:GetImportVersionData(ImportVersion)
    local CompressData;
    local ModifyCompress = false;
    local ImportVersionName = self:GetImportVersionAddon(ImportVersion);
    local CurrentVersionName = self:GetImportVersionAddon(CrossoverAchievements.Helpers.GameVersionHelper:GetAchievementsDataType());
    local ImportVersionVariable = self:GetImportVersionVariable(ImportVersion);
    
    if CurrentVersionName == ImportVersionName then
        return nil;
    end 
    
    if not ImportVersionName then
        print("Can't import other version game exported data ImportVersionName nil");
        return nil;
    end
    if not LoadAddOn("CrossoverAchievements - ".. ImportVersionName) then
        return nil;
    end
    if not ImportVersionVariable then
        return nil;
    end
    CompressData = ImportVersionVariable;
    -- Data from a newer version
    if CompressData and CompressData.DataVersion then
        if not DoCompressImportData and not CompressData.Clear then
            ModifyCompress = true;
        else
            if not CompressData.GameVersion then
                print('Please Export '.. ImportVersionName ..' data with the last version of CrossoverAchievements addon');
                ImportVersionVariable = nil;
                return nil;
            end
            if CompressData.GameVersion ~= ImportVersion then
                print('Please Export '.. ImportVersionName ..' data with the last version of CrossoverAchievements addon');
                ImportVersionVariable = nil;
                return nil;
            end
            --if CompressData.DataVersion == self.AddonDataVersionUpdate then
            --    CompressData.DataVersion = self.AddonDataVersion;
            --end
            if CompressData.DataVersion > self.AddonDataVersion then
                print('Please upgrade CrossoverAchievements addon to be able to Import '.. ImportVersionName ..' data');
                ImportVersionVariable = nil;
                return nil;
            end
            if CompressData.DataVersion < self.AddonDataVersion then
                print('Please Export '.. ImportVersionName ..' data with the last version of CrossoverAchievements addon');
                CrossoverAchievements_WOTLK = nil;
                return nil;
            end
        end
    end
    -- Not allow invalid data
    if not self:IsCompressDataValid(ImportVersion, CompressData) then
        return nil;
    end
    
    -- Not data exported from the same version
    if not CrossoverAchievements.Helpers.GameVersionHelper:CanImportData(CompressData.GameVersion) then
        return nil;
    end

    -- Data exported from the other version already processed
    if not ModifyCompress and 
       CrossoverAchievements_AccountData[CompressData.GameVersion] and 
       CrossoverAchievements_AccountData[CompressData.GameVersion].Time >= CompressData.Time then
        return nil;
    end

    return CompressData;
end

function Storage:ImportAccountData(ImportVersion)
    CompressData = self:GetImportAccountData(ImportVersion);

    if CompressData == nil then
        return false;
    end    

    if CompressData ~= nil and not self:DecompressAccountData(CompressData) then
        return false;
    end
    return true;
end

function Storage:ImportVersionData(ImportVersion)
    local CompressData = self:GetImportVersionData(ImportVersion);

    if CompressData == nil then
        CompressData = CrossoverAchievements_AccountData[ImportVersion];
    end    

    if CompressData ~= nil and not self:DecompressVersionData(CompressData) then
        return false;
    end
    return true;
end

function Storage:DecompressVersionData(CompressData)
    if CompressData.Clear then
        if CompressData.Export then
            AccountData[CompressData.GameVersion] = CompressData.Export;
        else
            AccountData[CompressData.GameVersion] = CompressData;
        end
        return true;
    end
    
    local ImportData = CrossoverAchievements.Helpers.CompressHelper:DecompressDecodeData(CompressData.Export);
    -- Data exported cant be decompressed
    if not ImportData or
       not ImportData.Time or
       not ImportData.DataVersion or
       not ImportData.GameVersion then
        return false;
    end

    --if ImportData.DataVersion == self.AddonDataVersionUpdate then
	--    ImportData.DataVersion = self.AddonDataVersion;
    --end
    
    if ImportData.GameVersion ~= CompressData.GameVersion  then
        if ImportData.GameVersion  == CrossoverAchievements.Helpers.GameVersionHelper.GameVersion_ClassicWOTLK and 
           CompressData.GameVersion == CrossoverAchievements.Helpers.GameVersionHelper.GameVersion_ClassicCataclysm then
           ImportData.GameVersion = CrossoverAchievements.Helpers.GameVersionHelper.GameVersion_ClassicCataclysm;
        end
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
    if not DoCompressData then
        CrossoverAchievements_AccountData[ImportData.GameVersion] = ImportData;
        CrossoverAchievements_AccountData[ImportData.GameVersion].Clear = true;
    end
    return true;
end

function Storage:MigrateClassicVersions()
    if CrossoverAchievements_AccountData and
       CrossoverAchievements_AccountData[CrossoverAchievements.Helpers.GameVersionHelper.GameVersion_ClassicWOTLK] then
       if CrossoverAchievements.Helpers.GameVersionHelper:IsCataclysm() then
           CrossoverAchievements_AccountData[CrossoverAchievements.Helpers.GameVersionHelper.GameVersion_ClassicCataclysm] = CrossoverAchievements_AccountData[CrossoverAchievements.Helpers.GameVersionHelper.GameVersion_ClassicWOTLK];
       end
       CrossoverAchievements_AccountData[CrossoverAchievements.Helpers.GameVersionHelper.GameVersion_ClassicWOTLK] = nil;
    end
end

function Storage:CopyAccountData(ImportData, Compressed)
    if ImportData == nil then
        return nil;
    end
    if not Compressed then
        ImportData = ImportData.Export;
    end

    if ImportData == nil or ImportData.Characters == nil then
        return nil;
    end
    local GameVersionsWithAchievements = CrossoverAchievements.Helpers.GameVersionHelper.GameVersionsWithAchievements;
    for _,GameVersion in pairs(GameVersionsWithAchievements) do 
        if ImportData.GameVersion == GameVersion then
            local GameVersionTable = CrossoverAchievements.Storage:GetGameVersionTable(GameVersion);
            if GameVersionTable == nil then
                return;
            end
            for _,CharacterTable in pairs(ImportData.Characters) do
				if CrossoverAchievements_AccountData.AccountName == nil or CharacterTable.AccountName == nil or CharacterTable.AccountName == CrossoverAchievements_AccountData.AccountName then
                    return nil;
				end
                GameVersionTable.Characters[CharacterTable.GUID] = CharacterTable;
            end
        end
    end
end

function Storage:DecompressAccountData(CompressData)
    if CompressData.Clear then
        Storage:CopyAccountData(CompressData, false);
        return true;
    end
    
    local ImportData = CrossoverAchievements.Helpers.CompressHelper:DecompressDecodeData(CompressData.Export);
    -- Data exported cant be decompressed
    if not ImportData or
       not ImportData.Time or
       not ImportData.DataVersion or
       not ImportData.GameVersion then
        print("Can't import other account exported data");
        return false;
    end

    --if ImportData.DataVersion == self.AddonDataVersionUpdate then
	--    ImportData.DataVersion = self.AddonDataVersion;
    --end
  
    if ImportData.GameVersion ~= CompressData.GameVersion or
       ImportData.Time ~= CompressData.Time or
       ImportData.DataVersion ~= CompressData.DataVersion  then
        print("Can't import other account exported data");
        -- Invalid data, it should have the same information compressed and decompressed
        return false;
    end
  
    if ImportData.Achievements and not CrossoverAchievements.Helpers.GameVersionHelper:HasBlizzardAccountAchievements(ImportData.GameVersion) then
        -- WOTLK Classic data can't have account achievements
        return false;
    end

    Storage:CopyAccountData(ImportData, true);
    return true;
end