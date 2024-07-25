getfenv().AutoFram = true
getfenv().bypasstween = true
local loop = game:GetService("RunService").RenderStepped
function newpart()
    if not game.Workspace:FindFirstChild("Part01BotHub") then
        local part = Instance.new("Part",game.Workspace)
        part.Anchored = true
        part.Size = Vector3.new(30,1,30)
        part.Transparency = 1
        part.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,-5,0)
        part.Name = "Part01BotHub"
    end
end
function Tween(P)
    pcall(function()
        local Pos = (P.Position - game.Workspace:FindFirstChild("Part01BotHub").Position).Magnitude
        local tween_Service = game:service"TweenService"
        local tween_info = TweenInfo.new(Pos/360, Enum.EasingStyle.Linear)
        local Warp = tween_Service:Create(game.Workspace:FindFirstChild("Part01BotHub"), tween_info, {CFrame = P * CFrame.new(0,-5,0)})
        Warp:Play()
        if Pos <= 50 then
            game.Workspace:FindFirstChild("Part01BotHub").CFrame = P * CFrame.new(0,-5,0)
        end
    end)
end
function Tweenply(P)
    pcall(function()
        local Pos = (P.Position - game.Workspace:FindFirstChild("Part01BotHub").Position).Magnitude
        local tween_Service = game:service"TweenService"
        local tween_info = TweenInfo.new(Pos/360, Enum.EasingStyle.Linear)
        local Warp = tween_Service:Create(game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"], tween_info, {CFrame = P})
        Warp:Play()
        if Pos <= 50 then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = P
        end
    end)
end
function CheckLevel()
    local Level = game:GetService("Players").LocalPlayer.Data.Level.Value
    if Level < 10 then
        Mon = "Bandit"
        SpawnPoint = "Default"
        QuestName = "BanditQuest1"
        QuestNumber = 1
        CFrameQuest = CFrame.new(1059.9759521484375, 16.488065719604492, 1549.023193359375)
        CFramePuk = CFrame.new(1108.1478271484375, 57.41001510620117, 1623.7769775390625)
    elseif Level < 105 then
        Mon = "Monkey"
        SpawnPoint = "Jungle"
        QuestName = "JungleQuest"
        QuestNumber = 1
        CFrameQuest = CFrame.new(-1599.5264892578125, 36.977455139160156, 153.2390899658203)
        CFramePuk = CFrame.new(-1586.5660400390625, 39.97743606567383, 155.67477416992188)
    end
end
spawn(function()
    loop:Connect(function()
        if getfenv().AutoFram and game.Workspace:FindFirstChild("Part01BotHub") then
            pcall(function()
                Tweenply(CFrame.new(game.Workspace:FindFirstChild("Part01BotHub").CFrame * CFrame.new(0,5,0)))
            end)
        end
    end)
end)
spawn(function()
    loop:Connect(function()
        local LastSpawnPoint = game:GetService("Players").LocalPlayer.Data.LastSpawnPoint
        CheckLevel()
        if getfenv().AutoFram and getfenv().bypasstween and LastSpawnPoint.Value ~= SpawnPoint then
            game.Workspace:FindFirstChild("Part01BotHub"):Destroy()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameQuest
            game.Players.LocalPlayer.Character.Humanoid.Health = 0
        end
    end)
end)
spawn(function()
    loop:Connect(function()
        CheckLevel()
        if getfenv().AutoFram and game:GetService("Players").LocalPlayer.Data.LastSpawnPoint.Value == SpawnPoint then
            newpart()
            if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                Tween(CFrameQuest)
                if (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 50 then
                    wait(0.3)
                    local args = {
                        [1] = "StartQuest",
                        [2] = QuestName,
                        [3] = QuestNumber
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
            end
        end
    end)
end)
spawn(function()
    loop:Connect(function()
        CheckLevel()
        local loser = game:GetService("Players").LocalPlayer
        if getfenv().AutoFram and loser.Data.LastSpawnPoint.Value == SpawnPoint then
            newpart()
            if loser.PlayerGui.Main.Quest.Visible == true then
                pcall(function()
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        for x,y in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == Mon and y.Name == Mon then
                                y.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                                v.HumanoidRootPart.CanCollide = false
                                v.HumanoidRootPart.Anchored = false
                                v.HumanoidRootPart.Size = Vector3.new(20,50,20)
                                Tween(v.HumanoidRootPart.CFrame * CFrame.new(0,15,0))
                                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                            end
                        end
                    end
                end)
            end
        end
    end)
end)
spawn(function()
    loop:Connect(function()
        if getfenv().AutoFram then
            pcall(function()
                CheckLevel()
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Name == Mon then
                        if v.Humanoid.Health == 0 then
                            wait(0.1)
                            v:Destroy()
                        else
                            if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 50 then
                                getfenv().Attack = true
                            else
                                getfenv().Attack = false
                            end
                        end
                    else
                        Tween(CFramePuk)
                    end
                end
            end)
        end
    end)
end)
spawn(function()
    pcall(function()
        local Code = {
            "SECRET_ADMIN",
            "CODESLIDE",
            "ADMINHACKED",
            "TRIPLEABUSE",
            "SEATROLLING",
            "ZIOLES",
            "KITT_RESET",
            "Sub2CaptainMaui",
            "SUB2GAMERROBOT_RESET1",
            "kittgaming",
            "Sub2Fer999",
            "Enyu_is_Pro",
            "Magicbus",
            "JCWK",
            "Starcodeheo",
            "Bluxxy",
            "fudd10_v2",
            "FUDD10",
            "BIGNEWS",
            "THEGREATACE",
            "SUB2GAMERROBOT_EXP1",
            "Sub2OfficialNoobie",
            "StrawHatMaine",
            "SUB2NOOBMASTER123",
            "Sub2UncleKizaru",
            "Sub2Daigrock",
            "Axiore",
            "TantaiGaming"
        }
        x = 1
        while wait() do
            if x <= #Code then
                game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(Code[x])
                x = x + 1
            else
                break
            end
        end
    end)
end)
spawn(function()
    loop:Connect(function()
        local args = {
            [1] = "AddPoint",
            [2] = "Melee",
            [3] = 1
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end)
end)
local A = getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework))[2]['activeController']
spawn(function()
    loop:Connect(function()
        if getfenv().AutoFram then
            pcall(function()
                local Camera = require(game.ReplicatedStorage.Util.CameraShaker)
                Camera:Stop()
                A.timeToNextAttack = 0
                A.hitboxMagnitude = 50
            end)
        end
    end)
end)
spawn(function()
    loop:Connect(function()
        if getfenv().Attack then
            A:attack()
        end
    end)
end)
spawn(function()
    loop:Connect(function()
        if getfenv().Attack then
            game:GetService'VirtualUser':CaptureController()
            game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
        end
    end)
end)