LocalPlayer = game:GetService("Players").LocalPlayer
Char = LocalPlayer.Character

local player = game.Players.LocalPlayer

-- LocalScript ที่จะให้ผู้เล่นถือของในช่อง 1 ตลอดเวลา

local player = game.Players.LocalPlayer
local backpack = player.Backpack
local function equipItemInSlot1()
    -- ตรวจสอบว่าในช่อง 1 มีอุปกรณ์ไหม
    local slot1 = backpack:GetChildren()[1]
    if slot1 then
        -- ตรวจสอบว่าไม่กำลังถืออุปกรณ์
        local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
        if humanoid and not humanoid:FindFirstChildOfClass("Tool") then
            humanoid:EquipTool(slot1)
        end
    end
end

-- ตรวจสอบเมื่อผู้เล่นเกิดใหม่
player.CharacterAdded:Connect(function(character)
    -- รอให้ Humanoid โหลดก่อน
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.Died:Connect(function()
        -- เมื่อผู้เล่นตายก็รอให้เกิดใหม่แล้วถืออุปกรณ์ในช่อง 1
        player.CharacterAdded:Wait()  -- รอจนกระทั่งผู้เล่นเกิดใหม่
        equipItemInSlot1()  -- ให้ผู้เล่นถืออุปกรณ์ในช่อง 1
    end)
end)

-- เรียกฟังก์ชั่นเพื่อให้ผู้เล่นถือของในช่อง 1 เมื่อเริ่มเกม
equipItemInSlot1()

-- ใช้ Heartbeat เพื่อตรวจสอบทุกเฟรม
game:GetService("RunService").Heartbeat:Connect(function()
    equipItemInSlot1()
end)


_G.AutoFarm = true
local GetQuests = function(N,NB)
    local args = {
        [1] = "StartQuest",
        [2] = N or "BanditQuest1",
        [3] = NB or 1
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))    
end;local ChackQ = function()
    local Lv = LocalPlayer.Data.Level
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
            ["NumQ"] = 'BuggyQuest1',
            ["NameQ"] = 1,
            ["CFrameQ"] = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627),
            ["CFrameMon"] = CFrame.new(-1140.53113, 4.2390337, 3902.15552, -0.314336032, -0.0212563779, 0.949073732, -0.00985086057, 0.999768496, 0.0191291496, -0.949260652, -0.00333620096, -0.314472646)
    }
        elseif Lv.Value >= 40 and Lv.Value <= 59 then
        return {
            ["Mon"] = 'Brute',
            ["NumQ"] = 'BuggyQuest1',
            ["NameQ"] = 2,
            ["CFrameQ"] = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627),
            ["CFrameMon"] = CFrame.new(-979.713379, 14.6394949, 4234.73877, 0.647896409, 0.00203980552, 0.761725724, -0.0149893798, 0.999836922, 0.0100720003, -0.761581004, -0.0179434083, 0.647821307)
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
            Tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance/50, Enum.EasingStyle.Cubic),{CFrame = CFrame[1]})
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
_G.AUTOHAKI = true
spawn(function()
	while wait(.1) do
		if _G.AUTOHAKI then 
			if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
				local args = {
					[1] = "Buso"
				}
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
			end
		end
	end
end)