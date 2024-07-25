_G.AutoFram = true
_G.ByPass = true
-- local
local player = game.Players
local Localplayer = player.LocalPlayer
local char = Localplayer.Character
local hum = char.Humanoid
local HumanoidRoot = char.HumanoidRootPart

local Players_ser = game:GetService("Players")
local Localplayer_ser = Players_ser.LocalPlayer
local char_ser = Localplayer_ser.Character
local Hum_ser = char_ser.Humanoid
local HumanoidRoot_ser = char_ser.HumanoidRootPart

local loop = game:GetService("RunService").RenderStepped
local A
-- function
function Tween(P)
    if _G.ByPass == false then
        HumanoidRoot_ser.Anchored = true
        local Pos = (P.Position - HumanoidRoot.Position).Magnitude
        local tween_Service = game:GetService("TweenService")
        local tween_info = TweenInfo.new(Pos/365, Enum.EasingStyle.Linear)
        local Warps = tween_Service:Create(char_ser["HumanoidRootPart"], tween_info, {CFrame = P})
        Warps:Play()
        if Pos <= 20 then
            HumanoidRoot.CFrame = P
            HumanoidRoot_ser.Anchored = false
        end
    else
        HumanoidRoot.CFrame = P
        hum.Health = 0
    end
end
function CheckMagnitude(a,b)
    A = (a.Position - b.Position).Magnitude
end
function ChackLevel()
    local lv = Localplayer_ser.Data.Level.Value
    if lv == 1 or lv <= 9 then
        Mon = "Bandit"
        SpawnPoint = "Default"
        QuestName = "BanditQuest1"
        QuestNumber = 1
        CFrameQuest = CFrame.new(1059.9759521484375, 16.488065719604492, 1549.023193359375)
        CFramePuk = CFrame.new(1108.1478271484375, 57.41001510620117, 1623.7769775390625)
    elseif lv == 10 or lv <= 140 then
        Mon = "Monkey"
        SpawnPoint = "Jungle"
        QuestName = "JungleQuest"
        QuestNumber = 1
        CFrameQuest = CFrame.new(-1599.5264892578125, 36.977455139160156, 153.2390899658203)
        CFramePuk = CFrame.new(-1586.5660400390625, 39.97743606567383, 155.67477416992188)
    end
end
function LastSpawnPoint()
    ChackLevel()
    if Localplayer_ser.Data.LastSpawnPoint.Value ~= SpawnPoint then
        repeat
            HumanoidRoot.CFrame = CFramePuk
            hum.Health = 0
        until Localplayer_ser.Data.LastSpawnPoint.Value == SpawnPoint
    end
end
-- Quest
spawn(function()
    loop:Connect(function()
        if _G.AutoFram then
            pcall(function()
                ChackLevel()
                LastSpawnPoint()
                if Localplayer_ser.PlayerGui.Main.Quest.Visible == false then
                    _G.Attack = false
                    CheckMagnitude(CFrameQuest,HumanoidRoot)
                    if A < 20 then
                        local args = {
                            [1] = "StartQuest",
                            [2] = QuestName,
                            [3] = QuestNumber
                        }
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    else
                        Tween(CFrameQuest)
                    end
                end
            end)
        end
    end)
end)
-- AutoFram
spawn(function()
    loop:Connect(function()
        if _G.AutoFram then
            pcall(function()
                LastSpawnPoint()
                if Localplayer_ser.PlayerGui.Main.Quest.Visible == true then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        for x,y in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            ChackLevel()
                            if v.Name == Mon and y.Name == Mon then
                                v.HumanoidRootPart.Size = Vector3.new(25,2.5,25)
                                v.HumanoidRootPart.Transparency = 0.5
                                v.HumanoidRootPart.CanCollide = false
                                v.Humanoid.WalkSpeed = 0
                                v.Humanoid.JumpPower = 0
                                CheckMagnitude(v.HumanoidRootPart - y.HumanoidRootPart)
                                if A <= 200 then
                                    v.HumanoidRootPart.CFrame = y.HumanoidRootPart.CFrame
                                    Tween(v.HumanoidRootPart.CFrame * CFrame.new(0,0,15))
                                else
                                    Tween(v.HumanoidRootPart.CFrame * CFrame.new(0,0,15))
                                end
                                if sethiddenproperty then
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                end
                            else
                                _G.Attack = false
                                Tween(CFramePuk)
                            end
                        end
                    end
                end
            end)
        end
    end)
end)
-- QuestTitle
spawn(function()
	loop:Connect(function()
		pcall(function()
			if _G.AutoFram then
				ChackLevel()
				if not string.find(Localplayer_ser.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, Mon) then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
				end
			end
		end)
	end)
end)
-- Mon
spawn(function()
    loop:Connect(function()
        if _G.AutoFram then
            pcall(function()
                if not game.Players.LocalPlayer.Character.Humanoid:FindFirstChild("LeftHand_BusoLayer1") then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                end
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    ChackLevel()
                    if v.Name == Mon then
                        if v.Humanoid.Health == 0 then
                            _G.Attack = false
                            wait(.2)
                            v:Destroy()
                        else
                            CheckMagnitude(v.HumanoidRootPart - HumanoidRoot)
                            if A < 50 then
                                _G.Attack = true
                            else
                                _G.Attack = false
                            end
                        end
                    end
                end
            end)
        end
    end)
end)
-- Fast Attack
spawn(function()
    loop:Connect(function()
        for i,v in pairs(getreg()) do
            if typeof(v) == "function" and getfenv(v).script == Localplayer_ser.PlayerScripts.CombatFramework then
                for i,v in pairs(debug.getupvalues(v)) do
                    spawn(function()
                        pcall(function()
                            local StopCamera = require(game.ReplicatedStorage.Util.CameraShaker)StopCamera:Stop()
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
-- Attack
spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if _G.Attack then
            game:GetService'VirtualUser':CaptureController()
            game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
        end
    end)
end)