local Notif = {}
function Notif(title, body, duration, iconID)
    for _,r in pairs(game.CoreGui:GetChildren()) do
        if r.Name == "NotifGUI" then
            r.NotifFrame.Position = UDim2.new(0, r.NotifFrame.AbsolutePosition.X, 0, r.NotifFrame.AbsolutePosition.Y - 100)
        end
    end
    local NotifGUI = Instance.new("ScreenGui")
    local NotifFrame = Instance.new("Frame")
    local NotifBody = Instance.new("TextLabel")
    local TitleFrame = Instance.new("Frame")
    local NotifTitle = Instance.new("TextLabel")
    local TitleImage = Instance.new("ImageLabel")
    
    NotifGUI.Name = "NotifGUI"
    NotifGUI.Parent = game.CoreGui
    NotifGUI.ZIndexBehavior = Enum.ZIndexBehavior.Global
    
    NotifFrame.Name = "NotifFrame"
    NotifFrame.Parent = NotifGUI
    NotifFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    NotifFrame.BorderSizePixel = 0
    NotifFrame.Position = UDim2.new(0.011805566, 0, 0.874112415, 0)
    NotifFrame.Size = UDim2.new(0, 0, 0, 86) -- (0, 300, 0, 86)
    
    NotifBody.Name = "NotifBody"
    NotifBody.Parent = NotifFrame
    NotifBody.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    NotifBody.BackgroundTransparency = 1.000
    NotifBody.BorderSizePixel = 0
    NotifBody.Position = UDim2.new(0.0233333334, 0, 0.383720934, 0)
    NotifBody.Size = UDim2.new(0, 287, 0, 57)
    NotifBody.SizeConstraint = Enum.SizeConstraint.RelativeYY
    NotifBody.Font = Enum.Font.Gotham
    NotifBody.Text = tostring(body)
    NotifBody.TextColor3 = Color3.fromRGB(255, 255, 255)
    NotifBody.TextSize = 16.000
    NotifBody.TextWrapped = true
    NotifBody.TextXAlignment = Enum.TextXAlignment.Left
    NotifBody.TextYAlignment = Enum.TextYAlignment.Top
    NotifBody.TextTransparency = 1
    
    TitleFrame.Name = "TitleFrame"
    TitleFrame.Parent = NotifFrame
    TitleFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    TitleFrame.BorderSizePixel = 0
    TitleFrame.Size = UDim2.new(0, 0, 0, 27) -- (0, 300, 0, 27)
    
    NotifTitle.Name = "NotifTitle"
    NotifTitle.Parent = TitleFrame
    NotifTitle.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    NotifTitle.BackgroundTransparency = 1.000
    NotifTitle.BorderSizePixel = 0
    NotifTitle.Position = UDim2.new(0.0233333334, 0, 0, 0)
    NotifTitle.Size = UDim2.new(0, 287, 0, 27)
    NotifTitle.SizeConstraint = Enum.SizeConstraint.RelativeYY
    NotifTitle.Font = Enum.Font.GothamSemibold
    NotifTitle.Text = tostring(title)
    NotifTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    NotifTitle.TextSize = 20.000
    NotifTitle.TextXAlignment = Enum.TextXAlignment.Left
    NotifTitle.TextTransparency = 1
    
    TitleImage.Name = "TitleImage"
    TitleImage.Parent = TitleFrame
    TitleImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TitleImage.BackgroundTransparency = 1.000
    TitleImage.Position = UDim2.new(0.910000026, 0, 0, 0)
    TitleImage.Size = UDim2.new(0, 27, 0, 27)
    local IconImage = nil
    if iconID == nil then
        IconImage = "rbxassetid://7403270296"
    else
        IconImage = iconID
    end
    TitleImage.Image = IconImage
    TitleImage.ImageTransparency = 1
    
    for i = 1, 0, -0.2 do
        NotifFrame.BackgroundTransparency = i
        NotifBody.TextTransparency = i
        TitleFrame.BackgroundTransparency = i
        NotifTitle.TextTransparency = i
        TitleImage.ImageTransparency = i
        Shadow1.ImageTransparency = i
        Shadow2.ImageTransparency = i
        Shadow3.ImageTransparency = i
        wait(0.01)
    end
    
    wait(tonumber(duration))
    
    for i = 0, 1, 0.2 do
        NotifFrame.BackgroundTransparency = i
        NotifBody.TextTransparency = i
        TitleFrame.BackgroundTransparency = i
        NotifTitle.TextTransparency = i
        TitleImage.ImageTransparency = i
        Shadow1.ImageTransparency = i
        Shadow2.ImageTransparency = i
        Shadow3.ImageTransparency = i
        wait(0.01)
    end
    
    NotifGUI:Destroy()
end

return Notif
