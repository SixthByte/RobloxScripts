function WinNotif(title, body, delay, round)
    local WinNotif = Instance.new("ScreenGui")
    local Main = Instance.new("Frame")
    local Icon = Instance.new("ImageLabel")
    local Close = Instance.new("ImageButton")
    local Program = Instance.new("TextLabel")
    local Title = Instance.new("TextLabel")
    local Body = Instance.new("TextLabel")
    local Sound = Instance.new("Sound")
    
    WinNotif.Name = "WinNotif"
    WinNotif.Parent = game.CoreGui
    WinNotif.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    Main.Name = "Main"
    Main.Parent = WinNotif
    Main.BackgroundColor3 = Color3.fromRGB(3, 3, 3)
    Main.BackgroundTransparency = 0.100
    Main.BorderSizePixel = 0
    Main.Position = UDim2.new(1, 0, 0.843100765, 0) -- 0.736805558, 0, 0.843100765, 0
    Main.Size = UDim2.new(0, 364, 0, 110)
    
    Icon.Name = "Icon"
    Icon.Parent = Main
    Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Icon.BackgroundTransparency = 1.000
    Icon.Position = UDim2.new(0.0384615399, 0, 0.127272725, 0)
    Icon.Size = UDim2.new(0, 28, 0, 28)
    Icon.Image = "rbxassetid://7826686602"
    
    Close.Name = "Close"
    Close.Parent = Main
    Close.BackgroundTransparency = 1.000
    Close.Position = UDim2.new(0.898351669, 0, 0.181818187, 0)
    Close.Size = UDim2.new(0, 16, 0, 16)
    Close.ZIndex = 2
    Close.Image = "rbxassetid://3926305904"
    Close.ImageColor3 = Color3.fromRGB(220, 220, 220)
    Close.ImageRectOffset = Vector2.new(284, 4)
    Close.ImageRectSize = Vector2.new(24, 24)
    
    Program.Name = "Program"
    Program.Parent = Main
    Program.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Program.BackgroundTransparency = 1.000
    Program.Position = UDim2.new(0.134615391, 0, 0.181818187, 0)
    Program.Size = UDim2.new(0, 264, 0, 16)
    Program.Font = Enum.Font.SourceSans
    Program.Text = "Hex"
    Program.TextColor3 = Color3.fromRGB(255, 255, 255)
    Program.TextSize = 17.000
    Program.TextXAlignment = Enum.TextXAlignment.Left
    
    Title.Name = "Title"
    Title.Parent = Main
    Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1.000
    Title.Position = UDim2.new(0.0384615399, 0, 0.463636369, 0)
    Title.Size = UDim2.new(0, 329, 0, 21)
    Title.Font = Enum.Font.SourceSansSemibold
    Title.Text = title
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 20.000
    Title.TextXAlignment = Enum.TextXAlignment.Left
    
    Body.Name = "Body"
    Body.Parent = Main
    Body.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Body.BackgroundTransparency = 1.000
    Body.Position = UDim2.new(0.0384615399, 0, 0.654545426, 0)
    Body.Size = UDim2.new(0, 329, 0, 21)
    Body.Font = Enum.Font.SourceSans
    Body.Text = body
    Body.TextColor3 = Color3.fromRGB(200, 200, 200)
    Body.TextSize = 19.000
    Body.TextXAlignment = Enum.TextXAlignment.Left
    Body.TextWrapped = true
    
    Sound.Parent = Main
    Sound.SoundId = "rbxassetid://478544929"
    
    if round == true or round == nil then
        local UICorner = Instance.new("UICorner")
        UICorner.CornerRadius = UDim.new(0, 10)
        UICorner.Parent = Main
    end
    
    OpenTween = game:GetService("TweenService"):Create(Main, TweenInfo.new(0.35, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = UDim2.new(0.736805558, 0, 0.843100765, 0)})
    CloseTween = game:GetService("TweenService"):Create(Main, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(1, 0, 0.843100765, 0)})
    repeat wait() until OpenTween
    OpenTween:Play()
    Sound:Play()
    
    Close.MouseButton1Click:Connect(function()
        CloseTween:Play()
        wait(0.3)
        WinNotif:Destroy()
    end)
    
    wait(delay)
    
    CloseTween:Play()
    wait(0.3)
    WinNotif:Destroy()
end

return WinNotif
