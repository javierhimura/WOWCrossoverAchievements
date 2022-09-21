local CrossoverAchievements = LibStub("AceAddon-3.0"):GetAddon("CrossoverAchievements");

local Account = {};
CrossoverAchievements.Account = Account;

local CompletedAchievements = {};
local TotalPoints = 0;
local SaveCompletedAchievementsWTF = false;

function Account:GetCompletedAchievementInfo(AchievementID)
    return CompletedAchievements[AchievementID];
end

function Account:GetTotalPoints()
    return TotalPoints;
end

function Account:ProcessCompletedAchievement(AchievementID, AchievementTime, Account, WasEarnedByMe, WasEarnedHere, EarnedBy, Realm, GameVersion)
    if not CompletedAchievements[AchievementID] then
        CompletedAchievements[AchievementID] = { 
                                 AchievementID = AchievementID,
                                 AchievementTime = AchievementTime,
                                 Account = Account,
                                 WasEarnedByMe = WasEarnedByMe,
                                 WasEarnedHere = WasEarnedHere,
                                 EarnedBy = EarnedBy,
                                 Realm = Realm,
                                 GameVersion = GameVersion
                                 };
        TotalPoints = TotalPoints + CrossoverAchievements.Data.Achievements:GetAchievementData(AchievementID).Points;
    elseif AchievementTime <  CompletedAchievements[AchievementID].AchievementTime then -- Oldest achievement prevail
        if CompletedAchievements[AchievementID].WasEarnedByMe and not WasEarnedByMe then
            return;  -- Current Character Achievements prevail over other characters
        end
        if CompletedAchievements[AchievementID].WasEarnedHere and not WasEarnedHere then
            return;  -- Current Version Achievements prevail over other versions
        end
        CompletedAchievements[AchievementID].AchievementTime = AchievementTime;
        CompletedAchievements[AchievementID].Account = Account;
        CompletedAchievements[AchievementID].WasEarnedByMe = WasEarnedByMe;
        CompletedAchievements[AchievementID].EarnedBy = EarnedBy;
        CompletedAchievements[AchievementID].Realm = Realm;
        CompletedAchievements[AchievementID].GameVersion = GameVersion;
    end
end

function Account:ReprocessCompletedAchievements()
    CompletedAchievements = {};
    TotalPoints = 0;
    self:ProcessCompletedAchievements();
end

function Account:ProcessCompletedAchievements()
    local playerGUID = UnitGUID("player");
    local CurrentGameVersionTable = CrossoverAchievements:GetCurrentGameVersionTable();
    local CurrentCharacterTable = CurrentGameVersionTable.Characters[playerGUID];
    local GameVersionsWithAchievements = CrossoverAchievements.Helpers.GameVersionHelper.GameVersionsWithAchievements;

    -- Load account achievements from current version and achievements from current character first, they have priority
    self:ProcessCompletedAchievementsVersion(CurrentGameVersionTable, true);
    self:ProcessCompletedAchievementsCharacter(CurrentCharacterTable, true, true);

    for _,GameVersion in pairs(GameVersionsWithAchievements) do 
        local GameVersionTable = CrossoverAchievements_AccountData[GameVersion];
        local WasEarnedHere = (CurrentGameVersionTable == GameVersionTable); 
        if GameVersionTable then
            if GameVersionTable ~= CurrentGameVersionTable then
                self:ProcessCompletedAchievementsVersion(CrossoverAchievements_AccountData[GameVersion], WasEarnedHere);
			end
            for _,CharacterTable in pairs(CrossoverAchievements_AccountData[GameVersion].Characters) do 
                if CharacterTable and CharacterTable ~= CurrentCharacterTable then
                    local WasEarnedByMe = (CurrentCharacterTable == CharacterTable);
                    self:ProcessCompletedAchievementsCharacter(CharacterTable, WasEarnedByMe, WasEarnedHere );
				end
            end
        end
    end
    if SaveCompletedAchievementsWTF then
        CrossoverAchievements_AccountData.AllAchievements = CompletedAchievements;
    else
        SaveCompletedAchievementsWTF = nil;
	end
end

function Account:ProcessCompletedAchievementsVersion(GameVersionTable, WasEarnedHere)
    if GameVersionTable.Achievements then
        for AchievementID, AchievementTime in pairs(GameVersionTable.Achievements) do
            self:ProcessCompletedAchievement(AchievementID, AchievementTime, true, WasEarnedHere, WasEarnedHere, GameVersionTable.GameVersion, GameVersionTable.GameVersion);
        end
    end
end

function Account:ProcessCompletedAchievementsCharacter(CharacterTable, WasEarnedByMe, WasEarnedHere)
    if CharacterTable.Achievements then
        for AchievementID, AchievementTime in pairs(CharacterTable.Achievements) do 
            self:ProcessCompletedAchievement(AchievementID, AchievementTime, false, WasEarnedByMe, WasEarnedHere, CharacterTable.Name, CharacterTable.Realm, CharacterTable.GameVersion);
        end
    end
end