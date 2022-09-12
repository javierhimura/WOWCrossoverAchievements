local _, CrossoverAchievements = ...

local CompressHelper = {};
CrossoverAchievements.CompressHelper = CompressHelper;

local libJ = LibStub:GetLibrary("LibParse");
local libS = LibStub:GetLibrary("AceSerializer-3.0");
local libC = LibStub:GetLibrary("LibCompress");
local libCE = libC:GetChatEncodeTable();
local libSerializer = LibStub("LibSerialize");
local LibBase64 = LibStub:GetLibrary("LibBase64-1.0");

function CompressHelper:CompressEncodeData(GameVersionTable)
    local ExportTable = {};
    GameVersionTable.ExportData = {};
    ExportTable.GameVersion = GameVersionTable.GameVersion;
    ExportTable.Time = GameVersionTable.Time;
    ExportTable.Characters = GameVersionTable.Characters;
    ExportTable.Achievements = GameVersionTable.Achievements;
    local json = libJ:JSONEncode(ExportTable);
    local base64Data1 = LibBase64.Encode(json);
    local compressedData1 = libC:Compress(base64Data1);
    local compressedData2 = libCE:Encode(compressedData1);
    local base64Data2 = LibBase64.Encode(compressedData2);
    GameVersionTable.ExportData = base64Data2;
end

function CompressHelper:DecompressDecodeData(GameVersionTable)
    if not GameVersionTable.ExportData or GameVersionTable.ExportData == "" then
        return;
    end
    local compressedData2 = LibBase64.Decode(GameVersionTable.ExportData);
    if not compressedData2 then
        return;
    end
    local compressedData1 = libCE:Decode(compressedData2);
    if not compressedData1 then
        return;
    end
    local base64Data1 = libC:Decompress(compressedData1);
    if not base64Data1 or base64Data1 == "" then
        return;
    end
    local json = LibBase64.Decode(base64Data1);
    if not json or json == "" then
        return;
    end
    local ImportData = libJ:JSONDecode(json);
    if not ImportData or ImportData == {} then
        return;
    end
    GameVersionTable.ImportData = ImportData;
end