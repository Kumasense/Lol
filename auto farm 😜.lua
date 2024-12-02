function checklevel()
    local Level = game:GetService("Players").LocalPlayer.Data.Level.Value
  
    if Level <= 9 then
        local MON = "Bandit [Lv. 5]"
        local QUESTPOS = CFrame.new(1059.37195, 16.4439793, 1550.4231, 0.939700544, 0, -0.341998369, 0, 1, 0, 0.341998369, 0, 0.939700544)
        local MONPOS = CFrame.new(1102.06604, 15.7263451, 1589.47229, -0.342042685, 0.0331513658, -0.939099431, 0, 0.999377489, 0.0352792554, 0.939684391, 0.0120670116, -0.341829747)
        local QUESTNAME = "BanditQuest1"
        local QUESTNUMBER = 1
      
      
    end
end

checklevel()

local args = {
        [1] = "StartQuest"
        [2] = QUESTNAME,
        [3] = QUESTNUMBER
}
game: GetService("ReplicatedStorage"). Remotes.CommF_InvokeServer(unpack(args))

