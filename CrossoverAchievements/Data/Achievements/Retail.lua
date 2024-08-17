local CrossoverAchievements = LibStub("AceAddon-3.0"):GetAddon("CrossoverAchievements");
local GameVersion_Retail = "Retail";

CrossoverAchievements.Data = CrossoverAchievements.Data or {};
CrossoverAchievements.Data.Achievements = CrossoverAchievements.Data.Achievements or {};
CrossoverAchievements.Data.Achievements[GameVersion_Retail] = CrossoverAchievements.Data.Achievements[GameVersion_Retail] or {};

CrossoverAchievements.Data.Achievements[GameVersion_Retail].List = {
  -- Quests Start
    -- Eastern Kingdoms Start
      -- Silverpine Forest Quests (Horde)
      [4894] = {Faction = 'Horde', OtherSide = 4903},
      -- Hillsbrad Foothills Quests (Horde)
      [4895] = {Faction = 'Horde', OtherSide = 4902},
      -- Loch Modan Quests (Alliance)
      [4899] = {Faction = 'Alliance', OtherSide = 4908},
      -- Redridge Mountains Quests (Alliance)
      [4902] = {Faction = 'Alliance', OtherSide = 4895},
      -- Westfall Quests (Alliance)
      [4903] = {Faction = 'Alliance', OtherSide = 4894},
      -- Ghostlands Quests (Horde)
      [4908] = {Faction = 'Horde', OtherSide = 4899},
    -- Eastern Kingdoms Ends
    -- Kalimdor Start
      -- Ashenvale Quests (Alliance)
      [4925] = {Faction = 'Alliance', OtherSide = 4976},
      -- Bloodmyst Isle Quests (Alliance)
      [4926] = {Faction = 'Alliance', OtherSide = 4933},
      -- Azshara Quests (Horde)
      [4927] = {Faction = 'Horde', OtherSide = 4928},
      -- Darkshore Quests (Alliance)
      [4928] = {Faction = 'Alliance', OtherSide = 4927},
      -- Dustwallow Marsh Quests (Alliance)
      [4929] = {Faction = 'Alliance', OtherSide = 4978},
      -- Feralas Quests (Alliance)
      [4932] = {Faction = 'Alliance', OtherSide = 4979},
      -- Northern Barrens Quests (Horde)
      [4933] = {Faction = 'Horde', OtherSide = 4926},
      -- Stonetalon Mountains Quests (Alliance)
      [4936] = {Faction = 'Alliance', OtherSide = 4980},
      -- Southern Barrens Quests (Alliance)
      [4937] = {Faction = 'Alliance', OtherSide = 4981},
      -- Ashenvale Quests (Horde)
      [4976] = {Faction = 'Horde', OtherSide = 4925},
      -- Dustwallow Marsh Quests (Horde)
      [4978] = {Faction = 'Horde', OtherSide = 4929},
      -- Feralas Quests (Horde)
      [4979] = {Faction = 'Horde', OtherSide = 4932},
      -- Stonetalon Mountains Quests (Horde)
      [4980] = {Faction = 'Horde', OtherSide = 4936},
      -- Southern Barrens Quests (Horde)
      [4981] = {Faction = 'Horde', OtherSide = 4937},
      -- Ghosts in the Dark (Alliance)
      [5453] = {Faction = 'Alliance', OtherSide = 5454},
      -- Joy Ride (Horde)
      [5454] = {Faction = 'Horde', OtherSide = 5453},
    -- Kalimdor Ends
    -- Outland Start
      -- To Hellfire and Back (Alliance)
      [1189] = {Faction = 'Alliance', OtherSide = 1271},
      -- Terror of Terokkar (Alliance)
      [1191] = {Faction = 'Alliance', OtherSide = 1272},
      -- Nagrand Slam (Alliance)
      [1192] = {Faction = 'Alliance', OtherSide = 1273},
      -- To Hellfire and Back (Horde)
      [1271] = {Faction = 'Horde', OtherSide = 1189},
      -- Terror of Terokkar (Horde)
      [1272] = {Faction = 'Horde', OtherSide = 1191},
      -- Nagrand Slam (Horde)
      [1273] = {Faction = 'Horde', OtherSide = 1192},
    -- Outland Ends
    -- Northrend Start
      -- Nothing Boring About Borean (Alliance)
      [33] = {Faction = 'Alliance', OtherSide = 1358},
      -- I've Toured the Fjord (Alliance)
      [34] = {Faction = 'Alliance', OtherSide = 1356},
      -- Might of Dragonblight (Alliance)
      [35] = {Faction = 'Alliance', OtherSide = 1359},
      -- Fo' Grizzle My Shizzle (Alliance)
      [37] = {Faction = 'Alliance', OtherSide = 1357},
      -- I've Toured the Fjord (Horde)
      [1356] = {Faction = 'Horde', OtherSide = 34},
      -- Fo' Grizzle My Shizzle (Horde)
      [1357] = {Faction = 'Horde', OtherSide = 37},
      -- Nothing Boring About Borean (Horde)
      [1358] = {Faction = 'Horde', OtherSide = 33},
      -- Might of Dragonblight (Horde)
      [1359] = {Faction = 'Horde', OtherSide = 35},
    -- Northrend Ends
    -- Cataclysm Start
      -- Sinking into Vashj'ir (Alliance)
      [4869] = {Faction = 'Alliance', OtherSide = 4982},
      -- Fading into Twilight (Alliance)
      [4873] = {Faction = 'Alliance', OtherSide = 5501},
      -- Sinking into Vashj'ir (Horde)
      [4982] = {Faction = 'Horde', OtherSide = 4869},
      -- 20,000 Leagues Under the Sea (Alliance)
      [5318] = {Faction = 'Alliance', OtherSide = 5319},
      -- 20,000 Leagues Under the Sea (Horde)
      [5319] = {Faction = 'Horde', OtherSide = 5318},
      -- King of the Mountain (Alliance)
      [5320] = {Faction = 'Alliance', OtherSide = 5321},
      -- King of the Mountain (Horde)
      [5321] = {Faction = 'Horde', OtherSide = 5320},
      -- Wildhammer Tour of Duty (Alliance)
      [5481] = {Faction = 'Alliance', OtherSide = 5482},
      -- Dragonmaw Tour of Duty (Horde)
      [5482] = {Faction = 'Horde', OtherSide = 5481},
      -- Fading into Twilight (Horde)
      [5501] = {Faction = 'Horde', OtherSide = 4873},
    -- Cataclysm Ends
    -- Pandaria Start
      -- Upjade Complete (Alliance)
      [6300] = {Faction = 'Alliance', OtherSide = 6534},
      -- Upjade Complete (Horde)
      [6534] = {Faction = 'Horde', OtherSide = 6300},
      -- Mighty Roamin' Krasaranger (Alliance)
      [6535] = {Faction = 'Alliance', OtherSide = 6536},
      -- Mighty Roamin' Krasaranger (Horde)
      [6536] = {Faction = 'Horde', OtherSide = 6535},
      -- Slum It in the Summit (Alliance)
      [6537] = {Faction = 'Alliance', OtherSide = 6538},
      -- Slum It in the Summit (Horde)
      [6538] = {Faction = 'Horde', OtherSide = 6537},
      -- Operation: Shieldwall Campaign (Alliance)
      [7928] = {Faction = 'Alliance', OtherSide = 7929},
      -- Dominance Offensive Campaign (Horde)
      [7929] = {Faction = 'Horde', OtherSide = 7928},
    -- Pandaria Ends
    -- Draenor Start
      -- You'll Get Caught Up In The... Frostfire! (Horde)
      [8671] = {Faction = 'Horde', OtherSide = 8845},
      -- As I Walk Through the Valley of the Shadow of Moon (Alliance)
      [8845] = {Faction = 'Alliance', OtherSide = 8671},
      -- Don't Let the Tala-door Hit You on the Way Out (Horde)
      [8919] = {Faction = 'Horde', OtherSide = 8920},
      -- Don't Let the Tala-door Hit You on the Way Out (Alliance)
      [8920] = {Faction = 'Alliance', OtherSide = 8919},
      -- Welcome to Draenor (Alliance)
      [8921] = {Faction = 'Alliance', OtherSide = 8922},
      -- Welcome to Draenor (Horde)
      [8922] = {Faction = 'Horde', OtherSide = 8921},
      -- Putting the Gore in Gorgrond (Alliance)
      [8923] = {Faction = 'Alliance', OtherSide = 8924},
      -- Putting the Gore in Gorgrond (Horde)
      [8924] = {Faction = 'Horde', OtherSide = 8923},
      -- Between Arak and a Hard Place (Alliance)
      [8925] = {Faction = 'Alliance', OtherSide = 8926},
      -- Between Arak and a Hard Place (Horde)
      [8926] = {Faction = 'Horde', OtherSide = 8925},
      -- Nagrandeur (Alliance)
      [8927] = {Faction = 'Alliance', OtherSide = 8928},
      -- Nagrandeur (Horde)
      [8928] = {Faction = 'Horde', OtherSide = 8927},
      -- The Garrison Campaign (Alliance)
      [9491] = {Faction = 'Alliance', OtherSide = 9492},
      -- The Garrison Campaign (Horde)
      [9492] = {Faction = 'Horde', OtherSide = 9491},
      -- On the Shadow's Trail (Alliance)
      [9528] = {Faction = 'Alliance', OtherSide = 9529},
      -- On the Shadow's Trail (Horde)
      [9529] = {Faction = 'Horde', OtherSide = 9528},
      -- Writing in the Snow (Alliance)
      [9530] = {Faction = 'Alliance', OtherSide = 9531},
      -- Writing in the Snow (Horde)
      [9531] = {Faction = 'Horde', OtherSide = 9530},
      -- Securing Draenor (Horde)
      [9562] = {Faction = 'Horde', OtherSide = 9564},
      -- Securing Draenor (Alliance)
      [9564] = {Faction = 'Alliance', OtherSide = 9562},
      -- Shoot For the Moon (Alliance)
      [9602] = {Faction = 'Alliance', OtherSide = nil},
      -- Frostfire Fridge (Horde)
      [9606] = {Faction = 'Horde', OtherSide = nil},
      -- Master Relic Hunter (Alliance)
      [9825] = {Faction = 'Alliance', OtherSide = 9836},
      -- Loremaster of Draenor (Alliance)
      [9833] = {Faction = 'Alliance', OtherSide = 9923},
      -- Master Relic Hunter (Horde)
      [9836] = {Faction = 'Horde', OtherSide = 9825},
      -- Loremaster of Draenor (Horde)
      [9923] = {Faction = 'Horde', OtherSide = 9833},
      -- In Pursuit of Gul'dan (Alliance)
      [10067] = {Faction = 'Alliance', OtherSide = 10074},
      -- Draenor's Last Stand (Alliance)
      [10068] = {Faction = 'Alliance', OtherSide = 10075},
      -- Rumble in the Jungle (Alliance)
      [10072] = {Faction = 'Alliance', OtherSide = 10265},
      -- In Pursuit of Gul'dan (Horde)
      [10074] = {Faction = 'Horde', OtherSide = 10067},
      -- Draenor's Last Stand (Horde)
      [10075] = {Faction = 'Horde', OtherSide = 10068},
      -- Rumble in the Jungle (Horde)
      [10265] = {Faction = 'Horde', OtherSide = 10072},
    -- Draenor Ends
    -- Battle for Azeroth Start
      -- The Throne of Zuldazar (Horde)
      [11861] = {Faction = 'Horde', OtherSide = nil},
      -- The Dark Heart of Nazmir (Horde)
      [11868] = {Faction = 'Horde', OtherSide = nil},
      -- The Reining Champion (Alliance)
      [12087] = {Faction = 'Alliance', OtherSide = nil},
      -- &lt;Hidden&gt; Zandalar Intro Breadcrumb Launch (Horde)
      [12472] = {Faction = 'Horde', OtherSide = nil},
      -- A Sound Plan (Alliance)
      [12473] = {Faction = 'Alliance', OtherSide = nil},
      -- Secrets in the Sands (Horde)
      [12478] = {Faction = 'Horde', OtherSide = nil},
      -- Zandalar Forever! (Horde)
      [12479] = {Faction = 'Horde', OtherSide = nil},
      -- A Bargain of Blood (Horde)
      [12480] = {Faction = 'Horde', OtherSide = nil},
      -- The Final Seal (Horde)
      [12481] = {Faction = 'Horde', OtherSide = nil},
      -- Stormsong and Dance (Alliance)
      [12496] = {Faction = 'Alliance', OtherSide = nil},
      -- Drust Do It. (Alliance)
      [12497] = {Faction = 'Alliance', OtherSide = nil},
      -- Ready for War (Horde)
      [12509] = {Faction = 'Horde', OtherSide = 12510},
      -- Ready for War (Alliance)
      [12510] = {Faction = 'Alliance', OtherSide = 12509},
      -- Welcome to Zandalar (Horde)
      [12555] = {Faction = 'Horde', OtherSide = nil},
      -- Come Sail Away (Alliance)
      [12582] = {Faction = 'Alliance', OtherSide = nil},
      -- Loremaster of Kul Tiras (Alliance)
      [12593] = {Faction = 'Alliance', OtherSide = 13294},
      -- Loa Expectations (Horde)
      [12614] = {Faction = 'Horde', OtherSide = nil},
      -- Spirits Be With You (Horde)
      [12719] = {Faction = 'Horde', OtherSide = nil},
      -- A Nation United (Alliance)
      [12891] = {Faction = 'Alliance', OtherSide = nil},
      -- The Pride of Kul Tiras (Alliance)
      [12997] = {Faction = 'Alliance', OtherSide = nil},
      -- Adept Sandfisher (Horde)
      [13009] = {Faction = 'Horde', OtherSide = nil},
      -- Vorrik's Champion (Horde)
      [13014] = {Faction = 'Horde', OtherSide = nil},
      -- Champion of the Vulpera (Horde)
      [13017] = {Faction = 'Horde', OtherSide = nil},
      -- Bow to Your Masters (Horde)
      [13020] = {Faction = 'Horde', OtherSide = nil},
      -- A Most Efficient Apocalypse (Horde)
      [13021] = {Faction = 'Horde', OtherSide = nil},
      -- Revenge is Best Served Speedily (Horde)
      [13022] = {Faction = 'Horde', OtherSide = nil},
      -- Zandalari Spycatcher (Horde)
      [13025] = {Faction = 'Horde', OtherSide = nil},
      -- 7th Legion Spycatcher (Alliance)
      [13026] = {Faction = 'Alliance', OtherSide = nil},
      -- How to Ptrain Your Pterrordax (Horde)
      [13030] = {Faction = 'Horde', OtherSide = nil},
      -- Torcanata (Horde)
      [13037] = {Faction = 'Horde', OtherSide = nil},
      -- Raptari Rider (Horde)
      [13038] = {Faction = 'Horde', OtherSide = nil},
      -- Paku'ai (Horde)
      [13039] = {Faction = 'Horde', OtherSide = nil},
      -- Hungry, Hungry Ranishu (Horde)
      [13041] = {Faction = 'Horde', OtherSide = nil},
      -- The Long Con (Alliance)
      [13049] = {Faction = 'Alliance', OtherSide = nil},
      -- Deadliest Cache (Alliance)
      [13053] = {Faction = 'Alliance', OtherSide = 17367},
      -- Drag Race (Alliance)
      [13059] = {Faction = 'Alliance', OtherSide = nil},
      -- Kul Runnings (Alliance)
      [13060] = {Faction = 'Alliance', OtherSide = nil},
      -- Let's Bee Friends (Alliance)
      [13062] = {Faction = 'Alliance', OtherSide = nil},
      -- 8.0 Lordaeron Skip Unlock - Alliance (Alliance)
      [13139] = {Faction = 'Alliance', OtherSide = 13140},
      -- 8.0 Lordaeron Skip Unlock - Horde (Horde)
      [13140] = {Faction = 'Horde', OtherSide = 13139},
      -- 8.0 Darkshore Skip Unlock - Alliance (Alliance)
      [13147] = {Faction = 'Alliance', OtherSide = 13148},
      -- 8.0 Darkshore Skip Unlock - Horde (Horde)
      [13148] = {Faction = 'Horde', OtherSide = 13147},
      -- 8.0 Lordaeron Push - Horde (UNUSED DELETE ME) (Horde)
      [13154] = {Faction = 'Horde', OtherSide = nil},
      -- In Teldrassil's Shadow (Alliance)
      [13251] = {Faction = 'Alliance', OtherSide = nil},
      -- The Shadow Hunter (Horde)
      [13263] = {Faction = 'Horde', OtherSide = nil},
      -- Frontline Warrior (Alliance)
      [13283] = {Faction = 'Alliance', OtherSide = 13284},
      -- Frontline Warrior (Horde)
      [13284] = {Faction = 'Horde', OtherSide = 13283},
      -- Upright Citizens (Alliance)
      [13285] = {Faction = 'Alliance', OtherSide = nil},
      -- Loremaster of Zandalar (Horde)
      [13294] = {Faction = 'Horde', OtherSide = 12593},
      -- Kul Tirans Don't Look at Explosions (Alliance)
      [13384] = {Faction = 'Alliance', OtherSide = nil},
      -- Come On and Slam (Alliance)
      [13426] = {Faction = 'Alliance', OtherSide = nil},
      -- Doomsoul Surprise (Horde)
      [13435] = {Faction = 'Horde', OtherSide = nil},
      -- Scavenge like a Vulpera (Horde)
      [13437] = {Faction = 'Horde', OtherSide = nil},
      -- Pushing the Payload (Alliance)
      [13440] = {Faction = 'Alliance', OtherSide = 13441},
      -- Pushing the Payload (Horde)
      [13441] = {Faction = 'Horde', OtherSide = 13440},
      -- Tides of Vengeance (Horde)
      [13466] = {Faction = 'Horde', OtherSide = 13467},
      -- Tides of Vengeance (Alliance)
      [13467] = {Faction = 'Alliance', OtherSide = 13466},
      -- In Teldrassil's Shadow (Hidden Character Achievement) (Alliance)
      [13488] = {Faction = 'Alliance', OtherSide = nil},
      -- How to Train Your Direhorn (Horde)
      [13542] = {Faction = 'Horde', OtherSide = nil},
      -- The Mechagonian Threat (Alliance)
      [13553] = {Faction = 'Alliance', OtherSide = 13700},
      -- How to Ptrain Your Pterrordax (Horde)
      [13573] = {Faction = 'Horde', OtherSide = nil},
      -- The Mechagonian Threat (Horde)
      [13700] = {Faction = 'Horde', OtherSide = 13553},
      -- Unfathomable (Horde)
      [13709] = {Faction = 'Horde', OtherSide = 13710},
      -- Sunken Ambitions (Alliance)
      [13710] = {Faction = 'Alliance', OtherSide = 13709},
      -- &lt;Hidden&gt; Nazjatar - Flight Master Whistle Upgrade - Alliance (DNT) (Alliance)
      [13741] = {Faction = 'Alliance', OtherSide = 13742},
      -- &lt;Hidden&gt; Nazjatar - Flight Master Whistle Upgrade - Horde (DNT) (Horde)
      [13742] = {Faction = 'Horde', OtherSide = 13741},
      -- The Fourth War (Horde)
      [13924] = {Faction = 'Horde', OtherSide = 13925},
      -- The Fourth War (Alliance)
      [13925] = {Faction = 'Alliance', OtherSide = 13924},
    -- Battle for Azeroth Ends
    -- Dragonflight Start
      -- Dracthyr, Awaken (Alliance)
      [15325] = {Faction = 'Alliance', OtherSide = 15638},
      -- Dracthyr, Awaken (Horde)
      [15638] = {Faction = 'Horde', OtherSide = 15325},
      -- &lt;Hidden&gt; 10.1.5 Warlock Expansion - Mail Quest Push - Alliance (NJS) (Alliance)
      [18390] = {Faction = 'Alliance', OtherSide = 18392},
      -- &lt;Hidden&gt; 10.1.5 Warlock Expansion - Mail Quest Push - Horde (NJS) (Horde)
      [18392] = {Faction = 'Horde', OtherSide = 18390},
    -- Dragonflight Ends
  -- Quests End

  -- Exploration Start
    -- Battle for Azeroth Start
      -- Nautical Battlefield Training (Horde)
      [13645] = {Faction = 'Horde', OtherSide = 13704},
      -- Nautical Battlefield Training (Alliance)
      [13704] = {Faction = 'Alliance', OtherSide = 13645},
      -- Aqua Team Murder Force (Horde)
      [13761] = {Faction = 'Horde', OtherSide = 13762},
      -- Aqua Team Murder Force (Alliance)
      [13762] = {Faction = 'Alliance', OtherSide = 13761},
    -- Battle for Azeroth Ends
  -- Exploration End

  -- Player vs. Player Start
    -- Battlemaster (Alliance)
    [230] = {Faction = 'Alliance', OtherSide = 1175},
    -- Know Thy Enemy (Alliance)
    [246] = {Faction = 'Alliance', OtherSide = 1005},
    -- City Defender (Alliance)
    [388] = {Faction = 'Alliance', OtherSide = 1006},
    -- Wrath of the Horde (Horde)
    [603] = {Faction = 'Horde', OtherSide = 604},
    -- Wrath of the Alliance (Alliance)
    [604] = {Faction = 'Alliance', OtherSide = 603},
    -- Killed in Quel'Thalas (Alliance)
    [613] = {Faction = 'Alliance', OtherSide = 618},
    -- For the Alliance! (Alliance)
    [614] = {Faction = 'Alliance', OtherSide = 619},
    -- Overthrow the Council (Horde)
    [616] = {Faction = 'Horde', OtherSide = 611},
    -- Putting Out the Light (Horde)
    [618] = {Faction = 'Horde', OtherSide = 613},
    -- For the Horde! (Horde)
    [619] = {Faction = 'Horde', OtherSide = 614},
    -- The Conqueror (Horde)
    [714] = {Faction = 'Horde', OtherSide = 907},
    -- The Justicar (Alliance)
    [907] = {Faction = 'Alliance', OtherSide = 714},
    -- Call to Arms! (Alliance)
    [908] = {Faction = 'Alliance', OtherSide = 909},
    -- Call to Arms! (Horde)
    [909] = {Faction = 'Horde', OtherSide = 908},
    -- Know Thy Enemy (Horde)
    [1005] = {Faction = 'Horde', OtherSide = 246},
    -- City Defender (Horde)
    [1006] = {Faction = 'Horde', OtherSide = 388},
    -- Battlemaster (Horde)
    [1175] = {Faction = 'Horde', OtherSide = 230},
    -- Grizzled Veteran (Alliance)
    [2016] = {Faction = 'Alliance', OtherSide = 2017},
    -- Grizzled Veteran (Horde)
    [2017] = {Faction = 'Horde', OtherSide = 2016},
    -- Khan (Alliance)
    [8052] = {Faction = 'Alliance', OtherSide = 8055},
    -- Khan (Horde)
    [8055] = {Faction = 'Horde', OtherSide = 8052},
    -- Executing the Exarch (Horde)
    [14815] = {Faction = 'Horde', OtherSide = 14817},
    -- Opposing Orgrimmar (Alliance)
    [14817] = {Faction = 'Alliance', OtherSide = 14815},
    -- Warsong Gulch Start
      -- Quick Cap (Alliance)
      [202] = {Faction = 'Alliance', OtherSide = 1502},
      -- Not In My House (Alliance)
      [203] = {Faction = 'Alliance', OtherSide = 1251},
      -- Supreme Defender (Alliance)
      [206] = {Faction = 'Alliance', OtherSide = 1252},
      -- Warsong Outrider (Horde)
      [712] = {Faction = 'Horde', OtherSide = 713},
      -- Silverwing Sentinel (Alliance)
      [713] = {Faction = 'Alliance', OtherSide = 712},
      -- Not In My House (Horde)
      [1251] = {Faction = 'Horde', OtherSide = 203},
      -- Supreme Defender (Horde)
      [1252] = {Faction = 'Horde', OtherSide = 206},
      -- Quick Cap (Horde)
      [1502] = {Faction = 'Horde', OtherSide = 202},
    -- Warsong Gulch Ends
    -- Arathi Basin Start
      -- The Defiler (Horde)
      [710] = {Faction = 'Horde', OtherSide = 711},
      -- Knight of Arathor (Alliance)
      [711] = {Faction = 'Alliance', OtherSide = 710},
    -- Arathi Basin Ends
    -- Alterac Valley Start
      -- Stormpike Perfection (Alliance)
      [220] = {Faction = 'Alliance', OtherSide = 873},
      -- Loyal Defender (Horde)
      [224] = {Faction = 'Horde', OtherSide = 1151},
      -- Everything Counts (Alliance)
      [225] = {Faction = 'Alliance', OtherSide = 1164},
      -- Frostwolf Howler (Horde)
      [706] = {Faction = 'Horde', OtherSide = 707},
      -- Stormpike Battle Charger (Alliance)
      [707] = {Faction = 'Alliance', OtherSide = 706},
      -- Hero of the Frostwolf Clan (Horde)
      [708] = {Faction = 'Horde', OtherSide = 709},
      -- Hero of the Stormpike Guard (Alliance)
      [709] = {Faction = 'Alliance', OtherSide = 708},
      -- Frostwolf Perfection (Horde)
      [873] = {Faction = 'Horde', OtherSide = 220},
      -- Loyal Defender (Alliance)
      [1151] = {Faction = 'Alliance', OtherSide = 224},
      -- Everything Counts (Horde)
      [1164] = {Faction = 'Horde', OtherSide = 225},
      -- Alterac Valley of Olde (Alliance)
      [13928] = {Faction = 'Alliance', OtherSide = 13930},
      -- Alterac Valley of Olde (Horde)
      [13930] = {Faction = 'Horde', OtherSide = 13928},
    -- Alterac Valley Ends
    -- Ashran Start
      -- Bounty Hunter (Horde)
      [9103] = {Faction = 'Horde', OtherSide = 9104},
      -- Bounty Hunter (Alliance)
      [9104] = {Faction = 'Alliance', OtherSide = 9103},
      -- Operation Counterattack (Horde)
      [9217] = {Faction = 'Horde', OtherSide = 9408},
      -- Take Them Out (Horde)
      [9224] = {Faction = 'Horde', OtherSide = 9225},
      -- Take Them Out (Alliance)
      [9225] = {Faction = 'Alliance', OtherSide = 9224},
      -- Down Goes Van Rook (Alliance)
      [9228] = {Faction = 'Alliance', OtherSide = nil},
      -- Rescue Operation (Alliance)
      [9256] = {Faction = 'Alliance', OtherSide = 9257},
      -- Rescue Operation (Horde)
      [9257] = {Faction = 'Horde', OtherSide = 9256},
      -- Operation Counterattack (Alliance)
      [9408] = {Faction = 'Alliance', OtherSide = 9217},
      -- Vol'jin's Spear (Horde)
      [9473] = {Faction = 'Horde', OtherSide = nil},
      -- Wrynn's Vanguard (Alliance)
      [9474] = {Faction = 'Alliance', OtherSide = nil},
      -- Thy Kingdom Come (Alliance)
      [9714] = {Faction = 'Alliance', OtherSide = 9715},
      -- Thy Kingdom Come (Horde)
      [9715] = {Faction = 'Horde', OtherSide = 9714},
    -- Ashran Ends
    -- Isle of Conquest Start
      -- Resource Glut (Alliance)
      [3846] = {Faction = 'Alliance', OtherSide = 4176},
      -- Mine (Alliance)
      [3851] = {Faction = 'Alliance', OtherSide = 4177},
      -- Demolition Derby (Alliance)
      [3856] = {Faction = 'Alliance', OtherSide = 4256},
      -- Master of Isle of Conquest (Alliance)
      [3857] = {Faction = 'Alliance', OtherSide = 3957},
      -- Master of Isle of Conquest (Horde)
      [3957] = {Faction = 'Horde', OtherSide = 3857},
      -- Resource Glut (Horde)
      [4176] = {Faction = 'Horde', OtherSide = 3846},
      -- Mine (Horde)
      [4177] = {Faction = 'Horde', OtherSide = 3851},
      -- Demolition Derby (Horde)
      [4256] = {Faction = 'Horde', OtherSide = 3856},
    -- Isle of Conquest Ends
    -- Wintergrasp Start
      -- Destruction Derby (Alliance)
      [1737] = {Faction = 'Alliance', OtherSide = 2476},
      -- Destruction Derby (Horde)
      [2476] = {Faction = 'Horde', OtherSide = 1737},
    -- Wintergrasp Ends
    -- Twin Peaks Start
      -- Soaring Spirits (Alliance)
      [5213] = {Faction = 'Alliance', OtherSide = 5214},
      -- Soaring Spirits (Horde)
      [5214] = {Faction = 'Horde', OtherSide = 5213},
      -- I'm in the White Lodge (Alliance)
      [5219] = {Faction = 'Alliance', OtherSide = 5220},
      -- I'm in the Black Lodge (Horde)
      [5220] = {Faction = 'Horde', OtherSide = 5219},
      -- Fire, Walk With Me (Alliance)
      [5221] = {Faction = 'Alliance', OtherSide = 5222},
      -- Fire, Walk With Me (Horde)
      [5222] = {Faction = 'Horde', OtherSide = 5221},
      -- Cloud Nine (Alliance)
      [5226] = {Faction = 'Alliance', OtherSide = 5227},
      -- Cloud Nine (Horde)
      [5227] = {Faction = 'Horde', OtherSide = 5226},
      -- Wild Hammering (Horde)
      [5228] = {Faction = 'Horde', OtherSide = 5229},
      -- Drag a Maw (Alliance)
      [5229] = {Faction = 'Alliance', OtherSide = 5228},
      -- Double Jeopardy (Alliance)
      [5231] = {Faction = 'Alliance', OtherSide = 5552},
      -- Double Jeopardy (Horde)
      [5552] = {Faction = 'Horde', OtherSide = 5231},
    -- Twin Peaks Ends
    -- Rated Battleground Start
      -- In Service of the Alliance (Alliance)
      [5268] = {Faction = 'Alliance', OtherSide = 5269},
      -- In Service of the Horde (Horde)
      [5269] = {Faction = 'Horde', OtherSide = 5268},
      -- In Service of the Alliance (Alliance)
      [5322] = {Faction = 'Alliance', OtherSide = 5269},
      -- In Service of the Horde (Horde)
      [5323] = {Faction = 'Horde', OtherSide = 5268},
      -- In Service of the Horde (Horde)
      [5324] = {Faction = 'Horde', OtherSide = 5268},
      -- Veteran of the Horde (Horde)
      [5325] = {Faction = 'Horde', OtherSide = 5328},
      -- Warbringer of the Horde (Horde)
      [5326] = {Faction = 'Horde', OtherSide = 5329},
      -- In Service of the Alliance (Alliance)
      [5327] = {Faction = 'Alliance', OtherSide = 5269},
      -- Veteran of the Alliance (Alliance)
      [5328] = {Faction = 'Alliance', OtherSide = 5325},
      -- Warbound Veteran of the Alliance (Alliance)
      [5329] = {Faction = 'Alliance', OtherSide = 5326},
      -- Private (Alliance)
      [5330] = {Faction = 'Alliance', OtherSide = 5345},
      -- Corporal (Alliance)
      [5331] = {Faction = 'Alliance', OtherSide = 5346},
      -- Sergeant (Alliance)
      [5332] = {Faction = 'Alliance', OtherSide = 5347},
      -- Master Sergeant (Alliance)
      [5333] = {Faction = 'Alliance', OtherSide = 5348},
      -- Sergeant Major (Alliance)
      [5334] = {Faction = 'Alliance', OtherSide = 5349},
      -- Knight (Alliance)
      [5335] = {Faction = 'Alliance', OtherSide = 5350},
      -- Knight-Lieutenant (Alliance)
      [5336] = {Faction = 'Alliance', OtherSide = 5351},
      -- Knight-Captain (Alliance)
      [5337] = {Faction = 'Alliance', OtherSide = 5352},
      -- Centurion (Horde)
      [5338] = {Faction = 'Horde', OtherSide = 5359},
      -- Lieutenant Commander (Alliance)
      [5339] = {Faction = 'Alliance', OtherSide = 5353},
      -- Commander (Alliance)
      [5340] = {Faction = 'Alliance', OtherSide = 9494},
      -- Marshal (Alliance)
      [5341] = {Faction = 'Alliance', OtherSide = 5355},
      -- Warlord (Horde)
      [5342] = {Faction = 'Horde', OtherSide = 5357},
      -- Grand Marshal (Alliance)
      [5343] = {Faction = 'Alliance', OtherSide = 5356},
      -- Scout (Horde)
      [5345] = {Faction = 'Horde', OtherSide = 5330},
      -- Grunt (Horde)
      [5346] = {Faction = 'Horde', OtherSide = 5331},
      -- Sergeant (Horde)
      [5347] = {Faction = 'Horde', OtherSide = 5332},
      -- Senior Sergeant (Horde)
      [5348] = {Faction = 'Horde', OtherSide = 5333},
      -- First Sergeant (Horde)
      [5349] = {Faction = 'Horde', OtherSide = 5334},
      -- Stone Guard (Horde)
      [5350] = {Faction = 'Horde', OtherSide = 5335},
      -- Blood Guard (Horde)
      [5351] = {Faction = 'Horde', OtherSide = 5336},
      -- Legionnaire (Horde)
      [5352] = {Faction = 'Horde', OtherSide = 5337},
      -- Champion (Horde)
      [5353] = {Faction = 'Horde', OtherSide = 5339},
      -- Lieutenant General (Horde)
      [5354] = {Faction = 'Horde', OtherSide = 5340},
      -- General (Horde)
      [5355] = {Faction = 'Horde', OtherSide = 5341},
      -- High Warlord (Horde)
      [5356] = {Faction = 'Horde', OtherSide = 5343},
      -- Field Marshal (Alliance)
      [5357] = {Faction = 'Alliance', OtherSide = 5342},
      -- Knight-Champion (Alliance)
      [5359] = {Faction = 'Alliance', OtherSide = 5338},
      -- Veteran of the Alliance II (Alliance)
      [5823] = {Faction = 'Alliance', OtherSide = 5824},
      -- Veteran of the Horde II (Horde)
      [5824] = {Faction = 'Horde', OtherSide = 5823},
      -- Hero of the Horde (Horde)
      [6941] = {Faction = 'Horde', OtherSide = 6942},
      -- Hero of the Alliance (Alliance)
      [6942] = {Faction = 'Alliance', OtherSide = 6941},
    -- Rated Battleground Ends
    -- World Start
      -- Conqueror of Azeroth (Horde)
      [12604] = {Faction = 'Horde', OtherSide = 12605},
      -- Conqueror of Azeroth (Alliance)
      [12605] = {Faction = 'Alliance', OtherSide = 12604},
      -- Frontline Veteran (Alliance)
      [13387] = {Faction = 'Alliance', OtherSide = 13388},
      -- Frontline Veteran (Horde)
      [13388] = {Faction = 'Horde', OtherSide = 13387},
      -- Frontline Slayer (Alliance)
      [13402] = {Faction = 'Alliance', OtherSide = 13403},
      -- Frontline Slayer (Horde)
      [13403] = {Faction = 'Horde', OtherSide = 13402},
      -- Boxing Match (Horde)
      [13438] = {Faction = 'Horde', OtherSide = 13439},
      -- Boxing Match (Alliance)
      [13439] = {Faction = 'Alliance', OtherSide = 13438},
    -- World Ends
  -- Player vs. Player End

  -- Dungeons & Raids Start
    -- Lich King Dungeon Start
      -- Trial of the Champion (Horde)
      [3778] = {Faction = 'Horde', OtherSide = 4296},
      -- Trial of the Champion (Alliance)
      [4296] = {Faction = 'Alliance', OtherSide = 3778},
      -- Heroic: Trial of the Champion (Horde)
      [4297] = {Faction = 'Horde', OtherSide = 4298},
      -- Heroic: Trial of the Champion (Alliance)
      [4298] = {Faction = 'Alliance', OtherSide = 4297},
    -- Lich King Dungeon Ends
    -- Pandaria Raid Start
      -- Conqueror of Orgrimmar (Alliance)
      [8679] = {Faction = 'Alliance', OtherSide = 8680},
      -- Liberator of Orgrimmar (Horde)
      [8680] = {Faction = 'Horde', OtherSide = 8679},
    -- Pandaria Raid Ends
    -- Battle Raid Start
      -- Siege of Dazar'alor (Alliance)
      [13286] = {Faction = 'Alliance', OtherSide = 13289},
      -- Empire's Fall (Alliance)
      [13287] = {Faction = 'Alliance', OtherSide = 13290},
      -- Might of the Alliance (Alliance)
      [13288] = {Faction = 'Alliance', OtherSide = 13291},
      -- Defense of Dazar'alor (Horde)
      [13289] = {Faction = 'Horde', OtherSide = 13286},
      -- Death's Bargain (Horde)
      [13290] = {Faction = 'Horde', OtherSide = 13287},
      -- Victory or Death (Horde)
      [13291] = {Faction = 'Horde', OtherSide = 13288},
      -- Mythic: Jadefire Masters (Horde)
      [13295] = {Faction = 'Horde', OtherSide = 13298},
      -- Mythic: Jadefire Masters (Alliance)
      [13298] = {Faction = 'Alliance', OtherSide = 13295},
    -- Battle Raid Ends
  -- Dungeons & Raids End

  -- Professions Start
    -- Professional Kul Tiran Master (Alliance)
    [12731] = {Faction = 'Alliance', OtherSide = 12733},
    -- Professional Zandalari Master (Horde)
    [12733] = {Faction = 'Horde', OtherSide = 12731},
    -- Working in Kul Tiras (Alliance)
    [12734] = {Faction = 'Alliance', OtherSide = 12735},
    -- Working in Zandalar (Horde)
    [12735] = {Faction = 'Horde', OtherSide = 12734},
    -- Kul Tiran Master of All (Alliance)
    [12736] = {Faction = 'Alliance', OtherSide = 12737},
    -- Zandalari Master of All (Horde)
    [12737] = {Faction = 'Horde', OtherSide = 12736},
    -- Giving a Scrap (Alliance)
    [12741] = {Faction = 'Alliance', OtherSide = 13056},
    -- Giving a Scrap (Horde)
    [13056] = {Faction = 'Horde', OtherSide = 12741},
    -- Inscription Start
      -- Forge and Befuddle (Horde)
      [18858] = {Faction = 'Horde', OtherSide = 18859},
      -- Forge and Befuddle (Alliance)
      [18859] = {Faction = 'Alliance', OtherSide = 18858},
    -- Inscription Ends
    -- Cooking Start
      -- Our Daily Bread (Alliance)
      [1782] = {Faction = 'Alliance', OtherSide = 1783},
      -- Our Daily Bread (Horde)
      [1783] = {Faction = 'Horde', OtherSide = 1782},
      -- Let's Do Lunch: Stormwind (Alliance)
      [5474] = {Faction = 'Alliance', OtherSide = 5475},
      -- Let's Do Lunch: Orgrimmar (Horde)
      [5475] = {Faction = 'Horde', OtherSide = 5474},
      -- Let's Do Lunch: Ironforge (Alliance)
      [5841] = {Faction = 'Alliance', OtherSide = 5844},
      -- Let's Do Lunch: Darnassus (Alliance)
      [5842] = {Faction = 'Alliance', OtherSide = 5843},
      -- Let's Do Lunch: Thunder Bluff (Horde)
      [5843] = {Faction = 'Horde', OtherSide = 5842},
      -- Let's Do Lunch: Undercity (Horde)
      [5844] = {Faction = 'Horde', OtherSide = 5841},
      -- Kul Tiran Cook (Alliance)
      [12742] = {Faction = 'Alliance', OtherSide = 12743},
      -- Zandalari Cook (Horde)
      [12743] = {Faction = 'Horde', OtherSide = 12742},
      -- The Kul Tiran Menu (Alliance)
      [12744] = {Faction = 'Alliance', OtherSide = 12746},
      -- The Zandalari Menu (Horde)
      [12746] = {Faction = 'Horde', OtherSide = 12744},
    -- Cooking Ends
    -- Fishing Start
      -- Fish or Cut Bait: Stormwind (Alliance)
      [5476] = {Faction = 'Alliance', OtherSide = 5477},
      -- Fish or Cut Bait: Orgrimmar (Horde)
      [5477] = {Faction = 'Horde', OtherSide = 5476},
      -- Fish or Cut Bait: Ironforge (Alliance)
      [5847] = {Faction = 'Alliance', OtherSide = 5850},
      -- Fish or Cut Bait: Darnassus (Alliance)
      [5848] = {Faction = 'Alliance', OtherSide = 5849},
      -- Fish or Cut Bait: Thunder Bluff (Horde)
      [5849] = {Faction = 'Horde', OtherSide = 5848},
      -- Fish or Cut Bait: Undercity (Horde)
      [5850] = {Faction = 'Horde', OtherSide = 5847},
      -- Kul Tiran Fisherman (Alliance)
      [12753] = {Faction = 'Alliance', OtherSide = 12754},
      -- Zandalari Fisherman (Horde)
      [12754] = {Faction = 'Horde', OtherSide = 12753},
      -- Baiting the Enemy (Alliance)
      [12758] = {Faction = 'Alliance', OtherSide = 12759},
      -- Baiting the Enemy (Horde)
      [12759] = {Faction = 'Horde', OtherSide = 12758},
    -- Fishing Ends
    -- Archaeology Start
      -- Kul Tiran Archaeologist (Alliance)
      [12760] = {Faction = 'Alliance', OtherSide = 12761},
      -- Zandalari Archaeologist (Horde)
      [12761] = {Faction = 'Horde', OtherSide = 12760},
      -- Kul Tiran Curator (Alliance)
      [12762] = {Faction = 'Alliance', OtherSide = 12764},
      -- Zandalari Curator (Horde)
      [12764] = {Faction = 'Horde', OtherSide = 12762},
    -- Archaeology Ends
  -- Professions End

  -- Reputation Start
    -- Ambassador of the Horde (Horde)
    [762] = {Faction = 'Horde', OtherSide = 948},
    -- The Diplomat (Alliance)
    [942] = {Faction = 'Alliance', OtherSide = 943},
    -- The Diplomat (Horde)
    [943] = {Faction = 'Horde', OtherSide = 942},
    -- Ambassador of the Alliance (Alliance)
    [948] = {Faction = 'Alliance', OtherSide = 762},
    -- The Burning Crusade Start
      -- The Burning Crusader (Horde)
      [763] = {Faction = 'Horde', OtherSide = 764},
      -- The Burning Crusader (Alliance)
      [764] = {Faction = 'Alliance', OtherSide = 763},
      -- Oh My, Kurenai (Alliance)
      [899] = {Faction = 'Alliance', OtherSide = 901},
      -- Mag'har of Draenor (Horde)
      [901] = {Faction = 'Horde', OtherSide = 899},
    -- The Burning Crusade Ends
    -- Wrath of the Lich King Start
      -- The Winds of the North (Horde)
      [1011] = {Faction = 'Horde', OtherSide = 1012},
      -- The Winds of the North (Alliance)
      [1012] = {Faction = 'Alliance', OtherSide = 1011},
    -- Wrath of the Lich King Ends
    -- Cataclysm Start
      -- Wildhammer Clan (Alliance)
      [4885] = {Faction = 'Alliance', OtherSide = 4886},
      -- Dragonmaw Clan (Horde)
      [4886] = {Faction = 'Horde', OtherSide = 4885},
      -- Baradin's Wardens (Alliance)
      [5375] = {Faction = 'Alliance', OtherSide = 5376},
      -- Hellscream's Reach (Horde)
      [5376] = {Faction = 'Horde', OtherSide = 5375},
    -- Cataclysm Ends
    -- Pandaria Start
      -- Pandaren Ambassador (Horde)
      [6827] = {Faction = 'Horde', OtherSide = 6828},
      -- Pandaren Ambassador (Alliance)
      [6828] = {Faction = 'Alliance', OtherSide = 6827},
      -- Operation: Shieldwall (Alliance)
      [8205] = {Faction = 'Alliance', OtherSide = 8206},
      -- Dominance Offensive (Horde)
      [8206] = {Faction = 'Horde', OtherSide = 8205},
      -- Kirin Tor Offensive (Alliance)
      [8208] = {Faction = 'Alliance', OtherSide = 8209},
      -- Sunreaver Onslaught (Horde)
      [8209] = {Faction = 'Horde', OtherSide = 8208},
    -- Pandaria Ends
    -- Draenor Start
      -- Council of Exarchs (Alliance)
      [9470] = {Faction = 'Alliance', OtherSide = nil},
      -- Frostwolf Orcs (Horde)
      [9471] = {Faction = 'Horde', OtherSide = nil},
      -- Laughing Skull Orcs (Horde)
      [9475] = {Faction = 'Horde', OtherSide = nil},
      -- Sha'tari Defense (Alliance)
      [9476] = {Faction = 'Alliance', OtherSide = nil},
      -- Savage Friends (Horde)
      [9477] = {Faction = 'Horde', OtherSide = 9478},
      -- Savage Friends (Alliance)
      [9478] = {Faction = 'Alliance', OtherSide = 9477},
      -- Tanaan Diplomat (Horde)
      [10349] = {Faction = 'Horde', OtherSide = 10350},
      -- Tanaan Diplomat (Alliance)
      [10350] = {Faction = 'Alliance', OtherSide = 10349},
    -- Draenor Ends
    -- Battle for Azeroth Start
      -- Talanji's Expedition (Horde)
      [12948] = {Faction = 'Horde', OtherSide = nil},
      -- The Voldunai (Horde)
      [12949] = {Faction = 'Horde', OtherSide = nil},
      -- Zandalari Empire (Horde)
      [12950] = {Faction = 'Horde', OtherSide = nil},
      -- Proudmoore Admiralty (Alliance)
      [12951] = {Faction = 'Alliance', OtherSide = nil},
      -- Order of Embers (Alliance)
      [12952] = {Faction = 'Alliance', OtherSide = nil},
      -- Storm's Wake (Alliance)
      [12953] = {Faction = 'Alliance', OtherSide = nil},
      -- Champion of the 7th Legion (Alliance)
      [12954] = {Faction = 'Alliance', OtherSide = nil},
      -- Champion of the Honorbound (Horde)
      [12957] = {Faction = 'Horde', OtherSide = nil},
      -- Waveblade Ankoan (Alliance)
      [13558] = {Faction = 'Alliance', OtherSide = nil},
      -- The Unshackled (Horde)
      [13559] = {Faction = 'Horde', OtherSide = nil},
    -- Battle for Azeroth Ends
  -- Reputation End

  -- World Events Start
    -- The Flame Warden (Alliance)
    [1038] = {Faction = 'Alliance', OtherSide = 1039},
    -- The Flame Keeper (Horde)
    [1039] = {Faction = 'Horde', OtherSide = 1038},
    -- Noblegarden Start
      -- Spring Fling (Alliance)
      [2419] = {Faction = 'Alliance', OtherSide = 2497},
      -- Noble Garden (Horde)
      [2420] = {Faction = 'Horde', OtherSide = 2421},
      -- Noble Garden (Alliance)
      [2421] = {Faction = 'Alliance', OtherSide = 2420},
      -- Spring Fling (Horde)
      [2497] = {Faction = 'Horde', OtherSide = 2419},
    -- Noblegarden Ends
    -- Midsummer Start
      -- Flame Warden of Eastern Kingdoms (Alliance)
      [1022] = {Faction = 'Alliance', OtherSide = 1025},
      -- Flame Warden of Kalimdor (Alliance)
      [1023] = {Faction = 'Alliance', OtherSide = 1026},
      -- Flame Warden of Outland (Alliance)
      [1024] = {Faction = 'Alliance', OtherSide = 1027},
      -- Flame Keeper of Eastern Kingdoms (Horde)
      [1025] = {Faction = 'Horde', OtherSide = 1022},
      -- Flame Keeper of Kalimdor (Horde)
      [1026] = {Faction = 'Horde', OtherSide = 1023},
      -- Flame Keeper of Outland (Horde)
      [1027] = {Faction = 'Horde', OtherSide = 1024},
      -- Extinguishing Eastern Kingdoms (Alliance)
      [1028] = {Faction = 'Alliance', OtherSide = 1031},
      -- Extinguishing Kalimdor (Alliance)
      [1029] = {Faction = 'Alliance', OtherSide = 1032},
      -- Extinguishing Outland (Alliance)
      [1030] = {Faction = 'Alliance', OtherSide = 1033},
      -- Extinguishing Eastern Kingdoms (Horde)
      [1031] = {Faction = 'Horde', OtherSide = 1028},
      -- Extinguishing Kalimdor (Horde)
      [1032] = {Faction = 'Horde', OtherSide = 1029},
      -- Extinguishing Outland (Horde)
      [1033] = {Faction = 'Horde', OtherSide = 1030},
      -- The Fires of Azeroth (Alliance)
      [1034] = {Faction = 'Alliance', OtherSide = 1036},
      -- Desecration of the Horde (Alliance)
      [1035] = {Faction = 'Alliance', OtherSide = 1037},
      -- The Fires of Azeroth (Horde)
      [1036] = {Faction = 'Horde', OtherSide = 1034},
      -- Desecration of the Alliance (Horde)
      [1037] = {Faction = 'Horde', OtherSide = 1035},
      -- Extinguishing Northrend (Alliance)
      [6007] = {Faction = 'Alliance', OtherSide = 6010},
      -- Flame Warden of Northrend (Alliance)
      [6008] = {Faction = 'Alliance', OtherSide = 6009},
      -- Flame Keeper of Northrend (Horde)
      [6009] = {Faction = 'Horde', OtherSide = 6008},
      -- Extinguishing Northrend (Horde)
      [6010] = {Faction = 'Horde', OtherSide = 6007},
      -- Flame Warden of Cataclysm (Alliance)
      [6011] = {Faction = 'Alliance', OtherSide = 6012},
      -- Flame Keeper of Cataclysm (Horde)
      [6012] = {Faction = 'Horde', OtherSide = 6011},
      -- Extinguishing the Cataclysm (Alliance)
      [6013] = {Faction = 'Alliance', OtherSide = 6014},
      -- Extinguishing the Cataclysm (Horde)
      [6014] = {Faction = 'Horde', OtherSide = 6013},
      -- Extinguishing Pandaria (Alliance)
      [8042] = {Faction = 'Alliance', OtherSide = 8043},
      -- Extinguishing Pandaria (Horde)
      [8043] = {Faction = 'Horde', OtherSide = 8042},
      -- Flame Keeper of Pandaria (Horde)
      [8044] = {Faction = 'Horde', OtherSide = 8045},
      -- Flame Warden of Pandaria (Alliance)
      [8045] = {Faction = 'Alliance', OtherSide = 8044},
      -- Extinguishing Draenor (Alliance)
      [11276] = {Faction = 'Alliance', OtherSide = 11277},
      -- Extinguishing Draenor (Horde)
      [11277] = {Faction = 'Horde', OtherSide = 11276},
      -- Extinguishing the Broken Isles (Alliance)
      [11278] = {Faction = 'Alliance', OtherSide = 11279},
      -- Extinguishing the Broken Isles (Horde)
      [11279] = {Faction = 'Horde', OtherSide = 11278},
      -- Flame Warden of the Broken Isles (Alliance)
      [11280] = {Faction = 'Alliance', OtherSide = 11282},
      -- Flame Keeper of the Broken Isles (Horde)
      [11282] = {Faction = 'Horde', OtherSide = 11280},
      -- Flame Warden of Draenor (Alliance)
      [11283] = {Faction = 'Alliance', OtherSide = 11284},
      -- Flame Keeper of Draenor (Horde)
      [11284] = {Faction = 'Horde', OtherSide = 11283},
      -- Flame Keeper of Zandalar (Horde)
      [13340] = {Faction = 'Horde', OtherSide = 13341},
      -- Flame Warden of Kul Tiras (Alliance)
      [13341] = {Faction = 'Alliance', OtherSide = 13340},
      -- Extinguishing Kul Tiras (Horde)
      [13342] = {Faction = 'Horde', OtherSide = 13343},
      -- Extinguishing Zandalar (Alliance)
      [13343] = {Faction = 'Alliance', OtherSide = 13342},
      -- Flame Warden of the Dragon Isles (Alliance)
      [17737] = {Faction = 'Alliance', OtherSide = 17738},
      -- Flame Keeper of the Dragon Isles (Horde)
      [17738] = {Faction = 'Horde', OtherSide = 17737},
    -- Midsummer Ends
    -- Brewfest Start
      -- Strange Brew (Alliance)
      [1184] = {Faction = 'Alliance', OtherSide = 1203},
      -- Strange Brew (Horde)
      [1203] = {Faction = 'Horde', OtherSide = 1184},
    -- Brewfest Ends
    -- Hallow's End Start
      -- Tricks and Treats of Kalimdor (Alliance)
      [963] = {Faction = 'Alliance', OtherSide = 965},
      -- Tricks and Treats of Kalimdor (Horde)
      [965] = {Faction = 'Horde', OtherSide = 963},
      -- Tricks and Treats of Eastern Kingdoms (Alliance)
      [966] = {Faction = 'Alliance', OtherSide = 967},
      -- Tricks and Treats of Eastern Kingdoms (Horde)
      [967] = {Faction = 'Horde', OtherSide = 966},
      -- Tricks and Treats of Outland (Horde)
      [968] = {Faction = 'Horde', OtherSide = 969},
      -- Tricks and Treats of Outland (Alliance)
      [969] = {Faction = 'Alliance', OtherSide = 968},
      -- Rotten Hallow (Alliance)
      [1040] = {Faction = 'Alliance', OtherSide = 1041},
      -- Rotten Hallow (Horde)
      [1041] = {Faction = 'Horde', OtherSide = 1040},
      -- Tricks and Treats of Northrend (Horde)
      [5835] = {Faction = 'Horde', OtherSide = 5836},
      -- Tricks and Treats of Northrend (Alliance)
      [5836] = {Faction = 'Alliance', OtherSide = 5835},
      -- Tricks and Treats of the Cataclysm (Alliance)
      [5837] = {Faction = 'Alliance', OtherSide = 5838},
      -- Tricks and Treats of the Cataclysm (Horde)
      [5838] = {Faction = 'Horde', OtherSide = 5837},
      -- Tricks and Treats of Pandaria (Alliance)
      [7601] = {Faction = 'Alliance', OtherSide = 7602},
      -- Tricks and Treats of Pandaria (Horde)
      [7602] = {Faction = 'Horde', OtherSide = 7601},
    -- Hallow's End Ends
    -- Pilgrim's Bounty Start
      -- Pilgrim's Paunch (Alliance)
      [3556] = {Faction = 'Alliance', OtherSide = 3557},
      -- Pilgrim's Paunch (Horde)
      [3557] = {Faction = 'Horde', OtherSide = 3556},
      -- Now We're Cookin' (Alliance)
      [3576] = {Faction = 'Alliance', OtherSide = 3577},
      -- Now We're Cookin' (Horde)
      [3577] = {Faction = 'Horde', OtherSide = 3576},
      -- Pilgrim's Peril (Alliance)
      [3580] = {Faction = 'Alliance', OtherSide = 3581},
      -- Pilgrim's Peril (Horde)
      [3581] = {Faction = 'Horde', OtherSide = 3580},
      -- Pilgrim's Progress (Alliance)
      [3596] = {Faction = 'Alliance', OtherSide = 3597},
      -- Pilgrim's Progress (Horde)
      [3597] = {Faction = 'Horde', OtherSide = 3596},
    -- Pilgrim's Bounty Ends
    -- Winter Veil Start
      -- Scrooge (Horde)
      [259] = {Faction = 'Horde', OtherSide = 1255},
      -- Scrooge (Alliance)
      [1255] = {Faction = 'Alliance', OtherSide = 259},
      -- Holiday Bromance (Horde)
      [1685] = {Faction = 'Horde', OtherSide = 1686},
      -- Holiday Bromance (Alliance)
      [1686] = {Faction = 'Alliance', OtherSide = 1685},
      -- BB King (Alliance)
      [4436] = {Faction = 'Alliance', OtherSide = 4437},
      -- BB King (Horde)
      [4437] = {Faction = 'Horde', OtherSide = 4436},
      -- A-Caroling We Will Go (Alliance)
      [5853] = {Faction = 'Alliance', OtherSide = 5854},
      -- A-Caroling We Will Go (Horde)
      [5854] = {Faction = 'Horde', OtherSide = 5853},
    -- Winter Veil Ends
    -- Darkmoon Faire Start
      -- Taking the Show on the Road (Alliance)
      [6030] = {Faction = 'Alliance', OtherSide = 6031},
      -- Taking the Show on the Road (Horde)
      [6031] = {Faction = 'Horde', OtherSide = 6030},
    -- Darkmoon Faire Ends
  -- World Events End

  -- Pet Battles Start
    -- Battle Start
      -- Taming Kalimdor (Horde)
      [6602] = {Faction = 'Horde', OtherSide = 6603},
      -- Taming Eastern Kingdoms (Alliance)
      [6603] = {Faction = 'Alliance', OtherSide = 6602},
    -- Battle Ends
  -- Pet Battles End

  -- Collections Start
    -- Mounts Start
      -- Mountain o' Mounts (Alliance)
      [2536] = {Faction = 'Alliance', OtherSide = 2537},
      -- Mountain o' Mounts (Horde)
      [2537] = {Faction = 'Horde', OtherSide = 2536},
      -- We're Going to Need More Saddles (Alliance)
      [7860] = {Faction = 'Alliance', OtherSide = 7862},
      -- We're Going to Need More Saddles (Horde)
      [7862] = {Faction = 'Horde', OtherSide = 7860},
      -- Mount Parade (Horde)
      [8302] = {Faction = 'Horde', OtherSide = 8304},
      -- Mount Parade (Alliance)
      [8304] = {Faction = 'Alliance', OtherSide = 8302},
      -- Mountacular (Alliance)
      [9598] = {Faction = 'Alliance', OtherSide = 9599},
      -- Mountacular (Horde)
      [9599] = {Faction = 'Horde', OtherSide = 9598},
      -- Lord of the Reins (Horde)
      [10355] = {Faction = 'Horde', OtherSide = 10356},
      -- Lord of the Reins (Alliance)
      [10356] = {Faction = 'Alliance', OtherSide = 10355},
      -- No Stable Big Enough (Horde)
      [12931] = {Faction = 'Horde', OtherSide = 12932},
      -- No Stable Big Enough (Alliance)
      [12932] = {Faction = 'Alliance', OtherSide = 12931},
      -- A Horde of Hoofbeats (Alliance)
      [12933] = {Faction = 'Alliance', OtherSide = 12934},
      -- A Horde of Hoofbeats (Horde)
      [12934] = {Faction = 'Horde', OtherSide = 12933},
      -- Thanks for the Carry! (Horde)
      [15833] = {Faction = 'Horde', OtherSide = 15834},
      -- Thanks for the Carry! (Alliance)
      [15834] = {Faction = 'Alliance', OtherSide = 15833},
    -- Mounts Ends
  -- Collections End

  -- Expansion Features Start
    -- Argent Tournament Start
      -- Exalted Champion of Darnassus (Alliance)
      [2760] = {Faction = 'Alliance', OtherSide = 2769},
      -- Exalted Champion of the Exodar (Alliance)
      [2761] = {Faction = 'Alliance', OtherSide = 2767},
      -- Exalted Champion of Gnomeregan (Alliance)
      [2762] = {Faction = 'Alliance', OtherSide = 2766},
      -- Exalted Champion of Ironforge (Alliance)
      [2763] = {Faction = 'Alliance', OtherSide = 2768},
      -- Exalted Champion of Stormwind (Alliance)
      [2764] = {Faction = 'Alliance', OtherSide = 2765},
      -- Exalted Champion of Orgrimmar (Horde)
      [2765] = {Faction = 'Horde', OtherSide = 2764},
      -- Exalted Champion of Sen'jin (Horde)
      [2766] = {Faction = 'Horde', OtherSide = 2762},
      -- Exalted Champion of Silvermoon City (Horde)
      [2767] = {Faction = 'Horde', OtherSide = 2761},
      -- Exalted Champion of Thunder Bluff (Horde)
      [2768] = {Faction = 'Horde', OtherSide = 2763},
      -- Exalted Champion of the Undercity (Horde)
      [2769] = {Faction = 'Horde', OtherSide = 2760},
      -- Exalted Champion of the Alliance (Alliance)
      [2770] = {Faction = 'Alliance', OtherSide = 2771},
      -- Exalted Champion of the Horde (Horde)
      [2771] = {Faction = 'Horde', OtherSide = 2770},
      -- Champion of Darnassus (Alliance)
      [2777] = {Faction = 'Alliance', OtherSide = 2787},
      -- Champion of the Exodar (Alliance)
      [2778] = {Faction = 'Alliance', OtherSide = 2785},
      -- Champion of Gnomeregan (Alliance)
      [2779] = {Faction = 'Alliance', OtherSide = 2784},
      -- Champion of Ironforge (Alliance)
      [2780] = {Faction = 'Alliance', OtherSide = 2786},
      -- Champion of Stormwind (Alliance)
      [2781] = {Faction = 'Alliance', OtherSide = 2783},
      -- Champion of the Alliance (Alliance)
      [2782] = {Faction = 'Alliance', OtherSide = 2788},
      -- Champion of Orgrimmar (Horde)
      [2783] = {Faction = 'Horde', OtherSide = 2781},
      -- Champion of Sen'jin (Horde)
      [2784] = {Faction = 'Horde', OtherSide = 2779},
      -- Champion of Silvermoon City (Horde)
      [2785] = {Faction = 'Horde', OtherSide = 2778},
      -- Champion of Thunder Bluff (Horde)
      [2786] = {Faction = 'Horde', OtherSide = 2780},
      -- Champion of the Undercity (Horde)
      [2787] = {Faction = 'Horde', OtherSide = 2777},
      -- Champion of the Horde (Horde)
      [2788] = {Faction = 'Horde', OtherSide = 2782},
      -- Exalted Argent Champion of the Horde (Horde)
      [2816] = {Faction = 'Horde', OtherSide = 2817},
      -- Exalted Argent Champion of the Alliance (Alliance)
      [2817] = {Faction = 'Alliance', OtherSide = 2816},
      -- A Silver Confidant (Alliance)
      [3676] = {Faction = 'Alliance', OtherSide = 3677},
      -- The Sunreavers (Horde)
      [3677] = {Faction = 'Horde', OtherSide = 3676},
    -- Argent Tournament Ends
    -- Tol Barad Start
      -- Tol Barad Veteran (Alliance)
      [5417] = {Faction = 'Alliance', OtherSide = 5418},
      -- Tol Barad Veteran (Horde)
      [5418] = {Faction = 'Horde', OtherSide = 5417},
      -- Master of Tol Barad (Alliance)
      [5489] = {Faction = 'Alliance', OtherSide = 5490},
      -- Master of Tol Barad (Horde)
      [5490] = {Faction = 'Horde', OtherSide = 5489},
      -- Just Another Day in Tol Barad (Alliance)
      [5718] = {Faction = 'Alliance', OtherSide = 5719},
      -- Just Another Day in Tol Barad (Horde)
      [5719] = {Faction = 'Horde', OtherSide = 5718},
    -- Tol Barad Ends
    -- Pandaria Scenarios Start
      -- Scenaturday (Alliance)
      [6874] = {Faction = 'Alliance', OtherSide = 7509},
      -- Scenaturday (Horde)
      [7509] = {Faction = 'Horde', OtherSide = 6874},
      -- Theramore's Fall (Alliance)
      [7523] = {Faction = 'Alliance', OtherSide = 7524},
      -- Theramore's Fall (Horde)
      [7524] = {Faction = 'Horde', OtherSide = 7523},
      -- Kite Fight (Alliance)
      [7526] = {Faction = 'Alliance', OtherSide = 7529},
      -- No Tank You (Alliance)
      [7527] = {Faction = 'Alliance', OtherSide = 7530},
      -- Kite Fight (Horde)
      [7529] = {Faction = 'Horde', OtherSide = 7526},
      -- No Tank You (Horde)
      [7530] = {Faction = 'Horde', OtherSide = 7527},
      -- Lion's Landing (Alliance)
      [8010] = {Faction = 'Alliance', OtherSide = 8013},
      -- Number Five Is Alive (Alliance)
      [8011] = {Faction = 'Alliance', OtherSide = 8014},
      -- Waste Not, Want Not (Alliance)
      [8012] = {Faction = 'Alliance', OtherSide = 8015},
      -- Domination Point (Horde)
      [8013] = {Faction = 'Horde', OtherSide = 8010},
      -- Number Five Is Alive (Horde)
      [8014] = {Faction = 'Horde', OtherSide = 8011},
      -- Waste Not, Want Not (Horde)
      [8015] = {Faction = 'Horde', OtherSide = 8012},
      -- Battle on the High Seas (Alliance)
      [8314] = {Faction = 'Alliance', OtherSide = 8315},
      -- Battle on the High Seas (Horde)
      [8315] = {Faction = 'Horde', OtherSide = 8314},
      -- Heroic: Battle on the High Seas (Alliance)
      [8364] = {Faction = 'Alliance', OtherSide = 8366},
      -- Heroic: Battle on the High Seas (Horde)
      [8366] = {Faction = 'Horde', OtherSide = 8364},
    -- Pandaria Scenarios Ends
    -- Draenor Garrison Start
      -- Choppin' Even More Logs (Alliance)
      [9078] = {Faction = 'Alliance', OtherSide = 9080},
      -- Choppin' Even More Logs (Horde)
      [9080] = {Faction = 'Horde', OtherSide = 9078},
      -- More Plots (Alliance)
      [9100] = {Faction = 'Alliance', OtherSide = 9545},
      -- Even More Plots (Alliance)
      [9101] = {Faction = 'Alliance', OtherSide = 9546},
      -- Garrison Buddies (Horde)
      [9132] = {Faction = 'Horde', OtherSide = 9210},
      -- Garrison Buddies (Alliance)
      [9210] = {Faction = 'Alliance', OtherSide = 9132},
      -- Defender of Draenor (Horde)
      [9248] = {Faction = 'Horde', OtherSide = 9630},
      -- Mythic Draenor Raider (Horde)
      [9255] = {Faction = 'Horde', OtherSide = 9631},
      -- Warlord of Draenor (Horde)
      [9508] = {Faction = 'Horde', OtherSide = 9738},
      -- Nemesis: Draenei Destroyer (Horde)
      [9509] = {Faction = 'Horde', OtherSide = 9516},
      -- Nemesis: Dwarfstalker (Horde)
      [9510] = {Faction = 'Horde', OtherSide = nil},
      -- Nemesis: Gnomebane (Horde)
      [9511] = {Faction = 'Horde', OtherSide = nil},
      -- Nemesis: Manslayer (Horde)
      [9512] = {Faction = 'Horde', OtherSide = nil},
      -- Nemesis: Scourge of the Kaldorei (Horde)
      [9513] = {Faction = 'Horde', OtherSide = nil},
      -- Nemesis: Terror of the Tushui (Horde)
      [9514] = {Faction = 'Horde', OtherSide = nil},
      -- Nemesis: Worgen Hunter (Horde)
      [9515] = {Faction = 'Horde', OtherSide = nil},
      -- Nemesis: Slayer of Sin'dorei (Alliance)
      [9516] = {Faction = 'Alliance', OtherSide = 9509},
      -- Nemesis: Death Stalker (Alliance)
      [9517] = {Faction = 'Alliance', OtherSide = nil},
      -- Nemesis: Killer of Kezan (Alliance)
      [9518] = {Faction = 'Alliance', OtherSide = nil},
      -- Nemesis: Orcslayer (Alliance)
      [9519] = {Faction = 'Alliance', OtherSide = nil},
      -- Nemesis: Huojin's Fall (Alliance)
      [9520] = {Faction = 'Alliance', OtherSide = nil},
      -- Nemesis: The Butcher (Alliance)
      [9521] = {Faction = 'Alliance', OtherSide = nil},
      -- Nemesis: Troll Hunter (Alliance)
      [9522] = {Faction = 'Alliance', OtherSide = nil},
      -- Advanced Husbandry (Alliance)
      [9539] = {Faction = 'Alliance', OtherSide = 9705},
      -- The Stable Master (Alliance)
      [9540] = {Faction = 'Alliance', OtherSide = 9706},
      -- More Plots (Horde)
      [9545] = {Faction = 'Horde', OtherSide = 9100},
      -- Even More Plots (Horde)
      [9546] = {Faction = 'Horde', OtherSide = 9101},
      -- Defender of Draenor (Alliance)
      [9630] = {Faction = 'Alliance', OtherSide = 9248},
      -- Mythic Draenor Raider (Alliance)
      [9631] = {Faction = 'Alliance', OtherSide = 9255},
      -- Advanced Husbandry (Horde)
      [9705] = {Faction = 'Horde', OtherSide = 9539},
      -- The Stable Master (Horde)
      [9706] = {Faction = 'Horde', OtherSide = 9540},
      -- Warlord of Draenor (Alliance)
      [9738] = {Faction = 'Alliance', OtherSide = 9508},
      -- Ten Hit Tunes (Alliance)
      [9828] = {Faction = 'Alliance', OtherSide = 9897},
      -- Ten Hit Tunes (Horde)
      [9897] = {Faction = 'Horde', OtherSide = 9828},
      -- Don't Call Me Junior (Horde)
      [9901] = {Faction = 'Horde', OtherSide = 9928},
      -- Azeroth's Top Twenty Tunes (Alliance)
      [9912] = {Faction = 'Alliance', OtherSide = 9914},
      -- Azeroth's Top Twenty Tunes (Horde)
      [9914] = {Faction = 'Horde', OtherSide = 9912},
      -- Don't Call Me Junior (Alliance)
      [9928] = {Faction = 'Alliance', OtherSide = 9901},
      -- Full Discography (Alliance)
      [10015] = {Faction = 'Alliance', OtherSide = 10016},
      -- Full Discography (Horde)
      [10016] = {Faction = 'Horde', OtherSide = 10015},
      -- Exploring the High Seas (Alliance)
      [10167] = {Faction = 'Alliance', OtherSide = 10307},
      -- Petty Officer (Alliance)
      [10172] = {Faction = 'Alliance', OtherSide = 10255},
      -- Fleet Commander (Alliance)
      [10173] = {Faction = 'Alliance', OtherSide = 10275},
      -- Admiral (Alliance)
      [10174] = {Faction = 'Alliance', OtherSide = 10276},
      -- Petty Officer (Horde)
      [10255] = {Faction = 'Horde', OtherSide = 10172},
      -- Charting a Course (Alliance)
      [10256] = {Faction = 'Alliance', OtherSide = 10258},
      -- Charting a Course (Horde)
      [10258] = {Faction = 'Horde', OtherSide = 10256},
      -- Fleet Commander (Horde)
      [10275] = {Faction = 'Horde', OtherSide = 10173},
      -- Admiral (Horde)
      [10276] = {Faction = 'Horde', OtherSide = 10174},
      -- Exploring the High Seas (Horde)
      [10307] = {Faction = 'Horde', OtherSide = 10167},
    -- Draenor Garrison Ends
    -- Legion Class Hall Start
      -- Fighting with Style: War-torn (Alliance)
      [10749] = {Faction = 'Alliance', OtherSide = 11173},
      -- Fighting with Style: War-torn (Horde)
      [11173] = {Faction = 'Horde', OtherSide = 10749},
    -- Legion Class Hall Ends
    -- Island Expeditions Start
      -- Team Deathmatch (Alliance)
      [13133] = {Faction = 'Alliance', OtherSide = 13135},
      -- Team Deathmatch (Horde)
      [13135] = {Faction = 'Horde', OtherSide = 13133},
    -- Island Expeditions Ends
    -- War Effort Start
      -- Azeroth at War: The Barrens (Horde)
      [12867] = {Faction = 'Horde', OtherSide = 12896},
      -- Azeroth at War: After Lordaeron (Horde)
      [12869] = {Faction = 'Horde', OtherSide = 12898},
      -- Azeroth at War: Kalimdor on Fire (Horde)
      [12870] = {Faction = 'Horde', OtherSide = 12899},
      -- War is Hell (Horde)
      [12873] = {Faction = 'Horde', OtherSide = 12881},
      -- Strike Fast (Horde)
      [12876] = {Faction = 'Horde', OtherSide = 12889},
      -- Strike Hard (Horde)
      [12877] = {Faction = 'Horde', OtherSide = 12888},
      -- Leader of Troops (Horde)
      [12878] = {Faction = 'Horde', OtherSide = 12884},
      -- Tour of War (Horde)
      [12879] = {Faction = 'Horde', OtherSide = 12886},
      -- War is Hell (Alliance)
      [12881] = {Faction = 'Alliance', OtherSide = 12873},
      -- Leader of Troops (Alliance)
      [12884] = {Faction = 'Alliance', OtherSide = 12878},
      -- Tour of War (Alliance)
      [12886] = {Faction = 'Alliance', OtherSide = 12879},
      -- Strike Hard (Alliance)
      [12888] = {Faction = 'Alliance', OtherSide = 12877},
      -- Strike Fast (Alliance)
      [12889] = {Faction = 'Alliance', OtherSide = 12876},
      -- Azeroth at War: The Barrens (Alliance)
      [12896] = {Faction = 'Alliance', OtherSide = 12867},
      -- Azeroth at War: After Lordaeron (Alliance)
      [12898] = {Faction = 'Alliance', OtherSide = 12869},
      -- Azeroth at War: Kalimdor on Fire (Alliance)
      [12899] = {Faction = 'Alliance', OtherSide = 12870},
      -- Defeat 2 Commanders (Horde) (Hidden) (Horde)
      [13254] = {Faction = 'Horde', OtherSide = 13255},
      -- Defeat 2 Commanders (Alliance) (Hidden) (Alliance)
      [13255] = {Faction = 'Alliance', OtherSide = 13254},
      -- War for the Shore (Horde)
      [13296] = {Faction = 'Horde', OtherSide = 13297},
      -- War for the Shore (Alliance)
      [13297] = {Faction = 'Alliance', OtherSide = 13296},
      -- Under Cover of Darkness (Horde)
      [13301] = {Faction = 'Horde', OtherSide = 13302},
      -- Under Cover of Darkness (Alliance)
      [13302] = {Faction = 'Alliance', OtherSide = 13301},
      -- Night Moves (Alliance)
      [13305] = {Faction = 'Alliance', OtherSide = 13306},
      -- Night Moves (Horde)
      [13306] = {Faction = 'Horde', OtherSide = 13305},
      -- Recruitment Officer (Horde)
      [13307] = {Faction = 'Horde', OtherSide = 13308},
      -- Recruitment Officer (Alliance)
      [13308] = {Faction = 'Alliance', OtherSide = 13307},
      -- Heroic: War is Hell (Horde)
      [13735] = {Faction = 'Horde', OtherSide = 13737},
      -- Heroic: War is Hell (Alliance)
      [13737] = {Faction = 'Alliance', OtherSide = 13735},
      -- Heroic: Tour of War (Horde)
      [13738] = {Faction = 'Horde', OtherSide = nil},
      -- Heroic: Tour of War (Alliance)
      [13739] = {Faction = 'Alliance', OtherSide = nil},
      -- Heroic: War for the Shore (Horde)
      [14149] = {Faction = 'Horde', OtherSide = 14150},
      -- Heroic: War for the Shore (Alliance)
      [14150] = {Faction = 'Alliance', OtherSide = 14149},
    -- War Effort Ends
  -- Expansion Features End

  -- Remix: Pandaria Start
    -- Quests Start
      -- Campaign: The Jade Forest (Alliance)
      [19882] = {Faction = 'Alliance', OtherSide = 19883},
      -- Campaign: The Jade Forest (Horde)
      [19883] = {Faction = 'Horde', OtherSide = 19882},
      -- Campaign: Krasarang Wilds (Alliance)
      [19885] = {Faction = 'Alliance', OtherSide = 19886},
      -- Campaign: Krasarang Wilds (Horde)
      [19886] = {Faction = 'Horde', OtherSide = 19885},
      -- Campaign: Kun-Lai Summit (Alliance)
      [19887] = {Faction = 'Alliance', OtherSide = 19888},
      -- Campaign: Kun-Lai Summit (Horde)
      [19888] = {Faction = 'Horde', OtherSide = 19887},
    -- Quests Ends
    -- Reputation Start
      -- Operation: Shieldwall (Alliance)
      [19917] = {Faction = 'Alliance', OtherSide = 19918},
      -- Dominance Offensive (Horde)
      [19918] = {Faction = 'Horde', OtherSide = 19917},
      -- Kirin Tor Offensive (Alliance)
      [19919] = {Faction = 'Alliance', OtherSide = 19920},
      -- Sunreaver Onslaught (Horde)
      [19920] = {Faction = 'Horde', OtherSide = 19919},
    -- Reputation Ends
    -- Scenarios Start
      -- Domination Point (Horde)
      [19932] = {Faction = 'Horde', OtherSide = 20500},
      -- Battle on the High Seas (Alliance)
      [19934] = {Faction = 'Alliance', OtherSide = 19936},
      -- Heroic: Battle on the High Seas (Alliance)
      [19935] = {Faction = 'Alliance', OtherSide = 19937},
      -- Battle on the High Seas (Horde)
      [19936] = {Faction = 'Horde', OtherSide = 19934},
      -- Heroic: Battle on the High Seas (Horde)
      [19937] = {Faction = 'Horde', OtherSide = 19935},
      -- Theramore's Fall (Alliance)
      [19938] = {Faction = 'Alliance', OtherSide = 19939},
      -- Theramore's Fall (Horde)
      [19939] = {Faction = 'Horde', OtherSide = 19938},
      -- Lion's Landing (Alliance)
      [20500] = {Faction = 'Alliance', OtherSide = 19932},
    -- Scenarios Ends
  -- Remix: Pandaria End

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
      -- Vicious Saddle (37) (Alliance)
      [17725] = {Faction = 'Alliance', OtherSide = 17726},
      -- Vicious Saddle (37) (Horde)
      [17726] = {Faction = 'Horde', OtherSide = 17725},
      -- Obsidian Combatant (Alliance)
      [17727] = {Faction = 'Alliance', OtherSide = 17728},
      -- Obsidian Combatant (Horde)
      [17728] = {Faction = 'Horde', OtherSide = 17727},
      -- Hero of the Alliance: Obsidian (Alliance)
      [17768] = {Faction = 'Alliance', OtherSide = 17772},
      -- Hero of the Horde: Obsidian (Horde)
      [17772] = {Faction = 'Horde', OtherSide = 17768},
      -- Verdant Combatant (Alliance)
      [19140] = {Faction = 'Alliance', OtherSide = 19141},
      -- Verdant Combatant (Horde)
      [19141] = {Faction = 'Horde', OtherSide = 19140},
      -- Hero of the Horde: Verdant (Horde)
      [19161] = {Faction = 'Horde', OtherSide = 19162},
      -- Hero of the Alliance: Verdant (Alliance)
      [19162] = {Faction = 'Alliance', OtherSide = 19161},
      -- Vicious Saddle (38) (Alliance)
      [19287] = {Faction = 'Alliance', OtherSide = 19289},
      -- Vicious Saddle (38) (Horde)
      [19289] = {Faction = 'Horde', OtherSide = 19287},
      -- Hero of the Alliance: Draconic (Alliance)
      [19455] = {Faction = 'Alliance', OtherSide = 19456},
      -- Hero of the Horde: Draconic (Horde)
      [19456] = {Faction = 'Horde', OtherSide = 19455},
      -- Draconic Combatant (Alliance)
      [19501] = {Faction = 'Alliance', OtherSide = 19502},
      -- Draconic Combatant (Horde)
      [19502] = {Faction = 'Horde', OtherSide = 19501},
      -- Vicious Saddle (39) (Alliance)
      [19551] = {Faction = 'Alliance', OtherSide = 19552},
      -- Vicious Saddle (39) (Horde)
      [19552] = {Faction = 'Horde', OtherSide = 19551},
    -- Player vs. Player Ends
    -- Events Start
      -- Flirt With Disaster (Alliance)
      [1279] = {Faction = 'Alliance', OtherSide = 1280},
      -- Flirt With Disaster (Horde)
      [1280] = {Faction = 'Horde', OtherSide = 1279},
      -- Nation of Adoration (Alliance)
      [1697] = {Faction = 'Alliance', OtherSide = 1698},
      -- Nation of Adoration (Horde)
      [1698] = {Faction = 'Horde', OtherSide = 1697},
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

