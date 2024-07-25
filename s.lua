--[[_G.BringMob = true
function CheckLv()
    local lv = game:GetService("Players").LocalPlayer.Data.Level.Value
    if lv <= 9 then
        Mon = "Bandit"
    elseif lv <= 14 then
        Mon = "Jungle"
    end
end
function Setlast()
    
end
spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        for i,v in pairs(getreg()) do
            if typeof(v) == "function" and getfenv(v).script == game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework then
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
_G.BringMob = true
spawn(function()
    while wait() do
        if _G.BringMob then
            pcall(function()
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    for x,y in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        --CheckLv()
                        if v.Name == "Bandit" and y.Name == "Bandit" then
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Anchored = true
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = y.HumanoidRootPart.CFrame * CFrame.new(0,0,10)
                            v.HumanoidRootPart.CFrame = y.HumanoidRootPart.CFrame
                            v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                            y.HumanoidRootPart.Size = Vector3.new(60,60,60)
                            v.HumanoidRootPart.Transparency = 1
                            v.HumanoidRootPart.CanCollide = false
                            y.HumanoidRootPart.CanCollide = false
                            v.Humanoid.WalkSpeed = 0
                            y.Humanoid.WalkSpeed = 0
                            v.Humanoid.JumpPower = 0
                            y.Humanoid.JumpPower = 0
                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                            game:GetService'VirtualUser':CaptureController()
                            game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        pcall(function()
        --CheckLevel()
            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if v.Name == Mon then
                    if v.Humanoid.Health == 0 then
                    v:Destroy()
                    end
                end
            end
        end)
    end)
end)
spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if _G.BringMob then
            pcall(function()
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Name == Mon then
                        if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 50 then
                            _G.Attack = true
                        else
                            _G.Attack = false
                        end
                    end
                end
            end)
        end
    end)
end)
spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if _G.Attack then
            game:GetService'VirtualUser':CaptureController()
            game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
        end
    end)
end)
]]


spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        --game:GetService'VirtualUser':CaptureController()
        --game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
        for i,v in pairs(getreg()) do
            if typeof(v) == "function" and getfenv(v).script == game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework then
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
function C()
    local lv = game:GetService("Players").LocalPlayer.Data.Level.Value
    if lv == 1 or lv <= 90 then
        Mon = "Bandit"
    elseif lv == 100 or lv <= 140 then
        Mon = "Jungle"
    end
end
_G.BringMob = true
spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if _G.BringMob then
            pcall(function()
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    for x,y in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        C()
                        if v.Name == Mon and y.Name == Mon and v.Humanoid.Health > 0 then
                            _G.Attack = true
                            v.HumanoidRootPart.CFrame = y.HumanoidRootPart.CFrame
                            --y.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = y.HumanoidRootPart.CFrame * CFrame.new(0,0,15)
                            v.HumanoidRootPart.Size = Vector3.new(150,2.5,150)
                            y.HumanoidRootPart.Size = Vector3.new(150,2.5,150)
                            v.HumanoidRootPart.Transparency = 1
                            v.HumanoidRootPart.CanCollide = false
                            y.HumanoidRootPart.CanCollide = false
                            v.Humanoid.WalkSpeed = 0
                            y.Humanoid.WalkSpeed = 0
                            v.Humanoid.JumpPower = 0
                            y.Humanoid.JumpPower = 0
                            if sethiddenproperty then
                                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                            end
                        elseif v.Humanoid.Health == 0 then
                            _G.Attack = false
                            v:Destroy()
                        else
                            _G.Attack = false
                        end
                    end
                end
            end)
        end
    end)
end)
spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if _G.Attack then
            game:GetService'VirtualUser':CaptureController()
            game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
        end
    end)
end)