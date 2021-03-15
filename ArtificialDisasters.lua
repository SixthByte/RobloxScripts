--Created by WolfGod746#5851 and Throit#0699

local NDS = Instance.new("ScreenGui")
local Main = Instance.new("ImageLabel")
local Toggle = Instance.new("TextButton")
local Status = Instance.new("TextLabel")
local Title = Instance.new("TextLabel")
local Credits = Instance.new("TextLabel")
local Destroy = Instance.new("TextButton")
local Destroy_Roundify_12px = Instance.new("ImageLabel")
local Tower = Instance.new("TextButton")
local Island = Instance.new("TextButton")
local Disaster = Instance.new("TextLabel")
local Vote = Instance.new("TextButton")
local FallDmg = Instance.new("TextButton")
local Minimize = Instance.new("TextButton")
local Destroy_Roundify_12px_2 = Instance.new("ImageLabel")
local Discord = Instance.new("TextLabel")
local Show = Instance.new("Frame")
local Toggle_2 = Instance.new("TextButton")
local Toggle_Roundify_12px = Instance.new("ImageLabel")


NDS.Name = "NDS"
NDS.Parent = game.CoreGui

Main.Name = "Main"
Main.Parent = NDS
Main.Active = true
Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Main.BackgroundTransparency = 1.000
Main.Position = UDim2.new(0.103953153, 0, 0.201171875, 0)
Main.Selectable = true
Main.Size = UDim2.new(0, 392, 0, 290)
Main.Image = "rbxassetid://3570695787"
Main.ImageColor3 = Color3.fromRGB(36, 36, 36)
Main.ScaleType = Enum.ScaleType.Slice
Main.SliceCenter = Rect.new(100, 100, 100, 100)
Main.SliceScale = 0.120
Main.Draggable = true

Toggle.Name = "Toggle"
Toggle.Parent = Main
Toggle.Active = false
Toggle.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Toggle.BorderColor3 = Color3.fromRGB(24, 24, 24)
Toggle.BorderSizePixel = 5
Toggle.Position = UDim2.new(0.0714285672, 0, 0.216450229, 0)
Toggle.Size = UDim2.new(0, 141, 0, 32)
Toggle.Font = Enum.Font.Roboto
Toggle.Text = "Toggle Autofarm"
Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
Toggle.TextScaled = true
Toggle.TextSize = 14.000
Toggle.TextWrapped = true

Status.Name = "Status"
Status.Parent = Main
Status.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
Status.BorderColor3 = Color3.fromRGB(24, 24, 24)
Status.BorderSizePixel = 0
Status.Position = UDim2.new(0.502551019, 0, 0.216450214, 0)
Status.Size = UDim2.new(0, 173, 0, 32)
Status.Font = Enum.Font.Roboto
Status.Text = "Autofarm is Disabled"
Status.TextColor3 = Color3.fromRGB(255, 0, 0)
Status.TextScaled = true
Status.TextSize = 14.000
Status.TextWrapped = true

Title.Name = "Title"
Title.Parent = Main
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0.173469394, 0, 0.0259740259, 0)
Title.Size = UDim2.new(0, 256, 0, 30)
Title.Font = Enum.Font.Roboto
Title.Text = "Artificial Disasters"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.TextSize = 14.000
Title.TextWrapped = true

Credits.Name = "Credits"
Credits.Parent = Main
Credits.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Credits.BackgroundTransparency = 1.000
Credits.Position = UDim2.new(0.502551019, 0, 0.731467426, 0)
Credits.Size = UDim2.new(0, 173, 0, 62)
Credits.Font = Enum.Font.Roboto
Credits.Text = "Created by: WolfGod746#5851"
Credits.TextColor3 = Color3.fromRGB(255, 255, 255)
Credits.TextScaled = true
Credits.TextSize = 14.000
Credits.TextWrapped = true

