local _, CrossoverAchievements = ...

local Account = {};
CrossoverAchievements.Account = Account;

local CompletedAchievements = {};
local TotalPoints = 0;

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
    local GameVersionsWithAchievements = CrossoverAchievements.GameVersion.GameVersionsWithAchievements;
    for _,GameVersion in pairs(GameVersionsWithAchievements) do 
        local GameVersionTable = CrossoverAchievements_AccountData[GameVersion];
        local WasEarnedHere = (CurrentGameVersionTable == GameVersionTable); 
        if GameVersionTable then
            self:ProcessCompletedAchievementsVersion(CrossoverAchievements_AccountData[GameVersion], WasEarnedHere);
            for _,CharacterTable in pairs(CrossoverAchievements_AccountData[GameVersion].Characters) do 
                local WasEarnedByMe = (CurrentCharacterTable == CharacterTable);
                self:ProcessCompletedAchievementsCharacter(CharacterTable, WasEarnedByMe, WasEarnedHere );
            end
        end
    end
    CrossoverAchievements_AccountData.AllAchievements = CompletedAchievements;
end

function Account:ProcessCompletedAchievementsVersion(GameVersionTable, WasEarnedHere)
    if GameVersionTable.Achievements then
        for AchievementID, AchievementTime in pairs(GameVersionTable.Achievements) do 
            self:ProcessCompletedAchievement(AchievementID, AchievementTime, true, WasEarnedHere, WasEarnedHere, nil, GameVersionTable.GameVersion);
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