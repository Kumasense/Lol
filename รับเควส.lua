local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local Char = LocalPlayer.Character
_G.AutoFarm = true

local GetQuest = function(N, NB)
    local args = {
        [1] = "StartQuest"
        [2] = N or "BanditQuest1",
        [3] = NB or 1
    }
    ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack(args))
end

local CheckQ = function()
    local Lv = LocalPlayer.Data.Level
    if Lv.Value >= 1 and Lv.Value < 10 then
        return {
            ["Mon"] = "Bandit",
            ["NumQ"] = "BanditQuest1",
            ["NameQ"] = "1",
            ["CframeQ"] = CFrame.new(1059.37195, 16.4439793, 1550.4231, 0.939700544, 0, -0.341998369, 0, 1, 0, 0.341998369, 0, 0.939700544),
            ["CframeMon"] = CFrame.new(1102.06604, 15.7263451, 1589.47229, -0.342042685, 0.0331513658, -0.939099431, 0, 0.999377489, 0.0352792554, 0.939684391, 0.0120670116, -0.341829747)
        }
    elseif Lv.Value >= 10 then
        return {
            ["Mon"] = "Monkey",
            ["NumQ"] = "JungleQuest",
            ["NameQ"] = "1",
            ["CframeQ"] = CFrame.new(-1598.08911, 36.4001007, 153.377838, 0, 0, 1, 0, 1, 0, -1, 0, 0),
            ["CframeMon"] = CFrame.new(-1579.20569, 22.2984085, 377.569336, 0.999999702, -3.12550983e-05, 0.000745425641, -3.87474586e-08, 0.999119937, 0.0419442765, -0.000746080594, -0.0419442654, 0.999119639)
        }
      elseif Lv == 15 or Lv <= 29 then
                ["Mon"] = "Gorilla"
                ["NumQ"] = "JungleQuest"
                ["LvQ"] = "2" 
                ["NameQ"] = "Gorilla"
                ["CframeQ"] = CFrame.new(-1599.8194580078125, 36.852149963378906, 153.0706024169922)
                ["CframeMon"] = CFrame.new(-1443.7662353515625, 61.851966857910156, -47.555946350097656)
      end
end