Destroy.Name = "Destroy"
Destroy.Parent = Main
Destroy.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Destroy.BackgroundTransparency = 1.000
Destroy.BorderSizePixel = 0
Destroy.Position = UDim2.new(0.936224461, 0, 0, 0)
Destroy.Size = UDim2.new(0, 25, 0, 23)
Destroy.ZIndex = 2
Destroy.Font = Enum.Font.Roboto
Destroy.Text = "X"
Destroy.TextColor3 = Color3.fromRGB(0, 0, 0)
Destroy.TextScaled = true
Destroy.TextSize = 14.000
Destroy.TextWrapped = true

Destroy_Roundify_12px.Name = "Destroy_Roundify_12px"
Destroy_Roundify_12px.Parent = Destroy
Destroy_Roundify_12px.Active = true
Destroy_Roundify_12px.AnchorPoint = Vector2.new(0.5, 0.5)
Destroy_Roundify_12px.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Destroy_Roundify_12px.BackgroundTransparency = 1.000
Destroy_Roundify_12px.Position = UDim2.new(0.5, 0, 0.5, 0)
Destroy_Roundify_12px.Selectable = true
Destroy_Roundify_12px.Size = UDim2.new(1, 0, 1, 0)
Destroy_Roundify_12px.Image = "rbxassetid://3570695787"
Destroy_Roundify_12px.ImageColor3 = Color3.fromRGB(255, 0, 0)
Destroy_Roundify_12px.ImageTransparency = 0.500
Destroy_Roundify_12px.ScaleType = Enum.ScaleType.Slice
Destroy_Roundify_12px.SliceCenter = Rect.new(100, 100, 100, 100)
Destroy_Roundify_12px.SliceScale = 0.120

Tower.Name = "Tower"
Tower.Parent = Main
Tower.Active = false
Tower.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Tower.BorderColor3 = Color3.fromRGB(24, 24, 24)
Tower.BorderSizePixel = 5
Tower.Position = UDim2.new(0.0714285672, 0, 0.407150358, 0)
Tower.Size = UDim2.new(0, 141, 0, 32)
Tower.Font = Enum.Font.Roboto
Tower.Text = "Tower"
Tower.TextColor3 = Color3.fromRGB(255, 255, 255)
Tower.TextScaled = true
Tower.TextSize = 14.000
Tower.TextWrapped = true

Island.Name = "Island"
Island.Parent = Main
Island.Active = false
Island.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Island.BorderColor3 = Color3.fromRGB(24, 24, 24)
Island.BorderSizePixel = 5
Island.Position = UDim2.new(0.517857134, 0, 0.407150358, 0)
Island.Size = UDim2.new(0, 141, 0, 32)
Island.Font = Enum.Font.Roboto
Island.Text = "Island"
Island.TextColor3 = Color3.fromRGB(255, 255, 255)
Island.TextScaled = true
Island.TextSize = 14.000
Island.TextWrapped = true

Disaster.Name = "Disaster"
Disaster.Parent = Main
Disaster.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
Disaster.BorderSizePixel = 0
Disaster.Position = UDim2.new(0.497448981, 0, 0.590073168, 0)
Disaster.Size = UDim2.new(0, 170, 0, 33)
Disaster.Font = Enum.Font.Roboto
Disaster.Text = ""
Disaster.TextColor3 = Color3.fromRGB(255, 0, 0)
Disaster.TextScaled = true
Disaster.TextSize = 14.000
Disaster.TextWrapped = true

Vote.Name = "Vote"
Vote.Parent = Main
Vote.Active = false
Vote.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Vote.BorderColor3 = Color3.fromRGB(24, 24, 24)
Vote.BorderSizePixel = 5
Vote.Position = UDim2.new(0.068877548, 0, 0.590073168, 0)
Vote.Size = UDim2.new(0, 141, 0, 32)
Vote.Font = Enum.Font.Roboto
Vote.Text = "Toggle Vote Menu"
Vote.TextColor3 = Color3.fromRGB(255, 255, 255)
Vote.TextScaled = true
Vote.TextSize = 14.000
Vote.TextWrapped = true

