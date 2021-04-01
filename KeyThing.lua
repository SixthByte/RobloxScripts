-- Gui to Lua
-- Version: 3.2

-- Instances:

local WASD = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local D = Instance.new("TextLabel")
local MB1 = Instance.new("TextLabel")
local Spacebar = Instance.new("TextLabel")
local MB2 = Instance.new("TextLabel")
local S = Instance.new("TextLabel")
local fps = Instance.new("TextLabel")
local W = Instance.new("TextLabel")
local A = Instance.new("TextLabel")
local mouse = game.Players.LocalPlayer:GetMouse()

--Properties:

WASD.Name = "WASD"
WASD.Parent = game.CoreGui
WASD.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = WASD
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.Position = UDim2.new(0.188140556, 0, 0.181219116, 0)
Frame.Size = UDim2.new(0, 150, 0, 250)

D.Name = "D"
D.Parent = Frame
D.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
D.BackgroundTransparency = 0.500
D.BorderColor3 = Color3.fromRGB(0, 0, 0)
D.BorderSizePixel = 0
D.Position = UDim2.new(0.670666635, 0, 0.261999995, 0)
D.Size = UDim2.new(0, 47, 0, 47)
D.Font = Enum.Font.Gotham
D.Text = "D"
D.TextColor3 = Color3.fromRGB(0, 0, 0)
D.TextScaled = true
D.TextSize = 14.000
D.TextWrapped = true
D.Active = true
D.Draggable = true

MB1.Name = "MB1"
MB1.Parent = Frame
MB1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MB1.BackgroundTransparency = 0.500
MB1.BorderColor3 = Color3.fromRGB(0, 0, 0)
MB1.BorderSizePixel = 0
MB1.Position = UDim2.new(-0.00233333278, 0, 0.465000004, 0)
MB1.Size = UDim2.new(0, 73, 0, 47)
MB1.Font = Enum.Font.Gotham
MB1.Text = "LMB"
MB1.TextColor3 = Color3.fromRGB(0, 0, 0)
MB1.TextScaled = true
MB1.TextSize = 14.000
MB1.TextWrapped = true
MB1.Active = true
MB1.Draggable = true

Spacebar.Name = "Space"
Spacebar.Parent = Frame
Spacebar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Spacebar.BackgroundTransparency = 0.500
Spacebar.BorderColor3 = Color3.fromRGB(0, 0, 0)
Spacebar.BorderSizePixel = 0
Spacebar.Position = UDim2.new(-0.00233333278, 0, 0.665000021, 0)
Spacebar.Size = UDim2.new(0, 148, 0, 25)
Spacebar.Font = Enum.Font.Gotham
Spacebar.Text = "____"
Spacebar.TextColor3 = Color3.fromRGB(0, 0, 0)
Spacebar.TextSize = 14.000
Spacebar.TextWrapped = true
Spacebar.Active = true
Spacebar.Draggable = true

MB2.Name = "MB2"
MB2.Parent = Frame
MB2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MB2.BackgroundTransparency = 0.500
MB2.BorderColor3 = Color3.fromRGB(0, 0, 0)
MB2.BorderSizePixel = 0
MB2.Position = UDim2.new(0.497666657, 0, 0.465000004, 0)
MB2.Size = UDim2.new(0, 73, 0, 47)
MB2.Font = Enum.Font.Gotham
MB2.Text = "RMB"
MB2.TextColor3 = Color3.fromRGB(0, 0, 0)
MB2.TextScaled = true
MB2.TextSize = 14.000
MB2.TextWrapped = true
MB2.Active = true
MB2.Draggable = true

S.Name = "S"
S.Parent = Frame
S.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
S.BackgroundTransparency = 0.500
S.BorderColor3 = Color3.fromRGB(0, 0, 0)
S.BorderSizePixel = 0
S.Position = UDim2.new(0.336666673, 0, 0.261999995, 0)
S.Size = UDim2.new(0, 47, 0, 47)
S.Font = Enum.Font.Gotham
S.Text = "S"
S.TextColor3 = Color3.fromRGB(0, 0, 0)
S.TextScaled = true
S.TextSize = 14.000
S.TextWrapped = true
S.Active = true
S.Draggable = true

