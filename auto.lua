-- tween
function WarpTween(P)
    local Pos = (P.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    local tween_Service = game:service"TweenService"
    local tween_info = TweenInfo.new(Pos/370, Enum.EasingStyle.Linear)
    local Warps = tween_Service:Create(game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"], tween_info, {CFrame = P})
    Warps:Play()
end

-- Auto Ken
local args = {
    [1] = "Ken",
    [2] = true
}
game:GetService("ReplicatedStorage").Remotes.CommE:FireServer(unpack(args))

-- Auto Haki
if not game.Players.LocalPlayer.Character.Humanoid:FindFirstChild("LeftHand_BusoLayer1") then
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
end

-- Auto Weapon
Weapon = ""
game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(Weapon))

-- Auto Gui
local part = script.Parent.Parent.TextButton
local ply = game.Players
local mouse = game:GetService("UserInputService")
local b
game:GetService("RunService").RenderStepped:Connect(function()
	part.MouseButton1Down:Connect(function()
		b = (part.Position - UDim2.new(0, mouse:GetMouseLocation().X - 600 , 0, mouse:GetMouseLocation().Y - 300))
		_G.a = true
	end)
	part.MouseButton1Up:Connect(function()
		_G.a = false
	end)
end)
game:GetService("RunService").RenderStepped:Connect(function()
	if _G.a then
		part.Position = b + UDim2.new(0, mouse:GetMouseLocation().X - 600 , 0, mouse:GetMouseLocation().Y - 300)
	end
end)

-- Auto Fram Player Quest
_G.AutoPLayersQuest = true
game:GetService("RunService").RenderStepped:Connect(function()
	if _G.AutoPLayersQuest and game:GetService("Players").LocalPlayer.Data.Level.Value >= 100 then
		for i,v in pairs(game.Workspace.Characters:GetChildren()) do
			repeat game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PlayerHunter")
			until string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, v.Name)
			if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, v.Name) then
				--script
			end
			if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Value == false then
				_G.AutoPLayersQuest = false
			end
		end
	end
end)

-- Turn off text Notifications
_G.Notifications = true
game:GetService("Players").LocalPlayer.PlayerGui.Notifications = _G.Notifications

-- no fall
local a
a = hookmetamethod(game,"__namecall",function(self,...)
    local args = {...}
    if getnamecallmethod() == "FireServer" and tostring(self) == "CommE" then
        if args[1] == "Dodge" then
            return
        end
    end
    return a(self,...)
end)