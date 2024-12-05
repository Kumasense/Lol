local function TeleportTo(position)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = position
    wait(0.25)
end

local player = game.Players.LocalPlayer

-- ฟังก์ชันสำหรับให้ตัวละครถือไอเทมจากช่อง 1
local function equipToolFromSlot1(character)
    local backpack = player:WaitForChild("Backpack")
    -- ค้นหา Tool ในช่อง 1 (Slot 1)
    local tool = backpack:FindFirstChildOfClass("Tool")

    if tool then
        -- ให้ตัวละครถือ Tool จากช่อง 1
        character:WaitForChild("Humanoid"):EquipTool(tool)
    end
end

-- ตรวจจับเมื่อตัวละครเกิดใหม่
player.CharacterAdded:Connect(function(character)
    -- รอให้ตัวละครโหลดเสร็จ
    character:WaitForChild("Humanoid")
    equipToolFromSlot1(character)
end)

-- เรียกใช้สำหรับตัวละครปัจจุบัน (ในกรณีที่ตัวละครยังไม่ตาย)
if player.Character then
    equipToolFromSlot1(player.Character)
end


local function GetQuest(questName, questLevel)
    local args = {
        [1] = "StartQuest",
        [2] = questName,
        [3] = questLevel
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end

local function AttackMonsterFast(monsterName)
    for _, monster in pairs(game.Workspace.Enemies:GetChildren()) do
        if monster.Name == monsterName and monster:FindFirstChild("Humanoid") then
            repeat
                TeleportTo(monster.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0)) -- วาร์ปไปบนมอนสเตอร์
                for _ = 1, 4 do -- ตีมอนเร็ว x4
                    game:GetService("VirtualUser"):CaptureController()
                    game:GetService("VirtualUser"):Button1Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                    wait(0.05)
                end
            until not monster:FindFirstChild("Humanoid") or monster.Humanoid.Health <= 0
        end
    end
end

local function HasActiveQuest(questName)
    local currentQuest = game.Players.LocalPlayer.PlayerGui:FindFirstChild("QuestFrame")
    if currentQuest then
        local questTitle = currentQuest:FindFirstChild("QuestTitle")
        if questTitle and questTitle.Text == questName then
            local remaining = currentQuest:FindFirstChild("QuestCounter") -- จำนวนที่ต้องฆ่า
            if remaining and tonumber(remaining.Text:split("/")[1]) > 0 then
                return true -- มีเควสที่ยังไม่สำเร็จ
            end
        end
    end
    return false -- ไม่มีเควส หรือเควสสำเร็จแล้ว
end

local function CompleteQuest()
    -- ตรวจสอบว่าเควสสำเร็จแล้วให้ไปรับรางวัล
    local completeFrame = game.Players.LocalPlayer.PlayerGui:FindFirstChild("QuestCompleteFrame")
    if completeFrame then
        local acceptButton = completeFrame:FindFirstChild("AcceptButton")
        if acceptButton then
            fireclickdetector(acceptButton.ClickDetector) -- คลิกเพื่อรับรางวัล
            wait(1)
        end
    end
end

