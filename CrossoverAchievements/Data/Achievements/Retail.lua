local CrossoverAchievements = LibStub("AceAddon-3.0"):GetAddon("CrossoverAchievements");
local GameVersion_Retail = "Retail";

CrossoverAchievements.Data = CrossoverAchievements.Data or {};
CrossoverAchievements.Data.Achievements = CrossoverAchievements.Data.Achievements or {};
CrossoverAchievements.Data.Achievements[GameVersion_Retail] = CrossoverAchievements.Data.Achievements[GameVersion_Retail] or {};

CrossoverAchievements.Data.Achievements[GameVersion_Retail].List = {
  -- Feats of Strength Start
    -- Mounts Start
      -- Winterspring Frostsaber (Alliance)
      [3356] = {Faction = 'Alliance', OtherSide = 3357},
      -- Venomhide Ravasaur (Horde)
      [3357] = {Faction = 'Horde', OtherSide = 3356},
    -- Mounts Ends
    -- Raids Start
      -- A Tribute to Immortality (Horde)
      [4079] = {Faction = 'Horde', OtherSide = 4156},
      -- A Tribute to Immortality (Alliance)
      [4156] = {Faction = 'Alliance', OtherSide = 4079},
    -- Raids Ends
    -- Player vs. Player Start
      -- Hero of the Alliance: Vicious (Alliance)
      [5344] = {Faction = 'Alliance', OtherSide = 5358},
      -- Hero of the Horde: Vicious (Horde)
      [5358] = {Faction = 'Horde', OtherSide = 5344},
      -- Hero of the Alliance: Ruthless (Alliance)
      [6316] = {Faction = 'Alliance', OtherSide = 6317},
      -- Hero of the Horde: Ruthless (Horde)
      [6317] = {Faction = 'Horde', OtherSide = 6316},
      -- Hero of the Alliance: Cataclysmic (Alliance)
      [6939] = {Faction = 'Alliance', OtherSide = 6940},
      -- Hero of the Horde: Cataclysmic (Horde)
      [6940] = {Faction = 'Horde', OtherSide = 6939},
      -- Hero of the Alliance: Malevolent (Alliance)
      [8243] = {Faction = 'Alliance', OtherSide = 8244},
      -- Hero of the Horde: Malevolent (Horde)
      [8244] = {Faction = 'Horde', OtherSide = 8243},
      -- Hero of the Alliance: Tyrannical (Alliance)
      [8652] = {Faction = 'Alliance', OtherSide = 8653},
      -- Hero of the Horde: Tyrannical (Horde)
      [8653] = {Faction = 'Horde', OtherSide = 8652},
      -- Hero of the Alliance: Grievous (Alliance)
      [8654] = {Faction = 'Alliance', OtherSide = 8657},
      -- Hero of the Horde: Grievous (Horde)
      [8657] = {Faction = 'Horde', OtherSide = 8654},
      -- Hero of the Alliance: Prideful (Alliance)
      [8658] = {Faction = 'Alliance', OtherSide = 8659},
      -- Hero of the Horde: Prideful (Horde)
      [8659] = {Faction = 'Horde', OtherSide = 8658},
      -- Hero of the Alliance: Primal (Alliance)
      [9230] = {Faction = 'Alliance', OtherSide = 9231},
      -- Hero of the Horde: Primal (Horde)
      [9231] = {Faction = 'Horde', OtherSide = 9230},
      -- Soldier of the Alliance: Warlords Season 1 (Alliance)
      [9995] = {Faction = 'Alliance', OtherSide = 9998},
      -- Defender of the Alliance: Warlords Season 1 (Alliance)
      [9996] = {Faction = 'Alliance', OtherSide = 10001},
      -- Guardian of the Alliance: Warlords Season 1 (Alliance)
      [9997] = {Faction = 'Alliance', OtherSide = 10000},
      -- Soldier of the Horde: Warlords Season 1 (Horde)
      [9998] = {Faction = 'Horde', OtherSide = 9995},
      -- Guardian of the Horde: Warlords Season 1 (Horde)
      [10000] = {Faction = 'Horde', OtherSide = 9997},
      -- Defender of the Horde: Warlords Season 1 (Horde)
      [10001] = {Faction = 'Horde', OtherSide = 9996},
      -- Warmongering Combatant (Horde)
      [10094] = {Faction = 'Horde', OtherSide = 10095},
      -- Warmongering Combatant (Alliance)
      [10095] = {Faction = 'Alliance', OtherSide = 10094},
      -- Hero of the Alliance: Wild (Alliance)
      [10102] = {Faction = 'Alliance', OtherSide = 10103},
      -- Hero of the Horde: Wild (Horde)
      [10103] = {Faction = 'Horde', OtherSide = 10102},
      -- Soldier of the Alliance: Warlords Season 2 (Alliance)
      [10104] = {Faction = 'Alliance', OtherSide = 10105},
      -- Soldier of the Horde: Warlords Season 2 (Horde)
      [10105] = {Faction = 'Horde', OtherSide = 10104},
      -- Defender of the Alliance: Warlords Season 2 (Alliance)
      [10106] = {Faction = 'Alliance', OtherSide = 10107},
      -- Defender of the Horde: Warlords Season 2 (Horde)
      [10107] = {Faction = 'Horde', OtherSide = 10106},
      -- Guardian of the Alliance: Warlords Season 2 (Alliance)
      [10108] = {Faction = 'Alliance', OtherSide = 10109},
      -- Guardian of the Horde: Warlords Season 2 (Horde)
      [10109] = {Faction = 'Horde', OtherSide = 10108},
      -- Hero of the Alliance: Warmongering (Alliance)
      [10114] = {Faction = 'Alliance', OtherSide = 10115},
      -- Hero of the Horde: Warmongering (Horde)
      [10115] = {Faction = 'Horde', OtherSide = 10114},
      -- Guardian of the Alliance: Warlords Season 3 (Alliance)
      [10116] = {Faction = 'Alliance', OtherSide = 10117},
      -- Guardian of the Horde: Warlords Season 3 (Horde)
      [10117] = {Faction = 'Horde', OtherSide = 10116},
      -- Defender of the Alliance: Warlords Season 3 (Alliance)
      [10118] = {Faction = 'Alliance', OtherSide = 10119},
      -- Defender of the Horde: Warlords Season 3 (Horde)
      [10119] = {Faction = 'Horde', OtherSide = 10118},
      -- Soldier of the Alliance: Warlords Season 3 (Alliance)
      [10120] = {Faction = 'Alliance', OtherSide = 10121},
      -- Soldier of the Horde: Warlords Season 3 (Horde)
      [10121] = {Faction = 'Horde', OtherSide = 10120},
      -- Vindictive Combatant (Horde)
      [10997] = {Faction = 'Horde', OtherSide = 10998},
      -- Vindictive Combatant (Alliance)
      [10998] = {Faction = 'Alliance', OtherSide = 10997},
      -- Fearless Combatant (Horde)
      [11003] = {Faction = 'Horde', OtherSide = 11004},
      -- Fearless Combatant (Alliance)
      [11004] = {Faction = 'Alliance', OtherSide = 11003},
      -- Cruel Combatant (Horde)
      [11005] = {Faction = 'Horde', OtherSide = 11008},
      -- Cruel Combatant (Alliance)
      [11008] = {Faction = 'Alliance', OtherSide = 11005},
      -- Ferocious Combatant (Horde)
      [11009] = {Faction = 'Horde', OtherSide = 11010},
      -- Ferocious Combatant (Alliance)
      [11010] = {Faction = 'Alliance', OtherSide = 11009},
      -- Hero of the Alliance: Vindictive (Alliance)
      [11018] = {Faction = 'Alliance', OtherSide = 11019},
      -- Hero of the Horde: Vindictive (Horde)
      [11019] = {Faction = 'Horde', OtherSide = 11018},
      -- Guardian of the Alliance: Legion Season 1 (Alliance)
      [11020] = {Faction = 'Alliance', OtherSide = 11021},
      -- Guardian of the Horde: Legion Season 1 (Horde)
      [11021] = {Faction = 'Horde', OtherSide = 11020},
      -- Defender of the Alliance: Legion Season 1 (Alliance)
      [11022] = {Faction = 'Alliance', OtherSide = 11023},
      -- Defender of the Horde: Legion Season 1 (Horde)
      [11023] = {Faction = 'Horde', OtherSide = 11022},
      -- Soldier of the Alliance: Legion Season 1 (Alliance)
      [11024] = {Faction = 'Alliance', OtherSide = 11025},
      -- Soldier of the Horde: Legion Season 1 (Horde)
      [11025] = {Faction = 'Horde', OtherSide = 11024},
      -- Hero of the Horde: Fearless (Horde)
      [11029] = {Faction = 'Horde', OtherSide = 11030},
      -- Hero of the Alliance: Fearless (Alliance)
      [11030] = {Faction = 'Alliance', OtherSide = 11029},
      -- Guardian of the Horde: Legion Season 2 (Horde)
      [11031] = {Faction = 'Horde', OtherSide = 11032},
      -- Guardian of the Alliance: Legion Season 2 (Alliance)
      [11032] = {Faction = 'Alliance', OtherSide = 11031},
      -- Defender of the Horde: Legion Season 2 (Horde)
      [11033] = {Faction = 'Horde', OtherSide = 11034},
      -- Defender of the Alliance: Legion Season 2 (Alliance)
      [11034] = {Faction = 'Alliance', OtherSide = 11033},
      -- Soldier of the Horde: Legion Season 2 (Horde)
      [11035] = {Faction = 'Horde', OtherSide = 11036},
      -- Soldier of the Alliance: Legion Season 2 (Alliance)
      [11036] = {Faction = 'Alliance', OtherSide = 11035},
      -- Hero of the Horde: Cruel (Horde)
      [11042] = {Faction = 'Horde', OtherSide = 11043},
      -- Hero of the Alliance: Cruel (Alliance)
      [11043] = {Faction = 'Alliance', OtherSide = 11042},
      -- Defender of the Horde: Legion Season 3 (Horde)
      [11044] = {Faction = 'Horde', OtherSide = 11045},
      -- Defender of the Alliance: Legion Season 3 (Alliance)
      [11045] = {Faction = 'Alliance', OtherSide = 11044},
      -- Guardian of the Horde: Legion Season 3 (Horde)
      [11046] = {Faction = 'Horde', OtherSide = 11047},
      -- Guardian of the Alliance: Legion Season 3 (Alliance)
      [11047] = {Faction = 'Alliance', OtherSide = 11046},
      -- Soldier of the Horde: Legion Season 3 (Horde)
      [11048] = {Faction = 'Horde', OtherSide = 11049},
      -- Soldier of the Alliance: Legion Season 3 (Alliance)
      [11049] = {Faction = 'Alliance', OtherSide = 11048},
      -- Soldier of the Alliance: Legion Season 4 (Alliance)
      [11050] = {Faction = 'Alliance', OtherSide = 11051},
      -- Soldier of the Horde: Legion Season 4 (Horde)
      [11051] = {Faction = 'Horde', OtherSide = 11050},
      -- Guardian of the Alliance: Legion Season 4 (Alliance)
      [11052] = {Faction = 'Alliance', OtherSide = 11053},
      -- Guardian of the Horde: Legion Season 4 (Horde)
      [11053] = {Faction = 'Horde', OtherSide = 11052},
      -- Defender of the Alliance: Legion Season 4 (Alliance)
      [11054] = {Faction = 'Alliance', OtherSide = 11055},
      -- Defender of the Horde: Legion Season 4 (Horde)
      [11055] = {Faction = 'Horde', OtherSide = 11054},
      -- Hero of the Alliance: Ferocious (Alliance)
      [11056] = {Faction = 'Alliance', OtherSide = 11057},
      -- Hero of the Horde: Ferocious (Horde)
      [11057] = {Faction = 'Horde', OtherSide = 11056},
      -- Fierce Combatant (Horde)
      [12031] = {Faction = 'Horde', OtherSide = 12032},
      -- Fierce Combatant (Alliance)
      [12032] = {Faction = 'Alliance', OtherSide = 12031},
      -- Hero of the Alliance: Fierce (Alliance)
      [12037] = {Faction = 'Alliance', OtherSide = 12041},
      -- Guardian of the Alliance: Legion Season 5 (Alliance)
      [12038] = {Faction = 'Alliance', OtherSide = 12042},
      -- Defender of the Alliance: Legion Season 5 (Alliance)
      [12039] = {Faction = 'Alliance', OtherSide = 12043},
      -- Soldier of the Alliance: Legion Season 5 (Alliance)
      [12040] = {Faction = 'Alliance', OtherSide = 12044},
      -- Hero of the Horde: Fierce (Horde)
      [12041] = {Faction = 'Horde', OtherSide = 12037},
      -- Guardian of the Horde: Legion Season 5 (Horde)
      [12042] = {Faction = 'Horde', OtherSide = 12038},
      -- Defender of the Horde: Legion Season 5 (Horde)
      [12043] = {Faction = 'Horde', OtherSide = 12039},
      -- Soldier of the Horde: Legion Season 5 (Horde)
      [12044] = {Faction = 'Horde', OtherSide = 12040},
      -- Hero of the Horde: Dominant (Horde)
      [12172] = {Faction = 'Horde', OtherSide = 12173},
      -- Hero of the Alliance: Dominant (Alliance)
      [12173] = {Faction = 'Alliance', OtherSide = 12172},
      -- Defender of the Horde: Legion Season 6 (Horde)
      [12174] = {Faction = 'Horde', OtherSide = 12175},
      -- Defender of the Alliance: Legion Season 6 (Alliance)
      [12175] = {Faction = 'Alliance', OtherSide = 12174},
      -- Guardian of the Horde: Legion Season 6 (Horde)
      [12176] = {Faction = 'Horde', OtherSide = 12177},
      -- Guardian of the Alliance: Legion Season 6 (Alliance)
      [12177] = {Faction = 'Alliance', OtherSide = 12176},
      -- Soldier of the Horde: Legion Season 6 (Horde)
      [12178] = {Faction = 'Horde', OtherSide = 12179},
      -- Soldier of the Alliance: Legion Season 6 (Alliance)
      [12179] = {Faction = 'Alliance', OtherSide = 12178},
      -- Soldier of the Alliance: Legion Season 7 (Alliance)
      [12189] = {Faction = 'Alliance', OtherSide = 12190},
      -- Soldier of the Horde: Legion Season 7 (Horde)
      [12190] = {Faction = 'Horde', OtherSide = 12189},
      -- Guardian of the Alliance: Legion Season 7 (Alliance)
      [12191] = {Faction = 'Alliance', OtherSide = 12192},
      -- Guardian of the Horde: Legion Season 7 (Horde)
      [12192] = {Faction = 'Horde', OtherSide = 12191},
      -- Defender of the Horde: Legion Season 7 (Horde)
      [12194] = {Faction = 'Horde', OtherSide = 12195},
      -- Defender of the Alliance: Legion Season 7 (Alliance)
      [12195] = {Faction = 'Alliance', OtherSide = 12194},
      -- Hero of the Horde: Demonic (Horde)
      [12196] = {Faction = 'Horde', OtherSide = 12197},
      -- Hero of the Alliance: Demonic (Alliance)
      [12197] = {Faction = 'Alliance', OtherSide = 12196},
      -- The Horde Slayer (Alliance)
      [12567] = {Faction = 'Alliance', OtherSide = 12568},
      -- The Alliance Slayer (Horde)
      [12568] = {Faction = 'Horde', OtherSide = 12567},
      -- Hero of the Alliance: Dread (Alliance)
      [12963] = {Faction = 'Alliance', OtherSide = 12964},
      -- Hero of the Horde: Dread (Horde)
      [12964] = {Faction = 'Horde', OtherSide = 12963},
      -- Dread Combatant (Horde)
      [13136] = {Faction = 'Horde', OtherSide = 13137},
      -- Dread Combatant (Alliance)
      [13137] = {Faction = 'Alliance', OtherSide = 13136},
      -- Hero of the Alliance: Sinister (Alliance)
      [13210] = {Faction = 'Alliance', OtherSide = 13211},
      -- Hero of the Horde: Sinister (Horde)
      [13211] = {Faction = 'Horde', OtherSide = 13210},
      -- Sinister Combatant (Horde)
      [13227] = {Faction = 'Horde', OtherSide = 13228},
      -- Sinister Combatant (Alliance)
      [13228] = {Faction = 'Alliance', OtherSide = 13227},
      -- Vicious Saddle (1) (Alliance)
      [13452] = {Faction = 'Alliance', OtherSide = 13453},
      -- Vicious Saddle (1) (Horde)
      [13453] = {Faction = 'Horde', OtherSide = 13452},
      -- Vicious Saddle (2) (Horde)
      [13521] = {Faction = 'Horde', OtherSide = 13530},
      -- Vicious Saddle (3) (Horde)
      [13522] = {Faction = 'Horde', OtherSide = 13531},
      -- Vicious Saddle (4) (Horde)
      [13523] = {Faction = 'Horde', OtherSide = 13532},
      -- Vicious Saddle (5) (Horde)
      [13524] = {Faction = 'Horde', OtherSide = 13533},
      -- Vicious Saddle (6) (Horde)
      [13525] = {Faction = 'Horde', OtherSide = 13534},
      -- Vicious Saddle (7) (Horde)
      [13526] = {Faction = 'Horde', OtherSide = 13535},
      -- Vicious Saddle (8) (Horde)
      [13527] = {Faction = 'Horde', OtherSide = 13536},
      -- Vicious Saddle (9) (Horde)
      [13528] = {Faction = 'Horde', OtherSide = 13537},
      -- Vicious Saddle (10) (Horde)
      [13529] = {Faction = 'Horde', OtherSide = 13538},
      -- Vicious Saddle (2) (Alliance)
      [13530] = {Faction = 'Alliance', OtherSide = 13521},
      -- Vicious Saddle (3) (Alliance)
      [13531] = {Faction = 'Alliance', OtherSide = 13522},
      -- Vicious Saddle (4) (Alliance)
      [13532] = {Faction = 'Alliance', OtherSide = 13523},
      -- Vicious Saddle (5) (Alliance)
      [13533] = {Faction = 'Alliance', OtherSide = 13524},
      -- Vicious Saddle (6) (Alliance)
      [13534] = {Faction = 'Alliance', OtherSide = 13525},
      -- Vicious Saddle (7) (Alliance)
      [13535] = {Faction = 'Alliance', OtherSide = 13526},
      -- Vicious Saddle (8) (Alliance)
      [13536] = {Faction = 'Alliance', OtherSide = 13527},
      -- Vicious Saddle (9) (Alliance)
      [13537] = {Faction = 'Alliance', OtherSide = 13528},
      -- Vicious Saddle (10) (Alliance)
      [13538] = {Faction = 'Alliance', OtherSide = 13529},
      -- Notorious Combatant (Horde)
      [13636] = {Faction = 'Horde', OtherSide = 13637},
      -- Notorious Combatant (Alliance)
      [13637] = {Faction = 'Alliance', OtherSide = 13636},
      -- Hero of the Alliance: Notorious (Alliance)
      [13643] = {Faction = 'Alliance', OtherSide = 13644},
      -- Hero of the Horde: Notorious (Horde)
      [13644] = {Faction = 'Horde', OtherSide = 13643},
      -- Vicious Saddle (11) (Horde)
      [13812] = {Faction = 'Horde', OtherSide = 13822},
      -- Vicious Saddle (12) (Horde)
      [13813] = {Faction = 'Horde', OtherSide = 13823},
      -- Vicious Saddle (13) (Horde)
      [13814] = {Faction = 'Horde', OtherSide = 13824},
      -- Vicious Saddle (14) (Horde)
      [13815] = {Faction = 'Horde', OtherSide = 13825},
      -- Vicious Saddle (15) (Horde)
      [13816] = {Faction = 'Horde', OtherSide = 13826},
      -- Vicious Saddle (16) (Horde)
      [13817] = {Faction = 'Horde', OtherSide = 13827},
      -- Vicious Saddle (17) (Horde)
      [13818] = {Faction = 'Horde', OtherSide = 13828},
      -- Vicious Saddle (18) (Horde)
      [13819] = {Faction = 'Horde', OtherSide = 13829},
      -- Vicious Saddle (19) (Horde)
      [13820] = {Faction = 'Horde', OtherSide = 13830},
      -- Vicious Saddle (20) (Horde)
      [13821] = {Faction = 'Horde', OtherSide = 13831},
      -- Vicious Saddle (11) (Alliance)
      [13822] = {Faction = 'Alliance', OtherSide = 13812},
      -- Vicious Saddle (12) (Alliance)
      [13823] = {Faction = 'Alliance', OtherSide = 13813},
      -- Vicious Saddle (13) (Alliance)
      [13824] = {Faction = 'Alliance', OtherSide = 13814},
      -- Vicious Saddle (14) (Alliance)
      [13825] = {Faction = 'Alliance', OtherSide = 13815},
      -- Vicious Saddle (15) (Alliance)
      [13826] = {Faction = 'Alliance', OtherSide = 13816},
      -- Vicious Saddle (16) (Alliance)
      [13827] = {Faction = 'Alliance', OtherSide = 13817},
      -- Vicious Saddle (17) (Alliance)
      [13828] = {Faction = 'Alliance', OtherSide = 13818},
      -- Vicious Saddle (18) (Alliance)
      [13829] = {Faction = 'Alliance', OtherSide = 13819},
      -- Vicious Saddle (19) (Alliance)
      [13830] = {Faction = 'Alliance', OtherSide = 13820},
      -- Vicious Saddle (20) (Alliance)
      [13831] = {Faction = 'Alliance', OtherSide = 13821},
      -- Vicious Saddle (21) (Alliance)
      [13933] = {Faction = 'Alliance', OtherSide = 13945},
      -- Vicious Saddle (22) (Alliance)
      [13934] = {Faction = 'Alliance', OtherSide = 13946},
      -- Vicious Saddle (23) (Alliance)
      [13935] = {Faction = 'Alliance', OtherSide = 13947},
      -- Vicious Saddle (24) (Alliance)
      [13936] = {Faction = 'Alliance', OtherSide = 13948},
      -- Vicious Saddle (25) (Alliance)
      [13937] = {Faction = 'Alliance', OtherSide = 13949},
      -- Vicious Saddle (26) (Alliance)
      [13938] = {Faction = 'Alliance', OtherSide = 13950},
      -- Vicious Saddle (27) (Alliance)
      [13939] = {Faction = 'Alliance', OtherSide = 13951},
      -- Vicious Saddle (28) (Alliance)
      [13940] = {Faction = 'Alliance', OtherSide = 13952},
      -- Vicious Saddle (29) (Alliance)
      [13941] = {Faction = 'Alliance', OtherSide = 13953},
      -- Vicious Saddle (30) (Alliance)
      [13942] = {Faction = 'Alliance', OtherSide = 13954},
      -- Corrupted Combatant (Alliance)
      [13943] = {Faction = 'Alliance', OtherSide = 13944},
      -- Corrupted Combatant (Horde)
      [13944] = {Faction = 'Horde', OtherSide = 13943},
      -- Vicious Saddle (21) (Horde)
      [13945] = {Faction = 'Horde', OtherSide = 13933},
      -- Vicious Saddle (22) (Horde)
      [13946] = {Faction = 'Horde', OtherSide = 13934},
      -- Vicious Saddle (23) (Horde)
      [13947] = {Faction = 'Horde', OtherSide = 13935},
      -- Vicious Saddle (24) (Horde)
      [13948] = {Faction = 'Horde', OtherSide = 13936},
      -- Vicious Saddle (25) (Horde)
      [13949] = {Faction = 'Horde', OtherSide = 13937},
      -- Vicious Saddle (26) (Horde)
      [13950] = {Faction = 'Horde', OtherSide = 13938},
      -- Vicious Saddle (27) (Horde)
      [13951] = {Faction = 'Horde', OtherSide = 13939},
      -- Vicious Saddle (28) (Horde)
      [13952] = {Faction = 'Horde', OtherSide = 13940},
      -- Vicious Saddle (29) (Horde)
      [13953] = {Faction = 'Horde', OtherSide = 13941},
      -- Vicious Saddle (30) (Horde)
      [13954] = {Faction = 'Horde', OtherSide = 13942},
      -- Hero of the Horde: Corrupted (Horde)
      [13965] = {Faction = 'Horde', OtherSide = 13966},
      -- Hero of the Alliance: Corrupted (Alliance)
      [13966] = {Faction = 'Alliance', OtherSide = 13965},
      -- Vicious Saddle (31) (Alliance)
      [14555] = {Faction = 'Alliance', OtherSide = 14561},
      -- Vicious Saddle (32) (Alliance)
      [14557] = {Faction = 'Alliance', OtherSide = 14563},
      -- Vicious Saddle (33) (Alliance)
      [14558] = {Faction = 'Alliance', OtherSide = 14564},
      -- Vicious Saddle (34) (Alliance)
      [14559] = {Faction = 'Alliance', OtherSide = 14565},
      -- Vicious Saddle (35) (Alliance)
      [14560] = {Faction = 'Alliance', OtherSide = 14566},
      -- Vicious Saddle (31) (Horde)
      [14561] = {Faction = 'Horde', OtherSide = 14555},
      -- Vicious Saddle (32) (Horde)
      [14563] = {Faction = 'Horde', OtherSide = 14557},
      -- Vicious Saddle (33) (Horde)
      [14564] = {Faction = 'Horde', OtherSide = 14558},
      -- Vicious Saddle (34) (Horde)
      [14565] = {Faction = 'Horde', OtherSide = 14559},
      -- Vicious Saddle (35) (Horde)
      [14566] = {Faction = 'Horde', OtherSide = 14560},
      -- Sinful Combatant (Horde)
      [14611] = {Faction = 'Horde', OtherSide = 14612},
      -- Sinful Combatant (Alliance)
      [14612] = {Faction = 'Alliance', OtherSide = 14611},
      -- Hero of the Alliance: Sinful (Alliance)
      [14692] = {Faction = 'Alliance', OtherSide = 14693},
      -- Hero of the Horde: Sinful (Horde)
      [14693] = {Faction = 'Horde', OtherSide = 14692},
      -- Unchained Combatant (Horde)
      [14966] = {Faction = 'Horde', OtherSide = 14967},
      -- Unchained Combatant (Alliance)
      [14967] = {Faction = 'Alliance', OtherSide = 14966},
      -- Hero of the Alliance: Unchained (Alliance)
      [14975] = {Faction = 'Alliance', OtherSide = 14976},
      -- Hero of the Horde: Unchained (Horde)
      [14976] = {Faction = 'Horde', OtherSide = 14975},
      -- Cosmic Combatant (Horde)
      [15346] = {Faction = 'Horde', OtherSide = 15347},
      -- Cosmic Combatant (Alliance)
      [15347] = {Faction = 'Alliance', OtherSide = 15346},
      -- Hero of the Alliance: Cosmic (Alliance)
      [15355] = {Faction = 'Alliance', OtherSide = 15356},
      -- Hero of the Horde: Cosmic (Horde)
      [15356] = {Faction = 'Horde', OtherSide = 15355},
      -- Eternal Combatant (Horde)
      [15598] = {Faction = 'Horde', OtherSide = 15599},
      -- Eternal Combatant (Alliance)
      [15599] = {Faction = 'Alliance', OtherSide = 15598},
      -- Hero of the Horde: Eternal (Horde)
      [15607] = {Faction = 'Horde', OtherSide = 15608},
      -- Hero of the Alliance: Eternal (Alliance)
      [15608] = {Faction = 'Alliance', OtherSide = 15607},
      -- Crimson Combatant (Horde)
      [15942] = {Faction = 'Horde', OtherSide = 15943},
      -- Crimson Combatant (Alliance)
      [15943] = {Faction = 'Alliance', OtherSide = 15942},
      -- Hero of the Horde: Crimson (Horde)
      [15958] = {Faction = 'Horde', OtherSide = 15959},
      -- Hero of the Alliance: Crimson (Alliance)
      [15959] = {Faction = 'Alliance', OtherSide = 15958},
      -- Vicious Saddle (36) (Alliance)
      [17104] = {Faction = 'Alliance', OtherSide = 17105},
      -- Vicious Saddle (36) (Horde)
      [17105] = {Faction = 'Horde', OtherSide = 17104},
    -- Player vs. Player Ends
    -- Events Start
      -- Operation: Gnomeregan (Alliance)
      [4786] = {Faction = 'Alliance', OtherSide = 4790},
      -- Zalazane's Fall (Horde)
      [4790] = {Faction = 'Horde', OtherSide = 4786},
      -- Theramore's Fall (Alliance)
      [7467] = {Faction = 'Alliance', OtherSide = 7468},
      -- Theramore's Fall (Horde)
      [7468] = {Faction = 'Horde', OtherSide = 7467},
      -- Victory in Hillsbrad (Horde)
      [9566] = {Faction = 'Horde', OtherSide = 9729},
      -- Victory in Hillsbrad (Alliance)
      [9729] = {Faction = 'Alliance', OtherSide = 9566},
    -- Events Ends
    -- Promotions Start
      -- Collector's Edition: Seabraid Stallion (Alliance)
      [12229] = {Faction = 'Alliance', OtherSide = 12230},
      -- Collector's Edition: Gilded Ravasaur (Horde)
      [12230] = {Faction = 'Horde', OtherSide = 12229},
    -- Promotions Ends
  -- Feats of Strength End

  -- Legacy Start
    -- You Are Not Your $#*@! Legplates (Season 1) (Alliance)
    [7937] = {Faction = 'Alliance', OtherSide = 8020},
    -- The Second Rule of Brawler's Guild (Season 1) (Horde)
    [7939] = {Faction = 'Horde', OtherSide = 7940},
    -- The Second Rule of Brawler's Guild (Season 1) (Alliance)
    [7940] = {Faction = 'Alliance', OtherSide = 7939},
    -- Brawlin' and Shot Callin' (Season 1) (Alliance)
    [7941] = {Faction = 'Alliance', OtherSide = 7942},
    -- Brawlin' and Shot Callin' (Season 1) (Horde)
    [7942] = {Faction = 'Horde', OtherSide = 7941},
    -- Now You're Just Showing Off (Season 1) (Alliance)
    [7946] = {Faction = 'Alliance', OtherSide = 8022},
    -- The First Rule of Brawler's Guild (Season 1 or 2) (Alliance)
    [7947] = {Faction = 'Alliance', OtherSide = 7948},
    -- The First Rule of Brawler's Guild (Season 1 or 2) (Horde)
    [7948] = {Faction = 'Horde', OtherSide = 7947},
    -- Rabble Rabble Rabble (Season 2) (Alliance)
    [7949] = {Faction = 'Alliance', OtherSide = 7950},
    -- Rabble Rabble Rabble (Season 2) (Horde)
    [7950] = {Faction = 'Horde', OtherSide = 7949},
    -- You Are Not Your $#*@! Legplates (Season 1) (Horde)
    [8020] = {Faction = 'Horde', OtherSide = 7937},
    -- Now You're Just Showing Off (Season 1) (Horde)
    [8022] = {Faction = 'Horde', OtherSide = 7946},
    -- Having a Brawl (Season 1) (Alliance)
    [8335] = {Faction = 'Alliance', OtherSide = 8337},
    -- I've Got the Biggest Brawls of Them All (Season 1) (Alliance)
    [8336] = {Faction = 'Alliance', OtherSide = 8338},
    -- Having a Brawl (Season 1) (Horde)
    [8337] = {Faction = 'Horde', OtherSide = 8335},
    -- I've Got the Biggest Brawls of Them All (Season 1) (Horde)
    [8338] = {Faction = 'Horde', OtherSide = 8336},
    -- Collect Your Deck (Season 2) (Alliance)
    [8339] = {Faction = 'Alliance', OtherSide = 8342},
    -- Deck Your Collection (Season 1) (Alliance)
    [8340] = {Faction = 'Alliance', OtherSide = 8343},
    -- Collect Your Deck (Season 2) (Horde)
    [8342] = {Faction = 'Horde', OtherSide = 8339},
    -- Deck Your Collection (Season 1) (Horde)
    [8343] = {Faction = 'Horde', OtherSide = 8340},
    -- You Are Not Your $#*@! Legplates (Season 2) (Alliance)
    [9168] = {Faction = 'Alliance', OtherSide = 9172},
    -- The Second Rule of Brawler's Guild (Season 2) (Alliance)
    [9169] = {Faction = 'Alliance', OtherSide = 9173},
    -- Brawlin' and Shot Callin' (Season 2) (Alliance)
    [9170] = {Faction = 'Alliance', OtherSide = 9174},
    -- Now You're Just Showing Off (Season 2) (Alliance)
    [9171] = {Faction = 'Alliance', OtherSide = 9175},
    -- You Are Not Your $#*@! Legplates (Season 2) (Horde)
    [9172] = {Faction = 'Horde', OtherSide = 9168},
    -- The Second Rule of Brawler's Guild (Season 2) (Horde)
    [9173] = {Faction = 'Horde', OtherSide = 9169},
    -- Brawlin' and Shot Callin' (Season 2) (Horde)
    [9174] = {Faction = 'Horde', OtherSide = 9170},
    -- Now You're Just Showing Off (Season 2) (Horde)
    [9175] = {Faction = 'Horde', OtherSide = 9171},
    -- Deck Your Collection (Season 2) (Alliance)
    [9176] = {Faction = 'Alliance', OtherSide = 9177},
    -- Deck Your Collection (Season 2) (Horde)
    [9177] = {Faction = 'Horde', OtherSide = 9176},
    -- You Are Not Your $#*@! Legplates (Season 3) (Alliance)
    [11560] = {Faction = 'Alliance', OtherSide = 11561},
    -- You Are Not Your $#*@! Legplates (Season 3) (Horde)
    [11561] = {Faction = 'Horde', OtherSide = 11560},
    -- The Second Rule of Brawler's Guild (Season 3) (Alliance)
    [11563] = {Faction = 'Alliance', OtherSide = 11564},
    -- The Second Rule of Brawler's Guild (Season 3) (Horde)
    [11564] = {Faction = 'Horde', OtherSide = 11563},
    -- King of the Guild (Season 3) (Alliance)
    [11565] = {Faction = 'Alliance', OtherSide = 11566},
    -- King of the Guild (Season 3) (Horde)
    [11566] = {Faction = 'Horde', OtherSide = 11565},
    -- Quests Start
      -- Chapter II: Wrathion's War (Alliance)
      [7534] = {Faction = 'Alliance', OtherSide = 8008},
      -- Chapter II: Wrathion's War (Horde)
      [8008] = {Faction = 'Horde', OtherSide = 7534},
      -- A Test of Valor (Alliance)
      [8030] = {Faction = 'Alliance', OtherSide = 8031},
      -- A Test of Valor (Horde)
      [8031] = {Faction = 'Horde', OtherSide = 8030},
      -- Hordebreaker (Alliance)
      [8306] = {Faction = 'Alliance', OtherSide = 8307},
      -- Darkspear Revolutionary (Horde)
      [8307] = {Faction = 'Horde', OtherSide = 8306},
      -- Chapter IV: Darkness Incarnate (Alliance)
      [10021] = {Faction = 'Alliance', OtherSide = 10148},
      -- Chapter IV: Darkness Incarnate (Horde)
      [10148] = {Faction = 'Horde', OtherSide = 10021},
    -- Quests Ends
    -- Player vs. Player Start
      -- Grand Marshal (Alliance)
      [433] = {Faction = 'Alliance', OtherSide = 443},
      -- Field Marshal (Alliance)
      [434] = {Faction = 'Alliance', OtherSide = 445},
      -- Commander (Alliance)
      [435] = {Faction = 'Alliance', OtherSide = 9494},
      -- Lieutenant Commander (Alliance)
      [436] = {Faction = 'Alliance', OtherSide = 447},
      -- Knight-Champion (Alliance)
      [437] = {Faction = 'Alliance', OtherSide = 448},
      -- Knight-Captain (Alliance)
      [438] = {Faction = 'Alliance', OtherSide = 469},
      -- Knight (Alliance)
      [439] = {Faction = 'Alliance', OtherSide = 451},
      -- Sergeant Major (Alliance)
      [440] = {Faction = 'Alliance', OtherSide = 452},
      -- Master Sergeant (Alliance)
      [441] = {Faction = 'Alliance', OtherSide = 450},
      -- Private (Alliance)
      [442] = {Faction = 'Alliance', OtherSide = 454},
      -- High Warlord (Horde)
      [443] = {Faction = 'Horde', OtherSide = 433},
      -- Lieutenant General (Horde)
      [444] = {Faction = 'Horde', OtherSide = 435},
      -- Warlord (Horde)
      [445] = {Faction = 'Horde', OtherSide = 434},
      -- General (Horde)
      [446] = {Faction = 'Horde', OtherSide = 473},
      -- Champion (Horde)
      [447] = {Faction = 'Horde', OtherSide = 436},
      -- Centurion (Horde)
      [448] = {Faction = 'Horde', OtherSide = 437},
      -- Blood Guard (Horde)
      [449] = {Faction = 'Horde', OtherSide = 472},
      -- Senior Sergeant (Horde)
      [450] = {Faction = 'Horde', OtherSide = 441},
      -- Stone Guard (Horde)
      [451] = {Faction = 'Horde', OtherSide = 439},
      -- First Sergeant (Horde)
      [452] = {Faction = 'Horde', OtherSide = 440},
      -- Sergeant (Horde)
      [453] = {Faction = 'Horde', OtherSide = 471},
      -- Scout (Horde)
      [454] = {Faction = 'Horde', OtherSide = 442},
      -- Grunt (Horde)
      [468] = {Faction = 'Horde', OtherSide = 470},
      -- Legionnaire (Horde)
      [469] = {Faction = 'Horde', OtherSide = 438},
      -- Corporal (Alliance)
      [470] = {Faction = 'Alliance', OtherSide = 468},
      -- Sergeant (Alliance)
      [471] = {Faction = 'Alliance', OtherSide = 453},
      -- Knight-Lieutenant (Alliance)
      [472] = {Faction = 'Alliance', OtherSide = 449},
      -- Marshal (Alliance)
      [473] = {Faction = 'Alliance', OtherSide = 446},
      -- Orgrimmar Offensive (Alliance)
      [610] = {Faction = 'Alliance', OtherSide = 615},
      -- Bleeding Bloodhoof (Alliance)
      [611] = {Faction = 'Alliance', OtherSide = 616},
      -- Downing the Dark Lady (Alliance)
      [612] = {Faction = 'Alliance', OtherSide = 617},
      -- Storming Stormwind (Horde)
      [615] = {Faction = 'Horde', OtherSide = 610},
      -- Immortal No More (Horde)
      [617] = {Faction = 'Horde', OtherSide = 612},
      -- Freedom of the Horde (Horde)
      [700] = {Faction = 'Horde', OtherSide = 701},
      -- Freedom of the Alliance (Alliance)
      [701] = {Faction = 'Alliance', OtherSide = 700},
      -- Defense of the Ancients (Alliance)
      [1757] = {Faction = 'Alliance', OtherSide = 2200},
      -- Not Even a Scratch (Alliance)
      [1762] = {Faction = 'Alliance', OtherSide = 2192},
      -- Not Even a Scratch (Horde)
      [2192] = {Faction = 'Horde', OtherSide = 1762},
      -- Defense of the Ancients (Horde)
      [2200] = {Faction = 'Horde', OtherSide = 1757},
      -- Tyrannical Conquest (Horde)
      [8093] = {Faction = 'Horde', OtherSide = 8218},
      -- Tyrannical Conquest (Alliance)
      [8218] = {Faction = 'Alliance', OtherSide = 8093},
      -- Grievous Conquest (Horde)
      [8381] = {Faction = 'Horde', OtherSide = 8382},
      -- Grievous Conquest (Alliance)
      [8382] = {Faction = 'Alliance', OtherSide = 8381},
      -- Prideful Conquest (Horde)
      [8450] = {Faction = 'Horde', OtherSide = 8451},
      -- Prideful Conquest (Alliance)
      [8451] = {Faction = 'Alliance', OtherSide = 8450},
      -- Grievous Combatant (Horde)
      [8484] = {Faction = 'Horde', OtherSide = 8485},
      -- Grievous Combatant (Alliance)
      [8485] = {Faction = 'Alliance', OtherSide = 8484},
      -- Prideful Combatant (Horde)
      [8641] = {Faction = 'Horde', OtherSide = 8642},
      -- Prideful Combatant (Alliance)
      [8642] = {Faction = 'Alliance', OtherSide = 8641},
      -- Hero of Stormshield (Alliance)
      [9214] = {Faction = 'Alliance', OtherSide = 9215},
      -- Hero of Warspear (Horde)
      [9215] = {Faction = 'Horde', OtherSide = 9214},
      -- Primal Conquest (Horde)
      [9233] = {Faction = 'Horde', OtherSide = 9234},
      -- Primal Conquest (Alliance)
      [9234] = {Faction = 'Alliance', OtherSide = 9233},
      -- Primal Combatant (Horde)
      [9236] = {Faction = 'Horde', OtherSide = 9238},
      -- Primal Combatant (Alliance)
      [9238] = {Faction = 'Alliance', OtherSide = 9236},
      -- Wild Conquest (Horde)
      [10088] = {Faction = 'Horde', OtherSide = 10089},
      -- Wild Conquest (Alliance)
      [10089] = {Faction = 'Alliance', OtherSide = 10088},
      -- Warmongering Conquest (Horde)
      [10090] = {Faction = 'Horde', OtherSide = 10091},
      -- Warmongering Conquest (Alliance)
      [10091] = {Faction = 'Alliance', OtherSide = 10090},
      -- Wild Combatant (Horde)
      [10092] = {Faction = 'Horde', OtherSide = 10093},
      -- Wild Combatant (Alliance)
      [10093] = {Faction = 'Alliance', OtherSide = 10092},
      -- The Prestige (Alliance)
      [10743] = {Faction = 'Alliance', OtherSide = 10745},
      -- The Prestige (Horde)
      [10745] = {Faction = 'Horde', OtherSide = 10743},
      -- Crest of Heroism (Alliance)
      [11165] = {Faction = 'Alliance', OtherSide = 11166},
      -- Crest of Heroism (Horde)
      [11166] = {Faction = 'Horde', OtherSide = 11165},
      -- Crest of Carnage (Alliance)
      [11167] = {Faction = 'Alliance', OtherSide = 11168},
      -- Crest of Carnage (Horde)
      [11168] = {Faction = 'Horde', OtherSide = 11167},
      -- Crest of Devastation (Alliance)
      [11169] = {Faction = 'Alliance', OtherSide = 11170},
      -- Crest of Devastation (Horde)
      [11170] = {Faction = 'Horde', OtherSide = 11169},
      -- Dominant Combatant (Horde)
      [12136] = {Faction = 'Horde', OtherSide = 12137},
      -- Dominant Combatant (Alliance)
      [12137] = {Faction = 'Alliance', OtherSide = 12136},
      -- Demonic Combatant (Horde)
      [12199] = {Faction = 'Horde', OtherSide = 12200},
      -- Demonic Combatant (Alliance)
      [12200] = {Faction = 'Alliance', OtherSide = 12199},
    -- Player vs. Player Ends
    -- World Events Start
      -- The First Rule of Brawler's Guild (Alliance)
      [11558] = {Faction = 'Alliance', OtherSide = 11559},
      -- The First Rule of Brawler's Guild (Horde)
      [11559] = {Faction = 'Horde', OtherSide = 11558},
      -- You Are Not Your $#*@! Legplates (Alliance)
      [13186] = {Faction = 'Alliance', OtherSide = 13188},
      -- You Are Not Your $#*@! Legplates (Horde)
      [13188] = {Faction = 'Horde', OtherSide = 13186},
      -- The Second Rule of Brawler's Guild (Alliance)
      [13189] = {Faction = 'Alliance', OtherSide = 13190},
      -- The Second Rule of Brawler's Guild (Horde)
      [13190] = {Faction = 'Horde', OtherSide = 13189},
      -- Brawler for Azeroth (Alliance)
      [13191] = {Faction = 'Alliance', OtherSide = 13192},
      -- Brawler for Azeroth (Horde)
      [13192] = {Faction = 'Horde', OtherSide = 13191},
    -- World Events Ends
  -- Legacy End
  
  -- Crashin Thrashin Racer
  [1706] = {Faction = 'Both', Account = true},
  -- MiniZep Controller
  [6060] = {Faction = 'Both', Account = true},
  -- They're Both Footballs?
  [7852] = {Faction = 'Both', Account = true},
  -- Crashin' Thrashin' Flyer
  [8698] = {Faction = 'Both', Account = true},
  -- Crashin' Thrashin' Shredder
  [9915] = {Faction = 'Both', Account = true},
  -- Crashin' Thrashin' Flamer
  [10337] = {Faction = 'Both', Account = true},
  -- Brr... It's Cold in Here
  [10751] = {Faction = 'Both', Account = true},
  -- Don't Play With That In The House
  [11913] = {Faction = 'Both', Account = true},
  -- At Least You're Being Careful
  [12850] = {Faction = 'Both', Account = true},
  -- Crashin' Splashin'
  [13927] = {Faction = 'Both', Account = true},
};

