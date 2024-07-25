_G.AutoFram = true
function WarpTween(P)
    local Pos = (P.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    local tween_Service = game:service"TweenService"
    local tween_info = TweenInfo.new(Pos/360, Enum.EasingStyle.Linear)
    local Warps = tween_Service:Create(game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"], tween_info, {CFrame = P})
    Warps:Play()
end
function Warp(O)
    local Poss = (O.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if Poss <= 50 then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = O
    end
end
function checklevel()
	local Level = game:GetService("Players").LocalPlayer.Data.Level.Value
	if Level == 1 or Level <= 9 then
        Mon = "Bandit"
        Title = "Bandit"
        CFramePuk = CFrame.new(1098.90247, 67.0395203, 1616.08984, 0.0688105226, 1.89194598e-08, -0.997629762, -2.03779624e-08, 1, 1.7558861e-08, 0.997629762, 1.9121428e-08, 0.0688105226)
        CFrameQuest = CFrame.new(1059.96899, 17.0475254, 1549.3396, -0.929264307, 4.23960245e-09, 0.369415551, 1.78822568e-10, 1, -1.10266853e-08, -0.369415551, -1.01806457e-08, -0.929264307)
        QuestName = "BanditQuest1"
        QuestNumber = 1
    else
    if Level == 10 or Level <= 14 then
        Mon = "Monkey"
		Title = "Monkey"
		QuestName = "JungleQuest"
		QuestNumber = 1
		CFrameQuest = CFrame.new(-1599.23096, 37.8653831, 153.335953, -0.0493941903, 1.29583286e-08, 0.998779356, 3.21716165e-08, 1, -1.13831318e-08, -0.998779356, 3.15700852e-08, -0.0493941903)
		CFramePuk = CFrame.new(-1776.32959, 61.1782455, 66.8902054, -0.912609756, -2.38546143e-08, 0.408831745, -2.14773621e-08, 1, 1.04056577e-08, -0.408831745, 7.15677129e-10, -0.912609756)
    else 
    if Level == 15 or Level <= 29 then
        Mon = "Gorilla"
        Title = "Gorilla"
        QuestName = "JungleQuest"
        QuestNumber = 2
        CFrameQuest = CFrame.new(-1599.23096, 37.8653831, 153.335953, -0.0493941903, 1.29583286e-08, 0.998779356, 3.21716165e-08, 1, -1.13831318e-08, -0.998779356, 3.15700852e-08, -0.0493941903)
        CFramePuk = CFrame.new(-1133.4574, 40.8067436, -526.086792, 0.647179008, -2.76535794e-10, 0.762338042, 3.26674865e-08, 1, -2.73699801e-08, -0.762338042, 4.26169464e-08, 0.647179008)
    else
    if Level == 30 or Level <= 39 then
        Mon = "Pirate"
        Title = "Pirate"
        QuestName = "BuggyQuest1"
        QuestNumber = 1
        CFrameQuest = CFrame.new(-1140.75, 5.27738094, 3830.41626, -0.971490741, 7.58226264e-08, 0.237077385, 6.98668288e-08, 1, -3.3523424e-08, -0.237077385, -1.60038507e-08, -0.971490741)
        CFramePuk = CFrame.new(-1251.65491, 44.8773575, 3817.86255, -0.973911822, -7.29827363e-08, 0.226926699, -5.31656923e-08, 1, 9.34400362e-08, -0.226926699, 7.89376458e-08, -0.973911822)
    else
    if Level == 40 or Level <= 59 then
        Mon = "Brute"
        Title = "Brute"
        QuestName = "BuggyQuest1"
        QuestNumber = 2
        CFrameQuest = CFrame.new(-1140.75, 5.27738094, 3830.41626, -0.971490741, 7.58226264e-08, 0.237077385, 6.98668288e-08, 1, -3.3523424e-08, -0.237077385, -1.60038507e-08, -0.971490741)
        CFramePuk = CFrame.new(-1150.32996, 14.9352036, 4297.00439, 0.987384498, 1.01365842e-07, -0.158340812, -9.35679765e-08, 1, 5.67021949e-08, 0.158340812, -4.11712406e-08, 0.987384498)
    else
    if Level == 60 or Level <= 74 then
        Mon = "Desert Bandit"
        Title = "Desert Bandit"
        QuestName = "DesertQuest"
        QuestNumber = 1
        CFrameQuest = CFrame.new(895.403687, 7.23450899, 4391.77539, -0.799823821, 1.00060483e-07, 0.600234807, 6.70158045e-08, 1, -7.74024542e-08, -0.600234807, -2.16831086e-08, -0.799823821)
        CFramePuk = CFrame.new(916.636719, 6.57437086, 4487.20459, -0.99167639, 3.41378552e-08, -0.128755197, 4.00251139e-08, 1, -4.31369394e-08, 0.128755197, -4.79313265e-08, -0.99167639)
    else
    if Level == 75 or Level <= 89 then
        Mon = "Desert Officer"
        Title = "Desert Officer"
        QuestName = "DesertQuest"
        QuestNumber = 2
        CFrameQuest = CFrame.new(895.403687, 7.23450899, 4391.77539, -0.799823821, 1.00060483e-07, 0.600234807, 6.70158045e-08, 1, -7.74024542e-08, -0.600234807, -2.16831086e-08, -0.799823821)
        CFramePuk = CFrame.new(1569.03528, 10.738265, 4383.6958, 0.0669981688, -1.48621693e-08, -0.997753084, -7.62906396e-08, 1, -2.00184811e-08, 0.997753084, 7.74604203e-08, 0.0669981688)
    else
    if Level == 90 or Level <= 104 then
        Mon = "Snow Bandit"
        Title = "Snow Bandit"
        QuestName = "SnowQuest"
        QuestNumber = 1
        CFrameQuest = CFrame.new(1388.32532, 87.6832581, -1298.98853, 0.257160485, -2.74615477e-08, -0.966368735, -5.96436962e-08, 1, -4.42890453e-08, 0.966368735, 6.90271946e-08, 0.257160485)
        CFramePuk = CFrame.new(1380.35999, 99.3419647, -1423.54041, 0.917633533, -4.69509835e-08, 0.397427559, 7.785661e-09, 1, 1.00160641e-07, -0.397427559, -8.88165275e-08, 0.917633533)
    else
    if Level == 105 or Level <= 119 then
        Mon = "Snowman"
        Title = "Snowman"
        QuestName = "SnowQuest"
        QuestNumber = 2
        CFrameQuest = CFrame.new(1388.32532, 87.6832581, -1298.98853, 0.257160485, -2.74615477e-08, -0.966368735, -5.96436962e-08, 1, -4.42890453e-08, 0.966368735, 6.90271946e-08, 0.257160485)
        CFramePuk = CFrame.new(1069.38684, 133.932724, -1418.21716, 0.841472507, 6.84720902e-09, -0.540299892, -3.10686019e-08, 1, -3.5713807e-08, 0.540299892, 4.68385508e-08, 0.841472507)
    else
    if Level == 120 or Level <= 149 then
        Mon = "Chief Petty Officer"
        Title = "Chief Petty Officer"
        QuestName = "MarineQuest2"
        QuestNumber = 1
        CFrameQuest = CFrame.new(-5038.46484, 29.1578293, 4324.80713, 0.00912523735, 5.73297276e-09, 0.999958336, -3.70268238e-09, 1, -5.69942227e-09, -0.999958336, -3.65051966e-09, 0.00912523735)
        CFramePuk = CFrame.new(-4944.73486, 20.6778202, 4035.72363, -0.286084443, -5.00526198e-08, 0.958204389, 3.86888672e-08, 1, 6.37869135e-08, -0.958204389, 5.53202888e-08, -0.286084443)
        CFramePuk2 = CFrame.new(-4757.90479, 20.6778202, 4571.61572, -0.553644061, 5.52476287e-08, 0.83275342, 6.71170497e-08, 1, -2.17215224e-08, -0.83275342, 4.38659598e-08, -0.553644061)
    else
    if Level == 150 or Level <= 174 then
        Mon = "Sky Bandit"
        Title = "Sky Bandit"
        QuestName = "SkyQuest"
        QuestNumber = 1
        CFrameQuest = CFrame.new(-4840.31299, 717.695129, -2620.99561, -0.872646511, 3.50654688e-08, -0.488352358, 4.38827996e-08, 1, -6.61141897e-09, 0.488352358, -2.71997003e-08, -0.872646511)
        CFramePuk = CFrame.new(-4954.60107, 295.769989, -2901.80957, -0.99389571, 3.12787805e-08, -0.110323451, 3.31190577e-08, 1, -1.48482462e-08, 0.110323451, -1.84114182e-08, -0.99389571)
    else
    if Level == 175 or Level <= 189 then
        Mon = "Dark Master"
        Title = "Dark Master"
        QuestName = "SkyQuest"
        QuestNumber = 2
        CFrameQuest = CFrame.new(-4840.31299, 717.695129, -2620.99561, -0.872646511, 3.50654688e-08, -0.488352358, 4.38827996e-08, 1, -6.61141897e-09, 0.488352358, -2.71997003e-08, -0.872646511)
        CFramePuk = CFrame.new(-5275.05762, 388.677734, -2182.99194, 0.488915712, -1.5530194e-08, -0.872331023, 1.16674235e-08, 1, -1.12638521e-08, 0.872331023, -4.6707811e-09, 0.488915712)
    else
    if Level == 190 or Level <= 209 then
        Mon = "Prisoner"
        Title = "Prisoner"
        QuestName = "PrisonerQuest"
        QuestNumber = 1
        CFrameQuest = CFrame.new(5309.55225, 2.75195122, 474.679321, -0.0972714424, 1.170243e-07, -0.995257914, -2.67411835e-08, 1, 1.20195438e-07, 0.995257914, 3.83059557e-08, -0.0972714424)
        CFramePuk = CFrame.new(5209.72754, 2.05960464, 404.438477, -0.867200434, -5.43310144e-08, 0.497959256, -5.61373241e-08, 1, 1.13437011e-08, -0.497959256, -1.81168378e-08, -0.867200434)
    else
    if Level == 210 or Level <= 249 then
        Mon = "Dangerous Prisoner"
        Title = "Dangerous Prisoner"
        QuestName = "PrisonerQuest"
        QuestNumber = 2
        CFrameQuest = CFrame.new(5309.55225, 2.75195122, 474.679321, -0.0972714424, 1.170243e-07, -0.995257914, -2.67411835e-08, 1, 1.20195438e-07, 0.995257914, 3.83059557e-08, -0.0972714424)
        CFramePuk = CFrame.new(5582.32861, 2.07905722, 642.074463, 0.460716367, 2.41286724e-08, -0.887547433, 5.63713964e-09, 1, 3.01119627e-08, 0.887547433, -1.88763032e-08, 0.460716367)
    else
    if Level == 250 or Level <= 274 then
        Mon = "Toga Warriosrs"
        Title = "Toga Warriosrs"
        QuestName = "ColosseumQuest"
        QuestNumber = 1
        CFrameQuest = CFrame.new(-1580.97534, 8.5393095, -2987.01904, -0.500865996, 5.42050671e-09, -0.865524828, 2.36723388e-08, 1, -7.43613926e-09, 0.865524828, -2.42135076e-08, -0.500865996)
        CFramePuk = CFrame.new(-1907.41516, 7.71650505, -2744.26758, 0.985260189, 0, -0.17106232, 0, 1, 0, 0.17106232, 0, 0.985260189)
    else
    if Level == 275 or Level <= 299 then
        Mon = "Gladiator"
        Title = "Gladiator"
        QuestName = "ColosseumQuest"
        QuestNumber = 2
        CFrameQuest = CFrame.new(-1580.97534, 8.5393095, -2987.01904, -0.500865996, 5.42050671e-09, -0.865524828, 2.36723388e-08, 1, -7.43613926e-09, 0.865524828, -2.42135076e-08, -0.500865996)
        CFramePuk = CFrame.new(-1455.57581, 7.86997795, -3246.27979, -0.484400183, -3.55323131e-08, 0.874846518, -6.56972503e-08, 1, 4.23908819e-09, -0.874846518, -5.5421598e-08, -0.484400183)
        CFramePuk2 = CFrame.new(-1430.90137, 7.86997795, -3330.93579, 0.533779979, 3.27129221e-08, 0.845623434, -7.00078857e-08, 1, 5.50586066e-09, -0.845623434, -6.21392289e-08, 0.533779979)
        CFramePuk3 = CFrame.new(-1151.17346, 7.71650505, -3220.04224, -0.392631441, -8.34044087e-08, -0.919695914, -6.19868601e-08, 1, -6.42238618e-08, 0.919695914, 3.17927586e-08, -0.392631441)
        CFramePuk4 = CFrame.new(-1202.39246, 7.71650505, -3111.0874, -0.921865344, 3.11717372e-08, 0.387510359, 3.83352194e-08, 1, 1.07562856e-08, -0.387510359, 2.47711416e-08, -0.921865344)
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoFram then
                checklevel()
                if game:GetService("Players").localPlayer.PlayerGui.Main.Quest.Visible == false then
                    WarpTween(CFrameQuest)
                    wait(1)
                    local args = {
                        [1] = "StartQuest",
                        [2] = QuestName,
                        [3] = QuestNumber
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
            end
        end)
    end
end)
spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoFram then
                checklevel()
                if game:GetService("Players").localPlayer.PlayerGui.Main.Quest.Visible == true then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        for i,v2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == Mon and v2.Name == Mon then
                                require(game.ReplicatedStorage.Util.CameraShaker):Stop()
                                require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework).activeController.timeToNextAttack = 0
                                v.HumanoidRootPart.CanCollide = false
                                v2.HumanoidRootPart.CanCollide = false
                                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                v.HumanoidRootPart.Size = Vector3.new(150,2.5,150)
                                v.HumanoidRootPart.CFrame = v2.HumanoidRootPart.CFrame
                                WarpTween(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
                                game:GetService'VirtualUser':CaptureController()
								game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                game:GetService'VirtualUser':CaptureController()
								game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                game:GetService'VirtualUser':CaptureController()
								game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                game:GetService'VirtualUser':CaptureController()
								game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                game:GetService'VirtualUser':CaptureController()
								game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                game:GetService'VirtualUser':CaptureController()
								game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                game:GetService'VirtualUser':CaptureController()
								game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                game:GetService'VirtualUser':CaptureController()
								game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                game:GetService'VirtualUser':CaptureController()
								game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                game:GetService'VirtualUser':CaptureController()
								game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                local args = {
                                    [1] = "Ken",
                                    [2] = true
                                }
                                game:GetService("ReplicatedStorage").Remotes.CommE:FireServer(unpack(args))
                            end
                        end
                    end
                end
            end
        end)
    end
end)
spawn(function()
    while _G.AutoFram do wait()
        if not game.Players.LocalPlayer.Character.Humanoid:FindFirstChild("LeftHand_BusoLayer1") then
            local args = {
                [1] = "Buso"
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end
    end
end)
spawn(function()
    while _G.AutoFram do
        checklevel()
        if not game:GetService("Workspace").Enemies:FindFirstChild(Mon) and game:GetService("Players").localPlayer.PlayerGui.Main.Quest.Visible == true then
            WarpTween(CFramePuk)
            wait(1)
            WarpTween(CFramePuk2)
            wait(1)
            WarpTween(CFramePuk3)
            wait(1)
            WarpTween(CFramePuk4)
        end
    end
end)
spawn(function()
	while task.wait() do
		pcall(function()
			if _G.AutoFram then
				checklevel()
				if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, Title) then
					local args = {
						[1] = "AbandonQuest"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				end
			end
		end)
	end
end)