local function StartAutoFarm()
    while wait(0.5) do
        pcall(function()
            local level = game.Players.LocalPlayer.Data.Level.Value
            local config = {}

            -- ตั้งค่ามอนสเตอร์ตามช่วงเลเวล
            if Lv.Value >= 1 and Lv.Value <= 9 then
        return {
            ["Mon"] = 'Bandit',
            ["NumQ"] = 'BanditQuest1',
            ["NameQ"] = 1,
            ["CFrameQ"] = CFrame.new(1059.37195, 15.4495068, 1550.4231, 0.939700544, -0, -0.341998369, 0, 1, -0, 0.341998369, 0, 0.939700544),
            ["CFrameMon"] = CFrame.new(1196.172, 11.8689699, 1616.95923, -0.309060812, 0, 0.951042235, 0, 1, 0, -0.951042235, 0, -0.309060812)
        }
    elseif Lv.Value >= 10 and Lv.Value <= 14 then
        return {
            ["Mon"] = 'Monkey',
            ["NumQ"] = 'JungleQuest',
            ["NameQ"] = 1,
            ["CFrameQ"] = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0),
            ["CFrameMon"] = CFrame.new(-1619.10632, 21.7005882, 142.148117, 0.342042625, -0.000311157171, 0.939684391, 0.000113111477, 0.99999994, 0.000289957155, -0.939684391, 7.11137545e-06, 0.342042685)
        }
    elseif Lv.Value >= 15 and Lv.Value <= 29 then
        return {
            ["Mon"] = 'Gorilla',
            ["NumQ"] = 'JungleQuest',
            ["NameQ"] = 2,
            ["CFrameQ"] = CFrame.new(-1590.45667, 40.678989, 232.14567, 0, 0, 1, 0, 1, -0, -1, 0, 0),
            ["CFrameMon"] = CFrame.new(-1196.23456, 25.678954, 315.7854, 0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, 0.342042685)
    }
    elseif Lv.Value >= 30 and Lv.Value <= 39 then
        return {
            ["Mon"] = 'Pirate',
            ["NumQ"] = 'PirateQuest',
            ["NameQ"] = 1,
            ["CFrameQ"] = CFrame.new(2058.2345, 20.1457, 1450.6789, 0.9397, -0, -0.3419, 0, 1, -0, 0.3419, 0, 0.9397),
            ["CFrameMon"] = CFrame.new(2167.5678, 15.6789, 1615.786, -0.3090, 0, 0.9510, 0, 1, 0, -0.9510, 0, -0.3090)
    }
        elseif Lv.Value >= 40 and Lv.Value <= 59 then
        return {
            ["Mon"] = 'Brute',
            ["NumQ"] = 'BruteQuest',
            ["NameQ"] = 2,
            ["CFrameQ"] = CFrame.new(3000.4567, 50.6789, 1200.2345, 0, 0, 1, 0, 1, -0, -1, 0, 0),
            ["CFrameMon"] = CFrame.new(3150.7891, 45.5678, 1280.6789, 0.3420, -0.0003, 0.9396, 0.0001, 1, 0.0002, -0.9396, 0, 0.3420)
}
            elseif level >= 60 and level <= 99 then
                config = {
                    monster = "Brute",
                    questName = "PirateQuest",
                    questLevel = 2,
                    questPosition = CFrame.new(-1140.55, 4.39, 3823.37),
                    monsterPosition = CFrame.new(-1180.77, 4.39, 3942.01)
                }
            elseif level >= 100 and level <= 174 then
                config = {
                    monster = "Desert Bandit",
                    questName = "DesertQuest",
                    questLevel = 1,
                    questPosition = CFrame.new(896.71, 6.44, 4390.72),
                    monsterPosition = CFrame.new(935.97, 6.44, 4373.19)
                }
            elseif level >= 175 and level <= 249 then
                config = {
                    monster = "Fishman Warrior",
                    questName = "FishmanQuest",
                    questLevel = 1,
                    questPosition = CFrame.new(61122, 18, 1567),
                    monsterPosition = CFrame.new(61035, 18, 1467)
                }
            elseif level >= 250 and level <= 299 then
                config = {
                    monster = "Fishman Commando",
                    questName = "FishmanQuest",
                    questLevel = 2,
                    questPosition = CFrame.new(61122, 18, 1567),
                    monsterPosition = CFrame.new(61800, 18, 1600)
                }
            elseif level >= 300 and level <= 374 then
                config = {
                    monster = "Sky Bandit",
                    questName = "SkyQuest",
                    questLevel = 1,
                    questPosition = CFrame.new(-4835.71, 717.67, -2620.18),
                    monsterPosition = CFrame.new(-4955.59, 717.67, -2705.08)
                }
            elseif level >= 375 and level <= 449 then
                config = {
                    monster = "Dark Master",
                    questName = "SkyQuest",
                    questLevel = 2,
                    questPosition = CFrame.new(-4835.71, 717.67, -2620.18),
                    monsterPosition = CFrame.new(-5235.56, 432.85, -2195.83)
                }
            elseif level >= 450 and level <= 524 then
                config = {
                    monster = "Toga Warrior",
                    questName = "ColosseumQuest",
                    questLevel = 1,
                    questPosition = CFrame.new(-1770.35, 7.29, -2987.83),
                    monsterPosition = CFrame.new(-1870.56, 7.29, -3047.14)
                }
            elseif level >= 525 and level <= 624 then
                config = {
                    monster = "Royal Soldier",
                    questName = "ColosseumQuest",
                    questLevel = 2,
                    questPosition = CFrame.new(-1770.35, 7.29, -2987.83),
                    monsterPosition = CFrame.new(-2350.27, 7.29, -2955.44)
                }
            elseif level >= 625 and level <= 700 then
                config = {
                    monster = "Galley Pirate",
                    questName = "GalleyQuest",
                    questLevel = 1,
                    questPosition = CFrame.new(-5498.74, 8.29, 840.85),
                    monsterPosition = CFrame.new(-5508.43, 8.29, 1085.29)
                }
            end
        end;
 local TW = function(...)
    local CFrame = {...}
    pcall(function()
        if not _G.StopTween then
            local Distance = (CFrame[1].Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            Tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance/20, Enum.EasingStyle.Cubic),{CFrame = CFrame[1]})
            if _G.StopTween then Tween:Cancel()
            elseif game.Players.LocalPlayer.Character.Humanoid.Health > 0 then Tween:Play() end
            if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("panupong") then
                local Noclip = Instance.new("BodyVelocity")
                Noclip.Name = "panupong"
                Noclip.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
                Noclip.MaxForce = Vector3.new(9e99,9e99,9e99)
                Noclip.Velocity = Vector3.new(0,0,0)
            end
        end
    end)
