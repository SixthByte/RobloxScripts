local HexUI = {}

function HexUI:Create(what, propri)
    local instance = Instance.new(what)
    for i, v in next, propri do
		if instance[i] and propri ~= "Parent" then
			instance[i] = v
		end
    end
    return instance
end

local mouse = game.Players.LocalPlayer:GetMouse()
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")
local RS = game:GetService("RunService")

function HexUI:CreateMain(Options)
    if Options.projName == nil then
        warn("projName not specified.")
        return
    end
    if Options.UIName == nil then
        warn("UIName not specified.")
        return
    end
    local nameforcheck = Options.projName
	local Main = {}
	local firstCategory = true
	
	Main.MainUI = Instance.new("ScreenGui")
    Main.MainUI.Name = Options.projName
	Main.MainUI.Parent = game.CoreGui
	Main.MainUI.ZIndexBehavior = Enum.ZIndexBehavior.Global
	
	Main.Motherframe = Instance.new("Frame")
    Main.Motherframe.Name = "Motherframe"
	Main.Motherframe.Parent = Main.MainUI
	Main.Motherframe.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	Main.Motherframe.Position = UDim2.new(0.0767304301, 0, 0.201271191, 0)
	Main.Motherframe.Size = UDim2.new(0, 493, 0, 450)
	
    Main.Shadow = Instance.new("ImageLabel")
    Main.Shadow.Name = "Shadow"
	Main.Shadow.Parent = Main.Motherframe
	Main.Shadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Main.Shadow.BackgroundTransparency = 1.000
	Main.Shadow.Position = UDim2.new(-0.0547667332, 0, -0.0541666672, 0)
	Main.Shadow.Size = UDim2.new(0, 546, 0, 498)
	Main.Shadow.ZIndex = -10
	Main.Shadow.Image = "rbxassetid://7666162633"
	Main.Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
	
	Main.UICorner = Instance.new("UICorner")
	Main.UICorner.Parent = Main.Motherframe
	
	Main.Title = Instance.new("TextLabel")
    Main.Title.Name = Options.UIName
	Main.Title.Parent = Main.Motherframe
	Main.Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Main.Title.BackgroundTransparency = 1.000
	Main.Title.Position = UDim2.new(0.0243407711, 0, 0.0133333337, 0)
	Main.Title.Size = UDim2.new(0, 468, 0, 36)
	Main.Title.Font = Enum.Font.Gotham
	Main.Title.Text = Options.UIName
	Main.Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Main.Title.TextSize = 30.000
	Main.Title.TextWrapped = true
	Main.Title.TextXAlignment = Enum.TextXAlignment.Left

	Main.TitleLine = Instance.new("Frame")
    Main.TitleLine.Name = "TitleLine"
	Main.TitleLine.Parent = Main.Motherframe
	Main.TitleLine.BackgroundColor3 = Color3.fromRGB(0, 75, 255)
	Main.TitleLine.BorderSizePixel = 0
	Main.TitleLine.Position = UDim2.new(0, 0, 0.106666669, 0)
	Main.TitleLine.Size = UDim2.new(0, 493, 0, 2)
	
	Main.SidebarLine = Instance.new("Frame")
    Main.SidebarLine.Name = "SidebarLine"
	Main.SidebarLine.Parent = Main.Motherframe
	Main.SidebarLine.BackgroundColor3 = Color3.fromRGB(0, 75, 255)
	Main.SidebarLine.BorderSizePixel = 0
	Main.SidebarLine.Position = UDim2.new(0.239350915, 0, 0.111111112, 0)
	Main.SidebarLine.Size = UDim2.new(0, 2, 0, 400)

    Main.Sidebar = Instance.new("Frame")
    Main.Sidebar.Name = "Sidebar"
	Main.Sidebar.Parent = Main.Motherframe
	Main.Sidebar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Main.Sidebar.BackgroundTransparency = 1.000
	Main.Sidebar.Position = UDim2.new(0.0121703856, 0, 0.126666665, 0)
	Main.Sidebar.Size = UDim2.new(0, 105, 0, 386)

    Main.UIListLayout = Instance.new("UIListLayout")
    Main.UIListLayout.Parent = Main.Sidebar
	Main.UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	Main.UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	Main.UIListLayout.Padding = UDim.new(0, 5)

	Main.Interactables = Instance.new("Frame")
    Main.Interactables.Name = "Interactables"
	Main.Interactables.Parent = Main.Motherframe
	Main.Interactables.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Main.Interactables.BackgroundTransparency = 1.000
	Main.Interactables.Position = UDim2.new(0.243000001, 0, 0.111000001, 0)
	Main.Interactables.Size = UDim2.new(0, 367, 0, 393)
	
	local dragInput
	local dragStart
	local startPos
	local function update(input)
		local delta = input.Position - dragStart
		Main.Motherframe:TweenPosition(UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y), 'Out', 'Linear', 0.01, true)
	end
	Main.Motherframe.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			dragStart = input.Position
			startPos = Main.Motherframe.Position
			repeat
				wait()
			until input.UserInputState == Enum.UserInputState.End
			dragging = false
		end
	end)
	Main.Motherframe.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement then
			dragInput = input
		end
	end)
	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)

	function Main:CreateCategory(Name)
        if Name == nil then
            warn("Category name not specified.")
            return
        end
        
        local Category = {}
        
        Category.NewCategory = Instance.new("TextButton")
        Category.NewCategory.Name = Name
    	Category.NewCategory.Parent = Main.Sidebar
    	Category.NewCategory.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    	Category.NewCategory.BackgroundTransparency = 1.000
    	Category.NewCategory.Position = UDim2.new(0.0571428575, 0, 0, 0)
    	Category.NewCategory.Size = UDim2.new(0, 99, 0, 25)
    	Category.NewCategory.Font = Enum.Font.Gotham
    	Category.NewCategory.Text = Name
    	Category.NewCategory.TextColor3 = Color3.fromRGB(255, 255, 255)
    	Category.NewCategory.TextSize = 19.000
    	Category.NewCategory.TextWrapped = true
    	Category.NewCategory.TextXAlignment = Enum.TextXAlignment.Left
    	
    	Category.Container = Instance.new("ScrollingFrame")
    	Category.Container.Name = Name
    	Category.Container.Parent = Main.Interactables
    	Category.Container.Active = true
    	Category.Container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    	Category.Container.BackgroundTransparency = 1.000
    	Category.Container.BorderSizePixel = 0
    	Category.Container.Size = UDim2.new(1, 0, 1, 0)
    	Category.Container.CanvasSize = UDim2.new(0, 0, 0, 393)
    	Category.Container.ScrollBarThickness = 6
    	
    	function Category:CreateSection(Name)
    	    
    	    local Section = {}
    	    
    	    Section.Section = Instance.new("Frame")
    	    Section.Section.Name = Name
        	Section.Section.Parent = Category
        	Section.Section.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
        	Section.Section.BorderColor3 = Color3.fromRGB(0, 75, 255)
        	Section.Section.BorderSizePixel = 0
        	Section.Section.Position = UDim2.new(0.019073572, 0, 0.00670059305, 0)
        	Section.Section.Size = UDim2.new(0, 347, 0, 296)
    	    
	        Section.SectionTitle = Instance.new("TextLabel")
    	    Section.SectionTitle.Name = Name
        	Section.SectionTitle.Parent = Section.Section
        	Section.SectionTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        	Section.SectionTitle.BackgroundTransparency = 1.000
        	Section.SectionTitle.Size = UDim2.new(0, 345, 0, 31)
        	Section.SectionTitle.Font = Enum.Font.Gotham
        	Section.SectionTitle.Text = Name
        	Section.SectionTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
        	Section.SectionTitle.TextSize = 24.000
        end
	end
end

return HexUI