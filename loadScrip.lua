_G.AutoFram = true
-- local Start
local players = game.Players
local localPlayer = players.localPlayer
local char = localPlayer.Character
local RootPart = char.HumanoidRootPart
-- Sever
local player_ser = game:GetService("Players")
local local_ser = player_ser.localPlayer
local char_ser = local_ser.Character
local RootPart_ser = char_ser.HumanoidRootPart
-- local end

-- function Start --
function WarpTween(C)
    local Pos = (C.Position - RootPart.Position).Magnitude
    local tween_Service = game:GetService("TweenService")
    local tween_info = TweenInfo.new(Pos/370, Enum.EasingStyle.Linear)
    local args = {
        CFrame = C
    }
    local Warps = tween_Service:Create(game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"], tween_info, args)
    Warps:Play()
end

function GetQuest()
    checklevel()
    if (CFrameQuest.Position - RootPart.Position).Magnitude < 50 then
        wait(.5)
        local args = {
            [1] = "StartQuest",
            [2] = QuestName,
            [3] = QuestNumber
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    else
        WarpTween(CFrameQuest)
    end
    repeat
        task.wait()
        if  local_ser.Data.LastSpawnPoint.Value ~= SpawnPoint then
            RootPart.CFrame = CFrameQuest
            char.Humanoid.Health = 0
        end
    until local_ser.Data.LastSpawnPoint.Value == SpawnPoint
end

function checklevel()
	local Level = local_ser.Data.Level.Value
    if Level == 1 or Level <= 9 then
        Mon = "Bandit"
        QuestName = "BanditQuest1"
        QuestNumber = 1
        CFramePuk = CFrame.new(1108.1478271484375, 57.41001510620117, 1623.7769775390625)
        CFrameQuest = CFrame.new(1059.9759521484375, 16.488065719604492, 1549.023193359375)
        SpawnPoint = "Default"
    elseif Level == 10 or Level <= 14 then
        Mon = "Monkey"
		QuestName = "JungleQuest"
		QuestNumber = 1
		CFrameQuest = CFrame.new(-1599.5264892578125, 36.977455139160156, 153.2390899658203)
		CFramePuk = CFrame.new(-1586.5660400390625, 39.97743606567383, 155.67477416992188)
        SpawnPoint = "Jungle"
    elseif Level == 15 or Level <= 29 then
        Mon = "Gorilla"
        QuestName = "JungleQuest"
        QuestNumber = 2
        CFrameQuest = CFrame.new(-1599.5264892578125, 36.977455139160156, 153.2390899658203)
        CFramePuk = CFrame.new(-1200.00390625, 7.816595077514648, -447.203125)
        SpawnPoint = "Jungle"
    end
end
-- function End --

-- Fast Attack Start --
spawn(function()
    local StopCamera = require(game.ReplicatedStorage.Util.CameraShaker)StopCamera:Stop()
    game:GetService("RunService").RenderStepped:Connect(function()
        for i,v in pairs(getreg()) do
            if typeof(v) == "function" and getfenv(v).script == local_ser.PlayerScripts.CombatFramework then
                for i,v in pairs(debug.getupvalues(v)) do
                    spawn(function()
                        pcall(function()
                            v.activeController.timeToNextAttack = -(math.huge^math.huge^math.huge)
                            v.activeController.attacking = false
                            v.activeController.increment = 4
                            v.activeController.blocking = false
                            v.activeController.hitboxMagnitude = 80
                            v.activeController.humanoid.AutoRotate = true
                            v.activeController.focusStart = 0
                            v.activeController.currentAttackTrack = 0
                            sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRaxNerous", math.huge)
                        end)
                    end)
                end
            end
        end
    end)
end)
-- Fast Attack End --

-- AutoFram Start --
spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if _G.AutoFram then
            pcall(function()
                RootPart_ser.Anchored = true
                checklevel()
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                    pcall(function()
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            for i,y in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == Mon and y.Name == Mon and v.Humanoid.Health >= 1 then
                                    sethiddenproperty(local_ser, "SimulationRaxNerous", math.huge)
                                    v.HumanoidRootPart.CFrame = y.HumanoidRootPart.CFrame
                                    v.HumanoidRootPart.Size = Vector3.new(150,1,150)
                                    WarpTween(v.HumanoidRootPart.CFrame * CFrame.new(0,18,0))
                                    v.HumanoidRootPart.CanCollide = false
                                    if (v.HumanoidRootPart.Position - RootPart.Position).Magnitude <= 50 then
                                        _G.AutoAttack = true
                                    else
                                        _G.AutoAttack = false
                                    end
                                else
                                    WarpTween(CFramePuk)
                                end
                            end
                        end
                    end)
                else
                    GetQuest()
                end
            end)
        else
            RootPart_ser.Anchored = false
        end
    end)
end)
spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if _G.AutoFram then
            if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, Mon) then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
            end
            if not game.Players.LocalPlayer.Character.Humanoid:FindFirstChild("LeftHand_BusoLayer1") then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
            end
        end
    end)
end)
-- AutoFram End --

-- AutoAttack Start --
spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if _G.AutoAttack then
            game:GetService'VirtualUser':CaptureController()
            game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
            game:GetService'VirtualUser':CaptureController()
            game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
        end
    end)
end)
spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if _G.AutoAttack then
            game:GetService'VirtualUser':CaptureController()
            game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
            game:GetService'VirtualUser':CaptureController()
            game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
        end
    end)
end)
spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if _G.AutoAttack then
            game:GetService'VirtualUser':CaptureController()
            game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
            game:GetService'VirtualUser':CaptureController()
            game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
        end
    end)
end)
spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if _G.AutoAttack then
            game:GetService'VirtualUser':CaptureController()
            game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
            game:GetService'VirtualUser':CaptureController()
            game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
        end
    end)
end)
spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if _G.AutoAttack then
            game:GetService'VirtualUser':CaptureController()
            game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
            game:GetService'VirtualUser':CaptureController()
            game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
        end
    end)
end)
-- AutoAttack End --
