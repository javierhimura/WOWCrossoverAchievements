local _, CrossoverAchievements = ...

CrossoverAchievements.CompressHelper = CrossoverAchievements.CompressHelper or {};
local CompressHelper = CrossoverAchievements.CompressHelper;

local LibDeflate = LibStub:GetLibrary("LibDeflate")
local json = json;

function CompressHelper:CompressEncodeData(ExportTable)
    local jsondata = json.stringify(ExportTable);
    local compress_deflate = LibDeflate:CompressDeflate(jsondata);
    local data_to_trasmit_WoW_addon = LibDeflate:EncodeForPrint(compress_deflate)
    return data_to_trasmit_WoW_addon;
end

function CompressHelper:DecompressDecodeData(data_to_trasmit_WoW_addon)
    if not data_to_trasmit_WoW_addon or data_to_trasmit_WoW_addon == "" then
        return;
    end
    local compress_deflate = LibDeflate:DecodeForPrint(data_to_trasmit_WoW_addon);
    if not compress_deflate then
        return;
    end
    local jsondata = LibDeflate:DecompressDeflate(compress_deflate);
    if not jsondata then
        return;
    end
    local ImportTable = json.parse(jsondata);
    if not ImportTable or ImportTable == {} then
        return;
    end
    return ImportTable;
end