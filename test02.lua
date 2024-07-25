_G.AutoFram = true
-- function
function Tween(P)
    local Pos = (P.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    local tween_Service = game:GetService("TweenService")
    local tween_info = TweenInfo.new(Pos/365, Enum.EasingStyle.Linear)
    local Warps = tween_Service:Create(game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"], tween_info, {CFrame = P})
    Warps:Play()
    if Pos <= 50 then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = P
    end
end
function CheckLevel()
    local Level = game:GetService("Players").LocalPlayer.Data.Level.Value
    if Level <= 9 then
        LastSpawnPoint = "Default"
        Mon = "Bandit"
        QuestName = "BanditQuest1"
        QuestNumber = 1
        CFrameQuest = CFrame.new(1059.9759521484375, 16.488065719604492, 1549.023193359375)
        CFramePuk = CFrame.new(1108.1478271484375, 57.41001510620117, 1623.7769775390625)
    elseif Level <= 14 then
        LastSpawnPoint = "Jungle"
        Mon = "Monkey"
        QuestName = "JungleQuest"
        QuestNumber = 1
        CFrameQuest = CFrame.new(-1599.5264892578125, 36.977455139160156, 153.2390899658203)
        CFramePuk = CFrame.new(-1586.5660400390625, 39.97743606567383, 155.67477416992188)
    end
end
-- Mon
_G.BringMob = true
spawn(function()
    while wait() do
        if _G.BringMob then
            pcall(function()
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    for x,y in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        --CheckLevel()
                        if v.Name == "Bandit" and y.Name == "Bandit" then
                            if sethiddenproperty then
                                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                            end
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Anchored = true
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,15,0)
                            v.HumanoidRootPart.Size = Vector3.new(150,20,150)
                            v.HumanoidRootPart.Transparency = 0.5
                            v.HumanoidRootPart.CanCollide = false
                            --v.HumanoidRootPart.Anchored = true
                            if (v.HumanoidRootPart.Position - y.HumanoidRootPart.Position).Magnitude < 200 then
                                v.HumanoidRootPart.CFrame = y.HumanoidRootPart.CFrame
                            end
                        end
                    end
                end
            end)
        end
    end
end)
-- AutoFram
spawn(function()
    while _G.AutoFram do wait()
        pcall(function()
            CheckLevel()
            if game:GetService("Players").LocalPlayer.Data.LastSpawnPoint.Value == LastSpawnPoint then
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == Mon then
                            _G.BringMob = true
                            Tween(v.HumanoidRootPart.CFrame * CFrame.new(0,15,0))
                            if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.HumanoidRootPart.Position).Magnitude < 30 then
                                _G.Attack = true
                            else
                                _G.Attack = false
                            end
                        else
                            _G.Attack = false
                            _G.BringMob = false
                            Tween(CFramePuk)
                        end
                    end
                else
                    Tween(CFrameQuest)
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQuest.Position).Magnitude <= 10 then
                        wait(0.3)
                        local args = {
                            [1] = "StartQuest",
                            [2] = QuestName,
                            [3] = QuestNumber
                        }
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    end
                end
            else
                Tween(CFrameQuest)
            end
        end)
    end
end)
-- Attack
spawn(function()
    local StopCamera = require(game.ReplicatedStorage.Util.CameraShaker)StopCamera:Stop()
    game:GetService'VirtualUser':CaptureController()
    game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
    for i,v in pairs(getreg()) do
        if typeof(v) == "function" and getfenv(v).script == game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework then
            for i,v in pairs(debug.getupvalues(v)) do
                spawn(function()
                    pcall(function()
                        v.activeController.hitboxMagnitude = 150
                        v.activeController.timeToNextAttack = -(math.huge^math.huge^math.huge)
                        v.activeController.attacking = false
                        v.activeController.increment = 4
                        v.activeController.blocking = false
                        v.activeController.humanoid.AutoRotate = true
                        v.activeController.focusStart = 0
                        v.activeController.currentAttackTrack = 0
                        if sethiddenproperty then
                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                        end
                    end)
                end)
            end
        end
    end
end)

spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if _G.Attack then
            game:GetService'VirtualUser':CaptureController()
            game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
        end
    end)
end)
-- Player
spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if _G.AutoFram == true then
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Anchored = true
        else
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Anchored = false
        end
    end)
end)