end;local ClearQ = function()
    if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, tostring(ChackQ()["Mon"])) then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
    end
end

spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoFarm then
                local UIQ = LocalPlayer.PlayerGui.Main.Quest
                ClearQ()
                if not UIQ.Visible or UIQ.Visible == false then
                    TW(ChackQ()["CFrameQ"])
                    if (ChackQ()["CFrameQ"].Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 15 then
                        wait(.2)
                        GetQuests(ChackQ()["NumQ"],ChackQ()["NameQ"])
                    end
                else
                    if game:GetService("Workspace").Enemies:FindFirstChild(ChackQ()["Mon"]) then
                        for _i,_v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if _v.Name == tostring(ChackQ()["Mon"]) and _v:FindFirstChild("Humanoid") and _v:FindFirstChild("HumanoidRootPart") then
                                if _v.Humanoid.Health > 0 then
                                    repeat wait()
                                        TW(_v:FindFirstChild("HumanoidRootPart").CFrame * CFrame.new(0,0,5))
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                    until not _G.AutoFarm or _G.AutoFarm == false or not _v.Parent or _v.Humanoid.Health <= 0 or not UIQ.Visible or UIQ.Visible == false
                                end
                            end
                        end
                    else
                        Char.HumanoidRootPart.CFrame = ChackQ()["CFrameMon"]
                    end
                end
            end
        end)
    end
end)

            -- หากไม่มีเควส หรือเควสสำเร็จ ให้รับเควสใหม่
            if not HasActiveQuest(config.questName) then
                TeleportTo(config.questPosition)
                CompleteQuest() -- รับรางวัลก่อนถ้ามี
                GetQuest(config.questName, config.questLevel)
            end

            -- ตีมอนสเตอร์
            AttackMonsterFast(config.monster)
        end)
    end
end

StartAutoFarm()
