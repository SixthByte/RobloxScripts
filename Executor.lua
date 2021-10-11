local Highlights = true

local Executor = Instance.new("ScreenGui")
local ExecutorFrame = Instance.new("Frame")
local Execute = Instance.new("TextButton")
local Clear = Instance.new("TextButton")
local Source = Instance.new("TextBox")
local Title = Instance.new("TextLabel")
local Minimize = Instance.new("TextButton")
local Logo = Instance.new("ImageLabel")
local EditorFrame = Instance.new("ScrollingFrame")
local Comments_ = Instance.new("TextLabel")
local Globals_ = Instance.new("TextLabel")
local Keywords_ = Instance.new("TextLabel")
local RemoteHighlight_ = Instance.new("TextLabel")
local Strings_ = Instance.new("TextLabel")
local Tokens_ = Instance.new("TextLabel")
local Numbers_ = Instance.new("TextLabel")
local Lines = Instance.new("TextLabel")
local ScriptBox = Instance.new("TextBox")
local Load = Instance.new("TextButton")
local Save = Instance.new("TextButton")
local Shadow1 = Instance.new("ImageLabel")
local Shadow2 = Instance.new("ImageLabel")
local Shadow3 = Instance.new("ImageLabel")
local BlackOut = Instance.new("Frame")

Executor.Name = "Executor"
Executor.Parent = game.CoreGui
Executor.ZIndexBehavior = Enum.ZIndexBehavior.Global

ExecutorFrame.Name = "ExecutorFrame"
ExecutorFrame.Parent = Executor
ExecutorFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ExecutorFrame.BorderSizePixel = 0
ExecutorFrame.Position = UDim2.new(0.456249982, 0, 0.210323155, 0)
ExecutorFrame.Size = UDim2.new(0, 721, 0, 425)
ExecutorFrame.Active = true
ExecutorFrame.Draggable = true

Execute.Name = "Execute"
Execute.Parent = ExecutorFrame
Execute.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Execute.BorderSizePixel = 0
Execute.Position = UDim2.new(0.0152565883, 0, 0.887058794, 0)
Execute.Size = UDim2.new(0, 100, 0, 39)
Execute.Font = Enum.Font.Gotham
Execute.Text = "Execute"
Execute.TextColor3 = Color3.fromRGB(255, 255, 255)
Execute.TextSize = 14.000

Clear.Name = "Clear"
Clear.Parent = ExecutorFrame
Clear.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Clear.BorderSizePixel = 0
Clear.Position = UDim2.new(0.1702565883, 0, 0.887058794, 0)
Clear.Size = UDim2.new(0, 100, 0, 39)
Clear.Font = Enum.Font.Gotham
Clear.Text = "Clear"
Clear.TextColor3 = Color3.fromRGB(255, 255, 255)
Clear.TextSize = 14.000

if isfolder("HexExecutor") ~= true then
    makefolder("HexExecutor")
end

ScriptBox.Name = "ScriptBox"
ScriptBox.Parent = ExecutorFrame
ScriptBox.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ScriptBox.BorderSizePixel = 0
ScriptBox.Position = UDim2.new(0.73652565883, 0, 0.887058794, 0)
ScriptBox.Size = UDim2.new(0, 180, 0, 39)
ScriptBox.TextColor3 = Color3.fromRGB(255, 255, 255)
ScriptBox.TextSize = 14.000
ScriptBox.Font = Enum.Font.Gotham
ScriptBox.PlaceholderText = "Script File"
ScriptBox.Text = ""
ScriptBox.TextTruncate = Enum.TextTruncate.AtEnd

Load.Name = "Load"
Load.Parent = ExecutorFrame
Load.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Load.BorderSizePixel = 0
Load.Position = UDim2.new(0.43752565883, 0, 0.887058794, 0)
Load.Size = UDim2.new(0, 100, 0, 39)
Load.Font = Enum.Font.Gotham
Load.Text = "Load File"
Load.TextColor3 = Color3.fromRGB(255, 255, 255)
Load.TextSize = 14.000

Save.Name = "Save"
Save.Parent = ExecutorFrame
Save.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Save.BorderSizePixel = 0
Save.Position = UDim2.new(0.58652565883, 0, 0.887058794, 0)
Save.Size = UDim2.new(0, 100, 0, 39)
Save.Font = Enum.Font.Gotham
Save.Text = "Save File"
Save.TextColor3 = Color3.fromRGB(255, 255, 255)
Save.TextSize = 14.000