fps.Name = "fps"
fps.Parent = Frame
fps.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
fps.BackgroundTransparency = 0.500
fps.BorderColor3 = Color3.fromRGB(0, 0, 0)
fps.BorderSizePixel = 0
fps.Position = UDim2.new(-0.00233333278, 0, 0.781000018, 0)
fps.Size = UDim2.new(0, 148, 0, 38)
fps.Font = Enum.Font.Gotham
fps.Text = ""
fps.TextColor3 = Color3.fromRGB(0, 0, 0)
fps.TextSize = 20.000
fps.TextWrapped = true
fps.Active = true
fps.Draggable = true

W.Name = "W"
W.Parent = Frame
W.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
W.BackgroundTransparency = 0.500
W.BorderColor3 = Color3.fromRGB(0, 0, 0)
W.BorderSizePixel = 0
W.Position = UDim2.new(0.337666661, 0, 0.061999999, 0)
W.Size = UDim2.new(0, 47, 0, 47)
W.Font = Enum.Font.Gotham
W.Text = "W"
W.TextColor3 = Color3.fromRGB(0, 0, 0)
W.TextScaled = true
W.TextSize = 14.000
W.TextWrapped = true
W.Active = true
W.Draggable = true

A.Name = "A"
A.Parent = Frame
A.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
A.BackgroundTransparency = 0.500
A.BorderColor3 = Color3.fromRGB(0, 0, 0)
A.BorderSizePixel = 0
A.Position = UDim2.new(0.0036666668, 0, 0.261999995, 0)
A.Size = UDim2.new(0, 47, 0, 47)
A.Font = Enum.Font.Gotham
A.Text = "A"
A.TextColor3 = Color3.fromRGB(0, 0, 0)
A.TextScaled = true
A.TextSize = 14.000
A.TextWrapped = true
A.Active = true
A.Draggable = true

-- Script

-- KeyDown
mouse.KeyDown:connect(function(key)
    if key == "w" then
        W.BackgroundColor3 = Color3.new(1,1,1)
    end
end)

mouse.KeyDown:connect(function(key)
    if key == "a" then
        A.BackgroundColor3 = Color3.new(1,1,1)
    end
end)

mouse.KeyDown:connect(function(key)
    if key == "s" then
        S.BackgroundColor3 = Color3.new(1,1,1)
    end
end)

mouse.KeyDown:connect(function(key)
    if key == "d" then
        D.BackgroundColor3 = Color3.new(1,1,1)
    end
end)

mouse.Button1Down:connect(function()
    MB1.BackgroundColor3 = Color3.new(1,1,1)
end)

mouse.Button2Down:connect(function()
    MB2.BackgroundColor3 = Color3.new(1,1,1)
end)

local uis = game:GetService("UserInputService")

uis.InputBegan:Connect(function(i)
 if i.KeyCode == Enum.KeyCode.Space then
    Spacebar.BackgroundColor3 = Color3.new(1,1,1)
 end
end)

-- KeyUp

mouse.KeyUp:connect(function(key)
    if key == "w" then
        W.BackgroundColor3 = Color3.new(0,0,0)
    end
end)

mouse.KeyUp:connect(function(key)
    if key == "a" then
        A.BackgroundColor3 = Color3.new(0,0,0)
    end
end)

mouse.KeyUp:connect(function(key)
    if key == "s" then
        S.BackgroundColor3 = Color3.new(0,0,0)
    end
end)

mouse.KeyUp:connect(function(key)
    if key == "d" then
        D.BackgroundColor3 = Color3.new(0,0,0)
    end
end)

mouse.Button1Up:connect(function()
    MB1.BackgroundColor3 = Color3.new(0,0,0)
end)

mouse.Button2Up:connect(function()
    MB2.BackgroundColor3 = Color3.new(0,0,0)
end)

uis.InputEnded:Connect(function(i)
 if i.KeyCode == Enum.KeyCode.Space then
    Spacebar.BackgroundColor3 = Color3.new(0,0,0)
 end
end)



while wait(0.5) do
    local x = workspace:GetRealPhysicsFPS()
    local plrfps = math.round(x)
    if plrfps == 60 then
        fps.Text = "60+ FPS"
    else
        fps.Text = (plrfps .. " FPS")
    end
end
