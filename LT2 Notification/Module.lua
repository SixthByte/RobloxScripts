local LT2Notif = {}
function LT2Notif(header, body, RightButtonText, LeftButtonText, callback)
    local Notif = Instance.new("ScreenGui")
    local Main = Instance.new("Frame")
    local ClickSound = Instance.new("Sound")
    local MainFrame = Instance.new("Frame")
    local BodyText = Instance.new("TextLabel")
    local Heading = Instance.new("TextLabel")
    local HeadingDropShadow = Instance.new("TextLabel")
    local MainFrameDropShadow = Instance.new("Frame")
    local Right = Instance.new("TextButton")
    local RightDropShadowFrame = Instance.new("Frame")
    local RightDropShadow = Instance.new("TextLabel")
    local Left = Instance.new("TextButton")
    local LeftDropShadowFrame = Instance.new("Frame")
    local LeftDropShadow = Instance.new("TextLabel")
    local LeftFake = Instance.new("TextLabel")
    local LeftFakeF = Instance.new("Frame")
    local RightFake = Instance.new("TextLabel")
    local RightFakeF = Instance.new("Frame")
    
    Notif.Name = "Notif"
    Notif.Parent = game.CoreGui
    
    Main.Name = "Main"
    Main.Parent = Notif
    Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Main.BackgroundTransparency = 1.000
    Main.BorderSizePixel = 0
    Main.Size = UDim2.new(1, 0, 1, 0)
    
    ClickSound.Name = "ClickSound"
    ClickSound.SoundId = "http://www.roblox.com/asset/?id=215658476"
    ClickSound.Parent = Workspace
    
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = Main
    MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MainFrame.BorderSizePixel = 0
    MainFrame.Position = UDim2.new(0.5, -150, 0.5, -198)
    MainFrame.Size = UDim2.new(0, 300, 0, 178)
    MainFrame.ZIndex = 5
    
    BodyText.Name = "BodyText"
    BodyText.Parent = MainFrame
    BodyText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    BodyText.BackgroundTransparency = 1.000
    BodyText.BorderSizePixel = 0
    BodyText.Position = UDim2.new(0, 10, 0, 60)
    BodyText.Size = UDim2.new(1, -20, 0, 120)
    BodyText.ZIndex = 5
    BodyText.Font = Enum.Font.ArialBold
    if body == nil or body == false then
        BodyText.Text = "BODY TEXT"
    else
        BodyText.Text = tostring(body)
    end
    BodyText.TextColor3 = Color3.fromRGB(0, 0, 0)
    BodyText.TextSize = 24.000
    BodyText.TextWrapped = true
    BodyText.TextYAlignment = "Top"
    
    Heading.Name = "Heading"
    Heading.Parent = MainFrame
    Heading.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Heading.BackgroundTransparency = 1.000
    Heading.BorderSizePixel = 0
    Heading.Position = UDim2.new(0, 0, 0, 10)
    Heading.Size = UDim2.new(1, 0, 0, 40)
    Heading.ZIndex = 6
    Heading.Font = Enum.Font.ArialBold
    if header == nil or header == false then
        Heading.Text = "HEADING"
    else
        Heading.Text = tostring(header)
    end
    Heading.TextColor3 = Color3.fromRGB(0, 0, 0)
    Heading.TextSize = 48.000
    Heading.TextWrapped = true
    
    HeadingDropShadow.Name = "HeadingDropShadow"
    HeadingDropShadow.Parent = Heading
    HeadingDropShadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    HeadingDropShadow.BackgroundTransparency = 1.000
    HeadingDropShadow.BorderSizePixel = 0
    HeadingDropShadow.Position = UDim2.new(0, 2, 0, 1)
    HeadingDropShadow.Size = UDim2.new(1, 0, 1, 0)
    HeadingDropShadow.ZIndex = 5
    HeadingDropShadow.Font = Enum.Font.ArialBold
    HeadingDropShadow.Text = "HEADING"
    HeadingDropShadow.TextColor3 = Color3.fromRGB(131, 131, 131)
    HeadingDropShadow.TextSize = 48.000
    HeadingDropShadow.TextStrokeColor3 = Color3.fromRGB(131, 131, 131)
    HeadingDropShadow.TextWrapped = true
    
    MainFrameDropShadow.Name = "DropShadow"
    MainFrameDropShadow.Parent = MainFrame
    MainFrameDropShadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    MainFrameDropShadow.BorderSizePixel = 0
    MainFrameDropShadow.Position = UDim2.new(0, 4, 0, 4)
    MainFrameDropShadow.Size = UDim2.new(1, 0, 1, 0)
    MainFrameDropShadow.ZIndex = 4
    
    Right.Name = "Right"
    Right.Parent = Main
    Right.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Right.BorderSizePixel = 0
    Right.Position = UDim2.new(0.5, 20, 0.5, 0)
    Right.Selectable = false
    Right.Size = UDim2.new(0, 130, 0, 40)
    Right.ZIndex = 5
    Right.Selected = true
    Right.Font = Enum.Font.SourceSans
    Right.Text = ""
    Right.TextSize = 14.000
    
    RightDropShadowFrame.Name = "DropShadow"
    RightDropShadowFrame.Parent = Right
    RightDropShadowFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    RightDropShadowFrame.BorderSizePixel = 0
    RightDropShadowFrame.Position = UDim2.new(0, 4, 0, 4)
    RightDropShadowFrame.Size = UDim2.new(1, 0, 1, 0)
    RightDropShadowFrame.ZIndex = 4
    
    RightDropShadow.Parent = Right
    RightDropShadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    RightDropShadow.BackgroundTransparency = 1.000
    RightDropShadow.BorderSizePixel = 0
    RightDropShadow.Position = UDim2.new(0, 0, 0, 0)
    RightDropShadow.Size = UDim2.new(1, 0, 1, 0)
    RightDropShadow.ZIndex = 5
    RightDropShadow.Font = Enum.Font.ArialBold
    if RightButtonText == nil or RightButtonText == false then
        RightDropShadow.Text = "Close"
    else
        RightDropShadow.Text = tostring(RightButtonText)
    end
    RightDropShadow.TextColor3 = Color3.fromRGB(0, 0, 0)
    RightDropShadow.TextSize = 24.000
    RightDropShadow.TextWrapped = true
    
    if LeftButtonText ~= nil or LeftButtonText ~= false then
    
        Left.Name = "Left"
        Left.Parent = Main
        Left.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Left.BorderSizePixel = 0
        Left.Position = UDim2.new(0.5, -150, 0.5, 0)
        Left.Selectable = false
        Left.Size = UDim2.new(0, 130, 0, 40)
        Left.ZIndex = 5
        Left.Selected = true
        Left.Font = Enum.Font.SourceSans
        Left.Text = ""
        Left.TextSize = 14.000
        
        LeftDropShadowFrame.Name = "DropShadow"
        LeftDropShadowFrame.Parent = Left
        LeftDropShadowFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        LeftDropShadowFrame.BorderSizePixel = 0
        LeftDropShadowFrame.Position = UDim2.new(0, 4, 0, 4)
        LeftDropShadowFrame.Size = UDim2.new(1, 0, 1, 0)
        LeftDropShadowFrame.ZIndex = 4
        
        LeftDropShadow.Parent = Left
        LeftDropShadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        LeftDropShadow.BackgroundTransparency = 1.000
        LeftDropShadow.BorderSizePixel = 0
        LeftDropShadow.Position = UDim2.new(0, 0, 0, 0)
        LeftDropShadow.Size = UDim2.new(1, 0, 1, 0)
        LeftDropShadow.ZIndex = 5
        LeftDropShadow.Font = Enum.Font.ArialBold
        if LeftButtonText == nil or LeftButtonText == false then
            RightDropShadow.Text = "Close"
        else
            RightDropShadow.Text = tostring(LeftButtonText)
        end
        LeftDropShadow.TextColor3 = Color3.fromRGB(0, 0, 0)
        LeftDropShadow.TextSize = 24.000
        LeftDropShadow.TextWrapped = true
        
        LeftFake.Parent = Main
        LeftFake.Name = "LeftFake"
        LeftFake.BorderSizePixel = 0
        LeftFake.BackgroundTransparency = 1
        LeftFake.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        LeftFake.Position = UDim2.new(0.5, -150, 0.5, 0)
        LeftFake.Size = UDim2.new(0, 130, 0, 40)
        LeftFake.ZIndex = 5
        LeftFake.TextSize = 24.000
        LeftFake.Font = Enum.Font.ArialBold
        LeftFake.TextColor3 = Color3.new(0, 0, 0)
        LeftFake.Text = LeftDropShadow.Text
        
        LeftFakeF.Name = "DropShadow"
        LeftFakeF.Parent = LeftFake
        LeftFakeF.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        LeftFakeF.BorderSizePixel = 0
        LeftFakeF.Position = UDim2.new(0, 4, 0, 4)
        LeftFakeF.Size = UDim2.new(1, 0, 1, 0)
        LeftFakeF.ZIndex = 4
        
    end
    
    RightFake.Parent = Main
    RightFake.Name = "RightFake"
    RightFake.BorderSizePixel = 0
    RightFake.BackgroundTransparency = 1
    RightFake.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    RightFake.Position = UDim2.new(0.5, 20, 0.5, 0)
    RightFake.Size = UDim2.new(0, 130, 0, 40)
    RightFake.ZIndex = 5
    RightFake.TextSize = 24.000
    RightFake.Font = Enum.Font.ArialBold
    RightFake.TextColor3 = Color3.new(0, 0, 0)
    RightFake.Text = RightDropShadow.Text
    
    RightFakeF.Name = "DropShadow"
    RightFakeF.Parent = RightFake
    RightFakeF.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    RightFakeF.BorderSizePixel = 0
    RightFakeF.Position = UDim2.new(0, 4, 0, 4)
    RightFakeF.Size = UDim2.new(1, 0, 1, 0)
    RightFakeF.ZIndex = 4
    
    LeftColorDark = game:GetService("TweenService"):Create(LeftFake, TweenInfo.new(0.1), {BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)})
    LeftColorLight = game:GetService("TweenService"):Create(LeftFake, TweenInfo.new(0.1), {BackgroundColor3 = Color3.new(1, 1, 1)})
    RightColorDark = game:GetService("TweenService"):Create(RightFake, TweenInfo.new(0.1), {BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)})
    RightColorLight = game:GetService("TweenService"):Create(RightFake, TweenInfo.new(0.1), {BackgroundColor3 = Color3.new(1, 1, 1)})
    
    function closeGui()
    	Main.Visible = false
    	Notif:Destroy()
    end
    Left.MouseButton1Down:Connect(function()
        if callback then
            callback()
        end
        ClickSound:Play()
        Left.Visible = false
        LeftFake.BackgroundTransparency = 0
        Right.Visible = false
        RightFake.BackgroundTransparency = 0
        LeftColorDark:Play()
        wait(0.1)
        LeftColorLight:Play()
        wait(0.1)
        closeGui()
    end)
    Right.MouseButton1Down:Connect(function()
        ClickSound:Play()
        Left.Visible = false
        LeftFake.BackgroundTransparency = 0
        Right.Visible = false
        RightFake.BackgroundTransparency = 0
        RightColorDark:Play()
        wait(0.1)
        RightColorLight:Play()
        wait(0.1)
        closeGui()
    end)
end
return LT2Notif