EditorFrame.Name = "EditorFrame"
EditorFrame.Parent = ExecutorFrame
EditorFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
EditorFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
EditorFrame.BorderSizePixel = 0
EditorFrame.Position = UDim2.new(0.0152565883, 0, 0.118106902, 0)
EditorFrame.Size = UDim2.new(0, 700, 0, 317)
EditorFrame.ZIndex = 3
EditorFrame.CanvasSize = UDim2.new(4, 0, 2, 0)
EditorFrame.HorizontalScrollBarInset = Enum.ScrollBarInset.ScrollBar
EditorFrame.ScrollBarThickness = 5
EditorFrame.ScrollBarImageTransparency = 0.5

Source.Name = "Source"
Source.Parent = EditorFrame
Source.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Source.BackgroundTransparency = 1
Source.BorderSizePixel = 0
Source.Size = UDim2.new(0, 680, 0, 317)
Source.Position = UDim2.new(0.0578, 0, 0, 0)
Source.ClearTextOnFocus = false
Source.Font = Enum.Font.Code
Source.MultiLine = true
Source.Text = ""
Source.TextColor3 = Color3.fromRGB(225, 225, 225)
Source.TextSize = 15.000
Source.TextXAlignment = Enum.TextXAlignment.Left
Source.TextYAlignment = Enum.TextYAlignment.Top

Comments_.Name = "Comments_"
Comments_.Parent = Source
Comments_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Comments_.BackgroundTransparency = 1.000
Comments_.Size = UDim2.new(1, 0, 1, 0)
Comments_.ZIndex = 5
Comments_.Font = Enum.Font.Code
Comments_.Text = ""
Comments_.TextColor3 = Color3.fromRGB(59, 200, 59)
Comments_.TextSize = 15.000
Comments_.TextXAlignment = Enum.TextXAlignment.Left
Comments_.TextYAlignment = Enum.TextYAlignment.Top

Globals_.Name = "Globals_"
Globals_.Parent = Source
Globals_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Globals_.BackgroundTransparency = 1.000
Globals_.Size = UDim2.new(1, 0, 1, 0)
Globals_.ZIndex = 5
Globals_.Font = Enum.Font.Code
Globals_.Text = ""
Globals_.TextColor3 = Color3.fromRGB(132, 214, 247)
Globals_.TextSize = 15.000
Globals_.TextXAlignment = Enum.TextXAlignment.Left
Globals_.TextYAlignment = Enum.TextYAlignment.Top

Keywords_.Name = "Keywords_"
Keywords_.Parent = Source
Keywords_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Keywords_.BackgroundTransparency = 1.000
Keywords_.Size = UDim2.new(1, 0, 1, 0)
Keywords_.ZIndex = 5
Keywords_.Font = Enum.Font.Code
Keywords_.Text = ""
Keywords_.TextColor3 = Color3.fromRGB(248, 109, 124)
Keywords_.TextSize = 15.000
Keywords_.TextXAlignment = Enum.TextXAlignment.Left
Keywords_.TextYAlignment = Enum.TextYAlignment.Top

RemoteHighlight_.Name = "RemoteHighlight_"
RemoteHighlight_.Parent = Source
RemoteHighlight_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RemoteHighlight_.BackgroundTransparency = 1.000
RemoteHighlight_.Size = UDim2.new(1, 0, 1, 0)
RemoteHighlight_.ZIndex = 5
RemoteHighlight_.Font = Enum.Font.Code
RemoteHighlight_.Text = ""
RemoteHighlight_.TextColor3 = Color3.fromRGB(0, 144, 255)
RemoteHighlight_.TextSize = 15.000
RemoteHighlight_.TextXAlignment = Enum.TextXAlignment.Left
RemoteHighlight_.TextYAlignment = Enum.TextYAlignment.Top

Strings_.Name = "Strings_"
Strings_.Parent = Source
Strings_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Strings_.BackgroundTransparency = 1.000
Strings_.Size = UDim2.new(1, 0, 1, 0)
Strings_.ZIndex = 5
Strings_.Font = Enum.Font.Code
Strings_.Text = ""
Strings_.TextColor3 = Color3.fromRGB(173, 241, 149)
Strings_.TextSize = 15.000
Strings_.TextXAlignment = Enum.TextXAlignment.Left
Strings_.TextYAlignment = Enum.TextYAlignment.Top

