local XboxNotification = {}

function XboxNotification(Title, Description, Icon, Switch, SwitchText)
    local XboxNotif = Instance.new("ScreenGui")
    local Main = Instance.new("Frame")
    local IconE = Instance.new("ImageLabel")
    local UICorner = Instance.new("UICorner")
    local UICorner_2 = Instance.new("UICorner")
    local TitleFrame = Instance.new("Frame")
    local UICorner_3 = Instance.new("UICorner")
    local TitleE = Instance.new("TextLabel")
    local DescriptionE = Instance.new("TextLabel")
    local Sound = Instance.new("Sound")
    
    local OriginalName = game:GetService("HttpService"):GenerateGUID(false)
    XboxNotif.Name = "|.NOTIF|_"..string.gsub(OriginalName, "-", "").."?!"
    XboxNotif.Parent = game.CoreGui
    XboxNotif.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    Main.Name = "Main"
    Main.Parent = XboxNotif
    Main.BackgroundColor3 = Color3.fromRGB(0, 40, 120)
    Main.BorderSizePixel = 0
    Main.Position = UDim2.new(0.4, 0, 0.9, 0)
    Main.Size = UDim2.new(0, 368, 0, 0)
    
    IconE.Name = "Icon"
    IconE.Parent = Main
    IconE.BackgroundColor3 = Color3.fromRGB(0, 70, 210)
    IconE.Position = UDim2.new(0.021739129, 0, 0.0884955823, 0)
    IconE.Size = UDim2.new(0.157000005, 0, 0.513199985, 0)
    if Icon == nil or Icon == false then
        IconE.Image = "rbxassetid://7826686602"
    else
        IconE.Image = tostring(Icon)
    end
    
    UICorner.Parent = IconE
    
    UICorner_2.Parent = Main
    
    TitleFrame.Name = "TitleFrame"
    TitleFrame.Parent = Main
    TitleFrame.BackgroundColor3 = Color3.fromRGB(0, 70, 210)
    TitleFrame.Position = UDim2.new(0, 0, 0.690265477, 0)
    TitleFrame.Size = UDim2.new(0, 368, 0.309734523, 0)
    
    UICorner_3.Parent = TitleFrame
    
    TitleE.Name = "Title"
    TitleE.Parent = TitleFrame
    TitleE.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TitleE.BackgroundTransparency = 1.000
    TitleE.Position = UDim2.new(0.0380434766, 0, 0, 0)
    TitleE.Size = UDim2.new(0, 344, 1, 0)
    TitleE.Font = Enum.Font.Gotham
    if Title == nil or Title == false then
        TitleE.Text = "Lorem Ipsum"
    else
        TitleE.Text = tostring(Title)
    end
    TitleE.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleE.TextSize = 18.000
    TitleE.TextTransparency = 1.000
    TitleE.TextXAlignment = Enum.TextXAlignment.Left
    
    DescriptionE.Name = "Description"
    DescriptionE.Parent = Main
    DescriptionE.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    DescriptionE.BackgroundTransparency = 1.000
    DescriptionE.Position = UDim2.new(0.220108703, 0, 0.162579298, 0)
    DescriptionE.Size = UDim2.new(0, 277, 0, 42)
    DescriptionE.Font = Enum.Font.Gotham
    if Description == nil or Description == false then
        DescriptionE.Text = "Lorem Ipsum"
    else
        DescriptionE.Text = tostring(Description)
    end
    DescriptionE.TextColor3 = Color3.fromRGB(255, 255, 255)
    DescriptionE.TextSize = 18.000
    DescriptionE.TextTransparency = 1.000
    DescriptionE.TextXAlignment = Enum.TextXAlignment.Left
    
    if Switch then
        local DescriptionS = Instance.new("TextLabel")
        DescriptionS.Name = "DescriptionS"
        DescriptionS.Parent = Main
        DescriptionS.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        DescriptionS.BackgroundTransparency = 1.000
        DescriptionS.Position = UDim2.new(0.220108703, 0, 0.162579298, 0)
        DescriptionS.Size = UDim2.new(0, 277, 0, 42)
        DescriptionS.Font = Enum.Font.Gotham
        if SwitchText == nil or SwitchText == false then
            DescriptionS.Text = "Lorem Ipsum"
        else
            DescriptionS.Text = tostring(SwitchText)
        end
        DescriptionS.TextColor3 = Color3.fromRGB(255, 255, 255)
        DescriptionS.TextSize = 18.000
        DescriptionS.TextTransparency = 1.000
        DescriptionS.TextXAlignment = Enum.TextXAlignment.Left
    end
    
    Sound.Parent = Main
    Sound.Name = "Sound"
    Sound.SoundId = "rbxassetid://261094177"
    
    local Tween1 = game:GetService("TweenService"):Create(Main, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {Size = UDim2.new(0, 368, 0, 113)})
    local Tween2 = game:GetService("TweenService"):Create(Main, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {Position = UDim2.new(0.4, 0, 0.75, 0)})
    Sound:Play()
    Tween1:Play()
    Tween2:Play()
    TitleE.TextTransparency = 0
    DescriptionE.TextTransparency = 0
    if Switch then
        wait(2.5)
        for i = 0, 1, 0.2 do
            DescriptionE.TextTransparency = i
            wait(0.01)
        end
        for i = 1, 0, -0.2 do
            Main.DescriptionS.TextTransparency = i
            wait(0.01)
        end
        wait(2.5)
        for i = 0, 1, 0.1 do
            TitleE.TextTransparency = i
            Main.DescriptionS.TextTransparency = i
            IconE.ImageTransparency = i
            Main.BackgroundTransparency = i
            TitleFrame.BackgroundTransparency = i
            IconE.BackgroundTransparency = i
            wait(0.01)
        end
        XboxNotif:Destroy()
    else
        wait(3)
        for i = 0, 1, 0.1 do
            TitleE.TextTransparency = i
            DescriptionE.TextTransparency = i
            IconE.ImageTransparency = i
            Main.BackgroundTransparency = i
            TitleFrame.BackgroundTransparency = i
            IconE.BackgroundTransparency = i
            wait(0.01)
        end
        XboxNotif:Destroy()
    end
end

return XboxNotification
