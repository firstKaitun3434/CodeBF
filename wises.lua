_G.FARM = false -- true = ON  /  false = OFF
_G.MON = "Bandit [Lv. 5]" -- NAME MONSTER
_G.TOOL = "Combat" -- Weapon name
_G.FARMMETHOD = 2 -- MODE FARM (1/3)
_G.HideHB = false -- HIDEHITBO
function EquipTool() -- WEAPON EQUIP
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v.name == _G.TOOL then
            v.Parent = game.Players.LocalPlayer.Character
        end
    end
end
function quest() -- CHECK QUESY AND AUTO QUEST
    local MYLEVEL = game:GetService("Players").LocalPlayer.Data.Level.Value
    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
    elseif MYLEVEL == 1 or MYLEVEL <= 9 then
        local args = {
            [1] = "StartQuest",
            [2] = "BanditQuest1",
            [3] = 1
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end
end
function attack() -- AUTO ATTACK
    game:GetService'VirtualUser':CaptureController()
    game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
end
function hitbox() -- HITBOX
    local enamie = game:GetService("Workspace").Enemies:GetChildren()
    for i,v in pairs(enamie) do
        v.HumanoidRootPart.Size = Vector3.new(100,100,100)
        v.HumanoidRootPart.CanCollide = true
        if _G.HideHB == true then
        v.HumanoidRootPart.Transparency = 1
        elseif _G.HideHB == false then
            v.HumanoidRootPart.Transparency = 0.5
        end
    end
end
function TPTOMON() -- FARM MODE
if game:GetService("Workspace").Enemies[_G.MON].Humanoid.Health == 0 then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1062.7824707031, 16.516611099243, 1539.5036621094)
elseif _G.FARMMETHOD == 1 then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies[_G.MON].HumanoidRootPart.CFrame * CFrame.new(0,0,20)
elseif _G.FARMMETHOD == 2 then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies[_G.MON].HumanoidRootPart.CFrame * CFrame.new(0,30,0)
elseif _G.FARMMETHOD == 3 then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies[_G.MON].HumanoidRootPart.CFrame * CFrame.new(0,-10,0)
    end
end
while _G.FARM do  wait()
    EquipTool()
    TPTOMON()
    hitbox()
    attack()
    quest()
end