Tokens_.Name = "Tokens_"
Tokens_.Parent = Source
Tokens_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Tokens_.BackgroundTransparency = 1.000
Tokens_.Size = UDim2.new(1, 0, 1, 0)
Tokens_.ZIndex = 5
Tokens_.Font = Enum.Font.Code
Tokens_.Text = ""
Tokens_.TextColor3 = Color3.fromRGB(255, 255, 255)
Tokens_.TextSize = 15.000
Tokens_.TextXAlignment = Enum.TextXAlignment.Left
Tokens_.TextYAlignment = Enum.TextYAlignment.Top

Numbers_.Name = "Numbers_"
Numbers_.Parent = Source
Numbers_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Numbers_.BackgroundTransparency = 1.000
Numbers_.Size = UDim2.new(1, 0, 1, 0)
Numbers_.ZIndex = 4
Numbers_.Font = Enum.Font.Code
Numbers_.Text = ""
Numbers_.TextColor3 = Color3.fromRGB(255, 198, 0)
Numbers_.TextSize = 15.000
Numbers_.TextXAlignment = Enum.TextXAlignment.Left
Numbers_.TextYAlignment = Enum.TextYAlignment.Top

Title.Name = "Title"
Title.Parent = ExecutorFrame
Title.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Title.BorderSizePixel = 0
Title.Size = UDim2.new(0, 721, 0, 37)
Title.Font = Enum.Font.GothamSemibold
Title.Text = "Hex Executor"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 15.000

Logo.Name = "Logo"
Logo.Parent = ExecutorFrame
Logo.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Logo.BackgroundTransparency = 1.000
Logo.BorderSizePixel = 0
Logo.Position = UDim2.new(0.00499999989, 0, 0.00200000009, 0)
Logo.Size = UDim2.new(0, 34, 0, 34)
Logo.Image = "rbxassetid://7403270296"

Minimize.Name = "Minimize"
Minimize.Parent = ExecutorFrame
Minimize.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Minimize.BorderSizePixel = 0
Minimize.Text = "-"
Minimize.Font = Enum.Font.GothamSemibold
Minimize.TextSize = 15
Minimize.TextColor3 = Color3.fromRGB(255, 255, 255)
Minimize.Position = UDim2.new(0.96, 0, 0.0135, 0)
Minimize.Size = UDim2.new(0, 25, 0, 25)

Lines.Name = "Lines"
Lines.Parent = EditorFrame
Lines.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Lines.BackgroundTransparency = 1.000
Lines.Size = UDim2.new(0, 40, 1, 0)
Lines.ZIndex = 4
Lines.Font = Enum.Font.Code
Lines.Text = "1"
Lines.TextColor3 = Color3.fromRGB(255, 255, 255)
Lines.TextSize = 15.000
Lines.TextWrapped = true
Lines.TextYAlignment = Enum.TextYAlignment.Top

Shadow1.Name = "Shadow1"
Shadow1.Parent = ExecutorFrame
Shadow1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Shadow1.BackgroundTransparency = 1.000
Shadow1.Position = UDim2.new(-0.0280898884, 0, -0.0460909101, 0)
Shadow1.Size = UDim2.new(1, 41, 1, 41)
Shadow1.ZIndex = -1
Shadow1.Image = "rbxassetid://7666162633"
Shadow1.ImageColor3 = Color3.fromRGB(0, 0, 0)
Shadow1.ScaleType = Enum.ScaleType.Slice
Shadow1.SliceCenter = Rect.new(24, 24, 276, 276)

Shadow2.Name = "Shadow2"
Shadow2.Parent = ExecutorFrame
Shadow2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Shadow2.BackgroundTransparency = 1.000
Shadow2.Position = UDim2.new(-0.0280898884, 0, -0.0460909101, 0)
Shadow2.Size = UDim2.new(1, 41, 1, 41)
Shadow2.ZIndex = -1
Shadow2.Image = "rbxassetid://7666162633"
Shadow2.ImageColor3 = Color3.fromRGB(0, 0, 0)
Shadow2.ScaleType = Enum.ScaleType.Slice
Shadow2.SliceCenter = Rect.new(24, 24, 276, 276)

Shadow3.Name = "Shadow3"
Shadow3.Parent = ExecutorFrame
Shadow3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Shadow3.BackgroundTransparency = 1.000
Shadow3.Position = UDim2.new(-0.0280898884, 0, -0.0460909101, 0)
Shadow3.Size = UDim2.new(1, 41, 1, 41)
Shadow3.ZIndex = -1
Shadow3.Image = "rbxassetid://7666162633"
Shadow3.ImageColor3 = Color3.fromRGB(0, 0, 0)
Shadow3.ScaleType = Enum.ScaleType.Slice
Shadow3.SliceCenter = Rect.new(24, 24, 276, 276)

