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
	
	Main.MainUI = HexUI:Create("ScreenGui", {
    	Name = Options.projName,
    	--Parent = game.CoreGui,
    	ZIndexBehavior = Enum.ZIndexBehavior.Global,
    	ResetOnSpawn = false,
	})
	Main.Motherframe = HexUI:Create("Frame", {
    	Name = "Motherframe",
        --Parent = MainUI,
        BackgroundColor3 = Color3.fromRGB(15, 15, 15),
        Position = UDim2.new(0, 332, 0, 121),
        Size = UDim2.new(0, 493, 0, 450),
    })
    Main.Shadow = HexUI:Create("ImageLabel", {
        Name = "Shadow",
    	--Parent = Motherframe,
    	BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    	BackgroundTransparency = 1.000,
    	Position = UDim2.new(-0.0547667332, 0, -0.0541666672, 0),
    	Size = UDim2.new(0, 546, 0, 498),
    	ZIndex = -10,
    	Image = "rbxassetid://7666162633",
    	ImageColor3 = Color3.fromRGB(0, 0, 0),
	})
	Main.UICorner = HexUI:Create("UICorner", {
	    --Parent = Motherframe,
	})
	Main.Title = HexUI:Create("TextLabel", {
    	Name = "Title",
    	--Parent = Motherframe,
    	BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    	BackgroundTransparency = 1.000,
    	Position = UDim2.new(0.0243407711, 0, 0.0133333337, 0),
    	Size = UDim2.new(0, 468, 0, 36),
    	Font = Enum.Font.Gotham,
    	Text = Options.UIName,
    	TextColor3 = Color3.fromRGB(255, 255, 255),
    	TextSize = 30.000,
    	TextWrapped = true,
    	TextXAlignment = Enum.TextXAlignment.Left,
    })
	Main.TitleLine = HexUI:Create("Frame", {
    	Name = "TitleLine",
    	--Parent = Motherframe,
    	BackgroundColor3 = Color3.fromRGB(0, 75, 255),
    	BorderSizePixel = 0,
    	Position = UDim2.new(0, 0, 0.106666669, 0),
    	Size = UDim2.new(0, 493, 0, 2),
	})
	Main.SidebarLine = HexUI:Create("Frame", {
    	Name = "SidebarLine",
    	--Parent = Motherframe,
    	BackgroundColor3 = Color3.fromRGB(0, 75, 255),
    	BorderSizePixel = 0,
    	Position = UDim2.new(0.239350915, 0, 0.111111112, 0),
    	Size = UDim2.new(0, 2, 0, 400),
    })
    Main.Sidebar = HexUI:Create("Frame", {
        Name = "Sidebar",
        --Parent = Motherframe,
    	BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    	BackgroundTransparency = 1.000,
    	Position = UDim2.new(0.0121703856, 0, 0.126666665, 0),
    	Size = UDim2.new(0, 105, 0, 386),
    })
    Main.UIListLayout = HexUI:Create("UIListLayout", {
        --Parent = Sidebar,
    	HorizontalAlignment = Enum.HorizontalAlignment.Center,
    	SortOrder = Enum.SortOrder.LayoutOrder,
    	Padding = UDim.new(0, 5),
    })
	Main.Interactables = HexUI:Create("Frame", {
    	Name = "Interactables",
    	--Parent = Motherframe,
    	BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    	BackgroundTransparency = 1.000,
    	Position = UDim2.new(0.243000001, 0, 0.111000001, 0),
    	Size = UDim2.new(0, 367, 0, 393),
	})
	
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

	function HexUI:CreateCategory(Name)
        if Name == nil then
            warn("Category name not specified.")
            return
        end
        
        local Category = {}
        
        Category.NewCategory = HexUI:Create("TextButton", {
            Name = Name,
        	--Parent = Sidebar,
        	BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        	BackgroundTransparency = 1.000,
        	Position = UDim2.new(0.0571428575, 0, 0, 0),
        	Size = UDim2.new(0, 99, 0, 25),
        	Font = Enum.Font.Gotham,
        	Text = Name,
        	TextColor3 = Color3.fromRGB(255, 255, 255),
        	TextSize = 19.000,
        	TextWrapped = true,
        	TextXAlignment = Enum.TextXAlignment.Left,
    	})
    	Category.Container = HexUI:Create("ScrollingFrame", {
    	    Name = Name,
    	    Active = true,
    	    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    	    BackgroundTransparency = 1.000,
    	    BorderSizePixel = 0,
    	    Size = UDim2.new(1, 0, 1, 0),
    	    CanvasSize = UDim2.new(0, 0, 0, 393),
    	    ScrollBarThickness = 6,
    	})
    	
    	function Category:CreateSection(Name)
    	    
            local Section = {}
            
            Section.Section = HexUI:Create("Frame", {
                Name = Name,
    			BackgroundColor3 = Color3.fromRGB(15, 15, 15),
    			BorderColor3 = Color3.fromRGB(0, 75, 255),
    			BorderSizePixel = 0,
    			Position = UDim2.new(0.019073572, 0, 0.00670059305, 0),
    			Size = UDim2.new(0, 347, 0, 296),
    		})
            Section.SectionTitle = HexUI:Create("TextLabel", {
                Name = Name,
    			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    			BackgroundTransparency = 1.000,
    			Size = UDim2.new(0, 345, 0, 31),
    			Font = Enum.Font.Gotham,
    			Text = Name,
    			TextColor3 = Color3.fromRGB(255, 255, 255),
    			TextSize = 24.000,
    		})
    		
    		Section.Section.Parent = Category.Container
    		Section.SectionTitle.Parent = Section.Section
    		return Section
        end
    	
    	Category.NewCategory.Parent = Main.Sidebar
    	Category.Container.Parent = Main.Interactables
    	firstCategory = false
    	return Category
	end
    Main.MainUI.Parent = game:GetService("CoreGui")
	Main.Motherframe.Parent = Main.MainUI
	Main.Shadow.Parent = Main.Motherframe
	Main.UICorner.Parent = Main.Motherframe
	Main.Title.Parent = Main.Motherframe
	Main.TitleLine.Parent = Main.Motherframe
	Main.Sidebar.Parent = Main.Motherframe
	Main.SidebarLine.Parent = Main.Motherframe
	Main.Interactables.Parent = Main.Motherframe
	return Main
end

return HexUI