FallDmg.Name = "FallDmg"
FallDmg.Parent = Main
FallDmg.Active = false
FallDmg.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
FallDmg.BorderColor3 = Color3.fromRGB(24, 24, 24)
FallDmg.BorderSizePixel = 5
FallDmg.Position = UDim2.new(0.068877548, 0, 0.76938349, 0)
FallDmg.Size = UDim2.new(0, 141, 0, 32)
FallDmg.Font = Enum.Font.Roboto
FallDmg.Text = "Disable Fall Damage"
FallDmg.TextColor3 = Color3.fromRGB(255, 255, 255)
FallDmg.TextScaled = true
FallDmg.TextSize = 14.000
FallDmg.TextWrapped = true

Minimize.Name = "Minimize"
Minimize.Parent = Main
Minimize.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
Minimize.BackgroundTransparency = 1.000
Minimize.BorderSizePixel = 0
Minimize.Position = UDim2.new(0.867346883, 0, 0, 0)
Minimize.Size = UDim2.new(0, 25, 0, 23)
Minimize.ZIndex = 2
Minimize.Font = Enum.Font.Roboto
Minimize.Text = "_"
Minimize.TextColor3 = Color3.fromRGB(0, 0, 0)
Minimize.TextScaled = true
Minimize.TextSize = 14.000
Minimize.TextWrapped = true

Destroy_Roundify_12px_2.Name = "Destroy_Roundify_12px"
Destroy_Roundify_12px_2.Parent = Minimize
Destroy_Roundify_12px_2.Active = true
Destroy_Roundify_12px_2.AnchorPoint = Vector2.new(0.5, 0.5)
Destroy_Roundify_12px_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Destroy_Roundify_12px_2.BackgroundTransparency = 1.000
Destroy_Roundify_12px_2.Position = UDim2.new(0.5, 0, 0.5, 0)
Destroy_Roundify_12px_2.Selectable = true
Destroy_Roundify_12px_2.Size = UDim2.new(1, 0, 1, 0)
Destroy_Roundify_12px_2.Image = "rbxassetid://3570695787"
Destroy_Roundify_12px_2.ImageColor3 = Color3.fromRGB(255, 255, 0)
Destroy_Roundify_12px_2.ImageTransparency = 0.500
Destroy_Roundify_12px_2.ScaleType = Enum.ScaleType.Slice
Destroy_Roundify_12px_2.SliceCenter = Rect.new(100, 100, 100, 100)
Destroy_Roundify_12px_2.SliceScale = 0.120

Discord.Name = "Discord"
Discord.Parent = Main
Discord.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Discord.BackgroundTransparency = 1.000
Discord.Position = UDim2.new(0.267857134, 0, 0.11765939, 0)
Discord.Size = UDim2.new(0, 182, 0, 28)
Discord.Font = Enum.Font.Roboto
Discord.Text = "https://discord.gg/mJ7rH9sUNq"
Discord.TextColor3 = Color3.fromRGB(255, 255, 255)
Discord.TextScaled = true
Discord.TextSize = 14.000
Discord.TextWrapped = true

Show.Name = "Show"
Show.Parent = NDS
Show.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Show.BackgroundTransparency = 1.000
Show.BorderSizePixel = 0
Show.Position = UDim2.new(0, 0, 0.476706266, 0)
Show.Size = UDim2.new(0, 89, 0, 44)
Show.Visible = false

Toggle_2.Name = "Toggle"
Toggle_2.Parent = Show
Toggle_2.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
Toggle_2.BackgroundTransparency = 1.000
Toggle_2.BorderSizePixel = 0
Toggle_2.Size = UDim2.new(0, 89, 0, 44)
Toggle_2.ZIndex = 2
Toggle_2.Font = Enum.Font.Roboto
Toggle_2.Text = "Show UI"
Toggle_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Toggle_2.TextScaled = true
Toggle_2.TextSize = 14.000
Toggle_2.TextWrapped = true

