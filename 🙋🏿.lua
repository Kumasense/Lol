function CheckQuest()
    local MyLevel = game:GetService("Players").LocalPlayer.Data.Level.Value
    local QuestData = {}

    if World1 then
        if MyLevel <= 9 then
            QuestData = {
                Mon = "Bandit",
                LevelQuest = 1,
                NameQuest = "BanditQuest1",
                NameMon = "Bandit",
                CFrameQuest = CFrame.new(1059.37195, 15.4495068, 1550.4231, 0.939700544, 0, -0.341998369, 0, 1, 0, 0.341998369, 0, 0.939700544),
                CFrameMon = CFrame.new(1045.962646484375, 27.00250816345215, 1560.8203125)
            }
        elseif MyLevel <= 14 then
            QuestData = {
                Mon = "Monkey",
                LevelQuest = 1,
                NameQuest = "JungleQuest",
                NameMon = "Monkey",
                CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, 0, -1, 0, 0),
                CFrameMon = CFrame.new(-1448.51806640625, 67.85301208496094, 11.46579647064209)
            }
        elseif MyLevel <= 29 then
            QuestData = {
                Mon = "Gorilla",
                LevelQuest = 2,
                NameQuest = "JungleQuest",
                NameMon = "Gorilla",
                CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, 0, -1, 0, 0),
                CFrameMon = CFrame.new(-1129.8836669921875, 40.46354675292969, -525.4237060546875)
            }
        elseif MyLevel <= 39 then
            QuestData = {
                Mon = "Pirate",
                LevelQuest = 1,
                NameQuest = "BuggyQuest1",
                NameMon = "Pirate",
                CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, 0, -0.258804798, 0, 1, 0, 0.258804798, 0, 0.965929627),
                CFrameMon = CFrame.new(-1103.513427734375, 13.752052307128906, 3896.091064453125)
            }
        elseif MyLevel <= 59 then
            QuestData = {
                Mon = "Brute",
                LevelQuest = 2,
                NameQuest = "BuggyQuest1",
                NameMon = "Brute",
                CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, 0, -0.258804798, 0, 1, 0, 0.258804798, 0, 0.965929627),
                CFrameMon = CFrame.new(-1140.083740234375, 14.809885025024414, 4322.92138671875)
            }
        elseif MyLevel <= 74 then
            QuestData = {
                Mon = "Desert Bandit",
                LevelQuest = 1,
                NameQuest = "DesertQuest",
                NameMon = "Desert Bandit",
                CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, 0, -0.573571265, 0, 1, 0, 0.573571265, 0, 0.819155693),
                CFrameMon = CFrame.new(924.7998046875, 6.44867467880249, 4481.5859375)
            }
        end
    end

    return QuestData
end

-- Example usage
local Quest = CheckQuest()
if Quest and Quest.NameQuest then
    print("Quest Name: " .. Quest.NameQuest)
    print("Quest Monster: " .. Quest.Mon)
end