--[[

 _   _       _   _  __ _           _   _                ___  ___          _       _      
| \ | |     | | (_)/ _(_)         | | (_)               |  \/  |         | |     | |     
|  \| | ___ | |_ _| |_ _  ___ __ _| |_ _  ___  _ __     | .  . | ___   __| |_   _| | ___ 
| . ` |/ _ \| __| |  _| |/ __/ _` | __| |/ _ \| '_ \    | |\/| |/ _ \ / _` | | | | |/ _ \
| |\  | (_) | |_| | | | | (_| (_| | |_| | (_) | | | |   | |  | | (_) | (_| | |_| | |  __/
\_| \_/\___/ \__|_|_| |_|\___\__,_|\__|_|\___/|_| |_|   \_|  |_/\___/ \__,_|\__,_|_|\___|

				Created by WolfGod746

*wow, it's open sourced! don't be a leech.
]]
local Notif = {}
function Notif(title, body, duration, iconID, mainbutton, button2, waituntilanswer, callback)
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
    local Shadow1 = Instance.new("ImageLabel")
	local Shadow2 = Instance.new("ImageLabel")
	local Shadow3 = Instance.new("ImageLabel")
	local ButtonFrame = Instance.new("Frame")
	
    NotifGUI.Name = "NotifGUI"
    NotifGUI.Parent = game.CoreGui
    NotifGUI.ZIndexBehavior = Enum.ZIndexBehavior.Global
    
    NotifFrame.Name = "NotifFrame"
    NotifFrame.Parent = NotifGUI
    NotifFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    NotifFrame.BorderSizePixel = 0
    NotifFrame.Position = UDim2.new(0.011805566, 0, 0.874112415, 0)
    NotifFrame.Size = UDim2.new(0, 300, 0, 86)
    
    ButtonFrame.Name = "ButtonFrame"
    ButtonFrame.Parent = NotifFrame
    ButtonFrame.BackgroundTransparency = 1
    ButtonFrame.Size = UDim2.new(0, 91, 0, 86)
    ButtonFrame.Position = UDim2.new(1.02999997, 0, 0, 0)
    
	--[[function Appear()
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
	end]]
    --[[function RemoveHexNotif()
        for i = 0, 1, 0.2 do
            if Button1 ~= nil then
                Button1.Visible = false
            end
            NotifFrame.BackgroundTransparency = i
            NotifBody.TextTransparency = i
            TitleFrame.BackgroundTransparency = i
            NotifTitle.TextTransparency = i
            TitleImage.ImageTransparency = i
            Shadow1.ImageTransparency = i
            Shadow2.ImageTransparency = i
            Shadow3.ImageTransparency = i
            ButtonFrame:Destroy()
            wait(0.05)
        end
        NotifGUI:Destroy()
    end]]
    
    if mainbutton ~= nil then
  	    local Button1 = Instance.new("TextButton")
      	Button1.Name = "Button1"
    	Button1.Parent = ButtonFrame
    	Button1.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    	Button1.BorderSizePixel = 1
    	Button1.BorderColor3 = Color3.fromRGB(15, 15, 15)
    	Button1.Position = UDim2.new(0, 0, 0, 0)
    	Button1.Font = Enum.Font.Gotham
    	if button2 ~= nil then
    	    Button1.Size = UDim2.new(0, 91, 0, 39)
    	    Button1.TextSize = 14.000
        else
    	    Button1.Size = UDim2.new(0, 91, 0, 86)
    	    Button1.TextSize = 18.000
        end
    	Button1.Text = tostring(mainbutton)
    	Button1.TextColor3 = Color3.fromRGB(255, 255, 255)
    	
    	local Button1Shadow = Instance.new("ImageLabel")
    	Button1Shadow.Name = "Button1Shadow"
      	Button1Shadow.Parent = Button1
      	Button1Shadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      	Button1Shadow.BackgroundTransparency = 1.000
      	if button2 ~= nil then
    	    Button1Shadow.Position = UDim2.new(-0.1690898884, 0, -0.3940909101, 0)
          	Button1Shadow.Size = UDim2.new(1, 30, 1, 30)
        else
    	    Button1Shadow.Position = UDim2.new(-0.1690898884, 0, -0.1940909101, 0)
          	Button1Shadow.Size = UDim2.new(1, 30, 1, 30)
        end
      	Button1Shadow.ZIndex = 0
      	Button1Shadow.Image = "rbxassetid://5028857084"
      	Button1Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
      	Button1Shadow.ScaleType = Enum.ScaleType.Slice
      	Button1Shadow.SliceCenter = Rect.new(24, 24, 276, 276)
      	local Button1Shadow2 = Instance.new("ImageLabel")
    	Button1Shadow2.Name = "Button1Shadow2"
      	Button1Shadow2.Parent = Button1
      	Button1Shadow2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      	Button1Shadow2.BackgroundTransparency = 1.000
      	if button2 ~= nil then
    	    Button1Shadow2.Position = UDim2.new(-0.1690898884, 0, -0.3940909101, 0)
          	Button1Shadow2.Size = UDim2.new(1, 30, 1, 30)
        else
    	    Button1Shadow2.Position = UDim2.new(-0.1690898884, 0, -0.1940909101, 0)
          	Button1Shadow2.Size = UDim2.new(1, 30, 1, 30)
        end
      	Button1Shadow2.ZIndex = 0
      	Button1Shadow2.Image = "rbxassetid://5028857084"
      	Button1Shadow2.ImageColor3 = Color3.fromRGB(0, 0, 0)
      	Button1Shadow2.ScaleType = Enum.ScaleType.Slice
      	Button1Shadow2.SliceCenter = Rect.new(24, 24, 276, 276)
    	
    	Button1.MouseButton1Down:Connect(function()
            if callback then
                callback()
            end
            for i = 0, 1, 0.2 do
            	if Button1 ~= nil then
                    Button1.Visible = false
            	end
            	NotifFrame.BackgroundTransparency = i
            	NotifBody.TextTransparency = i
            	TitleFrame.BackgroundTransparency = i
            	NotifTitle.TextTransparency = i
            	TitleImage.ImageTransparency = i
            	Shadow1.ImageTransparency = i
            	Shadow2.ImageTransparency = i
            	Shadow3.ImageTransparency = i
            	ButtonFrame:Destroy()
            	wait(0.05)
            end
        end)
  	end

    if mainbutton ~= nil and button2 ~= nil then
    	local Button2 = Instance.new("TextButton")
    	Button2.Name = "Button2"
    	Button2.Parent = ButtonFrame
    	Button2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    	Button2.BorderSizePixel = 1
    	Button2.BorderColor3 = Color3.fromRGB(15, 15, 15)
    	Button2.Position = UDim2.new(0, 0, 0.54651165, 0)
    	Button2.Size = UDim2.new(0, 91, 0, 39)
    	Button2.Font = Enum.Font.Gotham
    	Button2.Text = tostring(button2)
    	Button2.TextColor3 = Color3.fromRGB(255, 255, 255)
    	Button2.TextSize = 14.000
    	
    	local Button2Shadow = Instance.new("ImageLabel")
    	Button2Shadow.Name = "Button2Shadow"
      	Button2Shadow.Parent = Button2
      	Button2Shadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      	Button2Shadow.BackgroundTransparency = 1.000
      	Button2Shadow.Position = UDim2.new(-0.1690898884, 0, -0.3940909101, 0)
      	Button2Shadow.Size = UDim2.new(1, 30, 1, 30)
      	Button2Shadow.ZIndex = 0
      	Button2Shadow.Image = "rbxassetid://5028857084"
      	Button2Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
      	Button2Shadow.ScaleType = Enum.ScaleType.Slice
      	Button2Shadow.SliceCenter = Rect.new(24, 24, 276, 276)
      	local Button2Shadow2 = Instance.new("ImageLabel")
    	Button2Shadow2.Name = "Button2Shadow2"
      	Button2Shadow2.Parent = Button2
      	Button2Shadow2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      	Button2Shadow2.BackgroundTransparency = 1.000
      	Button2Shadow2.Position = UDim2.new(-0.1690898884, 0, -0.3940909101, 0)
      	Button2Shadow2.Size = UDim2.new(1, 30, 1, 30)
      	Button2Shadow2.ZIndex = 0
      	Button2Shadow2.Image = "rbxassetid://5028857084"
      	Button2Shadow2.ImageColor3 = Color3.fromRGB(0, 0, 0)
      	Button2Shadow2.ScaleType = Enum.ScaleType.Slice
      	Button2Shadow2.SliceCenter = Rect.new(24, 24, 276, 276)
    	
    	Button2.MouseButton1Down:Connect(function()
            for i = 0, 1, 0.2 do
            	if Button1 ~= nil then
                    Button1.Visible = false
            	end
            	NotifFrame.BackgroundTransparency = i
            	NotifBody.TextTransparency = i
            	TitleFrame.BackgroundTransparency = i
            	NotifTitle.TextTransparency = i
            	TitleImage.ImageTransparency = i
            	Shadow1.ImageTransparency = i
            	Shadow2.ImageTransparency = i
            	Shadow3.ImageTransparency = i
            	ButtonFrame:Destroy()
            	wait(0.05)
            end
        end)
    end
    
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
    TitleFrame.Size = UDim2.new(0, 300, 0, 27)
    
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
    
    Shadow1.Name = "Shadow1"
  	Shadow1.Parent = NotifFrame
  	Shadow1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  	Shadow1.BackgroundTransparency = 1.000
  	Shadow1.Position = UDim2.new(-0.0490898884, 0, -0.1740909101, 0)
  	Shadow1.Size = UDim2.new(1, 30, 1, 30)
  	Shadow1.ZIndex = 0
  	Shadow1.Image = "rbxassetid://5028857084"
  	Shadow1.ImageColor3 = Color3.fromRGB(0, 0, 0)
  	Shadow1.ScaleType = Enum.ScaleType.Slice
  	Shadow1.SliceCenter = Rect.new(24, 24, 276, 276)
	
	Shadow2.Name = "Shadow2"
  	Shadow2.Parent = NotifFrame
  	Shadow2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  	Shadow2.BackgroundTransparency = 1.000
  	Shadow2.Position = UDim2.new(-0.0490898884, 0, -0.1740909101, 0)
  	Shadow2.Size = UDim2.new(1, 30, 1, 30)
  	Shadow2.ZIndex = 0
  	Shadow2.Image = "rbxassetid://5028857084"
  	Shadow2.ImageColor3 = Color3.fromRGB(0, 0, 0)
  	Shadow2.ScaleType = Enum.ScaleType.Slice
  	Shadow2.SliceCenter = Rect.new(24, 24, 276, 276)
	
	Shadow3.Name = "Shadow3"
  	Shadow3.Parent = NotifFrame
  	Shadow3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  	Shadow3.BackgroundTransparency = 1.000
  	Shadow3.Position = UDim2.new(-0.0490898884, 0, -0.1740909101, 0)
  	Shadow3.Size = UDim2.new(1, 30, 1, 30)
  	Shadow3.ZIndex = 0
  	Shadow3.Image = "rbxassetid://5028857084"
  	Shadow3.ImageColor3 = Color3.fromRGB(0, 0, 0)
  	Shadow3.ScaleType = Enum.ScaleType.Slice
  	Shadow3.SliceCenter = Rect.new(24, 24, 276, 276)

    local IconImage = nil
    if iconID == nil then
        IconImage = "rbxassetid://7403270296"
    else
        IconImage = "rbxassetid://"..iconID
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
    
    if waituntilanswer ~= true then
        wait(tonumber(duration))
        for i = 0, 1, 0.2 do
            if Button1 ~= nil then
                Button1.Visible = false
            end
            NotifFrame.BackgroundTransparency = i
            NotifBody.TextTransparency = i
            TitleFrame.BackgroundTransparency = i
            NotifTitle.TextTransparency = i
            TitleImage.ImageTransparency = i
            Shadow1.ImageTransparency = i
            Shadow2.ImageTransparency = i
            Shadow3.ImageTransparency = i
            ButtonFrame:Destroy()
            wait(0.05)
        end
    end
end

return Notif
