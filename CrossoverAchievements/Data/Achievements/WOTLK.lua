local CrossoverAchievements = LibStub("AceAddon-3.0"):GetAddon("CrossoverAchievements");
local GameVersion_ClassicWOTLK = "Classic Wotlk";

CrossoverAchievements.Data = CrossoverAchievements.Data or {};
CrossoverAchievements.Data.Achievements = CrossoverAchievements.Data.Achievements or {};
CrossoverAchievements.Data.Achievements[GameVersion_ClassicWOTLK] = CrossoverAchievements.Data.Achievements[GameVersion_ClassicWOTLK] or {};
CrossoverAchievements.Data.Achievements[GameVersion_ClassicWOTLK].Phases = {
    EXPANSION_01_SEASON_OF_MASTERY             =  0001,
    EXPANSION_03_PHASE0_PREPATH                =  3000,
    EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH   =  3001,
    EXPANSION_03_PHASE1_RAIDS                  =  3002,
    EXPANSION_03_PHASE1_ARENA_SEASON_5_START   =  3003,
    EXPANSION_03_PHASE1_ARENA_SEASON_5_END     =  3004,
    EXPANSION_03_PHASE2_ULDUAR                 =  3100,
    EXPANSION_03_PHASE2_DEFENSE_PROTOCOL_ALPHA =  3101,
    EXPANSION_03_PHASE2_ARENA_SEASON_6_END     =  3102,
    EXPANSION_03_PHASE3_TRIAL_OF_CHAMPION      =  3200,
    EXPANSION_03_PHASE3_TRIAL_OF_CRUSADER      =  3201,
    EXPANSION_03_PHASE3_DEFENSE_PROTOCOL_BETA  =  3202,
    EXPANSION_03_PHASE3_ONYXIA_LAIR            =  3220,
    EXPANSION_03_PHASE3_ARENA_SEASON_7_END     =  3221,
    EXPANSION_03_PHASE4_ICC_DUNGEONS           =  3300,
    EXPANSION_03_PHASE4_ICC_RAID               =  3301,
    EXPANSION_03_PHASE4_DEFENSE_PROTOCOL_GAMMA =  3302,
    EXPANSION_03_PHASE4_RFD                    =  3303,
    EXPANSION_03_PHASE5_RUBY_SANCTUM           =  3350,
    EXPANSION_03_PHASE6_GNOMETROLL_EVENT       =  3351,
    EXPANSION_03_PHASE6_ARENA_SEASON_8_END     =  3352,
    UNRELEASED_PROMOTIONS                      = 99999,
};
-- ClassicOnly Achievement added in WOTLK Classic never available in Retail, not even in OG WOTLK
-- Merged Achievement with different version for Alliance and Horde but was merged in a given expansion into a single achievement
-- MergeId Achievement assigned to both Alliance and Horde achievements after merging, it is not always the same faction
-- Removed Achievement that was available in a given expansion, including Retail, but was removed without being turned into a Legacy achievement or FOS 
-- Phase in which the achievement will be added in Classic WOTLK or was added in OG WO TLK
-- OtherSide For Alliance/Horde separate factions the achievement in the other faction
CrossoverAchievements.Data.Achievements[GameVersion_ClassicWOTLK].List = {
  -- General Start
    -- Level 10
    [6] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Level 20
    [7] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Level 30
    [8] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Level 40
    [9] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Level 50
    [10] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Level 60
    [11] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Level 70
    [12] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Level 80
    [13] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Plenty of Pets
    [15] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Did Somebody Order a Knuckle Sandwich?
    [16] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Shave and a Haircut
    [545] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Safe Deposit
    [546] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Epic
    [556] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Superior
    [557] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Greedy
    [558] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Needy
    [559] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Represent
    [621] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Master of Arms
    [705] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Fast and Furious
    [889] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Into The Wild Blue Yonder
    [890] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Giddy Up!
    [891] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- The Right Stuff
    [892] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Going Down?
    [964] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Can I Keep Him?
    [1017] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Ten Tabards
    [1020] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Twenty-Five Tabards
    [1021] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- My Storage is 'Gigantique'
    [1165] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Got My Mind On My Money
    [1176] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Got My Mind On My Money
    [1177] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Got My Mind On My Money
    [1178] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Got My Mind On My Money
    [1180] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Got My Mind On My Money
    [1181] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- The Keymaster
    [1187] = {Faction = 'Both', Removed = LE_EXPANSION_CATACLYSM, Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- To All The Squirrels I've Loved Before
    [1206] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Well Read
    [1244] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Plethora of Pets
    [1248] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Shop Smart, Shop Pet...Smart
    [1250] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Friend or Fowl?
    [1254] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Tastes Like Chicken
    [1832] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- It's Happy Hour Somewhere
    [1833] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Higher Learning
    [1956] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Armored Brown Bear
    [2076] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Wooly Mammoth
    [2077] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Traveler's Tundra Mammoth
    [2078] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Ring of the Kirin Tor
    [2084] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Get to the Choppa!
    [2097] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Stable Keeper
    [2141] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Filling Up The Barn
    [2142] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Leading the Cavalry
    [2143] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Lil' Game Hunter
    [2516] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Mountain o' Mounts (Alliance)
    [2536] = {Faction = 'Alliance', OtherSide = 2537, Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Mountain o' Mounts (Horde)
    [2537] = {Faction = 'Horde', OtherSide = 2536, Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Pest Control
    [2556] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- To All The Squirrels Who Shared My Life
    [2557] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Dual Talent Specialization
    [2716] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
  -- General End



  -- Quests Start
    -- A Simple Re-Quest
    [31] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- 2000 Quests Completed
    [32] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- 50 Quests Completed
    [503] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- 100 Quests Completed
    [504] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- 250 Quests Completed
    [505] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- 500 Quests Completed
    [506] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- 1000 Quests Completed
    [507] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- 1500 Quests Completed
    [508] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Hemet Nesingwary: The Collected Quests
    [941] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- 5 Daily Quests Complete
    [973] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- 50 Daily Quests Complete
    [974] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- 200 Daily Quests Complete
    [975] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- 500 Daily Quests Complete
    [976] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- 1000 Daily Quests Complete
    [977] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- 3000 Quests Completed
    [978] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- The Bread Winner
    [1182] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Of Blood and Anguish
    [1576] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- The Loremaster (WOTLK) (Alliance)
    [1681] = {Faction = 'Alliance', OtherSide = 1682, Merged = LE_EXPANSION_MISTS_OF_PANDARIA, MergedId = 7520, Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH, Retroactive = true},
    -- The Loremaster (WOTLK) (Horde)
    [1682] = {Faction = 'Horde', OtherSide = 1681, Merged = LE_EXPANSION_MISTS_OF_PANDARIA, MergedId = 7520, Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH, Retroactive = true},
    -- The Loremaster (Retail)
    [7520] = {Faction = 'Both', Merged = LE_EXPANSION_MISTS_OF_PANDARIA, MergedNew = true, MergedId = 1681, Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH, Retroactive = true},
    -- Classic Start
      -- The Green Hills of Stranglethorn
      [940] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Loremaster of Eastern Kingdoms (Alliance)
      [1676] = {Faction = 'Alliance', OtherSide = 1677, Merged = LE_EXPANSION_MISTS_OF_PANDARIA, MergedId = 1676, Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Loremaster of Eastern Kingdoms (Horde)
      [1677] = {Faction = 'Horde', OtherSide = 1676, Merged = LE_EXPANSION_MISTS_OF_PANDARIA, MergedId = 1676, Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Loremaster of Kalimdor (Alliance)
      [1678] = {Faction = 'Alliance', OtherSide = 1680, Merged = LE_EXPANSION_MISTS_OF_PANDARIA, MergedId = 1678, Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Loremaster of Kalimdor (Horde)
      [1680] = {Faction = 'Horde', OtherSide = 1678, Merged = LE_EXPANSION_MISTS_OF_PANDARIA, MergedId = 1678, Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Classic Ends
    -- The Burning Crusade Start
      -- Hills Like White Elekk
      [939] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- To Hellfire and Back (Alliance)
      [1189] = {Faction = 'Alliance', OtherSide = 1271, Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Mysteries of the Marsh
      [1190] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Terror of Terokkar (Alliance)
      [1191] = {Faction = 'Alliance', OtherSide = 1272, Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Nagrand Slam (Alliance)
      [1192] = {Faction = 'Alliance', OtherSide = 1273, Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- On the Blade's Edge
      [1193] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Into the Nether
      [1194] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Shadow of the Betrayer
      [1195] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Loremaster of Outland (Alliance)
      [1262] = {Faction = 'Alliance', OtherSide = 1274, Merged = LE_EXPANSION_MISTS_OF_PANDARIA, MergedId = 1262, Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- To Hellfire and Back (Horde)
      [1271] = {Faction = 'Horde', OtherSide = 1189, Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Terror of Terokkar (Horde)
      [1272] = {Faction = 'Horde', OtherSide = 1191, Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Nagrand Slam (Horde)
      [1273] = {Faction = 'Horde', OtherSide = 1192, Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Loremaster of Outland (Horde)
      [1274] = {Faction = 'Horde', OtherSide = 1262, Merged = LE_EXPANSION_MISTS_OF_PANDARIA, MergedId = 1262, Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Bombs Away
      [1275] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Blade's Edge Bomberman
      [1276] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- The Burning Crusade Ends
    -- Wrath of the Lich King Start
      -- Nothing Boring About Borean (Alliance)
      [33] = {Faction = 'Alliance', OtherSide = 1358, Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- I've Toured the Fjord (Alliance)
      [34] = {Faction = 'Alliance', OtherSide = 1356, Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Might of Dragonblight (Alliance)
      [35] = {Faction = 'Alliance', OtherSide = 1359, Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- The Empire of Zul'Drak
      [36] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Fo' Grizzle My Shizzle (Alliance)
      [37] = {Faction = 'Alliance', OtherSide = 1357, Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- The Summit of Storm Peaks
      [38] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Into the Basin
      [39] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Icecrown: The Final Goal
      [40] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Loremaster of Northrend (Alliance)
      [41] = {Faction = 'Alliance', OtherSide = 1360, Merged = LE_EXPANSION_MISTS_OF_PANDARIA, MergedId = 41, Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Veteran of the Wrathgate
      [547] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- D.E.H.T.A's Little P.I.T.A.
      [561] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- The Snows of Northrend
      [938] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Honorary Frenzyheart
      [961] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Savior of the Oracles
      [962] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Rapid Defense
      [1277] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- I've Toured the Fjord (Horde)
      [1356] = {Faction = 'Horde', OtherSide = 34, Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Fo' Grizzle My Shizzle (Horde)
      [1357] = {Faction = 'Horde', OtherSide = 37, Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Nothing Boring About Borean (Horde)
      [1358] = {Faction = 'Horde', OtherSide = 33, Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Might of Dragonblight (Horde)
      [1359] = {Faction = 'Horde', OtherSide = 35, Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Loremaster of Northrend (Horde)
      [1360] = {Faction = 'Horde', OtherSide = 41, Merged = LE_EXPANSION_MISTS_OF_PANDARIA, MergedId = 41, Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Mine Sweeper
      [1428] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Guru of Drakuru
      [1596] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Wrath of the Lich King Ends
  -- Quests End

  -- Exploration Start
    -- Explore Eastern Kingdoms
    [42] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Explore Kalimdor
    [43] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Explore Outland
    [44] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Explore Northrend
    [45] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- World Explorer
    [46] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Eastern Kingdoms Start
      -- Explore Dun Morogh
      [627] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Explore Alterac Mountains
      [760] = {Faction = 'Both', Removed = LE_EXPANSION_CATACLYSM, Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Explore Arathi Highlands
      [761] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Explore Badlands
      [765] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Explore Blasted Lands
      [766] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Explore Tirisfal Glades
      [768] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Explore Silverpine Forest
      [769] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Explore Western Plaguelands
      [770] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Explore Eastern Plaguelands
      [771] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Explore Hillsbrad Foothills
      [772] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Explore The Hinterlands
      [773] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Explore Searing Gorge
      [774] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Explore Burning Steppes
      [775] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Explore Elwynn Forest
      [776] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Explore Deadwind Pass
      [777] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Explore Duskwood
      [778] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Explore Loch Modan
      [779] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Explore Redridge Mountains
      [780] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Explore Stranglethorn Vale
      [781] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Explore Swamp of Sorrows
      [782] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Explore Westfall
      [802] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Explore Wetlands
      [841] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Explore Ghostlands
      [858] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Explore Eversong Woods
      [859] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Explore Isle of Quel'Danas
      [868] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Eastern Kingdoms Ends
    -- Kalimdor Start
      -- Explore Durotar
      [728] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Explore Mulgore
      [736] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Explore The Barrens
      [750] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Explore Teldrassil
      [842] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Explore Darkshore
      [844] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Explore Ashenvale
      [845] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Explore Thousand Needles
      [846] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Explore Stonetalon Mountains
      [847] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Explore Desolace
      [848] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Explore Feralas
      [849] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Explore Dustwallow Marsh
      [850] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Explore Tanaris Desert
      [851] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Explore Azshara
      [852] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Explore Felwood
      [853] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Explore Un'Goro Crater
      [854] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Explore Moonglade
      [855] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Explore Silithus
      [856] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Explore Winterspring
      [857] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Explore Azuremyst Isle
      [860] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Explore Bloodmyst Isle
      [861] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Kalimdor Ends
    -- Outland Start
      -- Explore Netherstorm
      [843] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Explore Hellfire Peninsula
      [862] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Explore Zangarmarsh
      [863] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Explore Shadowmoon Valley
      [864] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Explore Blade's Edge Mountains
      [865] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Explore Nagrand
      [866] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Explore Terokkar Forest
      [867] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Medium Rare
      [1311] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Bloody Rare
      [1312] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Outland Ends
    -- Northrend Start
      -- Explore Howling Fjord
      [1263] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Explore Borean Tundra
      [1264] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Explore Dragonblight
      [1265] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Explore Grizzly Hills
      [1266] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Explore Zul'Drak
      [1267] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Explore Sholazar Basin
      [1268] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Explore Storm Peaks
      [1269] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Explore Icecrown
      [1270] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Explore Crystalsong Forest
      [1457] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Northern Exposure
      [2256] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Frostbitten
      [2257] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Northrend Ends
  -- Exploration End

  -- Player vs. Player Start
    -- Damage Control
    [227] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- The Grim Reaper
    [229] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Battlemaster (Alliance)
    [230] = {Faction = 'Alliance', OtherSide = 1175, Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Wrecking Ball
    [231] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- An Honorable Kill
    [238] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- 25000 Honorable Kills
    [239] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- That Takes Class
    [245] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Know Thy Enemy (Alliance)
    [246] = {Faction = 'Alliance', OtherSide = 1005, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Make Love, Not Warcraft
    [247] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- City Defender (Alliance)
    [388] = {Faction = 'Alliance', OtherSide = 1006, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Gurubashi Arena Master
    [389] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Gurubashi Arena Grand Master
    [396] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- 10000 Honorable Kills
    [509] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- 5000 Honorable Kills
    [512] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- 100 Honorable Kills
    [513] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- 500 Honorable Kills
    [515] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- 1000 Honorable Kills
    [516] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Wrath of the Horde (Horde)
    [603] = {Faction = 'Horde', OtherSide = 604, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Wrath of the Alliance (Alliance)
    [604] = {Faction = 'Alliance', OtherSide = 603, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Death to the Warchief! (Alliance)
    [610] = {Faction = 'Alliance', OtherSide = 615, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Bleeding Bloodhoof (Alliance)
    [611] = {Faction = 'Alliance', OtherSide = 616, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Downing the Dark Lady (Alliance)
    [612] = {Faction = 'Alliance', OtherSide = 617, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Killed in Quel'Thalas (Alliance)
    [613] = {Faction = 'Alliance', OtherSide = 618, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- For The Alliance! (Alliance)
    [614] = {Faction = 'Alliance', OtherSide = 619, Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Storming Stormwind (Horde)
    [615] = {Faction = 'Horde', OtherSide = 610, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Death to the King! (Horde)
    [616] = {Faction = 'Horde', OtherSide = 611, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Immortal No More (Horde)
    [617] = {Faction = 'Horde', OtherSide = 612, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Putting Out the Light (Horde)
    [618] = {Faction = 'Horde', OtherSide = 613, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- For The Horde! (Horde)
    [619] = {Faction = 'Horde', OtherSide = 614, Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Freedom of the Horde (Horde)
    [700] = {Faction = 'Horde', OtherSide = 701, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Freedom of the Alliance (Alliance)
    [701] = {Faction = 'Alliance', OtherSide = 700, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- The Conqueror (Horde)
    [714] = {Faction = 'Horde', OtherSide = 907, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Call in the Cavalry
    [727] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- 50000 Honorable Kills
    [869] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- 100000 Honorable Kills
    [870] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- The Justicar (Alliance)
    [907] = {Faction = 'Alliance', OtherSide = 714, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Call to Arms! (Alliance)
    [908] = {Faction = 'Alliance', OtherSide = 909, Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Call to Arms! (Horde)
    [909] = {Faction = 'Horde', OtherSide = 908, Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Know Thy Enemy (Horde)
    [1005] = {Faction = 'Horde', OtherSide = 246, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- City Defender (Horde)
    [1006] = {Faction = 'Horde', OtherSide = 388, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Duel-icious
    [1157] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Battlemaster (Horde)
    [1175] = {Faction = 'Horde', OtherSide = 230, Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Grizzled Veteran (Alliance)
    [2016] = {Faction = 'Alliance', OtherSide = 2017, Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Grizzled Veteran (Horde)
    [2017] = {Faction = 'Horde', OtherSide = 2016, Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Arena Start
      -- Step Into The Arena
      [397] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_ARENA_SEASON_5_START},
      -- Mercilessly Dedicated
      [398] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_ARENA_SEASON_5_START},
      -- Just the Two of Us: 1550
      [399] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_ARENA_SEASON_5_START},
      -- Just the Two of Us: 1750
      [400] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_ARENA_SEASON_5_START},
      -- Just the Two of Us: 2000
      [401] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_ARENA_SEASON_5_START},
      -- Three's Company: 1550
      [402] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_ARENA_SEASON_5_START},
      -- Three's Company: 1750
      [403] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_ARENA_SEASON_5_START},
      -- High Five: 2000
      [404] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_ARENA_SEASON_5_START},
      -- Three's Company: 2000
      [405] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_ARENA_SEASON_5_START},
      -- High Five: 1550
      [406] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_ARENA_SEASON_5_START},
      -- High Five: 1750
      [407] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_ARENA_SEASON_5_START},
      -- Hot Streak
      [408] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_ARENA_SEASON_5_START},
      -- Last Man Standing
      [409] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_ARENA_SEASON_5_START},
      -- World Wide Winner
      [699] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_ARENA_SEASON_5_START},
      -- Vengefully Dedicated
      [875] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_ARENA_SEASON_5_START},
      -- Brutally Dedicated
      [876] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_ARENA_SEASON_5_START},
      -- Just the Two of Us: 2200
      [1159] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_ARENA_SEASON_5_START},
      -- Three's Company: 2200
      [1160] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_ARENA_SEASON_5_START},
      -- High Five: 2200
      [1161] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_ARENA_SEASON_5_START},
      -- Hotter Streak
      [1162] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_ARENA_SEASON_5_START},
      -- The Arena Master
      [1174] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_ARENA_SEASON_5_START},
      -- Challenger
      [2090] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_ARENA_SEASON_5_END},
      -- Gladiator
      [2091] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_ARENA_SEASON_5_END},
      -- Duelist
      [2092] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_ARENA_SEASON_5_END},
      -- Rival
      [2093] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_ARENA_SEASON_5_END},
      -- Rival: Season 5
      [16313] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE1_ARENA_SEASON_5_END},
      -- Gladiator: Season 5
      [16314] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE1_ARENA_SEASON_5_END},
      -- Duelist: Season 5
      [16315] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE1_ARENA_SEASON_5_END},
      -- Challenger: Season 5
      [16316] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE1_ARENA_SEASON_5_END},
      -- Rival: Season 6
      [17415] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE1_ARENA_SEASON_5_START},
      -- Gladiator: Season 6
      [17416] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE1_ARENA_SEASON_5_START},
      -- Duelist: Season 6
      [17417] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE1_ARENA_SEASON_5_START},
      -- Challenger: Season 6
      [17418] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE1_ARENA_SEASON_5_START},
      -- Rival: Season 7
      [18544] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE1_ARENA_SEASON_5_START},
      -- Gladiator: Season 7
      [18545] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE1_ARENA_SEASON_5_START},
      -- Duelist: Season 7
      [18546] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE1_ARENA_SEASON_5_START},
      -- Challenger: Season 7
      [18547] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE1_ARENA_SEASON_5_START},
      -- Rival: Season 8
      [18548] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE1_ARENA_SEASON_5_START},
      -- Duelist: Season 8
      [18549] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE1_ARENA_SEASON_5_START},
      -- Challenger: Season 8
      [18550] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE1_ARENA_SEASON_5_START},
      -- Gladiator: Season 8
      [18551] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE1_ARENA_SEASON_5_START},
    -- Arena Ends
    -- Alterac Valley Start
      -- Alterac Valley Victory
      [218] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Alterac Valley Veteran
      [219] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Stormpike Perfection (Alliance)
      [220] = {Faction = 'Alliance', OtherSide = 873, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Alterac Grave Robber
      [221] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Tower Defense
      [222] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- The Sickly Gazelle
      [223] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Loyal Defender (Horde)
      [224] = {Faction = 'Horde', OtherSide = 1151, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Everything Counts (Alliance)
      [225] = {Faction = 'Alliance', OtherSide = 1164, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- The Alterac Blitz
      [226] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Alterac Valley All-Star
      [582] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Frostwolf Howler (Horde)
      [706] = {Faction = 'Horde', OtherSide = 707, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Stormpike Battle Charger (Alliance)
      [707] = {Faction = 'Alliance', OtherSide = 706, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Hero of the Frostwolf Clan (Horde)
      [708] = {Faction = 'Horde', OtherSide = 709, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Hero of the Stormpike Guard (Alliance)
      [709] = {Faction = 'Alliance', OtherSide = 708, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Frostwolf Perfection (Horde)
      [873] = {Faction = 'Horde', OtherSide = 220, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Loyal Defender (Alliance)
      [1151] = {Faction = 'Alliance', OtherSide = 224, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Everything Counts (Horde)
      [1164] = {Faction = 'Horde', OtherSide = 225, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- To the Looter Go the Spoils
      [1166] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Master of Alterac Valley (Alliance)
      [1167] = {Faction = 'Alliance', OtherSide = 1168, Merged = LE_EXPANSION_MISTS_OF_PANDARIA, MergedId = 1167, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Master of Alterac Valley (Horde)
      [1168] = {Faction = 'Horde', OtherSide = 1167, Merged = LE_EXPANSION_MISTS_OF_PANDARIA, MergedId = 1167, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Alterac Valley Ends
    -- Arathi Basin Start
      -- Disgracin' The Basin
      [73] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Arathi Basin Victory
      [154] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Arathi Basin Veteran
      [155] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Territorial Dominance
      [156] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- To The Rescue!
      [157] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Me and the Cappin' Makin' it Happen
      [158] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Let's Get This Done
      [159] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Resilient Victory
      [161] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- We Had It All Along *cough*
      [162] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Arathi Basin Perfection
      [165] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Arathi Basin All-Star
      [583] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Arathi Basin Assassin
      [584] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- The Defiler (Horde)
      [710] = {Faction = 'Horde', OtherSide = 711, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Knight of Arathor (Alliance)
      [711] = {Faction = 'Alliance', OtherSide = 710, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Overly Defensive
      [1153] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Master of Arathi Basin (Alliance)
      [1169] = {Faction = 'Alliance', OtherSide = 1170, Merged = LE_EXPANSION_MISTS_OF_PANDARIA, MergedId = 1169, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Master of Arathi Basin (Horde)
      [1170] = {Faction = 'Horde', OtherSide = 1169, Merged = LE_EXPANSION_MISTS_OF_PANDARIA, MergedId = 1169, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Arathi Basin Ends
    -- Eye of the Storm Start
      -- Eye of the Storm Victory
      [208] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Eye of the Storm Veteran
      [209] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Storm Glory
      [211] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Storm Capper
      [212] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Stormtrooper
      [213] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Flurry
      [214] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Bound for Glory
      [216] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Bloodthirsty Berserker
      [233] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Stormy Assassin
      [587] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- The Perfect Storm
      [783] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Eye of the Storm Domination
      [784] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Master of Eye of the Storm
      [1171] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Take a Chill Pill
      [1258] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Eye of the Storm Ends
    -- Warsong Gulch Start
      -- Warsong Gulch Victory
      [166] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Warsong Gulch Veteran
      [167] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Warsong Gulch Perfection
      [168] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Capture the Flag
      [199] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Persistent Defender
      [200] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Warsong Expedience
      [201] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Quick Cap (Alliance)
      [202] = {Faction = 'Alliance', OtherSide = 1502, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Not In My House (Alliance)
      [203] = {Faction = 'Alliance', OtherSide = 1251, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Ironman
      [204] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Supreme Defender (Alliance)
      [206] = {Faction = 'Alliance', OtherSide = 1252, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Save The Day
      [207] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Warsong Outrider (Horde)
      [712] = {Faction = 'Horde', OtherSide = 713, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Silverwing Sentinel (Alliance)
      [713] = {Faction = 'Alliance', OtherSide = 712, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Frenzied Defender
      [872] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Master of Warsong Gulch (Alliance)
      [1172] = {Faction = 'Alliance', OtherSide = 1173, Merged = LE_EXPANSION_MISTS_OF_PANDARIA, MergedId = 1172, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Master of Warsong Gulch (Horde)
      [1173] = {Faction = 'Horde', OtherSide = 1172, Merged = LE_EXPANSION_MISTS_OF_PANDARIA, MergedId = 1172, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Not In My House (Horde)
      [1251] = {Faction = 'Horde', OtherSide = 203, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Supreme Defender (Horde)
      [1252] = {Faction = 'Horde', OtherSide = 206, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Not So Fast
      [1259] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Quick Cap (Horde)
      [1502] = {Faction = 'Horde', OtherSide = 202, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Warsong Gulch Ends
    -- Strand of the Ancients Start
      -- Strand of the Ancients Victory
      [1308] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Strand of the Ancients Veteran
      [1309] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Storm the Beach
      [1310] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Defense of the Ancients (Alliance)
      [1757] = {Faction = 'Alliance', OtherSide = 2200, Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- The Dapper Sapper
      [1761] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Not Even a Scratch (Alliance)
      [1762] = {Faction = 'Alliance', OtherSide = 2192, Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Artillery Veteran
      [1763] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Drop it!
      [1764] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Steady Hands
      [1765] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Ancient Protector
      [1766] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Artillery Expert
      [2189] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Drop it now!
      [2190] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Ancient Courtyard Protector
      [2191] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Not Even a Scratch (Horde)
      [2192] = {Faction = 'Horde', OtherSide = 1762, Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Explosives Expert
      [2193] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Master of Strand of the Ancients (Alliance)
      [2194] = {Faction = 'Alliance', OtherSide = 2195, Merged = LE_EXPANSION_MISTS_OF_PANDARIA, MergedId = 2194, Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Master of Strand of the Ancients (Horde)
      [2195] = {Faction = 'Horde', OtherSide = 2194, Merged = LE_EXPANSION_MISTS_OF_PANDARIA, MergedId = 2194, Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Defense of the Ancients (Horde)
      [2200] = {Faction = 'Horde', OtherSide = 1757, Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Strand of the Ancients Ends
    -- Wintergrasp Start
      -- Wintergrasp Victory
      [1717] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Wintergrasp Veteran
      [1718] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Archavon the Stone Watcher (25 player)
      [1721] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- Archavon the Stone Watcher (10 player)
      [1722] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- Vehicular Gnomeslaughter
      [1723] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Leaning Tower
      [1727] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Destruction Derby (Alliance)
      [1737] = {Faction = 'Alliance', OtherSide = 2476, Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Didn't Stand a Chance
      [1751] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Master of Wintergrasp (Alliance)
      [1752] = {Faction = 'Alliance', OtherSide = 2776, Merged = LE_EXPANSION_MISTS_OF_PANDARIA, MergedId = 1752, Phase = EXPANSION_03_PHASE1_RAIDS},
      -- Within Our Grasp
      [1755] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Black War Mammoth
      [2080] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- 50 Stone Keeper's Shards
      [2085] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- 100 Stone Keeper's Shards
      [2086] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- 250 Stone Keeper's Shards
      [2087] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- 500 Stone Keeper's Shards
      [2088] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- 1000 Stone Keeper's Shards
      [2089] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Wintergrasp Ranger
      [2199] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Destruction Derby (Horde)
      [2476] = {Faction = 'Horde', OtherSide = 1737, Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Master of Wintergrasp (Horde)
      [2776] = {Faction = 'Horde', OtherSide = 1752, Merged = LE_EXPANSION_MISTS_OF_PANDARIA, MergedId = 1752, Phase = EXPANSION_03_PHASE1_RAIDS},
      -- Emalon the Storm Watcher (10 player)
      [3136] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Emalon the Storm Watcher (25 player)
      [3137] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Koralon the Flame Watcher (10 player)
      [3836] = {Faction = 'Both', Phase = EXPANSION_03_PHASE3_TRIAL_OF_CRUSADER},
      -- Koralon the Flame Watcher (25 player)
      [3837] = {Faction = 'Both', Phase = EXPANSION_03_PHASE3_TRIAL_OF_CRUSADER},
      -- Toravon the Ice Watcher (10 player)
      [4585] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
      -- Toravon the Ice Watcher (25 player)
      [4586] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
    -- Wintergrasp Ends
    -- Isle of Conquest Start
      -- Isle of Conquest Victory
      [3776] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Isle of Conquest Veteran
      [3777] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Isle of Conquest All-Star
      [3845] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Resource Glut (Alliance)
      [3846] = {Faction = 'Alliance', OtherSide = 4176, Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Four Car Garage
      [3847] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- A-bomb-inable
      [3848] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- A-bomb-ination
      [3849] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Mowed Down
      [3850] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Mine (Alliance)
      [3851] = {Faction = 'Alliance', OtherSide = 4177, Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Cut the Blue Wire... No the Red Wire!
      [3852] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- All Over the Isle
      [3853] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Back Door Job
      [3854] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Glaive Grave
      [3855] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Demolition Derby (Alliance)
      [3856] = {Faction = 'Alliance', OtherSide = 4256, Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Master of Isle of Conquest (Alliance)
      [3857] = {Faction = 'Alliance', OtherSide = 3957, Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Master of Isle of Conquest (Horde)
      [3957] = {Faction = 'Horde', OtherSide = 3857, Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Resource Glut (Horde)
      [4176] = {Faction = 'Horde', OtherSide = 3846, Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Mine (Horde)
      [4177] = {Faction = 'Horde', OtherSide = 3851, Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Demolition Derby (Horde)
      [4256] = {Faction = 'Horde', OtherSide = 3856, Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Isle of Conquest Ends
  -- Player vs. Player End

  -- Dungeons & Raids Start
    -- Classic Dungeonmaster
    [1283] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Outland Dungeonmaster
    [1284] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Classic Raider
    [1285] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Outland Raider
    [1286] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Outland Dungeon Hero
    [1287] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Northrend Dungeonmaster
    [1288] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Northrend Dungeon Hero
    [1289] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Champion of the Frozen Wastes
    [1658] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
    -- Glory of the Hero
    [2136] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Glory of the Raider (10 player)
    [2137] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
    -- Glory of the Raider (25 player)
    [2138] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
    -- Glory of the Ulduar Raider (10 player)
    [2957] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
    -- Glory of the Ulduar Raider (25 player)
    [2958] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
    -- Dungeon & Raid Emblem
    [3838] = {Faction = 'Both', Removed = LE_EXPANSION_CATACLYSM, Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- 25 Dungeon & Raid Emblems
    [3839] = {Faction = 'Both', Removed = LE_EXPANSION_CATACLYSM, Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- 50 Dungeon & Raid Emblems
    [3840] = {Faction = 'Both', Removed = LE_EXPANSION_CATACLYSM, Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- 100 Dungeon & Raid Emblems
    [3841] = {Faction = 'Both', Removed = LE_EXPANSION_CATACLYSM, Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- 250 Dungeon & Raid Emblems
    [3842] = {Faction = 'Both', Removed = LE_EXPANSION_CATACLYSM, Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- 500 Dungeon & Raid Emblems
    [3843] = {Faction = 'Both', Removed = LE_EXPANSION_CATACLYSM, Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- 1000 Dungeon & Raid Emblems
    [3844] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- 1500 Dungeon & Raid Emblems
    [3876] = {Faction = 'Both', Removed = LE_EXPANSION_CATACLYSM, Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- 2500 Dungeon & Raid Emblems
    [4316] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Looking For More
    [4476] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_RFD},
    -- Looking For Many
    [4477] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_RFD},
    -- Looking For Multitudes
    [4478] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_RFD},
    -- Glory of the Icecrown Raider (10 player)
    [4602] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
    -- Glory of the Icecrown Raider (25 player)
    [4603] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
    -- Defense Protocol Alpha: Terminated
    [17304] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE2_DEFENSE_PROTOCOL_ALPHA},
    -- Defense Protocol Beta: Terminated (Alliance)
    [18614] = {Faction = 'Alliance', OtherSide = 18688, ClassicOnly = true, Phase = EXPANSION_03_PHASE3_DEFENSE_PROTOCOL_BETA},
    -- Defense Protocol Beta: Terminated (Horde)
    [18688] = {Faction = 'Horde', OtherSide = 18614, ClassicOnly = true, Phase = EXPANSION_03_PHASE3_DEFENSE_PROTOCOL_BETA},
    -- Defense Protocol Gamma: Terminated (Alliance)
    [19439] = {Faction = 'Alliance', OtherSide = 19440, ClassicOnly = true, Phase = EXPANSION_03_PHASE4_DEFENSE_PROTOCOL_GAMMA},
    -- Defense Protocol Gamma: Terminated (Horde)
    [19440] = {Faction = 'Horde', OtherSide = 19439, ClassicOnly = true, Phase = EXPANSION_03_PHASE4_DEFENSE_PROTOCOL_GAMMA},
    -- Classic Start
      -- Deadmines
      [628] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Ragefire Chasm
      [629] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Wailing Caverns
      [630] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Shadowfang Keep
      [631] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Blackfathom Deeps
      [632] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Stormwind Stockade
      [633] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Gnomeregan
      [634] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Razorfen Kraul
      [635] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Razorfen Downs
      [636] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Scarlet Monastery
      [637] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Uldaman
      [638] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Zul'Farrak
      [639] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Maraudon
      [640] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Sunken Temple
      [641] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Blackrock Depths
      [642] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Lower Blackrock Spire
      [643] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- King of Dire Maul
      [644] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Scholomance
      [645] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Stratholme
      [646] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Blackwing Lair
      [685] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Molten Core
      [686] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Temple of Ahn'Qiraj
      [687] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Zul'Gurub
      [688] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Ruins of Ahn'Qiraj
      [689] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Upper Blackrock Spire
      [1307] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Leeeeeeeeeeeeeroy!
      [2188] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Classic Ends
    -- The Burning Crusade Start
      -- Hellfire Ramparts
      [647] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- The Blood Furnace
      [648] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- The Slave Pens
      [649] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Underbog
      [650] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Mana-Tombs
      [651] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- The Escape From Durnholde
      [652] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Sethekk Halls
      [653] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Shadow Labyrinth
      [654] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Opening of the Dark Portal
      [655] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- The Steamvault
      [656] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- The Shattered Halls
      [657] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- The Mechanar
      [658] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- The Botanica
      [659] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- The Arcatraz
      [660] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Magister's Terrace
      [661] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Auchenai Crypts
      [666] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Heroic: Hellfire Ramparts
      [667] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Heroic: The Blood Furnace
      [668] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Heroic: The Slave Pens
      [669] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Heroic: Underbog
      [670] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Heroic: Mana-Tombs
      [671] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Heroic: Auchenai Crypts
      [672] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Heroic: The Escape From Durnholde
      [673] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Heroic: Sethekk Halls
      [674] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Heroic: Shadow Labyrinth
      [675] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Heroic: Opening of the Dark Portal
      [676] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Heroic: The Steamvault
      [677] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Heroic: The Shattered Halls
      [678] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Heroic: The Mechanar
      [679] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Heroic: The Botanica
      [680] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Heroic: The Arcatraz
      [681] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Heroic: Magister's Terrace
      [682] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Karazhan
      [690] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Zul'Aman
      [691] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Gruul's Lair
      [692] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Magtheridon's Lair
      [693] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Serpentshrine Cavern
      [694] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- The Battle for Mount Hyjal
      [695] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Tempest Keep
      [696] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- The Black Temple
      [697] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
      -- Sunwell Plateau
      [698] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- The Burning Crusade Ends
    -- Lich King Dungeon Start
      -- Utgarde Keep
      [477] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- The Nexus
      [478] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- The Culling of Stratholme
      [479] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Azjol-Nerub
      [480] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Ahn'kahet: The Old Kingdom
      [481] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Drak'Tharon Keep
      [482] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- The Violet Hold
      [483] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Gundrak
      [484] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Halls of Stone
      [485] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Halls of Lightning
      [486] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- The Oculus
      [487] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Utgarde Pinnacle
      [488] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Trial of the Champion (Horde)
      [3778] = {Faction = 'Horde', OtherSide = 4296, Phase = EXPANSION_03_PHASE3_TRIAL_OF_CHAMPION},
      -- Trial of the Champion (Alliance)
      [4296] = {Faction = 'Alliance', OtherSide = 3778, Phase = EXPANSION_03_PHASE3_TRIAL_OF_CHAMPION},
      -- The Forge of Souls
      [4516] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_DUNGEONS},
      -- The Pit of Saron
      [4517] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_DUNGEONS},
      -- The Halls of Reflection
      [4518] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_DUNGEONS},
    -- Lich King Dungeon Ends
    -- Lich King Heroic Start
      -- Heroic: Utgarde Keep
      [489] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Heroic: The Nexus
      [490] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Heroic: Azjol-Nerub
      [491] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Heroic: Ahn'kahet: The Old Kingdom
      [492] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Heroic: Drak'Tharon Keep
      [493] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Heroic: The Violet Hold
      [494] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Heroic: Gundrak
      [495] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Heroic: Halls of Stone
      [496] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Heroic: Halls of Lightning
      [497] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Heroic: The Oculus
      [498] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Heroic: Utgarde Pinnacle
      [499] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Heroic: The Culling of Stratholme
      [500] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Watch Him Die
      [1296] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Hadronox Denied
      [1297] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Defenseless
      [1816] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- The Culling of Time
      [1817] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Lightning Struck
      [1834] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Gotta Go!
      [1860] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- The Party's Over -- Not in Classic Removed in OG WOTLK Patch 3.3.0
      --[1861] = {Faction = 'Both', Removed = LE_EXPANSION_WRATH_OF_THE_LICH_KING, Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Volazj's Quick Demise
      [1862] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- What the Eck?
      [1864] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Lockdown!
      [1865] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Good Grief
      [1866] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Timely Death
      [1867] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Make It Count
      [1868] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Experienced Drake Rider
      [1871] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Zombiefest!
      [1872] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Lodi Dodi We Loves the Skadi
      [1873] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- On The Rocks
      [1919] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Intense Cold
      [2036] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Chaos Theory
      [2037] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Respect Your Elders
      [2038] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Better Off Dred
      [2039] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Less-rabi
      [2040] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Dehydration
      [2041] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Shatter Resistant
      [2042] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- The Incredible Hulk
      [2043] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Ruby Void
      [2044] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Emerald Void
      [2045] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Amber Void
      [2046] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Volunteer Work
      [2056] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Oh Novos!
      [2057] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Snakes. Why'd It Have To Be Snakes?
      [2058] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Split Personality
      [2150] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Consumption Junction
      [2151] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Share The Love
      [2152] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- A Void Dance
      [2153] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Brann Spankin' New
      [2154] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Abuse the Ooze
      [2155] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- My Girl Loves to Skadi All the Time
      [2156] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- King's Bane
      [2157] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Argent Confessor
      [3802] = {Faction = 'Both', Phase = EXPANSION_03_PHASE3_TRIAL_OF_CHAMPION},
      -- The Faceroller
      [3803] = {Faction = 'Both', Phase = EXPANSION_03_PHASE3_TRIAL_OF_CHAMPION},
      -- I've Had Worse
      [3804] = {Faction = 'Both', Phase = EXPANSION_03_PHASE3_TRIAL_OF_CHAMPION},
      -- Heroic: Trial of the Champion (Horde)
      [4297] = {Faction = 'Horde', OtherSide = 4298, Phase = EXPANSION_03_PHASE3_TRIAL_OF_CHAMPION},
      -- Heroic: Trial of the Champion (Alliance)
      [4298] = {Faction = 'Alliance', OtherSide = 4297, Phase = EXPANSION_03_PHASE3_TRIAL_OF_CHAMPION},
      -- Heroic: The Forge of Souls
      [4519] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_DUNGEONS},
      -- Heroic: The Pit of Saron
      [4520] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_DUNGEONS},
      -- Heroic: The Halls of Reflection
      [4521] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_DUNGEONS},
      -- Soul Power
      [4522] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_DUNGEONS},
      -- Three Faced
      [4523] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_DUNGEONS},
      -- Doesn't Go to Eleven
      [4524] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_DUNGEONS},
      -- Don't Look Up
      [4525] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- We're Not Retreating; We're Advancing in a Different Direction.
      [4526] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_DUNGEONS},
      -- Defense Protocol Alpha: Utgarde Keep
      [17213] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE2_DEFENSE_PROTOCOL_ALPHA},
      -- Defense Protocol Alpha: The Nexus
      [17283] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE2_DEFENSE_PROTOCOL_ALPHA},
      -- Defense Protocol Alpha: Azjol-Nerub
      [17285] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE2_DEFENSE_PROTOCOL_ALPHA},
      -- Defense Protocol Alpha: Ahn'kahet: The Old Kingdom
      [17291] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE2_DEFENSE_PROTOCOL_ALPHA},
      -- Defense Protocol Alpha: Drak'Tharon Keep
      [17292] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE2_DEFENSE_PROTOCOL_ALPHA},
      -- Defense Protocol Alpha: The Violet Hold
      [17293] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE2_DEFENSE_PROTOCOL_ALPHA},
      -- Defense Protocol Alpha: Gundrak
      [17295] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE2_DEFENSE_PROTOCOL_ALPHA},
      -- Defense Protocol Alpha: Halls of Stone
      [17297] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE2_DEFENSE_PROTOCOL_ALPHA},
      -- Defense Protocol Alpha: Halls of Lightning
      [17299] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE2_DEFENSE_PROTOCOL_ALPHA},
      -- Defense Protocol Alpha: The Oculus
      [17300] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE2_DEFENSE_PROTOCOL_ALPHA},
      -- Defense Protocol Alpha: Utgarde Pinnacle
      [17301] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE2_DEFENSE_PROTOCOL_ALPHA},
      -- Defense Protocol Alpha: The Culling of Stratholme
      [17302] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE2_DEFENSE_PROTOCOL_ALPHA},
      -- Defense Protocol Beta: Utgarde Keep
      [18590] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE3_DEFENSE_PROTOCOL_BETA},
      -- Defense Protocol Beta: The Nexus
      [18591] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE3_DEFENSE_PROTOCOL_BETA},
      -- Defense Protocol Beta: Azjol-Nerub
      [18592] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE3_DEFENSE_PROTOCOL_BETA},
      -- Defense Protocol Beta: Ahn'kahet: The Old Kingdom
      [18593] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE3_DEFENSE_PROTOCOL_BETA},
      -- Defense Protocol Beta: Drak'Tharon Keep
      [18594] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE3_DEFENSE_PROTOCOL_BETA},
      -- Defense Protocol Beta: The Violet Hold
      [18595] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE3_DEFENSE_PROTOCOL_BETA},
      -- Defense Protocol Beta: Gundrak
      [18596] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE3_DEFENSE_PROTOCOL_BETA},
      -- Defense Protocol Beta: Halls of Stone
      [18597] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE3_DEFENSE_PROTOCOL_BETA},
      -- Defense Protocol Beta: Halls of Lightning
      [18598] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE3_DEFENSE_PROTOCOL_BETA},
      -- Defense Protocol Beta: The Oculus
      [18599] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE3_DEFENSE_PROTOCOL_BETA},
      -- Defense Protocol Beta: Utgarde Pinnacle
      [18600] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE3_DEFENSE_PROTOCOL_BETA},
      -- Defense Protocol Beta: The Culling of Stratholme
      [18601] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE3_DEFENSE_PROTOCOL_BETA},
      -- Defense Protocol Beta: Trial of The Champion
      [18602] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE3_DEFENSE_PROTOCOL_BETA},
      -- Defense Protocol Beta: Trial of the Champion (Alliance)
      [18677] = {Faction = 'Alliance', OtherSide = 18678, ClassicOnly = true, Phase = EXPANSION_03_PHASE3_DEFENSE_PROTOCOL_BETA},
      -- Defense Protocol Beta: Trial of the Champion (Horde)
      [18678] = {Faction = 'Horde', OtherSide = 18677, ClassicOnly = true, Phase = EXPANSION_03_PHASE3_DEFENSE_PROTOCOL_BETA},
      -- Defense Protocol Gamma: Trial of the Champion (Horde)
      [19425] = {Faction = 'Horde', OtherSide = 19426, ClassicOnly = true, Phase = EXPANSION_03_PHASE4_DEFENSE_PROTOCOL_GAMMA},
      -- Defense Protocol Gamma: Trial of the Champion (Alliance)
      [19426] = {Faction = 'Alliance', OtherSide = 19425, ClassicOnly = true, Phase = EXPANSION_03_PHASE4_DEFENSE_PROTOCOL_GAMMA},
      -- Defense Protocol Gamma: Utgarde Keep
      [19427] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE4_DEFENSE_PROTOCOL_GAMMA},
      -- Defense Protocol Gamma: The Nexus
      [19428] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE4_DEFENSE_PROTOCOL_GAMMA},
      -- Defense Protocol Gamma: Azjol-Nerub
      [19429] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE4_DEFENSE_PROTOCOL_GAMMA},
      -- Defense Protocol Gamma: Ahn'kahet: The Old Kingdom
      [19430] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE4_DEFENSE_PROTOCOL_GAMMA},
      -- Defense Protocol Gamma: Drak'Tharon Keep
      [19431] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE4_DEFENSE_PROTOCOL_GAMMA},
      -- Defense Protocol Gamma: The Violet Hold
      [19432] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE4_DEFENSE_PROTOCOL_GAMMA},
      -- Defense Protocol Gamma: Gundrak
      [19433] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE4_DEFENSE_PROTOCOL_GAMMA},
      -- Defense Protocol Gamma: Halls of Stone
      [19434] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE4_DEFENSE_PROTOCOL_GAMMA},
      -- Defense Protocol Gamma: Halls of Lightning
      [19435] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE4_DEFENSE_PROTOCOL_GAMMA},
      -- Defense Protocol Gamma: The Oculus
      [19436] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE4_DEFENSE_PROTOCOL_GAMMA},
      -- Defense Protocol Gamma: Utgarde Pinnacle
      [19437] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE4_DEFENSE_PROTOCOL_GAMMA},
      -- Defense Protocol Gamma: The Culling of Stratholme
      [19438] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE4_DEFENSE_PROTOCOL_GAMMA},
    -- Lich King Heroic Ends
    -- Lich King 10-Player Raid Start
      -- The Arachnid Quarter (10 player)
      [562] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- The Construct Quarter (10 player)
      [564] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- The Plague Quarter (10 player)
      [566] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- The Military Quarter (10 player)
      [568] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- Sapphiron's Demise (10 player)
      [572] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- Kel'Thuzad's Defeat (10 player)
      [574] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- The Fall of Naxxramas (10 player)
      [576] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- The Dedicated Few (10 player)
      [578] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- The Spellweaver's Downfall (10 player)
      [622] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- Less Is More (10 player)
      [624] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- Make Quick Werk Of Him (10 player)
      [1856] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- Arachnophobia (10 player)
      [1858] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- A Poke In The Eye (10 player)
      [1869] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- You Don't Have An Eternity (10 player)
      [1874] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- Besting the Black Dragonflight (10 player)
      [1876] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- The Safety Dance (10 player)
      [1996] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- Momma Said Knock You Out (10 player)
      [1997] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- Gonna Go When the Volcano Blows (10 player)
      [2047] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- Twilight Assist (10 player)
      [2049] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- Twilight Duo (10 player)
      [2050] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- The Twilight Zone (10 player)
      [2051] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- The Hundred Club (10 player)
      [2146] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- Denyin' the Scion (10 player)
      [2148] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- And They Would All Go Down Together (10 player)
      [2176] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- Shocking! (10 player)
      [2178] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- Subtraction (10 player)
      [2180] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- Spore Loser (10 player)
      [2182] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- Just Can't Get Enough (10 player)
      [2184] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- The Undying
      [2187] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- Earth, Wind & Fire (10 player)
      [4016] = {Faction = 'Both', Phase = EXPANSION_03_PHASE3_TRIAL_OF_CRUSADER},
      -- Onyxia's Lair (10 player)
      [4396] = {Faction = 'Both', Phase = EXPANSION_03_PHASE3_ONYXIA_LAIR},
      -- More Dots! (10 player)
      [4402] = {Faction = 'Both', Phase = EXPANSION_03_PHASE3_ONYXIA_LAIR},
      -- Many Whelps! Handle It! (10 player)
      [4403] = {Faction = 'Both', Phase = EXPANSION_03_PHASE3_ONYXIA_LAIR},
      -- She Deep Breaths More (10 player)
      [4404] = {Faction = 'Both', Phase = EXPANSION_03_PHASE3_ONYXIA_LAIR},
      -- The Twilight Destroyer (10 player)
      [4817] = {Faction = 'Both', Phase = EXPANSION_03_PHASE5_RUBY_SANCTUM},
      -- Heroic: The Twilight Destroyer (10 player)
      [4818] = {Faction = 'Both', Phase = EXPANSION_03_PHASE5_RUBY_SANCTUM},
    -- Lich King 10-Player Raid Ends
    -- Lich King 25-Player Raid Start
      -- The Arachnid Quarter (25 player)
      [563] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- The Construct Quarter (25 player)
      [565] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- The Plague Quarter (25 player)
      [567] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- The Military Quarter (25 player)
      [569] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- Sapphiron's Demise (25 player)
      [573] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- Kel'Thuzad's Defeat (25 player)
      [575] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- The Fall of Naxxramas (25 player)
      [577] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- The Dedicated Few (25 player)
      [579] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- The Spellweaver's Downfall (25 player)
      [623] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- Besting the Black Dragonflight (25 player)
      [625] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- Make Quick Werk Of Him (25 player)
      [1857] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- Arachnophobia (25 player)
      [1859] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- A Poke In The Eye (25 player)
      [1870] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- You Don't Have An Eternity (25 player)
      [1875] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- Less Is More (25 player)
      [1877] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- Gonna Go When the Volcano Blows (25 player)
      [2048] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- Twilight Assist (25 player)
      [2052] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- Twilight Duo (25 player)
      [2053] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- The Twilight Zone (25 player)
      [2054] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- The Safety Dance (25 player)
      [2139] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- Momma Said Knock You Out (25 player)
      [2140] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- The Hundred Club (25 player)
      [2147] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- Denyin' the Scion (25 player)
      [2149] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- And They Would All Go Down Together (25 player)
      [2177] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- Shocking! (25 player)
      [2179] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- Subtraction (25 player)
      [2181] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- Spore Loser (25 player)
      [2183] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- Just Can't Get Enough (25 player)
      [2185] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- The Immortal
      [2186] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
      -- Earth, Wind & Fire (25 player)
      [4017] = {Faction = 'Both', Phase = EXPANSION_03_PHASE3_TRIAL_OF_CRUSADER},
      -- Onyxia's Lair (25 player)
      [4397] = {Faction = 'Both', Phase = EXPANSION_03_PHASE3_ONYXIA_LAIR},
      -- More Dots! (25 player)
      [4405] = {Faction = 'Both', Phase = EXPANSION_03_PHASE3_ONYXIA_LAIR},
      -- Many Whelps! Handle It! (25 player)
      [4406] = {Faction = 'Both', Phase = EXPANSION_03_PHASE3_ONYXIA_LAIR},
      -- She Deep Breaths More (25 player)
      [4407] = {Faction = 'Both', Phase = EXPANSION_03_PHASE3_ONYXIA_LAIR},
      -- The Twilight Destroyer (25 player)
      [4815] = {Faction = 'Both', Phase = EXPANSION_03_PHASE5_RUBY_SANCTUM},
      -- Heroic: The Twilight Destroyer (25 player)
      [4816] = {Faction = 'Both', Phase = EXPANSION_03_PHASE5_RUBY_SANCTUM},
    -- Lich King 25-Player Raid Ends
    -- Secrets of Ulduar 10-Player Raid Start
      -- The Siege of Ulduar (10 player)
      [2886] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- The Antechamber of Ulduar (10 player)
      [2888] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- The Keepers of Ulduar (10 player)
      [2890] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- The Descent into Madness (10 player)
      [2892] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- The Secrets of Ulduar (10 player)
      [2894] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Champion of Ulduar
      [2903] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Unbroken (10 player)
      [2905] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Three Car Garage (10 player)
      [2907] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Take Out Those Turrets (10 player)
      [2909] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Shutout (10 player)
      [2911] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Orbital Bombardment (10 player)
      [2913] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Orbital Devastation (10 player)
      [2914] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Nuked from Orbit (10 player)
      [2915] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- A Quick Shave (10 player)
      [2919] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Iron Dwarf, Medium Rare (10 player)
      [2923] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Shattered (10 player)
      [2925] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Hot Pocket (10 player)
      [2927] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Stokin' the Furnace (10 player)
      [2930] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Nerf Engineering (10 player)
      [2931] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Nerf Scrapbots (10 player)
      [2933] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Nerf Gravity Bombs (10 player)
      [2934] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Must Deconstruct Faster (10 player)
      [2937] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- I Choose You, Runemaster Molgeim (10 player)
      [2939] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- I Choose You, Stormcaller Brundir (10 player)
      [2940] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- I Choose You, Steelbreaker (10 player)
      [2941] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- But I'm On Your Side (10 player)
      [2945] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Can't Do That While Stunned (10 player)
      [2947] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- With Open Arms (10 player)
      [2951] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Disarmed (10 player)
      [2953] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- If Looks Could Kill (10 player)
      [2955] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Rubble and Roll (10 player)
      [2959] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Cheese the Freeze (10 player)
      [2961] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- I Have the Coolest Friends (10 player)
      [2963] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Getting Cold in Here (10 player)
      [2967] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Staying Buffed All Winter (10 player)
      [2969] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Don't Stand in the Lightning (10 player)
      [2971] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- I'll Take You All On (10 player)
      [2973] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Who Needs Bloodlust? (10 player)
      [2975] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Siffed (10 player)
      [2977] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Lumberjacked (10 player)
      [2979] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Con-speed-atory (10 player)
      [2980] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Getting Back to Nature (10 player)
      [2982] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Deforestation (10 player)
      [2985] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Set Up Us the Bomb (10 player)
      [2989] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Shadowdodger (10 player)
      [2996] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Supermassive (10 player)
      [3003] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- He Feeds On Your Tears (10 player)
      [3004] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Crazy Cat Lady (10 player)
      [3006] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Drive Me Crazy (10 player)
      [3008] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Kiss and Make Up (10 player)
      [3009] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- He's Not Getting Any Older (10 player)
      [3012] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- They're Coming Out of the Walls (10 player)
      [3014] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- In His House He Waits Dreaming (10 player)
      [3015] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Observed (10 player)
      [3036] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Orbit-uary (10 player)
      [3056] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Heartbreaker (10 player)
      [3058] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Nine Lives (10 player)
      [3076] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Dwarfageddon (10 player)
      [3097] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Not-So-Friendly Fire (10 player)
      [3138] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Two Lights in the Darkness (10 player)
      [3141] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Three Lights in the Darkness (10 player)
      [3157] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- One Light in the Darkness (10 player)
      [3158] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Alone in the Darkness (10 player)
      [3159] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Lose Your Illusion (10 player)
      [3176] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Knock on Wood (10 player)
      [3177] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Knock, Knock on Wood (10 player)
      [3178] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Knock, Knock, Knock on Wood (10 player)
      [3179] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Firefighter (10 player)
      [3180] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- I Love the Smell of Saronite in the Morning (10 player)
      [3181] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- I Could Say That This Cache Was Rare (10 player)
      [3182] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Herald of the Titans
      [3316] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
    -- Secrets of Ulduar 10-Player Raid Ends
    -- Secrets of Ulduar 25-Player Raid Start
      -- The Siege of Ulduar (25 player)
      [2887] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- The Antechamber of Ulduar (25 player)
      [2889] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- The Keepers of Ulduar (25 player)
      [2891] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- The Descent into Madness (25 player)
      [2893] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- The Secrets of Ulduar (25 player)
      [2895] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Conqueror of Ulduar
      [2904] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Unbroken (25 player)
      [2906] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Three Car Garage (25 player)
      [2908] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Take Out Those Turrets (25 player)
      [2910] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Shutout (25 player)
      [2912] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Orbital Devastation (25 player)
      [2916] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Nuked from Orbit (25 player)
      [2917] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Orbital Bombardment (25 player)
      [2918] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- A Quick Shave (25 player)
      [2921] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Iron Dwarf, Medium Rare (25 player)
      [2924] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Shattered (25 player)
      [2926] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Hot Pocket (25 player)
      [2928] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Stokin' the Furnace (25 player)
      [2929] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Nerf Engineering (25 player)
      [2932] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Nerf Scrapbots (25 player)
      [2935] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Nerf Gravity Bombs (25 player)
      [2936] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Must Deconstruct Faster (25 player)
      [2938] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- I Choose You, Runemaster Molgeim (25 player)
      [2942] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- I Choose You, Stormcaller Brundir (25 player)
      [2943] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- I Choose You, Steelbreaker (25 player)
      [2944] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- But I'm On Your Side (25 player)
      [2946] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Can't Do That While Stunned (25 player)
      [2948] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- With Open Arms (25 player)
      [2952] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Disarmed (25 player)
      [2954] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- If Looks Could Kill (25 player)
      [2956] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Rubble and Roll (25 player)
      [2960] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Cheese the Freeze (25 player)
      [2962] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- I Have the Coolest Friends (25 player)
      [2965] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Getting Cold in Here (25 player)
      [2968] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Staying Buffed All Winter (25 player)
      [2970] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Don't Stand in the Lightning (25 player)
      [2972] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- I'll Take You All On (25 player)
      [2974] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Who Needs Bloodlust? (25 player)
      [2976] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Siffed (25 player)
      [2978] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Con-speed-atory (25 player)
      [2981] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Getting Back to Nature (25 player)
      [2983] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Deforestation (25 player)
      [2984] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Not-So-Friendly Fire (25 player)
      [2995] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Shadowdodger (25 player)
      [2997] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Supermassive (25 player)
      [3002] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- He Feeds On Your Tears (25 player)
      [3005] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Crazy Cat Lady (25 player)
      [3007] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Drive Me Crazy (25 player)
      [3010] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Kiss and Make Up (25 player)
      [3011] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- He's Not Getting Any Older (25 player)
      [3013] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- In His House He Waits Dreaming (25 player)
      [3016] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- They're Coming Out of the Walls (25 player)
      [3017] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Observed (25 player)
      [3037] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Orbit-uary (25 player)
      [3057] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Heartbreaker (25 player)
      [3059] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Nine Lives (25 player)
      [3077] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Dwarfageddon (25 player)
      [3098] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Lumberjacked (25 player)
      [3118] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Three Lights in the Darkness (25 player)
      [3161] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Two Lights in the Darkness (25 player)
      [3162] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- One Light in the Darkness (25 player)
      [3163] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Alone in the Darkness (25 player)
      [3164] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Lose Your Illusion (25 player)
      [3183] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- I Could Say That This Cache Was Rare (25 player)
      [3184] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Knock on Wood (25 player)
      [3185] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Knock, Knock on Wood (25 player)
      [3186] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Knock, Knock, Knock on Wood (25 player)
      [3187] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- I Love the Smell of Saronite in the Morning (25 player)
      [3188] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Firefighter (25 player)
      [3189] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
      -- Set Up Us the Bomb (25 player)
      [3237] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
    -- Secrets of Ulduar 25-Player Raid Ends
    -- Call of the Crusade 10-Player Raid Start
      -- Upper Back Pain (10 player)
      [3797] = {Faction = 'Both', Phase = EXPANSION_03_PHASE3_TRIAL_OF_CRUSADER},
      -- Resilience Will Fix It (10 player)
      [3798] = {Faction = 'Both', Phase = EXPANSION_03_PHASE3_TRIAL_OF_CRUSADER},
      -- Salt and Pepper (10 player)
      [3799] = {Faction = 'Both', Phase = EXPANSION_03_PHASE3_TRIAL_OF_CRUSADER},
      -- The Traitor King (10 player)
      [3800] = {Faction = 'Both', Phase = EXPANSION_03_PHASE3_TRIAL_OF_CRUSADER},
      -- A Tribute to Skill (10 player)
      [3808] = {Faction = 'Both', Phase = EXPANSION_03_PHASE3_TRIAL_OF_CRUSADER},
      -- A Tribute to Mad Skill (10 player)
      [3809] = {Faction = 'Both', Phase = EXPANSION_03_PHASE3_TRIAL_OF_CRUSADER},
      -- A Tribute to Insanity (10 player)
      [3810] = {Faction = 'Both', Phase = EXPANSION_03_PHASE3_TRIAL_OF_CRUSADER},
      -- Call of the Crusade (10 player)
      [3917] = {Faction = 'Both', Phase = EXPANSION_03_PHASE3_TRIAL_OF_CRUSADER},
      -- Call of the Grand Crusade (10 player)
      [3918] = {Faction = 'Both', Phase = EXPANSION_03_PHASE3_TRIAL_OF_CRUSADER},
      -- Not One, But Two Jormungars (10 player)
      [3936] = {Faction = 'Both', Phase = EXPANSION_03_PHASE3_TRIAL_OF_CRUSADER},
      -- Three Sixty Pain Spike (10 player)
      [3996] = {Faction = 'Both', Phase = EXPANSION_03_PHASE3_TRIAL_OF_CRUSADER},
      -- A Tribute to Dedicated Insanity
      [4080] = {Faction = 'Both', Phase = EXPANSION_03_PHASE3_TRIAL_OF_CRUSADER},
    -- Call of the Crusade 10-Player Raid Ends
    -- Call of the Crusade 25-Player Raid Start
      -- Call of the Grand Crusade (25 player)
      [3812] = {Faction = 'Both', Phase = EXPANSION_03_PHASE3_TRIAL_OF_CRUSADER},
      -- Upper Back Pain (25 player)
      [3813] = {Faction = 'Both', Phase = EXPANSION_03_PHASE3_TRIAL_OF_CRUSADER},
      -- Resilience Will Fix It (25 player)
      [3814] = {Faction = 'Both', Removed = LE_EXPANSION_CATACLYSM, Phase = EXPANSION_03_PHASE3_TRIAL_OF_CRUSADER},
      -- Salt and Pepper (25 player)
      [3815] = {Faction = 'Both', Phase = EXPANSION_03_PHASE3_TRIAL_OF_CRUSADER},
      -- The Traitor King (25 player)
      [3816] = {Faction = 'Both', Phase = EXPANSION_03_PHASE3_TRIAL_OF_CRUSADER},
      -- A Tribute to Skill (25 player)
      [3817] = {Faction = 'Both', Phase = EXPANSION_03_PHASE3_TRIAL_OF_CRUSADER},
      -- A Tribute to Mad Skill (25 player)
      [3818] = {Faction = 'Both', Phase = EXPANSION_03_PHASE3_TRIAL_OF_CRUSADER},
      -- A Tribute to Insanity (25 player)
      [3819] = {Faction = 'Both', Phase = EXPANSION_03_PHASE3_TRIAL_OF_CRUSADER},
      -- Call of the Crusade (25 player)
      [3916] = {Faction = 'Both', Phase = EXPANSION_03_PHASE3_TRIAL_OF_CRUSADER},
      -- Not One, But Two Jormungars (25 player)
      [3937] = {Faction = 'Both', Phase = EXPANSION_03_PHASE3_TRIAL_OF_CRUSADER},
      -- Three Sixty Pain Spike (25 player)
      [3997] = {Faction = 'Both', Phase = EXPANSION_03_PHASE3_TRIAL_OF_CRUSADER},
    -- Call of the Crusade 25-Player Raid Ends
    -- Fall of the Lich King 10-Player Raid Start
      -- The Frostwing Halls (10 player)
      [4527] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
      -- The Plagueworks (10 player)
      [4528] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
      -- The Crimson Hall (10 player)
      [4529] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
      -- The Frozen Throne (10 player)
      [4530] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
      -- Storming the Citadel (10 player)
      [4531] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
      -- Fall of the Lich King (10 player)
      [4532] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
      -- Boned (10 player)
      [4534] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
      -- Full House (10 player)
      [4535] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
      -- I'm on a Boat (10 player)
      [4536] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
      -- I've Gone and Made a Mess (10 player)
      [4537] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
      -- Dances with Oozes (10 player)
      [4538] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
      -- Once Bitten, Twice Shy (10 player)
      [4539] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
      -- Flu Shot Shortage (10 player)
      [4577] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
      -- Nausea, Heartburn, Indigestion... (10 player)
      [4578] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
      -- Portal Jockey (10 player)
      [4579] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
      -- All You Can Eat (10 player)
      [4580] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
      -- Neck-Deep in Vile (10 player)
      [4581] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
      -- The Orb Whisperer (10 player)
      [4582] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
      -- Bane of the Fallen King
      [4583] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
      -- Been Waiting a Long Time for This (10 player)
      [4601] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
      -- Heroic: Storming the Citadel (10 player)
      [4628] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
      -- Heroic: The Plagueworks (10 player)
      [4629] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
      -- Heroic: The Crimson Hall (10 player)
      [4630] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
      -- Heroic: The Frostwing Halls (10 player)
      [4631] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
      -- Heroic: Fall of the Lich King (10 player)
      [4636] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
    -- Fall of the Lich King 10-Player Raid Ends
    -- Fall of the Lich King 25-Player Raid Start
      -- The Light of Dawn
      [4584] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
      -- The Frozen Throne (25 player)
      [4597] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
      -- Storming the Citadel (25 player)
      [4604] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
      -- The Plagueworks (25 player)
      [4605] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
      -- The Crimson Hall (25 player)
      [4606] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
      -- The Frostwing Halls (25 player)
      [4607] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
      -- Fall of the Lich King (25 player)
      [4608] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
      -- Boned (25 player)
      [4610] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
      -- Full House (25 player)
      [4611] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
      -- I'm on a Boat (25 player)
      [4612] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
      -- I've Gone and Made a Mess (25 player)
      [4613] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
      -- Dances with Oozes (25 player)
      [4614] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
      -- Flu Shot Shortage (25 player)
      [4615] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
      -- Nausea, Heartburn, Indigestion... (25 player)
      [4616] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
      -- The Orb Whisperer (25 player)
      [4617] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
      -- Once Bitten, Twice Shy (25 player)
      [4618] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
      -- Portal Jockey (25 player)
      [4619] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
      -- All You Can Eat (25 player)
      [4620] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
      -- Been Waiting a Long Time for This (25 player)
      [4621] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
      -- Neck-Deep in Vile (25 player)
      [4622] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
      -- Heroic: Storming the Citadel (25 player)
      [4632] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
      -- Heroic: The Plagueworks (25 player)
      [4633] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
      -- Heroic: The Crimson Hall (25 player)
      [4634] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
      -- Heroic: The Frostwing Halls (25 player)
      [4635] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
      -- Heroic: Fall of the Lich King (25 player)
      [4637] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
    -- Fall of the Lich King 25-Player Raid Ends
  -- Dungeons & Raids End

  -- Professions Start
    -- Professional Journeyman
    [116] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Skills to Pay the Bills
    [730] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Professional Expert
    [731] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Professional Artisan
    [732] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Professional Master
    [733] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Professional Grand Master
    [734] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Working Day and Night
    [735] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Cooking Start
      -- Journeyman Cook
      [121] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Expert Cook
      [122] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Artisan Cook
      [123] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Master Cook
      [124] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Grand Master Cook
      [125] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- The Cake Is Not A Lie
      [877] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Kickin' It Up a Notch
      [906] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Hail to the Chef (Alliance)
      [1563] = {Faction = 'Alliance', OtherSide = 1784, Merged = LE_EXPANSION_MISTS_OF_PANDARIA, MergedId = 1563, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- The Northrend Gourmet
      [1777] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- The Northrend Gourmet
      [1778] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- The Northrend Gourmet
      [1779] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Second That Emotion
      [1780] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Critter Gitter
      [1781] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Our Daily Bread (Alliance)
      [1782] = {Faction = 'Alliance', OtherSide = 1783, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Our Daily Bread (Horde)
      [1783] = {Faction = 'Horde', OtherSide = 1782, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Hail to the Chef (Horde)
      [1784] = {Faction = 'Horde', OtherSide = 1563, Merged = LE_EXPANSION_MISTS_OF_PANDARIA, MergedId = 1563, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Dinner Impossible
      [1785] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Lunch Lady
      [1795] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Short Order Cook
      [1796] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Chef de Partie
      [1797] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Sous Chef
      [1798] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Chef de Cuisine
      [1799] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- The Outland Gourmet
      [1800] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Captain Rumsey's Lager
      [1801] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Dalaran Cooking Award
      [1998] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- 10 Dalaran Cooking Awards
      [1999] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- 25 Dalaran Cooking Awards
      [2000] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- 50 Dalaran Cooking Awards
      [2001] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- 100 Dalaran Cooking Awards
      [2002] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Cooking with Style
      [3296] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Cooking Ends
    -- Fishing Start
      -- Journeyman Fisherman
      [126] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Expert Fisherman
      [127] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Artisan Fisherman
      [128] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Master Fisherman
      [129] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Grand Master Fisherman
      [130] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- The Lurker Above
      [144] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- The Fishing Diplomat
      [150] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- The Old Gnome and the Sea
      [153] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Master Angler of Azeroth
      [306] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Deadliest Catch
      [560] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Mr. Pinchy's Magical Crawdad Box
      [726] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- One That Didn't Get Away
      [878] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Old Man Barlowned
      [905] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Outland Angler
      [1225] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Fish Don't Leave Footprints
      [1243] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- The Scavenger
      [1257] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Accomplished Angler
      [1516] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Northrend Angler
      [1517] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- 25 Fish
      [1556] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- 50 Fish
      [1557] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- 100 Fish
      [1558] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- 250 Fish
      [1559] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- 500 Fish
      [1560] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- 1000 Fish
      [1561] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Old Crafty
      [1836] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Old Ironjaw
      [1837] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- There's Gold In That There Fountain
      [1957] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- I Smell A Giant Rat
      [1958] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- A Penny For Your Thoughts
      [2094] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Silver in the City
      [2095] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- The Coin Master
      [2096] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Chasing Marcia
      [3217] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Turtles All the Way Down
      [3218] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Fishing Ends
    -- First Aid Start
      -- Journeyman in First Aid
      [131] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Expert in First Aid
      [132] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Artisan in First Aid
      [133] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Master in First Aid
      [134] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Grand Master in First Aid
      [135] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Stocking Up
      [137] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Ultimate Triage
      [141] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- First Aid Ends
  -- Professions End

  -- Reputation Start
    -- 30 Exalted Reputations
    [518] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- 25 Exalted Reputations
    [519] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- 20 Exalted Reputations
    [520] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- 15 Exalted Reputations
    [521] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Somebody Likes Me
    [522] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- 5 Exalted Reputations
    [523] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- 10 Exalted Reputations
    [524] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Ambassador of the Horde (Horde)
    [762] = {Faction = 'Horde', OtherSide = 948, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- The Diplomat (Alliance)
    [942] = {Faction = 'Alliance', OtherSide = 943, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- The Diplomat (Horde)
    [943] = {Faction = 'Horde', OtherSide = 942, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- The Argent Champion
    [945] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Ambassador of the Alliance (Alliance)
    [948] = {Faction = 'Alliance', OtherSide = 762, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Guardian of Cenarius
    [953] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- 35 Exalted Reputations
    [1014] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- 40 Exalted Reputations
    [1015] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Classic Start
      -- They Love Me In That Tunnel
      [944] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- The Argent Dawn
      [946] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Hydraxian Waterlords
      [955] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Brood of Nozdormu
      [956] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Hero of the Zandalar Tribe
      [957] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Classic Ends
    -- The Burning Crusade Start
      -- The Burning Crusader (Horde)
      [763] = {Faction = 'Horde', OtherSide = 764, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- The Burning Crusader (Alliance)
      [764] = {Faction = 'Alliance', OtherSide = 763, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Cenarion War Hippogryph
      [893] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Flying High Over Skettis
      [894] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- A Quest a Day Keeps the Ogres at Bay
      [896] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- You're So Offensive
      [897] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- On Wings of Nether
      [898] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Oh My, Kurenai (Alliance)
      [899] = {Faction = 'Alliance', OtherSide = 901, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- The Czar of Sporeggar
      [900] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Mag'har of Draenor (Horde)
      [901] = {Faction = 'Horde', OtherSide = 899, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Chief Exalted Officer
      [902] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Shattrath Divided
      [903] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Sworn to the Deathsworn
      [958] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- The Scale of the Sands
      [959] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- The Violet Eye
      [960] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Skyshattered
      [1638] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- The Burning Crusade Ends
    -- Wrath of the Lich King Start
      -- The Argent Crusade
      [947] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Tuskarrmageddon
      [949] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Frenzyheart Tribe
      [950] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- The Oracles
      [951] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Mercenary of Sholazar
      [952] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- The Wyrmrest Accord
      [1007] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- The Kirin Tor
      [1008] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Knights of the Ebon Blade
      [1009] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Northrend Vanguard
      [1010] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- The Winds of the North (Horde)
      [1011] = {Faction = 'Horde', OtherSide = 1012, Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- The Winds of the North (Alliance)
      [1012] = {Faction = 'Alliance', OtherSide = 1011, Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Ice Mammoth
      [2082] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Grand Ice Mammoth
      [2083] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- The Ashen Verdict
      [4598] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Wrath of the Lich King Ends
  -- Reputation End

  -- World Events Start
    -- To Honor One's Elders
    [913] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- The Flame Warden (Alliance)
    [1038] = {Faction = 'Alliance', OtherSide = 1039, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- The Flame Keeper (Horde)
    [1039] = {Faction = 'Horde', OtherSide = 1038, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Hallowed Be Thy Name (Alliance)
    [1656] = {Faction = 'Alliance', OtherSide = 1657, Merged = LE_EXPANSION_MISTS_OF_PANDARIA, MergedId = 1656, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Hallowed Be Thy Name (Horde)
    [1657] = {Faction = 'Horde', OtherSide = 1656, Merged = LE_EXPANSION_MISTS_OF_PANDARIA, MergedId = 1656, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Brewmaster (Horde)
    [1683] = {Faction = 'Horde', OtherSide = 1684, Merged = LE_EXPANSION_MISTS_OF_PANDARIA, MergedId = 1683, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Brewmaster (Alliance)
    [1684] = {Faction = 'Alliance', OtherSide = 1683, Merged = LE_EXPANSION_MISTS_OF_PANDARIA, MergedId = 1683, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Merrymaker (Horde)
    [1691] = {Faction = 'Horde', OtherSide = 1692, Merged = LE_EXPANSION_MISTS_OF_PANDARIA, MergedId = 1691, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Merrymaker (Alliance)
    [1692] = {Faction = 'Alliance', OtherSide = 1691, Merged = LE_EXPANSION_MISTS_OF_PANDARIA, MergedId = 1691, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Fool For Love (Horde)
    [1693] = {Faction = 'Horde', OtherSide = 1707, Merged = LE_EXPANSION_MISTS_OF_PANDARIA, MergedId = 1693, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Fool For Love (Alliance)
    [1707] = {Faction = 'Alliance', OtherSide = 1693, Merged = LE_EXPANSION_MISTS_OF_PANDARIA, MergedId = 1693, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- For The Children
    [1793] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- What A Long, Strange Trip It's Been (Alliance)
    [2144] = {Faction = 'Alliance', OtherSide = 2145, Merged = LE_EXPANSION_MISTS_OF_PANDARIA, MergedId = 2144, Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- What A Long, Strange Trip It's Been (Horde)
    [2145] = {Faction = 'Horde', OtherSide = 2144, Merged = LE_EXPANSION_MISTS_OF_PANDARIA, MergedId = 2144, Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Noble Gardener (Alliance)
    [2797] = {Faction = 'Alliance', OtherSide = 2798, Merged = LE_EXPANSION_MISTS_OF_PANDARIA, MergedId = 2798, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Noble Gardener (Horde)
    [2798] = {Faction = 'Horde', OtherSide = 2797, Merged = LE_EXPANSION_MISTS_OF_PANDARIA, MergedId = 2798, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Dead Man's Party
    [3456] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- The Captain's Booty
    [3457] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Pilgrim (Alliance)
    [3478] = {Faction = 'Alliance', OtherSide = 3656, Merged = LE_EXPANSION_MISTS_OF_PANDARIA, MergedId = 3478, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Pilgrim (Horde)
    [3656] = {Faction = 'Horde', OtherSide = 3478, Merged = LE_EXPANSION_MISTS_OF_PANDARIA, MergedId = 3478, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Lunar Festival Start
      -- A Coin of Ancestry
      [605] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- 5 Coins of Ancestry
      [606] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- 10 Coins of Ancestry
      [607] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- 25 Coins of Ancestry
      [608] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- 50 Coins of Ancestry
      [609] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Lunar Festival Finery
      [626] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Elders of the Dungeons
      [910] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Elders of Kalimdor
      [911] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Elders of Eastern Kingdoms
      [912] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Elders of the Horde
      [914] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Elders of the Alliance
      [915] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Elune's Blessing
      [937] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- The Rocket's Red Glare
      [1281] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Elders of Northrend
      [1396] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
      -- Frenzied Firecracker
      [1552] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Lunar Festival Ends
    -- Love is in the Air Start
      -- Charming
      [260] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Shafted!
      [1188] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Flirt With Disaster (Alliance)
      [1279] = {Faction = 'Alliance', OtherSide = 1280, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Flirt With Disaster (Horde)
      [1280] = {Faction = 'Horde', OtherSide = 1279, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Lonely?
      [1291] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Lovely Luck Is On Your Side
      [1694] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Dangerous Love
      [1695] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- The Rocket's Pink Glare
      [1696] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Nation of Adoration (Alliance)
      [1697] = {Faction = 'Alliance', OtherSide = 1698, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Nation of Adoration (Horde)
      [1698] = {Faction = 'Horde', OtherSide = 1697, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Fistful of Love
      [1699] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Perma-Peddle
      [1700] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Be Mine!
      [1701] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Sweet Tooth
      [1702] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- My Love is Like a Red, Red Rose
      [1703] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- I Pitied The Fool
      [1704] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Tough Love
      [4624] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Love is in the Air Ends
    -- Noblegarden Start
      -- Sunday's Finest
      [248] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Dressed for the Occasion
      [249] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Hard Boiled
      [2416] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Chocolate Lover
      [2417] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Chocoholic
      [2418] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Spring Fling (Alliance)
      [2419] = {Faction = 'Alliance', OtherSide = 2497, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Noble Garden (Horde)
      [2420] = {Faction = 'Horde', OtherSide = 2421, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Noble Garden (Alliance)
      [2421] = {Faction = 'Alliance', OtherSide = 2420, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Shake Your Bunny-Maker
      [2422] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Desert Rose
      [2436] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Spring Fling (Horde)
      [2497] = {Faction = 'Horde', OtherSide = 2419, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Blushing Bride
      [2576] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- I Found One!
      [2676] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Noblegarden Ends
    -- Children's Week Start
      -- Veteran Nanny
      [275] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- School of Hard Knocks
      [1786] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Once An Orphan... -- Not in Classic Removed in OG WOTLK Patch 3.1.0 before anyone was able to complete it
      --[1787] = {Faction = 'Both', Removed = LE_EXPANSION_WRATH_OF_THE_LICH_KING, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Bad Example
      [1788] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Daily Chores
      [1789] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Hail To The King, Baby
      [1790] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Home Alone
      [1791] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Aw, Isn't It Cute?
      [1792] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Children's Week Ends
    -- Midsummer Start
      -- Ice the Frost Lord
      [263] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Burning Hot Pole Dance
      [271] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Torch Juggler
      [272] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Flame Warden of Eastern Kingdoms (Alliance)
      [1022] = {Faction = 'Alliance', OtherSide = 1025, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Flame Warden of Kalimdor (Alliance)
      [1023] = {Faction = 'Alliance', OtherSide = 1026, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Flame Warden of Outland (Alliance)
      [1024] = {Faction = 'Alliance', OtherSide = 1027, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Flame Keeper of Eastern Kingdoms (Horde)
      [1025] = {Faction = 'Horde', OtherSide = 1022, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Flame Keeper of Kalimdor (Horde)
      [1026] = {Faction = 'Horde', OtherSide = 1023, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Flame Keeper of Outland (Horde)
      [1027] = {Faction = 'Horde', OtherSide = 1024, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Extinguishing Eastern Kingdoms (Alliance)
      [1028] = {Faction = 'Alliance', OtherSide = 1031, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Extinguishing Kalimdor (Alliance)
      [1029] = {Faction = 'Alliance', OtherSide = 1032, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Extinguishing Outland (Alliance)
      [1030] = {Faction = 'Alliance', OtherSide = 1033, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Extinguishing Eastern Kingdoms (Horde)
      [1031] = {Faction = 'Horde', OtherSide = 1028, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Extinguishing Kalimdor (Horde)
      [1032] = {Faction = 'Horde', OtherSide = 1029, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Extinguishing Outland (Horde)
      [1033] = {Faction = 'Horde', OtherSide = 1030, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- The Fires of Azeroth (Alliance)
      [1034] = {Faction = 'Alliance', OtherSide = 1036, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Desecration of the Horde (Alliance)
      [1035] = {Faction = 'Alliance', OtherSide = 1037, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- The Fires of Azeroth (Horde)
      [1036] = {Faction = 'Horde', OtherSide = 1034, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Desecration of the Alliance (Horde)
      [1037] = {Faction = 'Horde', OtherSide = 1035, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- King of the Fire Festival
      [1145] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Midsummer Ends
    -- Brewfest Start
      -- Disturbing the Peace
      [293] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Direbrewfest
      [295] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Have Keg, Will Travel
      [303] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Brew of the Year
      [1183] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Strange Brew (Alliance)
      [1184] = {Faction = 'Alliance', OtherSide = 1203, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- The Brewfest Diet
      [1185] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Down With The Dark Iron
      [1186] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Strange Brew (Horde)
      [1203] = {Faction = 'Horde', OtherSide = 1184, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Drunken Stupor
      [1260] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Does Your Wolpertinger Linger?
      [1936] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Brew of the Month
      [2796] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Brewfest Ends
    -- Hallow's End Start
      -- Bring Me The Head of... Oh Wait
      [255] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- The Masquerade
      [283] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- A Mask for All Occasions
      [284] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Out With It
      [288] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- The Savior of Hallow's End
      [289] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Check Your Head
      [291] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Sinister Calling
      [292] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Tricks and Treats of Kalimdor (Alliance)
      [963] = {Faction = 'Alliance', OtherSide = 965, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Tricks and Treats of Kalimdor (Horde)
      [965] = {Faction = 'Horde', OtherSide = 963, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Tricks and Treats of Eastern Kingdoms (Alliance)
      [966] = {Faction = 'Alliance', OtherSide = 967, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Tricks and Treats of Eastern Kingdoms (Horde)
      [967] = {Faction = 'Horde', OtherSide = 966, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Tricks and Treats of Outland (Horde)
      [968] = {Faction = 'Horde', OtherSide = 969, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Tricks and Treats of Outland (Alliance)
      [969] = {Faction = 'Alliance', OtherSide = 968, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Tricks and Treats of Azeroth (Alliance)
      [970] = {Faction = 'Alliance', OtherSide = 971, Merged = LE_EXPANSION_MISTS_OF_PANDARIA, MergedId = 971, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Tricks and Treats of Azeroth (Horde)
      [971] = {Faction = 'Horde', OtherSide = 970, Merged = LE_EXPANSION_MISTS_OF_PANDARIA, MergedId = 971, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Trick or Treat!
      [972] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- The Mask Task
      [979] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- That Sparkling Smile
      [981] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Rotten Hallow (Alliance)
      [1040] = {Faction = 'Alliance', OtherSide = 1041, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Rotten Hallow (Horde)
      [1041] = {Faction = 'Horde', OtherSide = 1040, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- G.N.E.R.D. Rage
      [1261] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Hallow's End Ends
    -- Pilgrim's Bounty Start
      -- Pilgrim's Paunch (Alliance)
      [3556] = {Faction = 'Alliance', OtherSide = 3557, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Pilgrim's Paunch (Horde)
      [3557] = {Faction = 'Horde', OtherSide = 3556, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Sharing is Caring
      [3558] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Turkey Lurkey
      [3559] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Now We're Cookin' (Alliance)
      [3576] = {Faction = 'Alliance', OtherSide = 3577, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Now We're Cookin' (Horde)
      [3577] = {Faction = 'Horde', OtherSide = 3576, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- The Turkinator
      [3578] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- 'FOOD FIGHT!'
      [3579] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Pilgrim's Peril (Alliance)
      [3580] = {Faction = 'Alliance', OtherSide = 3581, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Pilgrim's Peril (Horde)
      [3581] = {Faction = 'Horde', OtherSide = 3580, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Terokkar Turkey Time
      [3582] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Pilgrim's Progress (Alliance)
      [3596] = {Faction = 'Alliance', OtherSide = 3597, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Pilgrim's Progress (Horde)
      [3597] = {Faction = 'Horde', OtherSide = 3596, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Pilgrim's Bounty Ends
    -- Winter Veil Start
      -- With a Little Helper from My Friends
      [252] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Scrooge (Horde)
      [259] = {Faction = 'Horde', OtherSide = 1255, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- On Metzen!
      [273] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- 'Tis the Season
      [277] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Simply Abominable
      [279] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Scrooge (Alliance)
      [1255] = {Faction = 'Alliance', OtherSide = 259, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Fa-la-la-la-Ogri'la
      [1282] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Crashin' & Thrashin'
      [1295] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Holiday Bromance (Horde)
      [1685] = {Faction = 'Horde', OtherSide = 1686, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Holiday Bromance (Alliance)
      [1686] = {Faction = 'Alliance', OtherSide = 1685, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- Let It Snow
      [1687] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- The Winter Veil Gourmet
      [1688] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- He Knows If You've Been Naughty
      [1689] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- A Frosty Shake
      [1690] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
      -- BB King (Alliance)
      [4436] = {Faction = 'Alliance', OtherSide = 4437, Phase = EXPANSION_03_PHASE0_PREPATH},
      -- BB King (Horde)
      [4437] = {Faction = 'Horde', OtherSide = 4436, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Winter Veil Ends
    -- Argent Tournament Start
      -- Argent Aspiration
      [2756] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_DUNGEONS},
      -- Argent Valor
      [2758] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_DUNGEONS},
      -- Exalted Champion of Darnassus (Alliance)
      [2760] = {Faction = 'Alliance', OtherSide = 2769, Phase = EXPANSION_03_PHASE4_ICC_DUNGEONS},
      -- Exalted Champion of the Exodar (Alliance)
      [2761] = {Faction = 'Alliance', OtherSide = 2767, Phase = EXPANSION_03_PHASE4_ICC_DUNGEONS},
      -- Exalted Champion of Gnomeregan (Alliance)
      [2762] = {Faction = 'Alliance', OtherSide = 2766, Phase = EXPANSION_03_PHASE4_ICC_DUNGEONS},
      -- Exalted Champion of Ironforge (Alliance)
      [2763] = {Faction = 'Alliance', OtherSide = 2768, Phase = EXPANSION_03_PHASE4_ICC_DUNGEONS},
      -- Exalted Champion of Stormwind (Alliance)
      [2764] = {Faction = 'Alliance', OtherSide = 2765, Phase = EXPANSION_03_PHASE4_ICC_DUNGEONS},
      -- Exalted Champion of Orgrimmar (Horde)
      [2765] = {Faction = 'Horde', OtherSide = 2764, Phase = EXPANSION_03_PHASE4_ICC_DUNGEONS},
      -- Exalted Champion of Sen'jin (Horde)
      [2766] = {Faction = 'Horde', OtherSide = 2762, Phase = EXPANSION_03_PHASE4_ICC_DUNGEONS},
      -- Exalted Champion of Silvermoon City (Horde)
      [2767] = {Faction = 'Horde', OtherSide = 2761, Phase = EXPANSION_03_PHASE4_ICC_DUNGEONS},
      -- Exalted Champion of Thunder Bluff (Horde)
      [2768] = {Faction = 'Horde', OtherSide = 2763, Phase = EXPANSION_03_PHASE4_ICC_DUNGEONS},
      -- Exalted Champion of the Undercity (Horde)
      [2769] = {Faction = 'Horde', OtherSide = 2760, Phase = EXPANSION_03_PHASE4_ICC_DUNGEONS},
      -- Exalted Champion of the Alliance (Alliance)
      [2770] = {Faction = 'Alliance', OtherSide = 2771, Phase = EXPANSION_03_PHASE4_ICC_DUNGEONS},
      -- Exalted Champion of the Horde (Horde)
      [2771] = {Faction = 'Horde', OtherSide = 2770, Phase = EXPANSION_03_PHASE4_ICC_DUNGEONS},
      -- Tilted!
      [2772] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_DUNGEONS},
      -- It's Just a Flesh Wound
      [2773] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_DUNGEONS},
      -- Champion of Darnassus (Alliance)
      [2777] = {Faction = 'Alliance', OtherSide = 2787, Phase = EXPANSION_03_PHASE4_ICC_DUNGEONS},
      -- Champion of the Exodar (Alliance)
      [2778] = {Faction = 'Alliance', OtherSide = 2785, Phase = EXPANSION_03_PHASE4_ICC_DUNGEONS},
      -- Champion of Gnomeregan (Alliance)
      [2779] = {Faction = 'Alliance', OtherSide = 2784, Phase = EXPANSION_03_PHASE4_ICC_DUNGEONS},
      -- Champion of Ironforge (Alliance)
      [2780] = {Faction = 'Alliance', OtherSide = 2786, Phase = EXPANSION_03_PHASE4_ICC_DUNGEONS},
      -- Champion of Stormwind (Alliance)
      [2781] = {Faction = 'Alliance', OtherSide = 2783, Phase = EXPANSION_03_PHASE4_ICC_DUNGEONS},
      -- Champion of the Alliance (Alliance)
      [2782] = {Faction = 'Alliance', OtherSide = 2788, Phase = EXPANSION_03_PHASE4_ICC_DUNGEONS},
      -- Champion of Orgrimmar (Horde)
      [2783] = {Faction = 'Horde', OtherSide = 2781, Phase = EXPANSION_03_PHASE4_ICC_DUNGEONS},
      -- Champion of Sen'jin (Horde)
      [2784] = {Faction = 'Horde', OtherSide = 2779, Phase = EXPANSION_03_PHASE4_ICC_DUNGEONS},
      -- Champion of Silvermoon City (Horde)
      [2785] = {Faction = 'Horde', OtherSide = 2778, Phase = EXPANSION_03_PHASE4_ICC_DUNGEONS},
      -- Champion of Thunder Bluff (Horde)
      [2786] = {Faction = 'Horde', OtherSide = 2780, Phase = EXPANSION_03_PHASE4_ICC_DUNGEONS},
      -- Champion of the Undercity (Horde)
      [2787] = {Faction = 'Horde', OtherSide = 2777, Phase = EXPANSION_03_PHASE4_ICC_DUNGEONS},
      -- Champion of the Horde (Horde)
      [2788] = {Faction = 'Horde', OtherSide = 2782, Phase = EXPANSION_03_PHASE4_ICC_DUNGEONS},
      -- Exalted Argent Champion of the Horde (Horde)
      [2816] = {Faction = 'Horde', OtherSide = 2817, Phase = EXPANSION_03_PHASE4_ICC_DUNGEONS},
      -- Exalted Argent Champion of the Alliance (Alliance)
      [2817] = {Faction = 'Alliance', OtherSide = 2816, Phase = EXPANSION_03_PHASE4_ICC_DUNGEONS},
      -- Lance a Lot
      [2836] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_DUNGEONS},
      -- A Silver Confidant (Alliance)
      [3676] = {Faction = 'Alliance', OtherSide = 3677, Phase = EXPANSION_03_PHASE4_ICC_DUNGEONS},
      -- The Sunreavers (Horde)
      [3677] = {Faction = 'Horde', OtherSide = 3676, Phase = EXPANSION_03_PHASE4_ICC_DUNGEONS},
      -- Pony Up!
      [3736] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_DUNGEONS},
      -- The Sword in the Skull
      [4596] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_DUNGEONS},
    -- Argent Tournament Ends
  -- World Events End

  -- Feats of Strength Start
    -- Murky
    [411] = {Faction = 'Both', Phase = UNRELEASED_PROMOTIONS, Retroactive = true},
    -- Murloc Costume
    [412] = {Faction = 'Both', Phase = UNRELEASED_PROMOTIONS, Retroactive = true},
    -- Tyrael's Hilt
    [414] = {Faction = 'Both', Phase = UNRELEASED_PROMOTIONS, Retroactive = true},
    -- Big Blizzard Bear
    [415] = {Faction = 'Both', Phase = UNRELEASED_PROMOTIONS, Retroactive = true},
    -- Scarab Lord
    [416] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Merciless Gladiator
    [418] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Vengeful Gladiator
    [419] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Brutal Gladiator
    [420] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Why? Because It's Red
    [424] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Atiesh, Greatstaff of the Guardian
    [425] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Warglaives of Azzinoth
    [426] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Thunderfury, Blessed Blade of the Windseeker
    [428] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Sulfuras, Hand of Ragnaros
    [429] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Amani War Bear
    [430] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Hand of A'dal
    [431] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Champion of the Naaru
    [432] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Grand Marshal (Alliance)
    [433] = {Faction = 'Alliance', OtherSide = 443, Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true, VanillaOnly = true},
    -- Field Marshal (Alliance)
    [434] = {Faction = 'Alliance', OtherSide = 445, Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true, VanillaOnly = true},
    -- Commander (Alliance)
    [435] = {Faction = 'Alliance', OtherSide = 444, Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true, VanillaOnly = true},
    -- Lieutenant Commander (Alliance)
    [436] = {Faction = 'Alliance', OtherSide = 447, Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true, VanillaOnly = true},
    -- Knight-Champion (Alliance)
    [437] = {Faction = 'Alliance', OtherSide = 448, Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true, VanillaOnly = true},
    -- Knight-Captain (Alliance)
    [438] = {Faction = 'Alliance', OtherSide = 469, Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true, VanillaOnly = true},
    -- Knight (Alliance)
    [439] = {Faction = 'Alliance', OtherSide = 451, Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true, VanillaOnly = true},
    -- Sergeant Major (Alliance)
    [440] = {Faction = 'Alliance', OtherSide = 452, Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true, VanillaOnly = true},
    -- Master Sergeant (Alliance)
    [441] = {Faction = 'Alliance', OtherSide = 450, Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true, VanillaOnly = true},
    -- Private (Alliance)
    [442] = {Faction = 'Alliance', OtherSide = 454, Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true, VanillaOnly = true},
    -- High Warlord (Horde)
    [443] = {Faction = 'Horde', OtherSide = 433, Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true, VanillaOnly = true},
    -- Lieutenant General (Horde)
    [444] = {Faction = 'Horde', OtherSide = 435, Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true, VanillaOnly = true},
    -- Warlord (Horde)
    [445] = {Faction = 'Horde', OtherSide = 434, Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true, VanillaOnly = true},
    -- General (Horde)
    [446] = {Faction = 'Horde', OtherSide = 473, Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true, VanillaOnly = true},
    -- Champion (Horde)
    [447] = {Faction = 'Horde', OtherSide = 436, Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true, VanillaOnly = true},
    -- Centurion (Horde)
    [448] = {Faction = 'Horde', OtherSide = 437, Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true, VanillaOnly = true},
    -- Blood Guard (Horde)
    [449] = {Faction = 'Horde', OtherSide = 472, Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true, VanillaOnly = true},
    -- Senior Sergeant (Horde)
    [450] = {Faction = 'Horde', OtherSide = 441, Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true, VanillaOnly = true},
    -- Stone Guard (Horde)
    [451] = {Faction = 'Horde', OtherSide = 439, Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true, VanillaOnly = true},
    -- First Sergeant (Horde)
    [452] = {Faction = 'Horde', OtherSide = 440, Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true, VanillaOnly = true},
    -- Sergeant (Horde)
    [453] = {Faction = 'Horde', OtherSide = 471, Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true, VanillaOnly = true},
    -- Scout (Horde)
    [454] = {Faction = 'Horde', OtherSide = 442, Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true, VanillaOnly = true},
    -- Realm First! Obsidian Slayer
    [456] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
    -- Realm First! Level 80
    [457] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Realm First! Level 80 Rogue
    [458] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Realm First! Level 80 Warrior
    [459] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Realm First! Level 80 Mage
    [460] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Realm First! Level 80 Death Knight
    [461] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Realm First! Level 80 Hunter
    [462] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Realm First! Level 80 Warlock
    [463] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Realm First! Level 80 Priest
    [464] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Realm First! Level 80 Paladin
    [465] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Realm First! Level 80 Druid
    [466] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Realm First! Level 80 Shaman
    [467] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Grunt (Horde)
    [468] = {Faction = 'Horde', OtherSide = 470, Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Legionnaire (Horde)
    [469] = {Faction = 'Horde', OtherSide = 438, Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Corporal (Alliance)
    [470] = {Faction = 'Alliance', OtherSide = 468, Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Sergeant (Alliance)
    [471] = {Faction = 'Alliance', OtherSide = 453, Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Knight-Lieutenant (Alliance)
    [472] = {Faction = 'Alliance', OtherSide = 449, Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Marshal (Alliance)
    [473] = {Faction = 'Alliance', OtherSide = 446, Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Collector's Edition: Mini-Diablo
    [662] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Collector's Edition: Panda
    [663] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Collector's Edition: Zergling
    [664] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Collector's Edition: Netherwhelp
    [665] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Collector's Edition: Frost Wyrm Whelp
    [683] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Onyxia's Lair (Level 60)
    [684] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Thori'dal, the Stars' Fury
    [725] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Deathcharger's Reins
    [729] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Avast Ye, Admiral!
    [871] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Old School Ride
    [879] = {Faction = 'Both', Phase = UNRELEASED_PROMOTIONS, Retroactive = true, VanillaOnly = true},
    -- Swift Zulian Tiger
    [880] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Swift Razzashi Raptor
    [881] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Fiery Warhorse's Reins
    [882] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Reins of the Raven Lord
    [883] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Swift White Hawkstrider
    [884] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Ashes of Al'ar
    [885] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Swift Nether Drake
    [886] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Merciless Nether Drake
    [887] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Vengeful Nether Drake
    [888] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- The Horseman's Reins
    [980] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Hero of Shattrath
    [1205] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Yellow Brewfest Stein (Never available in Classic. TBC started with 2008 Reward Blue Brewfest Stein)
    [1292] = {Faction = 'Both', Phase = UNRELEASED_PROMOTIONS, Retroactive = true},
    -- Blue Brewfest Stein
    [1293] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Realm First! Magic Seeker
    [1400] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
    -- Realm First! Conqueror of Naxxramas
    [1402] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
    -- Realm First! Level 80 Gnome
    [1404] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Realm First! Level 80 Blood Elf
    [1405] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Realm First! Level 80 Draenei
    [1406] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Realm First! Level 80 Dwarf
    [1407] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Realm First! Level 80 Human
    [1408] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Realm First! Level 80 Night Elf
    [1409] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Realm First! Level 80 Orc
    [1410] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Realm First! Level 80 Tauren
    [1411] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Realm First! Level 80 Troll
    [1412] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Realm First! Level 80 Forsaken
    [1413] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Realm First! Grand Master Blacksmith
    [1414] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Realm First! Grand Master Alchemist
    [1415] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Realm First! Cooking Grand Master
    [1416] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Realm First! Grand Master Enchanter
    [1417] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Realm First! Grand Master Engineer
    [1418] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Realm First! First Aid Grand Master
    [1419] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Realm First! Grand Master Angler
    [1420] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Realm First! Grand Master Herbalist
    [1421] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Realm First! Grand Master Scribe
    [1422] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Realm First! Grand Master Jewelcrafter
    [1423] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Realm First! Grand Master Leatherworker
    [1424] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Realm First! Grand Master Miner
    [1425] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Realm First! Grand Master Skinner
    [1426] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Realm First! Grand Master Tailor
    [1427] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Friends In High Places
    [1436] = {Faction = 'Both', Phase = UNRELEASED_PROMOTIONS},
    -- Realm First! Northrend Vanguard
    [1463] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Competitor's Tabard
    [1636] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Spirit of Competition
    [1637] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Clockwork Rocket Bot
    [1705] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Crashin' Thrashin' Racer
    [1706] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Timear Foresees
    [2018] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Proof of Demise
    [2019] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Tabard of the Protector
    [2079] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Grand Black War Mammoth
    [2081] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_RAIDS},
    -- Tabard of the Argent Dawn
    [2116] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Brutal Nether Drake
    [2316] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Insane in the Membrane
    [2336] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Dreadsteed of Xoroth
    [2357] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Charger
    [2358] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Swift Flight Form
    [2359] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- WoW's 4th Anniversary
    [2398] = {Faction = 'Both', Phase = UNRELEASED_PROMOTIONS},
    -- Vampire Hunter
    [2456] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- The Fifth Element
    [2496] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Deadly Gladiator's Frostwyrm
    [3096] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_ARENA_SEASON_5_END},
    -- Realm First! Death's Demise
    [3117] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
    -- Val'anyr, Hammer of Ancient Kings
    [3142] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
    -- Realm First! Celestial Defender
    [3259] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
    -- Deadly Gladiator
    [3336] = {Faction = 'Both', Phase = EXPANSION_03_PHASE1_ARENA_SEASON_5_END},
    -- Winterspring Frostsaber (Alliance)
    [3356] = {Faction = 'Alliance', OtherSide = 3357, Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- Venomhide Ravasaur (Horde)
    [3357] = {Faction = 'Horde', OtherSide = 3356, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Furious Gladiator
    [3436] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ARENA_SEASON_6_END},
    -- A Brew-FAST Mount
    [3496] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH, Retroactive = true},
    -- The Marine Marine
    [3536] = {Faction = 'Both', Phase = UNRELEASED_PROMOTIONS},
    -- Murkimus the Gladiator
    [3618] = {Faction = 'Both', Phase = UNRELEASED_PROMOTIONS},
    -- Jade Tiger
    [3636] = {Faction = 'Both', Phase = UNRELEASED_PROMOTIONS},
    -- Furious Gladiator's Frostwyrm
    [3756] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ARENA_SEASON_6_END},
    -- Relentless Gladiator's Frostwyrm
    [3757] = {Faction = 'Both', Phase = EXPANSION_03_PHASE3_ARENA_SEASON_7_END},
    -- Relentless Gladiator
    [3758] = {Faction = 'Both', Phase = EXPANSION_03_PHASE3_ARENA_SEASON_7_END},
    -- Onyx Panther
    [3896] = {Faction = 'Both', Phase = UNRELEASED_PROMOTIONS},
    -- Realm First! Grand Crusader
    [4078] = {Faction = 'Both', Phase = EXPANSION_03_PHASE3_TRIAL_OF_CRUSADER},
    -- A Tribute to Immortality (Horde)
    [4079] = {Faction = 'Horde', OtherSide = 4156, Phase = EXPANSION_03_PHASE3_TRIAL_OF_CRUSADER},
    -- A Tribute to Immortality (Alliance)
    [4156] = {Faction = 'Alliance', OtherSide = 4079, Phase = EXPANSION_03_PHASE3_TRIAL_OF_CRUSADER},
    -- WoW's 5th Anniversary
    [4400] = {Faction = 'Both', Phase = UNRELEASED_PROMOTIONS},
    -- It's Over Nine Thousand!
    [4496] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Realm First! Fall of the Lich King
    [4576] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
    -- Wrathful Gladiator
    [4599] = {Faction = 'Both', Phase = EXPANSION_03_PHASE6_ARENA_SEASON_8_END},
    -- Wrathful Gladiator's Frostwyrm
    [4600] = {Faction = 'Both', Phase = EXPANSION_03_PHASE6_ARENA_SEASON_8_END},
    -- Shadowmourne
    [4623] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
    -- Invincible's Reins
    [4625] = {Faction = 'Both', Phase = EXPANSION_03_PHASE4_ICC_RAID},
    -- And I'll Form the Head!
    [4626] = {Faction = 'Both', Phase = EXPANSION_03_PHASE2_ULDUAR},
    -- X-45 Heartbreaker
    [4627] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Green Brewfest Stein
    [4782] = {Faction = 'Both', Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Emblematic (Alliance)
    [4784] = {Faction = 'Alliance', OtherSide = 4785, Removed = LE_EXPANSION_CATACLYSM, Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Emblematic (Horde)
    [4785] = {Faction = 'Horde', OtherSide = 4784, Removed = LE_EXPANSION_CATACLYSM, Phase = EXPANSION_03_PHASE1_CLASSIC_WOTLK_LAUNCH},
    -- Operation: Gnomeregan (Alliance)
    [4786] = {Faction = 'Alliance', OtherSide = 4790, Phase = EXPANSION_03_PHASE6_GNOMETROLL_EVENT},
    -- Zalazane's Fall (Horde)
    [4790] = {Faction = 'Horde', OtherSide = 4786, Phase = EXPANSION_03_PHASE6_GNOMETROLL_EVENT},
    -- Collector's Edition: Mini Thor
    [4824] = {Faction = 'Both', Phase = UNRELEASED_PROMOTIONS},
    -- Infernal Gladiator
    [15018] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Gladiator: Season 1
    [15019] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Duelist: Season 1
    [15020] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Rival: Season 1
    [15021] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Challenger: Season 1
    [15022] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- [DNT] BCC Arena Tournament - Vanquisher Title
    --[15198] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Gladiator: Season 2
    [15199] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Gladiator: Season 4
    [15200] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Duelist: Season 4
    [15201] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Rival: Season 4
    [15202] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Challenger: Season 4
    [15203] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Gladiator: Season 3
    [15204] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Duelist: Season 3
    [15205] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Rival: Season 3
    [15206] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Challenger: Season 3
    [15207] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Duelist: Season 2
    [15208] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Rival: Season 2
    [15209] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Challenger: Season 2
    [15210] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Survivor of the Firelord (Season of Mastery)
    [15330] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_01_PHASE0_SEASON_OF_MASTERY},
    -- [DNT] Survivor (Season of Mastery) (hidden)
    --[15332] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_01_PHASE0_SEASON_OF_MASTERY},
    -- Survivor of the Shadow Flame (Season of Mastery)
    [15333] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_01_PHASE0_SEASON_OF_MASTERY},
    -- Survivor of the Old God (Season of Mastery)
    [15334] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_01_PHASE0_SEASON_OF_MASTERY},
    -- Survivor of the Damned (Season of Mastery)
    [15335] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_01_PHASE0_SEASON_OF_MASTERY},
    -- The Immortal (Season of Mastery)
    [15637] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_01_PHASE0_SEASON_OF_MASTERY},
    -- &lt;Hidden&gt; Joyous Journeys - Hit 70 with Buff Joyous Journeys
    --[15853] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- The Perfect Pebble
    [16332] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- [DNT] Heirloom Tracking - Bloodied Arcanite Reaper (Hidden)
    --[16397] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Soul of Iron (Season of Mastery)
    [16433] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_01_PHASE0_SEASON_OF_MASTERY},
    -- [DNT] Soul of Iron Tracker (Season of Mastery) (hidden)
    --[16437] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_01_PHASE0_SEASON_OF_MASTERY},
    -- [DNT] Joyous Journeys - Hit 80 with Buff Joyous Journeys (hidden)
    --[17328] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- Ahead of the Curve: Yogg-Saron
    [17340] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE2_ULDUAR},
    -- Cutting Edge: Ulduar
    [17341] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE2_ULDUAR},
    -- [DNT] Joyous Journeys - Hit 80 with Buff Joyous Journeys (hidden)
    --[18375] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE0_PREPATH},
    -- [DNT] Joyous Journeys - Hit 80 with Buff Joyous Journeys (hidden)
    --[18376] = {Faction = 'Both', ClassicOnly = true, Phase = EXPANSION_03_PHASE0_PREPATH},
  -- Feats of Strength End
};