Toggle_Roundify_12px.Name = "Toggle_Roundify_12px"
Toggle_Roundify_12px.Parent = Toggle_2
Toggle_Roundify_12px.Active = true
Toggle_Roundify_12px.AnchorPoint = Vector2.new(0.5, 0.5)
Toggle_Roundify_12px.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Toggle_Roundify_12px.BackgroundTransparency = 1.000
Toggle_Roundify_12px.Position = UDim2.new(0.5, 0, 0.5, 0)
Toggle_Roundify_12px.Selectable = true
Toggle_Roundify_12px.Size = UDim2.new(1, 0, 1, 0)
Toggle_Roundify_12px.Image = "rbxassetid://3570695787"
Toggle_Roundify_12px.ImageColor3 = Color3.fromRGB(36, 36, 36)
Toggle_Roundify_12px.ScaleType = Enum.ScaleType.Slice
Toggle_Roundify_12px.SliceCenter = Rect.new(100, 100, 100, 100)
Toggle_Roundify_12px.SliceScale = 0.120

--Varaibles
plr = game.Players.LocalPlayer
AutoFarmToggled = false
local mouse = plr:GetMouse()

--Functions
mouse.KeyDown:connect(function(key)
    if key == "e" then
        if Main.Visible == true then
            Main.Visible = false
            Show.Visible = true
        else
            Main.Visible = true
            Show.Visible = false
        end
    end
end)

function isPlayerLoaded(player)
    if game.Workspace:FindFirstChild(player.Name) then
        if player.Character:FindFirstChild("HumanoidRootPart") then
            return true    
        end
    end
    return false
end

--Buttons
Toggle.MouseButton1Click:connect(function()
    if AutoFarmToggled then
        AutoFarmToggled = false
        Status.Text = "Autofarm is Disabled"
		Status.TextColor3 = Color3.new(1, 0, 0)
	else
	    AutoFarmToggled = true
	    Status.Text = "Autofarm is Enabled"
		Status.TextColor3 = Color3.new(0, 1, 0)
    end
end)

Destroy.MouseButton1Click:connect(function()
    NDS:Destroy()  
end)

Tower.MouseButton1Click:connect(function()
    if isPlayerLoaded(plr) then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-249.830933, 195.649323, 317.098053)
    end
end)

Island.MouseButton1Click:connect(function()
    if isPlayerLoaded(plr) then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-119.632835, 48.549366, 7.15458393)    
    end
end)


Vote.MouseButton1Click:connect(function()
    if game.Players.LocalPlayer.PlayerGui.MainGui.MapVotePage.Visible == false then
		game.Players.LocalPlayer.PlayerGui.MainGui.MapVotePage.Visible = true
	else if game.Players.LocalPlayer.PlayerGui.MainGui.MapVotePage.Visible == true then
			game.Players.LocalPlayer.PlayerGui.MainGui.MapVotePage.Visible = false
		end
	end    
end)

FallDmg.MouseButton1Click:connect(function()
    if isPlayerLoaded(plr) then
        if plr.Character:FindFirstChild("FallDamageScript") then
            game.Players.LocalPlayer.Character.FallDamageScript:Destroy()    
        end
    end
end)

Minimize.MouseButton1Click:connect(function()
    Main.Visible = false
    Show.Visible = true
end)

Toggle_2.MouseButton1Click:connect(function()
    Show.Visible = false
    Main.Visible = true
end)


--Main Loop

while wait(0.1) do
    --Update Status
    if isPlayerLoaded(plr) then
    	if game.Players.LocalPlayer.Character:FindFirstChild("SurvivalTag") ~= nil then
    		Disaster.Text = plr.Character.SurvivalTag.Value
    	else
    		Disaster.Text = "Waiting..."
    	end
    end
    --AutoFarm
    if isPlayerLoaded(plr) and AutoFarmToggled then
        plr.Character.HumanoidRootPart.CFrame = CFrame.new(-245.036911, 180.649384, 294.693726)        
    end
end