BlackOut.Name = "BlackOut"
BlackOut.BackgroundColor3 = Color3.new(0, 0, 0)
BlackOut.Parent = ExecutorFrame
BlackOut.ZIndex = 9
BlackOut.Size = UDim2.new(-1, 0, 0, 0)
BlackOut.Position = UDim2.new(1, 0, 0, 0)
BlackOut.BorderSizePixel = 0

Execute.MouseButton1Click:Connect(function()
	loadstring(Source.Text)()
end)

Clear.MouseButton1Click:Connect(function()
	Source.Text = ""
end)

Save.MouseButton1Click:Connect(function()
	writefile("HexExecutor/".. tostring(ScriptBox.Text) ..".lua", tostring(Source.Text))
end)

Load.MouseButton1Click:Connect(function()
    if isfile("HexExecutor/".. tostring(ScriptBox.Text) ..".lua") then
	    Source.Text = readfile("HexExecutor/".. tostring(ScriptBox.Text) ..".lua")
	end
end)
Executor.Enabled = false
ExecutorFrame.Visible = false
Execute.Visible = false
Clear.Visible = false
ScriptBox.Visible = false
Load.Visible = false
Save.Visible = false
EditorFrame.Visible = false
Title.Visible = false
Logo.Visible = false
ECloseBlack = game:GetService("TweenService"):Create(BlackOut, TweenInfo.new(0.2), {Size = UDim2.new(-1, 0, 1, 0)})
EOpenBlack = game:GetService("TweenService"):Create(BlackOut, TweenInfo.new(0.2), {Size = UDim2.new(-1, 0, 0, 0)})
ECloseTween = game:GetService("TweenService"):Create(ExecutorFrame, TweenInfo.new(0.2), {Size = UDim2.new(0, 721, 0, 0)})
EOpenTween = game:GetService("TweenService"):Create(ExecutorFrame, TweenInfo.new(0.2), {Size = UDim2.new(0, 721, 0, 425)})
function _G.OpenExecutor()
    Executor.Enabled = true
    ExecutorFrame.Visible = true
    EOpenTween:Play()
end
function _G.CloseExecutor()
    Shadow1.Visible = false
    Shadow2.Visible = false
    Shadow3.Visible = false
    Minimize.Visible = false
    ECloseBlack:Play()
end
local Opened = true
Minimize.MouseButton1Click:Connect(function()
    if Opened then
        _G.CloseExecutor()
    end
end)
ECloseBlack.Completed:Connect(function()
    Execute.Visible = false
    Clear.Visible = false
    ScriptBox.Visible = false
    Load.Visible = false
    Save.Visible = false
    EditorFrame.Visible = false
    Title.Visible = false
    Logo.Visible = false
    ECloseTween:Play()
end)
ECloseTween.Completed:Connect(function()
    Executor.Enabled = false
    ExecutorFrame.Visible = false
    Opened = false
end)
EOpenTween.Completed:Connect(function()
    Execute.Visible = true
    Clear.Visible = true
    ScriptBox.Visible = true
    Load.Visible = true
    Save.Visible = true
    EditorFrame.Visible = true
    Title.Visible = true
    Logo.Visible = true
    EOpenBlack:Play()
end)
EOpenBlack.Completed:Connect(function()
    Shadow1.Visible = true
    Shadow2.Visible = true
    Shadow3.Visible = true
    Minimize.Visible = true
    Opened = true
end)

Checker = nil
Checker = game:GetService'RunService'.RenderStepped:connect(function()
    local XSize = (Source.TextBounds.X - 656) --- 20
    local YSize = (Source.TextBounds.Y - 315) --- 125
    EditorFrame.CanvasSize = UDim2.new(1, XSize, 1, YSize)
    local NextXSize
    local NextYSize
    if Source.TextBounds.X < 696 then
        NextXSize = 680
    else
        NextXSize = Source.TextBounds.X
    end
    if Source.TextBounds.Y < 315 then --308
        NextYSize = 317
    else
        NextYSize = Source.TextBounds.Y + 125
    end
    Source.Size = UDim2.new(0, NextXSize, 0, NextYSize)
end)

local m = loadstring(game:HttpGet("https://raw.githubusercontent.com/WolfGod746/RobloxScripts/ExecutorFrame/Executor%20Colors%20Module.lua"))()

Source:GetPropertyChangedSignal("Text"):Connect(function()
    if Highlights then
	    m.highlight_source("Text", Executor.ExecutorFrame.EditorFrame.Source, Executor.ExecutorFrame.EditorFrame.Lines)
    end
end)
