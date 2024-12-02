LocalPlayer = game:GetService("Players").LocalPlayer
Char = LocalPlayer.Character

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
            ["Mon"] = 'Gorilla'
            ["NumQ"] = 'JungleQuest'
            ["NameQ"] = 2,
            ["CframeQ"] = Cframe.new(-1599.8194580078125, 36.852149963378906, 153.0706024169922)
            ["CframeMon"] = CFrame.new(-1443.7662353515625, 61.851966857910156, -47.555946350097656)
        }
    elseif Lv.Value >= 30 and Lv.Value <= 39 then
        return {
            ["Mon"] = 'Pirate'
            ["NumQ"] = 'BuggyQuest1'
            ["NameQ"] = 1,
            ["CframeQ"] = CFrame.new(-1139.5631103515625, 4.75205135345459, 3830.38671875)
            ["CframeMon"] = CFrame.new(-1045.943115234375, 64.41950225830078, 3930.302001953125)
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