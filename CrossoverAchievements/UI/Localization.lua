-- This file is executed at the end of addon load

function CrossoverAchievementFrameSummary_LocalizeButton (button)
    if AchievementFrameSummary_LocalizeButton then
    	return AchievementFrameSummary_LocalizeButton(button);
    end
end
	
function CrossoverAchievementButton_LocalizeMiniAchievement (frame)
    if AchievementButton_LocalizeMiniAchievement then
    	return AchievementButton_LocalizeMiniAchievement(frame);
    end
end

function CrossoverAchievementButton_LocalizeProgressBar (frame)
    if AchievementButton_LocalizeProgressBar then
    	return AchievementButton_LocalizeProgressBar(frame);
    end
end

function CrossoverAchievementButton_LocalizeMetaAchievement (frame)
    if AchievementButton_LocalizeMetaAchievement then
    	return AchievementButton_LocalizeMetaAchievement(frame);
    end
end

function CrossoverAchievementFrame_LocalizeCriteria (frame)
    if AchievementFrame_LocalizeCriteria then
    	return AchievementFrame_LocalizeCriteria(frame);
    end
end

function CrossoverAchievementCategoryButton_Localize(button)
    if AchievementCategoryButton_Localize then
        return AchievementCategoryButton_Localize(button);
    end
end