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
	local IsOpen = true
	local OldPos
	
	Main.MainUI = HexUI:Create("ScreenGui", {
    	Name = Options.projName,
    	ZIndexBehavior = Enum.ZIndexBehavior.Global,
    	ResetOnSpawn = false,
	})
	Main.Motherframe = HexUI:Create("Frame", {
    	Name = "Motherframe",
        BackgroundColor3 = Color3.fromRGB(15, 15, 15),
        Position = UDim2.new(0, 332, 0, 121),
        Size = UDim2.new(0, 493, 0, 450),
    })
    OldPos = Main.Motherframe.Position
    Main.MotherframeE = HexUI:Create("Frame", {
    	Name = "MotherframeE",
        BackgroundColor3 = Color3.fromRGB(15, 15, 15),
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 0, 0, 0),
        Size = UDim2.new(0, 493, 0, 450),
    })
    Main.Shadow = HexUI:Create("ImageLabel", {
        Name = "Shadow",
    	BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    	BackgroundTransparency = 1.000,
    	Position = UDim2.new(-0.0547667332, 0, -0.0541666672, 0),
    	Size = UDim2.new(0, 546, 0, 498),
    	ZIndex = -10,
    	Image = "rbxassetid://7666162633",
    	ImageColor3 = Color3.fromRGB(0, 0, 0),
	})
	Main.UICorner = HexUI:Create("UICorner", {})
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
    	BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    	BorderSizePixel = 0,
    	Position = UDim2.new(0.239350915, 0, 0.111111112, 0),
    	Size = UDim2.new(0, 2, 0, 400),
    })
    Main.SidebarLineGradient = HexUI:Create("UIGradient", {
        Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 75, 255)), ColorSequenceKeypoint.new(0.90, Color3.fromRGB(15, 15, 15)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(15, 15, 15))},
        Rotation = 90,
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
	local dragging
	local function update(input)
		local delta = input.Position - dragStart
		Main.Motherframe:TweenPosition(UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y), 'Out', 'Linear', 0.01, true)
	end
	Main.MotherframeE.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 and IsOpen then
			dragging = true
			dragStart = input.Position
			startPos = Main.Motherframe.Position
			repeat
				wait()
			until input.UserInputState == Enum.UserInputState.End
			dragging = false
			OldPos = Main.Motherframe.Position
		end
	end)
	Main.MotherframeE.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement then
			dragInput = input
		end
	end)
	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if input == dragInput and dragging and IsOpen then
			update(input)
		end
	end)
	
    function Main:ToggleGui()
        if not dragging then
            if IsOpen then
                IsOpen = false
                Main.MotherframeE.Size = UDim2.new(0, 0, 0, 0)
        	    TS:Create(Main.Motherframe, TweenInfo.new(0.35), {
        			Position = UDim2.new(0.35, 0, -0.75, 0)
        		}):Play()
        		wait(0.35)
        		Main.Motherframe.Position = UDim2.new(0.35, 0, -0.75, 0)
            elseif not IsOpen then
                IsOpen = true
    	        TS:Create(Main.Motherframe, TweenInfo.new(0.35), {
        			Position = OldPos
        		}):Play()
        		wait(0.35)
        		Main.MotherframeE.Size = UDim2.new(1, 0, 1, 0)
        		Main.Motherframe.Position = OldPos
        		OldPos = Main.Motherframe.Position
            end
        end
    end

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
        	TextColor3 = Color3.fromRGB(100, 100, 100),
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
    	    CanvasSize = UDim2.new(0, 0, 0, 0),
    	    ScrollBarImageColor3 = Color3.fromRGB(30, 30, 30),
    	    ScrollBarThickness = 6,
    	    Visible = false,
    	})
    	Category.UIListLayout = HexUI:Create("UIListLayout", {
    	    HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 5),
    	})
    	
    	if firstCategory then
    	    Category.NewCategory.TextColor3 = Color3.fromRGB(255, 255, 255)
			Category.Container.Visible = true
    	end
	
	    Category.NewCategory.MouseButton1Click:Connect(function(v)
	        if Category.NewCategory.TextColor3 ~= Color3.fromRGB(100, 100, 100) then
	            return
	        end
	        for i, v in pairs(Main.Interactables:GetChildren()) do
				if v:IsA("ScrollingFrame") then
				    spawn(function()
    				TS:Create(v, TweenInfo.new(0.1), {
    					Position = UDim2.new(1, 0, 0, 0)
    				}):Play()
    				wait(0.1)
    				v.Visible = false
    				end)
				end  
	        end
	        for i, v in pairs(Main.Sidebar:GetChildren()) do 
				if v:IsA("TextButton") then
				    TS:Create(v, TweenInfo.new(0.1), {
                        TextColor3 = Color3.fromRGB(100, 100, 100)
                    }):Play()
                    v.TextColor3 = Color3.fromRGB(100, 100, 100)
					--v.TextColor3 = Color3.fromRGB(100, 100, 100)
				end  
	        end
    		spawn(function()
    		    TS:Create(Category.NewCategory, TweenInfo.new(0.15), {
                    TextColor3 = Color3.fromRGB(255, 255, 255)
                }):Play()
                wait(0.13)
                --Category.NewCategory.TextColor3 = Color3.fromRGB(255, 255, 255)
                Category.Container.Position = UDim2.new(-1, 0, 0, 0)
                TS:Create(Category.Container, TweenInfo.new(0.15), {
    				Position = UDim2.new(0, 0, 0, 0)
    			}):Play()
    			Category.Container.Visible = true
    		end)
	    end)
    	
    	function Category:CreateSection(Name)
    	    
            local Section = {}
            
            Section.Section = HexUI:Create("Frame", {
                Name = Name,
    			BackgroundColor3 = Color3.fromRGB(15, 15, 15),
    			BorderColor3 = Color3.fromRGB(0, 75, 255),
    			BorderSizePixel = 2,
    			Position = UDim2.new(0.019073572, 0, 0.00670059305, 0),
    			Size = UDim2.new(0, 347, 0, 40),
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
    		Section.Line = HexUI:Create("Frame", {
    		    Name = "Line",
            	BackgroundColor3 = Color3.fromRGB(0, 75, 255),
            	BorderSizePixel = 0,
            	Position = UDim2.new(0.0463768132, 0, 1, 0),
            	Size = UDim2.new(0, 312, 0, 2),
            })
            --[[Section.Objects = HexUI:Create("Frame", {
                Name = "Objects",
            	BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            	BackgroundTransparency = 1.000,
            	Size = UDim2.new(1, 0, 1, 0),
            })]]
            Section.UIListLayout = HexUI:Create("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
    			SortOrder = Enum.SortOrder.LayoutOrder,
    			Padding = UDim.new(0, 8),
            })
            Section.UIPadding = HexUI:Create("UIPadding", {
                PaddingTop = UDim.new(0, 50),
            })
        
            function Section:SetText(Text)
                Section.SectionTitle.Text = Text
            end
            
            function Section:Create(Type, Name, Callback, Options)
                local Interactables = {}
                
                if Type:lower() == "button" then
                    Interactables.Button = HexUI:Create("Frame", {
                        Name = "Button",
                    	BackgroundColor3 = Color3.fromRGB(15, 15, 15),
                    	BackgroundTransparency = 1.000,
                    	BorderSizePixel = 0,
                    	Position = UDim2.new(0.0260000005, 0, 0.150000006, 0),
                    	Size = UDim2.new(0, 328, 0, 33),
                    })
                    Interactables.Base = HexUI:Create("ImageButton", {
                        Name = "Base",
                        AnchorPoint = Vector2.new(0.5, 0),
            			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            			BackgroundTransparency = 1.000,
            			Size = UDim2.new(1, 0, 1, 0),
            			Image = "rbxassetid://3570695787",
            			ImageColor3 = Color3.fromRGB(20, 20, 20),
            			Position = UDim2.new(0.5, 0, 0, 0),
            			ScaleType = Enum.ScaleType.Slice,
            			SliceCenter = Rect.new(100, 100, 100, 100),
            			SliceScale = 0.040,
                    })
                    Interactables.ButtonText = HexUI:Create("TextLabel", {
                        Name = "ButtonText",
            			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            			BackgroundTransparency = 1.000,
            			BorderSizePixel = 0,
            			Size = UDim2.new(1, 0, 1, 0),
            			Font = Enum.Font.Gotham,
            			Text = Name,
            			TextColor3 = Color3.fromRGB(255, 255, 255),
            			TextSize = 19.000,
                    })
                    
                    function Interactables:SetButtonText(Text)
						Interactables.ButtonText.Text = Text
                    end
				    
				    Interactables.Base.MouseButton1Click:Connect(function()

						if Options then
							if Options.animated then 
								TS:Create(Interactables.Base, TweenInfo.new(0.06), {
									Size = UDim2.new(0.96, 0, 0.9, 0)
								}):Play()
								wait(.07)
								TS:Create(Interactables.Base, TweenInfo.new(0.06), {
									Size = UDim2.new(1, 0, 1, 0)
								}):Play()			
							end
						end

						if Callback then 
							Callback()
						end

					end)
                    Category.Container.CanvasSize = Category.Container.CanvasSize + UDim2.new(0,0,0,41)
                    
                    Interactables.Button.Parent = Category.Container
                    Interactables.Base.Parent = Interactables.Button
                    Interactables.ButtonText.Parent = Interactables.Base
                    
                elseif Type:lower() == "toggle" then
                    
                    local State = false
                    
                    Interactables.Toggle = HexUI:Create("Frame", {
                        Name = "Toggle",
                    	BackgroundColor3 = Color3.fromRGB(15, 15, 15),
                    	BackgroundTransparency = 1.000,
                    	BorderSizePixel = 0,
                    	Position = UDim2.new(0.0260000005, 0, 0.289999992, 0),
                    	Size = UDim2.new(0, 328, 0, 33),
                    })
                    Interactables.Base = HexUI:Create("ImageLabel", {
                        Name = "Base",
                    	BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    	BackgroundTransparency = 1.000,
                    	BorderSizePixel = 0,
                    	Size = UDim2.new(1, 0, 1, 0),
                    	Image = "rbxassetid://3570695787",
                    	ImageColor3 = Color3.fromRGB(20, 20, 20),
                    	ScaleType = Enum.ScaleType.Slice,
                    	SliceCenter = Rect.new(100, 100, 100, 100),
                    	SliceScale = 0.040,
                    })
                    Interactables.ToggleText = HexUI:Create("TextLabel", {
                        Name = "ToggleText",
                    	BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    	BackgroundTransparency = 1.000,
                    	BorderSizePixel = 0,
                    	Position = UDim2.new(0.024390243, 0, 0, 0),
                    	Size = UDim2.new(0.750000119, 0, 1, 0),
                    	Font = Enum.Font.Gotham,
                    	Text = "Toggle",
                    	TextColor3 = Color3.fromRGB(255, 255, 255),
                        TextSize = 19.000,
                    	TextXAlignment = Enum.TextXAlignment.Left,
                    })
                    Interactables.ToggleOuter = HexUI:Create("ImageButton", {
                        Name = "ToggleOuter",
                    	BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    	BackgroundTransparency = 1.000,
                    	Position = UDim2.new(0.829999983, 0, 0.140000001, 0),
                    	Size = UDim2.new(0, 51, 0.699999988, 0),
                    	Image = "rbxassetid://3570695787",
                    	ImageColor3 = Color3.fromRGB(15, 15, 15),
                    	ScaleType = Enum.ScaleType.Slice,
                    	SliceCenter = Rect.new(100, 100, 100, 100),
                    	SliceScale = 0.040,
                    })
                    Interactables.ToggleInner = HexUI:Create("ImageLabel", {
                        Name = "ToggleInner",
                    	BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    	BackgroundTransparency = 1.000,
                    	Size = UDim2.new(0.5, 0, 1, 0),
                    	Image = "rbxassetid://3570695787",
                    	ScaleType = Enum.ScaleType.Slice,
                    	SliceCenter = Rect.new(100, 100, 100, 100),
                    	SliceScale = 0.040,
                    })
                
                    if Options then 
						if Options.default then 
							State = true 
							TS:Create(Interactables.ToggleInner, TweenInfo.new(0.1), {
								Position = UDim2.new(0.5, 0, 0, 0)
							}):Play()
							if Callback then 
								Callback(State)
							end
						end
                    end
				    
				    Interactables.ToggleOuter.MouseButton1Click:Connect(function()
						State = not State 

						if State then 
							TS:Create(Interactables.ToggleInner, TweenInfo.new(0.1), {
								Position = UDim2.new(0.5, 0, 0, 0)
							}):Play()
						else
							TS:Create(Interactables.ToggleInner, TweenInfo.new(0.1), {
								Position = UDim2.new(0, 0, 0, 0)
							}):Play()
						end

						if Callback then 
							Callback(State)
						end
						
					    function Interactables:ChangeState(pp)
    						if pp then 
    							State = pp
                                TS:Create(Interactables.ToggleInner, TweenInfo.new(0.1), {
                                    Position = UDim2.new(0.5, 0, 0, 0)
                                }):Play()
                                if Callback then 
                                    Callback(State)
                                end
    						else
    							State = pp
                                TS:Create(Interactables.ToggleInner, TweenInfo.new(0.1), {
                                    Position = UDim2.new(0, 0, 0, 0)
                                }):Play()
                                if Callback then 
                                    Callback(State)
                                end
    						end
                        end
					end)
                    Category.Container.CanvasSize = Category.Container.CanvasSize + UDim2.new(0,0,0,41)
                    
                    Interactables.Toggle.Parent = Category.Container
                    Interactables.Base.Parent = Interactables.Toggle
                    Interactables.ToggleText.Parent = Interactables.Base
                    Interactables.ToggleOuter.Parent = Interactables.Base
                    Interactables.ToggleInner.Parent = Interactables.ToggleOuter
                elseif Type:lower() == "textbox" then
                    
                    local Text
                    
                    Interactables.Textbox = HexUI:Create("Frame", {
                        Name = "Textbox",
            			BackgroundColor3 = Color3.fromRGB(15, 15, 15),
            			BackgroundTransparency = 1.000,
            			BorderSizePixel = 0,
            			Position = UDim2.new(0.0260000005, 0, 0.430000007, 0),
            			Size = UDim2.new(0, 328, 0, 33),
                    })
                    Interactables.Base = HexUI:Create("ImageLabel", {
                        Name = "Base",
            			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            			BackgroundTransparency = 1.000,
            			BorderSizePixel = 0,
            			Size = UDim2.new(1, 0, 1, 0),
            			Image = "rbxassetid://3570695787",
            			ImageColor3 = Color3.fromRGB(20, 20, 20),
            			ScaleType = Enum.ScaleType.Slice,
            			SliceCenter = Rect.new(100, 100, 100, 100),
            			SliceScale = 0.040,
                    })
                    Interactables.TextboxText = HexUI:Create("TextLabel", {
                        Name = "TextboxText",
            			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            			BackgroundTransparency = 1.000,
            			BorderSizePixel = 0,
            			Position = UDim2.new(0.024390243, 0, 0, 0),
            			Size = UDim2.new(0.451219648, 0, 1, 0),
            			Font = Enum.Font.Gotham,
            			Text = Name,
            			TextColor3 = Color3.fromRGB(255, 255, 255),
            			TextSize = 19.000,
            			TextXAlignment = Enum.TextXAlignment.Left,
                    })
                    Interactables.Input = HexUI:Create("TextBox", {
                        Name = "Input",
                        AnchorPoint = Vector2.new(1,0),
            			BackgroundColor3 = Color3.fromRGB(15, 15, 15),
            			Position = UDim2.new(0.99, 0, 0.128000259, 0),
            			Size = UDim2.new(0.325731754, 51, 0.75, 0),
            			Font = Enum.Font.Gotham,
            			PlaceholderText = Options.placeholder,
            			Text = "",
            			TextColor3 = Color3.fromRGB(255, 255, 255),
            			TextTruncate = Enum.TextTruncate.AtEnd,
            			TextSize = 15.000,
            			TextXAlignment = Enum.TextXAlignment.Right,
                    })
                    Interactables.UICorner = HexUI:Create("UICorner", {})
                    Interactables.InputButton = HexUI:Create("TextButton", {
                        Name = "InputButton",
                    	BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    	BackgroundTransparency = 1.000,
                    	Position = UDim2.new(0, 0, 0, 0),
                    	Size = UDim2.new(1, 0, 1, 0),
                    	Font = Enum.Font.Gotham,
                    	Text = "",
                    	TextColor3 = Color3.fromRGB(100, 100, 100),
                    	TextSize = 19.000,
                    	TextWrapped = true,
                    	TextXAlignment = Enum.TextXAlignment.Center,
                	})
                	Interactables.UICornerInput = HexUI:Create("UICorner", {})
                    
                    Interactables.InputButton.MouseButton1Click:Connect(function()
                        TS:Create(Interactables.Input, TweenInfo.new(0.2), {
                            Size = UDim2.new(0.325731754, 213, 0.75, 0)
                        }):Play()
                        TS:Create(Interactables.TextboxText, TweenInfo.new(0.1), {
                            TextColor3 = Color3.fromRGB(50, 50, 50)
                        }):Play()
                        Interactables.Input:CaptureFocus()
                    end)
                    
                    Interactables.Input.FocusLost:Connect(function()
                        TS:Create(Interactables.Input, TweenInfo.new(0.2), {
                            Size = UDim2.new(0.325731754, 51, 0.75, 0)
                        }):Play()
                        TS:Create(Interactables.TextboxText, TweenInfo.new(0.1), {
                            TextColor3 = Color3.fromRGB(255, 255, 255)
                        }):Play()
						Text = Interactables.Input.Text
						if Callback then
							Callback(Text)
						end
                    end)
				
				    Category.Container.CanvasSize = Category.Container.CanvasSize + UDim2.new(0,0,0,41)
                    
                    Interactables.Textbox.Parent = Category.Container
                    Interactables.Base.Parent = Interactables.Textbox
                    Interactables.TextboxText.Parent = Interactables.Base
                    Interactables.Input.Parent = Interactables.Base
                    Interactables.UICorner.Parent = Interactables.Input
                    Interactables.InputButton.Parent = Interactables.Input
                    Interactables.UICornerInput.Parent = Interactables.InputButton
                elseif Type:lower() == "textlabel" then
                    Interactables.TextLabel = HexUI:Create("Frame", {
                        Name = "Label",
                    	BackgroundColor3 = Color3.fromRGB(15, 15, 15),
                    	BackgroundTransparency = 1.000,
                    	BorderSizePixel = 0,
                    	Position = UDim2.new(0.0260000005, 0, 0.569999993, 0),
                    	Size = UDim2.new(0, 328, 0, 33),
                	})
                	Interactables.Base = HexUI:Create("ImageLabel", {
                        Name = "Base",
                    	BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    	BackgroundTransparency = 1.000,
                    	BorderSizePixel = 0,
                    	Size = UDim2.new(1, 0, 1, 0),
                    	Image = "rbxassetid://3570695787",
                    	ImageColor3 = Color3.fromRGB(20, 20, 20),
                    	ScaleType = Enum.ScaleType.Slice,
                    	SliceCenter = Rect.new(100, 100, 100, 100),
                    	SliceScale = 0.040,
                	})
                	Interactables.Label = HexUI:Create("TextLabel", {
                        Name = "TextboxText",
                    	BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    	BackgroundTransparency = 1.000,
                    	BorderSizePixel = 0,
                    	Position = UDim2.new(0.024390243, 0, 0, 0),
                    	Size = UDim2.new(1, 0, 1, 0),
                    	Font = Enum.Font.Gotham,
                    	Text = "",
                    	TextColor3 = Color3.fromRGB(255, 255, 255),
                    	TextSize = 19.000,
                    	TextXAlignment = Enum.TextXAlignment.Left,
                	})
                	
                	if #Name <= 100 then
                	    Interactables.Label.Text = Name
                	end
                    
                    function Interactables.SetText(Text)
                        if #Text <= 100 then
                            Interactables.Label.Text = Text
                        end
                    end
                    
                    Category.Container.CanvasSize = Category.Container.CanvasSize + UDim2.new(0,0,0,41)
                    
                    Interactables.TextLabel.Parent = Category.Container
                    Interactables.Base.Parent = Interactables.TextLabel
                    Interactables.Label.Parent = Interactables.Base
                elseif Type:lower() == "keybind" then
                    Interactables.Keybind = HexUI:Create("Frame", {
                        Name = "Keybind",
                        BackgroundColor3 = Color3.fromRGB(15, 15, 15),
                        BackgroundTransparency = 1.000,
                        BorderSizePixel = 0,
                        Position = UDim2.new(0.0260000005, 0, 0.430000007, 0),
                        Size = UDim2.new(0, 328, 0, 33),
                	})
                	Interactables.Base = HexUI:Create("ImageLabel", {
                        Name = "Base",
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        BackgroundTransparency = 1.000,
                        BorderSizePixel = 0,
                        Size = UDim2.new(1, 0, 1, 0),
                        Image = "rbxassetid://3570695787",
                        ImageColor3 = Color3.fromRGB(20, 20, 20),
                        ScaleType = Enum.ScaleType.Slice,
                        SliceCenter = Rect.new(100, 100, 100, 100),
                        SliceScale = 0.040,
                	})
                	Interactables.KeybindText = HexUI:Create("TextLabel", {
                        Name = "KeybindText",
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        BackgroundTransparency = 1.000,
                        BorderSizePixel = 0,
                        Position = UDim2.new(0.024390243, 0, 0, 0),
                        Size = UDim2.new(0.601219648, 0, 1, 0),
                        Font = Enum.Font.Gotham,
                        Text = "Keybind",
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        TextSize = 19.000,
                        TextXAlignment = Enum.TextXAlignment.Left,
                	})
                	Interactables.Input = HexUI:Create("ImageButton", {
                        Name = "Input",
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        BackgroundTransparency = 1.000,
                        Position = UDim2.new(0.655000001, 0, 0.128000006, 0),
                        Size = UDim2.new(0.130999997, 66, 0.75, 0),
                        AutoButtonColor = false,
                        Selected = true,
                        Image = "rbxassetid://3570695787",
                        ImageColor3 = Color3.fromRGB(15, 15, 15),
                        ScaleType = Enum.ScaleType.Slice,
                        SliceCenter = Rect.new(100, 100, 100, 100),
                        SliceScale = 0.040,
                	})
                	Interactables.KeybindKey = HexUI:Create("TextLabel", {
                	    Name = "KeybindKey",
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        BackgroundTransparency = 1.000,
                        Size = UDim2.new(1, 0, 1, 0),
                        Font = Enum.Font.Gotham,
                        Text = "None",
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        TextSize = 15.000,
                	})
                	
                	local connection
					local changing
					local bind
					local inputconnection
					local checkconnection

					if Options then
						if Options.default then 
							bind = Options.default
							Interactables.KeybindKey.Text = bind.Name
						end
					end

					Interactables.Input.MouseButton1Click:Connect(function()
						changing = true
						Interactables.KeybindKey.Text = "..."
						connection = game:GetService("UserInputService").InputBegan:Connect(function(i)
							if i.UserInputType.Name == "Keyboard" and i.KeyCode ~= Enum.KeyCode.Backspace then
								Interactables.KeybindKey.Text = i.KeyCode.Name
								bind = i.KeyCode
								if connection then
									connection:Disconnect()
									connection = nil
									wait(.1)
									changing = false
								end
							elseif i.KeyCode == Enum.KeyCode.Backspace then
								Interactables.KeybindKey.Text = "None"
								bind = nil
								if connection then
									connection:Disconnect()
									connection = nil 
									wait(.1)
									changing = false
								end
							end
						end)
					end)

					inputconnection = game:GetService("UserInputService").InputBegan:Connect(function(i, GPE)
						if bind and i.KeyCode == bind and not GPE and not connection then
							if Callback and not changing then
								Callback(i.KeyCode)
							end
						end
					end)

					checkconnection = game:GetService("CoreGui").ChildRemoved:Connect(function(child)
						if child.Name == nameforcheck then 
							if inputconnection then
								inputconnection:Disconnect()
								inputconnection = nil
							end
							if checkconnection then 
								checkconnection:Disconnect()
								checkconnection = nil
							end 
						end 
					end)
					
					Category.Container.CanvasSize = Category.Container.CanvasSize + UDim2.new(0,0,0,41)
                	
                	Interactables.Keybind.Parent = Category.Container
                	Interactables.Base.Parent = Interactables.Keybind
                	Interactables.KeybindText.Parent = Interactables.Base
                	Interactables.Input.Parent = Interactables.Base
                	Interactables.KeybindKey.Parent = Interactables.Input
                elseif Type:lower() == "slider" then
                    local Min = Options.min or 1
					local Max = Options.max or 0
					local MoveConnection
					local Value = 0
					
					Interactables.Slider = HexUI:Create("Frame", {
                	    Name = "Slider",
                        BackgroundColor3 = Color3.fromRGB(15, 15, 15),
                        BackgroundTransparency = 1.000,
                        BorderSizePixel = 0,
                        Position = UDim2.new(0.0260000005, 0, 0.430000007, 0),
                        Size = UDim2.new(0, 328, 0, 49),
                	})
                	Interactables.Base = HexUI:Create("ImageLabel", {
                	    Name = "Base",
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        BackgroundTransparency = 1.000,
                        BorderSizePixel = 0,
                        Size = UDim2.new(1, 0, 1, 0),
                        Image = "rbxassetid://3570695787",
                        ImageColor3 = Color3.fromRGB(20, 20, 20),
                        ScaleType = Enum.ScaleType.Slice,
                        SliceCenter = Rect.new(100, 100, 100, 100),
                        SliceScale = 0.040,
                	})
                	Interactables.SliderText = HexUI:Create("TextLabel", {
                	    Name = "SliderText",
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        BackgroundTransparency = 1.000,
                        BorderSizePixel = 0,
                        Position = UDim2.new(0.0240000002, 0, 0.0500000007, 0),
                        Size = UDim2.new(0.769999981, 0, 0.550000012, 0),
                        Font = Enum.Font.Gotham,
                        Text = Name,
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        TextSize = 19.000,
                        TextXAlignment = Enum.TextXAlignment.Left,
                	})
                	Interactables.Amount = HexUI:Create("TextLabel", {
                	    Name = "Amount",
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        BackgroundTransparency = 1.000,
                        BorderSizePixel = 0,
                        Position = UDim2.new(0.819999993, 0, 0.100000001, 0),
                        Size = UDim2.new(0.150000006, 0, 0.449999988, 0),
                        Font = Enum.Font.Gotham,
                        Text = Min,
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        TextSize = 17.000,
                        TextXAlignment = Enum.TextXAlignment.Right,
                	})
                	Interactables.SliderOuter = HexUI:Create("ImageButton", {
                	    Name = "SliderOuter",
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        BackgroundTransparency = 1.000,
                        ClipsDescendants = true,
                        Position = UDim2.new(0.0260000005, 0, 0, 32),
                        Size = UDim2.new(0.953999996, 0, 0, 10),
                        AutoButtonColor = false,
                        Image = "rbxassetid://3570695787",
                        ImageColor3 = Color3.fromRGB(15, 15, 15),
                        ScaleType = Enum.ScaleType.Slice,
                        SliceCenter = Rect.new(100, 100, 100, 100),
                        SliceScale = 0.030,
                	})
                	Interactables.SliderInner = HexUI:Create("ImageLabel", {
                	    Name = "SliderInner",
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        BackgroundTransparency = 1.000,
                        Position = UDim2.new(0, 0, 0, 1),
                        Size = UDim2.new(0, 0, 0, 8),
                        Image = "rbxassetid://3570695787",
                        ScaleType = Enum.ScaleType.Slice,
                        SliceCenter = Rect.new(100, 100, 100, 100),
                        SliceScale = 0.030,
                	})
                	
                	if Options.default then 
						Interactables.Amount.Text = tostring(Options.default)
						if Callback then
							Callback(Options.default)
						end
						local s = (Options.default - Min) / (Max - Min)
						TS:Create(Interactables.SliderInner, TweenInfo.new(0.05), {
							Size = UDim2.new(s, 0, 0, 8)
						}):Play()
					end

					Interactables.SliderOuter.MouseButton1Down:Connect(function()

						MoveConnection = RS.Heartbeat:Connect(function()
							local s = math.clamp(mouse.X - Interactables.SliderOuter.AbsolutePosition.X, 0, Interactables.SliderOuter.AbsoluteSize.X) / Interactables.SliderOuter.AbsoluteSize.X
							if Options.precise then
								Value = string.format("%.1f", Min + ((Max - Min) * s))
							else
								Value = math.floor(Min + ((Max - Min) * s))
							end
							Interactables.Amount.Text = tostring(Value)

							if Callback then
								Callback(Value)
							end

							TS:Create(Interactables.SliderInner, TweenInfo.new(0.05), {
								Size = UDim2.new(s, 0, 0, 8)
							}):Play()
						end)

						UIS.InputEnded:Connect(function(Check)
							if Check.UserInputType == Enum.UserInputType.MouseButton1 then
								if MoveConnection then
									MoveConnection:Disconnect()
									MoveConnection = nil
								end
							end
						end)
					end)
					
					Category.Container.CanvasSize = Category.Container.CanvasSize + UDim2.new(0,0,0,57)
                	
                	Interactables.Slider.Parent = Category.Container
                	Interactables.Base.Parent = Interactables.Slider
                	Interactables.SliderText.Parent = Interactables.Base
                	Interactables.Amount.Parent = Interactables.Base
                	Interactables.SliderOuter.Parent = Interactables.Base
                	Interactables.SliderInner.Parent = Interactables.SliderOuter
                elseif Type:lower() == "dropdown" then
                    if Options and not Options.search then

						local selectedvalue

						if Options then
							if Options.default and Options.options and not Options.playerlist then
								selectedvalue = Options.default
							elseif Options.default and Options.options and Options.playerlist then
								selectedvalue = Options.default
							elseif not Options.default and Options.options and Options.playerlist then
								selectedvalue = Options.options[1]
							elseif not Options.default and Options.options and not Options.playerlist then
								selectedvalue = Options.options[1]
							elseif not Options.default and not Options.options and Options.playerlist then
								selectedvalue = game:GetService("Players"):GetChildren()[1].Name  
							elseif Options.default and not Options.options and not Options.playerlist then
								selectedvalue = Options.default      
							elseif Options.default and not Options.options and Options.playerlist then
								selectedvalue = Options.default               
							end
						end

						local tablelist

						if Options then
							if Options.options and not Options.playerlist then
								tablelist = Options.options
							elseif Options.options and Options.playerlist then
								tablelist = {}

								for g, f in pairs(Options.options) do
									table.insert(tablelist, f)
								end
								local list = game:GetService("Players"):GetChildren()
								for i, v in pairs(list) do
									if v:IsA("Player") then
										table.insert(tablelist, v.Name)
									end
								end
							elseif not Options.options and Options.playerlist then
								tablelist = {}
								local list = game:GetService("Players"):GetChildren()
								for i, v in pairs(list) do
									if v:IsA("Player") then
										table.insert(tablelist, v.Name)
									end
								end
							end
						end

						Interactables.dropdownb = HexUI:Create("ImageLabel", {
							Name = "Dropdown",
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 1.000,
							BorderColor3 = Color3.fromRGB(27, 42, 53),
							Position = UDim2.new(0, 11, 0, 40),
							Size = UDim2.new(0.982, 0, 0, 30),
							ImageTransparency = 1,
							Image = "rbxassetid://3570695787",
							ImageColor3 = Color3.fromRGB(20,20,20),
							ScaleType = Enum.ScaleType.Slice,
							SliceCenter = Rect.new(100, 100, 100, 100),
							SliceScale = 0.040,
						})

						Interactables.dropdownb.ClipsDescendants = true

						Interactables.dropdown = HexUI:Create("ImageButton", {
							Name = "Dropdown",
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 1.000,
							BorderColor3 = Color3.fromRGB(27, 42, 53),
							Position = UDim2.new(0.04, 0, 0, 0),
							Size = UDim2.new(0.915, 0, 0, 30),
							AutoButtonColor = false,
							Image = "rbxassetid://3570695787",
							ImageColor3 = Color3.fromRGB(20,20,20),
							ScaleType = Enum.ScaleType.Slice,
							SliceCenter = Rect.new(100, 100, 100, 100),
							SliceScale = 0.040,
						})

						Interactables.arrow = HexUI:Create("ImageLabel", {
							Name = "Arrow",
							Active = true,
							BackgroundColor3 = Color3.fromRGB(248, 248, 248),
							BackgroundTransparency = 1.000,
							BorderColor3 = Color3.fromRGB(27, 42, 53),
							BorderSizePixel = 0,
							Position = UDim2.new(0.905401852, 0, 0.0333333351, 0),
							Rotation = 90.000,
							Selectable = true,
							Size = UDim2.new(0, 28, 0, 28),
							Image = "http://www.roblox.com/asset/?id=5054982349",
							ImageColor3 = Color3.fromRGB(255,255,255),
						})

						Interactables.selected = HexUI:Create("TextLabel", {
							Active = false,
							BackgroundColor3 = Color3.fromRGB(248, 248, 248),
							BackgroundTransparency = 1.000,
							BorderSizePixel = 0,
							Position = UDim2.new(0, 10, 0, 0),
							Selectable = false,
							Size = UDim2.new(0.200000003, 200, 1, 0),
							Font = Enum.Font.Gotham,
							Text = Name, --
							TextColor3 = Color3.fromRGB(255,255,255),
							TextSize = 19.000,
							TextXAlignment = Enum.TextXAlignment.Left,
						})

						Interactables.listb = HexUI:Create("ImageLabel", {
							Active = true,
							BackgroundColor3 = Color3.fromRGB(248, 248, 248),
							BackgroundTransparency = 1.000,
							BorderColor3 = Color3.fromRGB(27, 42, 53),
							Position = UDim2.new(0, 0, 0, 40),
							Selectable = true,
							Size = UDim2.new(1, 0, 0, 120),
							ZIndex = 2,
							Image = "rbxassetid://3570695787",
							ImageColor3 = Color3.fromRGB(15,15,15),
							ScaleType = Enum.ScaleType.Slice,
							SliceCenter = Rect.new(100, 100, 100, 100),
							SliceScale = 0.040,
						})

						Interactables.list = HexUI:Create("ScrollingFrame", {
							Active = true,
							BackgroundColor3 = Color3.fromRGB(29, 29, 35),
							BackgroundTransparency = 1.000,
							BorderSizePixel = 0,
							Size = UDim2.new(1, 0, 1, 0),
							ZIndex = 2,
							CanvasSize = UDim2.new(0, 0, 0, 0),
							ScrollBarThickness = 3,
							ScrollBarImageColor3 = Color3.fromRGB(30,30,30),
						})

						local tlistlayout = HexUI:Create("UIListLayout", {
							SortOrder = Enum.SortOrder.LayoutOrder,
							Padding = UDim.new(0, 10)
						})

						tlistlayout.Parent = Interactables.list
						tlistlayout = nil

						local tpadding = HexUI:Create("UIPadding", {
							PaddingBottom = UDim.new(0, 10),
							PaddingLeft = UDim.new(0, 10),
							PaddingTop = UDim.new(0, 10),
						})

						tpadding.Parent = Interactables.list
						tpadding = nil

						local dropdownopen = false

						Category.Container.CanvasSize = Category.Container.CanvasSize + UDim2.new(0, 0, 0, 41)

						Interactables.dropdownb.Parent = Category.Container
						Interactables.dropdown.Parent = Interactables.dropdownb
						Interactables.arrow.Parent = Interactables.dropdown
						Interactables.selected.Parent = Interactables.dropdown
						Interactables.listb.Parent = Interactables.dropdown
						Interactables.list.Parent = Interactables.listb

						local function refreshlist()

							for i, v in next, Interactables.list:GetChildren() do
								if v:IsA("ImageButton") then
									v:Destroy()
								end
							end

							for i, v in next, tablelist do
								local button = HexUI:Create("ImageButton", {
									Name = string.lower(v),
									AnchorPoint = Vector2.new(0.5, 0.5),
									BackgroundColor3 = Color3.fromRGB(255, 255, 255),
									BackgroundTransparency = 1.000,
									BorderColor3 = Color3.fromRGB(27, 42, 53),
									Position = UDim2.new(0, 252, 0, 0),
									Size = UDim2.new(0.98, 0, 0, 30),
									ZIndex = 2,
									AutoButtonColor = false,
									Image = "rbxassetid://3570695787",
									ImageColor3 = Color3.fromRGB(20,20,20),
									ScaleType = Enum.ScaleType.Slice,
									SliceCenter = Rect.new(100, 100, 100, 100),
									SliceScale = 0.040,
								})

								local buttontext = HexUI:Create("TextLabel", {
									BackgroundColor3 = Color3.fromRGB(255, 255, 255),
									BackgroundTransparency = 1.000,
									BorderSizePixel = 0,
									Position = UDim2.new(0.078, 0, 0, 0),
									Size = UDim2.new(0.833, 0, 1, 0),
									ZIndex = 2,
									Font = Enum.Font.Gotham,
									Text = v,
									TextColor3 = Color3.fromRGB(255,255,255),
									TextSize = 19,
								})

								button.Parent = Interactables.list
								buttontext.Parent = button

								button.MouseButton1Click:Connect(function()
									if dropdownopen then

										dropdownopen = not dropdownopen
										Interactables.selected.Text = v
										selectedvalue = v

										if dropdownopen then
										    Interactables.selected.Text = Name
											refreshlist()
											TS:Create(Interactables.dropdownb, TweenInfo.new(0.1), {
												Size = UDim2.new(0.982, 0, 0, 154)
											}):Play()
											TS:Create(Category.Container, TweenInfo.new(0.1), {
												CanvasSize = Category.Container.CanvasSize + UDim2.new(0, 0, 0, 150)
											}):Play()
											TS:Create(Interactables.list, TweenInfo.new(0.1), {
												CanvasSize = UDim2.new(0, 0, 0, Interactables.list["UIListLayout"].AbsoluteContentSize.Y) + UDim2.new(0, 0, 0, 26)
											}):Play()
											TS:Create(Interactables.arrow, TweenInfo.new(0.1), {
												Rotation = 0
											}):Play()
										else
											refreshlist()
											TS:Create(Interactables.dropdownb, TweenInfo.new(0.1), {
												Size = UDim2.new(0.982, 0, 0, 30)
											}):Play()
											TS:Create(Category.Container, TweenInfo.new(0.1), {
												CanvasSize = Category.Container.CanvasSize - UDim2.new(0, 0, 0, 150)
											}):Play()
											TS:Create(Interactables.arrow, TweenInfo.new(0.1), {
												Rotation = 90
											}):Play()
										end

										if Callback then
											Callback(selectedvalue)
										end
									end
								end)
							end
						end

						refreshlist()

						function Interactables:SetDropDownList(table)
							tablelist = {}
							if table then 
								if table.options then 
									tablelist = table.options
									refreshlist()
								end
							end
						end

						function Interactables:GetDropDownList()
							return tablelist
						end

						refreshlist()
						

						Interactables.dropdown.MouseButton1Click:Connect(function()
							dropdownopen = not dropdownopen

							if Options.BeforeOpen then 
								Options.BeforeOpen()
							end

							if Options then
								if Options.options and Options.playerlist then
									tablelist = {}

									for g, f in pairs(Options.options) do
										table.insert(tablelist, f)
									end
									local list = game:GetService("Players"):GetChildren()
									if not Options.plotlist then
										for i, v in pairs(list) do
											if v:IsA("Player") then
												table.insert(tablelist, v.Name)
											end
										end
									end
								elseif not Options.options and Options.playerlist then
									tablelist = {}
									local list = game:GetService("Players"):GetChildren()
									if not Options.plotlist then 
										for i, v in pairs(list) do
											if v:IsA("Player") then
												table.insert(tablelist, v.Name)
											end
										end									
									end                        
								end
							end


							if dropdownopen then
							    Interactables.selected.Text = Name
								refreshlist()
								TS:Create(Interactables.dropdownb, TweenInfo.new(0.1), {
									Size = UDim2.new(0.982, 0, 0, 154)
								}):Play()
								TS:Create(Category.Container, TweenInfo.new(0.1), {
									CanvasSize = Category.Container.CanvasSize + UDim2.new(0, 0, 0, 150)
								}):Play()
								TS:Create(Interactables.list, TweenInfo.new(0.1), {
									CanvasSize = UDim2.new(0, 0, 0, Interactables.list["UIListLayout"].AbsoluteContentSize.Y) + UDim2.new(0, 0, 0, 26)
								}):Play()
								TS:Create(Interactables.arrow, TweenInfo.new(0.1), {
									Rotation = 0
								}):Play()
							else
								refreshlist()
								TS:Create(Interactables.dropdownb, TweenInfo.new(0.1), {
									Size = UDim2.new(0.982, 0, 0, 30)
								}):Play()
								TS:Create(Category.Container, TweenInfo.new(0.1), {
									CanvasSize = Category.Container.CanvasSize - UDim2.new(0, 0, 0, 150)
								}):Play()
								TS:Create(Interactables.arrow, TweenInfo.new(0.1), {
									Rotation = 90
								}):Play()
							end

						end)
					elseif Options and Options.search then

						local selectedvalue

						if Options then
							if Options.default and Options.options and not Options.playerlist then
								selectedvalue = Options.default
							elseif Options.default and Options.options and Options.playerlist then
								selectedvalue = Options.default
							elseif not Options.default and Options.options and Options.playerlist then
								selectedvalue = Options.options[1]
							elseif not Options.default and Options.options and not Options.playerlist then
								selectedvalue = Options.options[1]
							elseif not Options.default and not Options.options and Options.playerlist then
								selectedvalue = game:GetService("Players"):GetChildren()[1].Name  
							elseif Options.default and not Options.options and not Options.playerlist then
								selectedvalue = Options.default      
							elseif Options.default and not Options.options and Options.playerlist then
								selectedvalue = Options.default               
							end
						end

						local tablelist

						if Options then
							if Options.options and not Options.playerlist then
								tablelist = Options.options
							elseif Options.options and Options.playerlist then
								tablelist = {}

								for g, f in pairs(Options.options) do
									table.insert(tablelist, f)
								end
								local list = game:GetService("Players"):GetChildren()
								if not Options.plotlist then
									for i, v in pairs(list) do
										if v:IsA("Player") then
											table.insert(tablelist, v.Name)
										end
									end
								end
							elseif not Options.options and Options.playerlist then
								tablelist = {}
								local list = game:GetService("Players"):GetChildren()
								if not Options.plotlist then 
									for i, v in pairs(list) do
										if v:IsA("Player") then
											table.insert(tablelist, v.Name)
										end
									end     
								end                        
							end
						end

						Interactables.dropdownb = HexUI:Create("ImageLabel", {
							Name = "Dropdown",
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 1.000,
							BorderColor3 = Color3.fromRGB(27, 42, 53),
							Position = UDim2.new(0, 11, 0, 40),
							Size = UDim2.new(0.982, 0, 0, 30),
							ImageTransparency = 1,
							Image = "rbxassetid://3570695787",
							ImageColor3 = Color3.fromRGB(20,20,20),
							ScaleType = Enum.ScaleType.Slice,
							SliceCenter = Rect.new(100, 100, 100, 100),
							SliceScale = 0.040,
						})

						Interactables.dropdownb.ClipsDescendants = true

						Interactables.dropdown = HexUI:Create("ImageButton", {
							Name = "Dropdown",
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 1.000,
							BorderColor3 = Color3.fromRGB(27, 42, 53),
							Position = UDim2.new(0.04, 0, 0, 0),
							Size = UDim2.new(0.915, 0, 0, 30),
							AutoButtonColor = false,
							Image = "rbxassetid://3570695787",
							ImageColor3 = Color3.fromRGB(20,20,20),
							ScaleType = Enum.ScaleType.Slice,
							SliceCenter = Rect.new(100, 100, 100, 100),
							SliceScale = 0.040,
						})

						Interactables.arrow = HexUI:Create("ImageLabel", {
							Name = "Arrow",
							Active = true,
							BackgroundColor3 = Color3.fromRGB(248, 248, 248),
							BackgroundTransparency = 1.000,
							BorderColor3 = Color3.fromRGB(27, 42, 53),
							BorderSizePixel = 0,
							Position = UDim2.new(1, -32, 0.0333333351, 0),
							Rotation = 90.000,
							Selectable = true,
							Size = UDim2.new(0, 28, 0, 28),
							Image = "http://www.roblox.com/asset/?id=5054982349",
							ImageColor3 = Color3.fromRGB(255,255,255),
						})
						
						Interactables.selectedbutton = HexUI:Create("ImageButton", {
							Name = "Dropdown",
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 1.000,
							BorderColor3 = Color3.fromRGB(27, 42, 53),
							Position = UDim2.new(0.03, 0, 0, 0),
							Size = UDim2.new(0.8, 0, 1, 0),
							ImageTransparency = 1,
							Image = "rbxassetid://3570695787",
							ImageColor3 = Color3.fromRGB(15,15,15),
							ScaleType = Enum.ScaleType.Slice,
							SliceCenter = Rect.new(100, 100, 100, 100),
							SliceScale = 0.040,
						})

						Interactables.selected = HexUI:Create("TextBox", {
							Active = false,
							BackgroundColor3 = Color3.fromRGB(15,15,15),
							BackgroundTransparency = 1.000,
							BorderSizePixel = 0,
							Position = UDim2.new(0, 0, 0.14, 0),
							Selectable = false,
							Size = UDim2.new(1, 0, 0.75, 0),
							Font = Enum.Font.Gotham,
							PlaceholderText = "Search",
							PlaceholderColor3 = Color3.fromRGB(140, 140, 140),
							Text = Name, --tostring(selectedvalue)
							TextColor3 = Color3.fromRGB(255,255,255),
							TextSize = 19.000,
							TextTruncate = Enum.TextTruncate.AtEnd,
							TextXAlignment = Enum.TextXAlignment.Left,
						})
						
						Interactables.selectedcorner = HexUI:Create("UICorner", {})
						
						Interactables.newselectedbutton = HexUI:Create("ImageButton", {
							Name = "Dropdown",
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 1.000,
							BorderColor3 = Color3.fromRGB(27, 42, 53),
							Position = UDim2.new(0, 0, 0, 0),
							Size = UDim2.new(1, 0, 1, 0),
							ImageTransparency = 1,
							Image = "",
							ImageColor3 = Color3.fromRGB(15,15,15),
							ScaleType = Enum.ScaleType.Slice,
							SliceCenter = Rect.new(100, 100, 100, 100),
							SliceScale = 0.040,
						})

						Interactables.listb = HexUI:Create("ImageLabel", {
							Active = true,
							BackgroundColor3 = Color3.fromRGB(248, 248, 248),
							BackgroundTransparency = 1.000,
							BorderColor3 = Color3.fromRGB(27, 42, 53),
							Position = UDim2.new(0, 0, 0, 40),
							Selectable = true,
							Size = UDim2.new(1, 0, 0, 120),
							ZIndex = 2,
							Image = "rbxassetid://3570695787",
							ImageColor3 = Color3.fromRGB(15,15,15),
							ScaleType = Enum.ScaleType.Slice,
							SliceCenter = Rect.new(100, 100, 100, 100),
							SliceScale = 0.040,
						})

						Interactables.list = HexUI:Create("ScrollingFrame", {
							Active = true,
							BackgroundColor3 = Color3.fromRGB(29, 29, 35),
							BackgroundTransparency = 1.000,
							BorderSizePixel = 0,
							Size = UDim2.new(1, 0, 1, 0),
							ZIndex = 2,
							CanvasSize = UDim2.new(0, 0, 0, 0),
							ScrollBarThickness = 3,
							ScrollBarImageColor3 = Color3.fromRGB(30, 30, 30),
						})

						local tlistlayout = HexUI:Create("UIListLayout", {
							SortOrder = Enum.SortOrder.LayoutOrder,
							Padding = UDim.new(0, 10)
						})

						tlistlayout.Parent = Interactables.list
						tlistlayout = nil

						local tpadding = HexUI:Create("UIPadding", {
							PaddingBottom = UDim.new(0, 10),
							PaddingLeft = UDim.new(0, 10),
							PaddingTop = UDim.new(0, 10),
						})

						local dropdownopen = false

						tpadding.Parent = Interactables.list
						tpadding = nil

						Category.Container.CanvasSize = Category.Container.CanvasSize + UDim2.new(0, 0, 0, 41)

						Interactables.dropdownb.Parent = Category.Container
						Interactables.dropdown.Parent = Interactables.dropdownb
						Interactables.arrow.Parent = Interactables.dropdown
						Interactables.selectedbutton.Parent = Interactables.dropdown
						Interactables.selected.Parent = Interactables.selectedbutton
						Interactables.selectedcorner.Parent = Interactables.selected
						--Interactables.newselectedbutton.Parent = Interactables.selected
						Interactables.listb.Parent = Interactables.dropdown
						Interactables.list.Parent = Interactables.listb

						local function refreshlist()

							for i, v in next, Interactables.list:GetChildren() do
								if v:IsA("ImageButton") then
									v:Destroy()
								end
							end

							for i, v in next, tablelist do
								local button = HexUI:Create("ImageButton", {
									Name = string.lower(v),
									AnchorPoint = Vector2.new(0.5, 0.5),
									BackgroundColor3 = Color3.fromRGB(255, 255, 255),
									BackgroundTransparency = 1.000,
									BorderColor3 = Color3.fromRGB(27, 42, 53),
									Position = UDim2.new(0, 252, 0, 0),
									Size = UDim2.new(0.98, 0, 0, 30),
									ZIndex = 2,
									AutoButtonColor = false,
									Image = "rbxassetid://3570695787",
									ImageColor3 = Color3.fromRGB(20,20,20),
									ScaleType = Enum.ScaleType.Slice,
									SliceCenter = Rect.new(100, 100, 100, 100),
									SliceScale = 0.040,
								})

								local buttontext = HexUI:Create("TextLabel", {
									BackgroundColor3 = Color3.fromRGB(255, 255, 255),
									BackgroundTransparency = 1.000,
									BorderSizePixel = 0,
									Position = UDim2.new(0.078, 0, 0, 0),
									Size = UDim2.new(0.833, 0, 1, 0),
									ZIndex = 2,
									Font = Enum.Font.Gotham,
									Text = v,
									TextColor3 = Color3.fromRGB(255,255,255),
									TextSize = 19.000,
								})

								button.Parent = Interactables.list
								buttontext.Parent = button

								button.MouseButton1Click:Connect(function()
									if dropdownopen then

										dropdownopen = not dropdownopen
										Interactables.selected.Text = v
										selectedvalue = v



										if dropdownopen then
										    Interactables.selected.Text = Name
											refreshlist()
											TS:Create(Interactables.dropdownb, TweenInfo.new(0.1), {
												Size = UDim2.new(0.982, 0, 0, 154)
											}):Play()
											TS:Create(Category.Container, TweenInfo.new(0.1), {
												CanvasSize = Category.Container.CanvasSize + UDim2.new(0, 0, 0, 125)
											}):Play()
											TS:Create(Interactables.list, TweenInfo.new(0.1), {
												CanvasSize = UDim2.new(0, 0, 0, Interactables.list["UIListLayout"].AbsoluteContentSize.Y) + UDim2.new(0, 0, 0, 26)
											}):Play()
											TS:Create(Interactables.arrow, TweenInfo.new(0.1), {
												Rotation = 0
											}):Play()
										else
											refreshlist()
											TS:Create(Interactables.dropdownb, TweenInfo.new(0.1), {
												Size = UDim2.new(0.982, 0, 0, 30)
											}):Play()
											TS:Create(Category.Container, TweenInfo.new(0.1), {
												CanvasSize = Category.Container.CanvasSize - UDim2.new(0, 0, 0, 125)
											}):Play()
											TS:Create(Interactables.arrow, TweenInfo.new(0.1), {
												Rotation = 90
											}):Play()
										end

										if Callback then
											Callback(selectedvalue)
										end
									end
								end)
							end
						end

						local Found = {}
						local searchtable = {}

						function Interactables:SetDropDownList(table)
							tablelist = {}
							if table then 
								if table.options then 
									tablelist = table.options
									refreshlist()
								end
							end
						end

						function Interactables:GetDropDownList()
							return tablelist
						end

						for f,h in pairs(tablelist) do
							table.insert(searchtable, string.lower(h))
						end

						refreshlist()
						

						Interactables.dropdown.MouseButton1Click:Connect(function()
							dropdownopen = not dropdownopen

							if Options.BeforeOpen then 
								Options.BeforeOpen()
							end

							if Options then
								if Options.options and Options.playerlist then
									tablelist = {}

									for g, f in pairs(Options.options) do
										table.insert(tablelist, f)
									end
									local list = game:GetService("Players"):GetChildren()
									if not Options.plotlist then
										for i, v in pairs(list) do
											if v:IsA("Player") then
												table.insert(tablelist, v.Name)
											end
										end
									else
										for i, v in pairs(list) do
											if v:IsA("Player") then
												table.insert(tablelist, v.Name)

												table.insert(tablelist, v.Name.."'s Plot")
											end
										end
									end
								elseif not Options.options and Options.playerlist then
									tablelist = {}
									local list = game:GetService("Players"):GetChildren()
									if not Options.plotlist then 
										for i, v in pairs(list) do
											if v:IsA("Player") then
												table.insert(tablelist, v.Name)
											end
										end     
									else       
										for i, v in pairs(list) do
											if v:IsA("Player") then
												table.insert(tablelist, v.Name)

												table.insert(tablelist, v.Name.."'s Plot")
											end
										end										
									end                        
								end
							end

							if dropdownopen then
							    Interactables.selected.Text = Name
								for f,h in pairs(tablelist) do
									table.insert(searchtable, string.lower(h))
								end	
								refreshlist()
								TS:Create(Interactables.dropdownb, TweenInfo.new(0.1), {
									Size = UDim2.new(0.982, 0, 0, 154)
								}):Play()
								TS:Create(Category.Container, TweenInfo.new(0.1), {
									CanvasSize = Category.Container.CanvasSize + UDim2.new(0, 0, 0, 125)
								}):Play()
								TS:Create(Interactables.list, TweenInfo.new(0.1), {
									CanvasSize = UDim2.new(0, 0, 0, Interactables.list["UIListLayout"].AbsoluteContentSize.Y) + UDim2.new(0, 0, 0, 26)
								}):Play()
								TS:Create(Interactables.arrow, TweenInfo.new(0.1), {
									Rotation = 0
								}):Play()
							else
								for f,h in pairs(tablelist) do
									table.insert(searchtable, string.lower(h))
								end	
								refreshlist()
								TS:Create(Interactables.dropdownb, TweenInfo.new(0.1), {
									Size = UDim2.new(0.982, 0, 0, 30)
								}):Play()
								TS:Create(Category.Container, TweenInfo.new(0.1), {
									CanvasSize = Category.Container.CanvasSize - UDim2.new(0, 0, 0, 125)
								}):Play()
								TS:Create(Interactables.arrow, TweenInfo.new(0.1), {
									Rotation = 90
								}):Play()
							end

						end)

						local function Edit()
							for i in pairs(Found) do
								Found[i] = nil
							end
							for h, l in pairs(Interactables.list:GetChildren()) do
								if not l:IsA("UIListLayout") and not l:IsA("UIPadding") then
									l.Visible = false
								end
							end
							Interactables.selected.Text = string.lower(Interactables.selected.Text)
						end

						local function Search()
							local Results = {}
							local num
							for i, v in pairs(searchtable) do
								if string.find(v, Interactables.selected.Text) then
									table.insert(Found, v)
								end
							end
							for a, b in pairs(Interactables.list:GetChildren()) do
								for c, d in pairs(Found) do
									if d == b.Name then
										b.Visible = true
									end
								end
							end
							for p, n in pairs(Interactables.list:GetChildren()) do
								if not n:IsA("UIListLayout") and not n:IsA("UIPadding") and n.Visible == true then
									table.insert(Results, n)
									for c, d in pairs(Results) do
										num = c
									end
								end
							end
							if num ~= nil then
								num = num * 40
								Interactables.list.CanvasSize = UDim2.new(0, 0, 0, num) + UDim2.new(0, 0, 0, 20)
								num = 0
							end
						end

						local function Nil()
							for i, v in pairs(Interactables.list:GetChildren()) do
								if not v:IsA("UIListLayout") and not v:IsA("UIPadding") and v.Visible == false then
									TS:Create(Interactables.list, TweenInfo.new(0.1), {
										CanvasSize = UDim2.new(0, 0, 0, Interactables.list["UIListLayout"].AbsoluteContentSize.Y) + UDim2.new(0, 0, 0, 26)
									}):Play()
									v.Visible = true
								end 
							end
						end


						local SearchLock = true
						Interactables.selected.Focused:Connect(function()
						    if not dropdownopen then
    						    dropdownopen = true
                                for f,h in pairs(tablelist) do
        							table.insert(searchtable, string.lower(h))
        						end	
        						refreshlist()
        						TS:Create(Interactables.dropdownb, TweenInfo.new(0.1), {
        							Size = UDim2.new(0.982, 0, 0, 154)
        						}):Play()
        						TS:Create(Category.Container, TweenInfo.new(0.1), {
        							CanvasSize = Category.Container.CanvasSize + UDim2.new(0, 0, 0, 125)
        						}):Play()
        						TS:Create(Interactables.list, TweenInfo.new(0.1), {
        							CanvasSize = UDim2.new(0, 0, 0, Interactables.list["UIListLayout"].AbsoluteContentSize.Y) + UDim2.new(0, 0, 0, 26)
        						}):Play()
        						TS:Create(Interactables.arrow, TweenInfo.new(0.1), {
        							Rotation = 0
        						}):Play()
    						end
					    end)
						Interactables.selected.Changed:connect(function()
							if not SearchLock then
								Edit()
								Search()
							end
							if Interactables.selected.Text == "" then
								Nil()
								TS:Create(Interactables.list, TweenInfo.new(0.1), {
									CanvasSize = UDim2.new(0, 0, 0, Interactables.list["UIListLayout"].AbsoluteContentSize.Y) + UDim2.new(0, 0, 0, 26)
								}):Play()
							end
						end)


						Interactables.selected.FocusLost:connect(function()
							SearchLock = true
							if Interactables.selected.Text == "" then
								TS:Create(Interactables.list, TweenInfo.new(0.1), {
									CanvasSize = UDim2.new(0, 0, 0, Interactables.list["UIListLayout"].AbsoluteContentSize.Y) + UDim2.new(0, 0, 0, 26)
								}):Play()
								SearchLock = true
								Nil()
								Interactables.selected.Text = tostring(Options.default) or tostring(selectedvalue)
							end
						end)

						Interactables.selected.Focused:connect(function()
							SearchLock = false
						end)
					end
                elseif Type:lower() == "colorpicker" then
			        local colorpickeropen = false
					local colorpickervalue
					
					Interactables.ColorpickerObject = HexUI:Create("Frame", {
						Name = "Colorpicker",
                        BackgroundColor3 = Color3.fromRGB(15, 15, 15),
                        BackgroundTransparency = 1.000,
                        BorderSizePixel = 0,
                        Position = UDim2.new(0.0260000005, 0, 0.430000007, 0),
                        Size = UDim2.new(0, 328, 0, 32),
					})
					Interactables.BaseObject = HexUI:Create("ImageLabel", {
						Name = "Base",
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        BackgroundTransparency = 1.000,
                        BorderSizePixel = 0,
                        Size = UDim2.new(1, 0, 1, 0),
                        Image = "rbxassetid://3570695787",
                        ImageColor3 = Color3.fromRGB(20, 20, 20),
                        ScaleType = Enum.ScaleType.Slice,
                        SliceCenter = Rect.new(100, 100, 100, 100),
                        SliceScale = 0.040,
					})
					Interactables.ColorpickerText = HexUI:Create("TextLabel", {
						Name = "ColorpickerText",
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        BackgroundTransparency = 1.000,
                        BorderSizePixel = 0,
                        Position = UDim2.new(0.024390243, 0, 0, 0),
                        Size = UDim2.new(0.735000014, 0, 1, 0),
                        Font = Enum.Font.Gotham,
                        Text = Name,
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        TextSize = 19.000,
                        TextXAlignment = Enum.TextXAlignment.Left,
					})
					Interactables.Input = HexUI:Create("ImageButton", {
						Name = "Input",
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        BackgroundTransparency = 1.000,
                        Position = UDim2.new(0.77439034, 0, 0.128000259, 0),
                        Size = UDim2.new(0.0546096712, 51, 0.75, 0),
                        AutoButtonColor = false,
                        Selected = true,
                        Image = "rbxassetid://3570695787",
                        ScaleType = Enum.ScaleType.Slice,
                        SliceCenter = Rect.new(100, 100, 100, 100),
                        SliceScale = 0.040,
					})
					
					-- Make the Colorpicker GUI
					Interactables.Colorpicker = HexUI:Create("Frame", {
						Name = "Colorpicker",
                        BackgroundColor3 = Color3.fromRGB(15, 15, 15),
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        ClipsDescendants = true,
                        Position = UDim2.new(1.02636921, 0, 0.106666684, 0),
                        Selectable = true,
                        Size = UDim2.new(0, 0, 0, 203),
					})
					Interactables.ColorpickerE = HexUI:Create("Frame", {
						Name = "Colorpicker",
                        BackgroundColor3 = Color3.fromRGB(15, 15, 15),
                        BorderSizePixel = 0,
                        ClipsDescendants = false,
                        Position = UDim2.new(0, 0, 0, 0),
                        Selectable = true,
                        Size = UDim2.new(0, 172, 0, 203),
					})
					Interactables.UICorner1 = HexUI:Create("UICorner", {})
					Interactables.ColorpickerShadow = HexUI:Create("ImageLabel", {
						Name = "Shadow",
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        BackgroundTransparency = 1.000,
                        Position = UDim2.new(-0.041, 0, -0.044, 0),
                        Size = UDim2.new(0, 187, 0, 223),
                        ZIndex = -10,
                        Image = "rbxassetid://7666162633",
                        ImageColor3 = Color3.fromRGB(0, 0, 0),
					})
					Interactables.DarknessPicker = HexUI:Create("ImageButton", {
						Name = "DarknessPicker",
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        BorderSizePixel = 0,
                        Position = UDim2.new(0.0850000009, 0, 0.0439999998, 0),
                        Size = UDim2.new(0, 122, 0, 122),
                        AutoButtonColor = false,
                        Image = "rbxassetid://5113592272",
                        ImageColor3 = Color3.fromRGB(255, 0, 0),
                        SliceCenter = Rect.new(2, 2, 298, 298),
					})
					Interactables.Light = HexUI:Create("ImageLabel", {
						Name = "Light",
                        BackgroundTransparency = 1.000,
                        BorderSizePixel = 0,
                        Size = UDim2.new(1, 0, 1, 0),
                        Image = "rbxassetid://5113600420",
					})
					Interactables.DarknessRing = HexUI:Create("ImageLabel", {
						Name = "DarknessRing",
						AnchorPoint = Vector2.new(0.5, 0.5),
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        BackgroundTransparency = 1.000,
                        Size = UDim2.new(0, 10, 0, 10),
                        SizeConstraint = Enum.SizeConstraint.RelativeYY,
                        ZIndex = 5,
                        Image = "rbxassetid://5674514673",
					})
					Interactables.Done = HexUI:Create("TextButton", {
						Name = "Done",
                        BackgroundColor3 = Color3.fromRGB(25, 25, 25),
                        BorderSizePixel = 0,
                        Position = UDim2.new(0.0465116277, 0, 0.85221678, 0),
                        Size = UDim2.new(0.899999976, 0, 0.100000001, 0),
                        AutoButtonColor = false,
                        Font = Enum.Font.Gotham,
                        Text = "Done",
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        TextSize = 14.000,
					})
					Interactables.UICorner2 = HexUI:Create("UICorner", {})
					Interactables.G = HexUI:Create("TextBox", {
						Name = "G",
                        BackgroundColor3 = Color3.fromRGB(25, 25, 25),
                        BorderSizePixel = 0,
                        Position = UDim2.new(0.442000002, 0, 0.689999998, 0),
                        Size = UDim2.new(0, 31, 0, 25),
                        Font = Enum.Font.Gotham,
                        Text = "255",
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        TextSize = 14.000,
					})
					Interactables.UICorner3 = HexUI:Create("UICorner", {})
					Interactables.GText = HexUI:Create("TextLabel", {
						Name = "GText",
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        BackgroundTransparency = 1.000,
                        Position = UDim2.new(0, -25, 0, 0),
                        Size = UDim2.new(1, 0, 1, 0),
                        Font = Enum.Font.Gotham,
                        Text = "G:",
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        TextSize = 14.000,
					})
					Interactables.R = HexUI:Create("TextBox", {
						Name = "R",
                        BackgroundColor3 = Color3.fromRGB(25, 25, 25),
                        BorderSizePixel = 0,
                        Position = UDim2.new(0.149000004, 0, 0.689999998, 0),
                        Size = UDim2.new(0, 30, 0, 25),
                        Font = Enum.Font.Gotham,
                        Text = "255",
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        TextSize = 14.000,
					})
					Interactables.UICorner4 = HexUI:Create("UICorner", {})
					Interactables.RText = HexUI:Create("TextLabel", {
						Name = "RText",
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        BackgroundTransparency = 1.000,
                        Position = UDim2.new(0, -25, 0, 0),
                        Size = UDim2.new(1, 0, 1, 0),
                        Font = Enum.Font.Gotham,
                        Text = "R:",
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        TextSize = 14.000,
					})
					Interactables.B = HexUI:Create("TextBox", {
						Name = "B",
                        BackgroundColor3 = Color3.fromRGB(25, 25, 25),
                        BorderSizePixel = 0,
                        Position = UDim2.new(0.74000001, 0, 0.689999998, 0),
                        Size = UDim2.new(0, 30, 0, 25),
                        Font = Enum.Font.Gotham,
                        Text = "255",
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        TextSize = 14.000,
					})
					Interactables.UICorner5 = HexUI:Create("UICorner", {})
					Interactables.BText = HexUI:Create("TextLabel", {
						Name = "BText",
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        BackgroundTransparency = 1.000,
                        Position = UDim2.new(0, -25, 0, 0),
                        Size = UDim2.new(1, 0, 1, 0),
                        Font = Enum.Font.Gotham,
                        Text = "B:",
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        TextSize = 14.000,
					})
					Interactables.HuePicker = HexUI:Create("ImageButton", {
						Name = "HuePicker",
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        BackgroundTransparency = 1.000,
                        BorderSizePixel = 0,
                        Position = UDim2.new(0.866279066, 0, 0.0443349741, 0),
                        Size = UDim2.new(0, 6, 0, 122),
                        Image = "rbxassetid://7666159158",
					})
					Interactables.HueRing = HexUI:Create("ImageLabel", {
						Name = "HueRing",
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        BackgroundTransparency = 1.000,
                        Position = UDim2.new(0, -1, 0, -6),
                        Size = UDim2.new(0, 8, 0, 8),
                        Image = "rbxassetid://3570695787",
					})
					
					Category.Container.CanvasSize = Category.Container.CanvasSize + UDim2.new(0,0,0,41)
					
					Interactables.Input.MouseButton1Click:Connect(function()
						colorpickeropen = not colorpickeropen
                        
                        for i,v in pairs(Main.Motherframe:GetChildren()) do
				            if v.Name == "Colorpicker" then
						        game:GetService("TweenService"):Create(v, TweenInfo.new(0.2), {Size = UDim2.new(0, 0, 0, 203)}):Play()
					        end
			            end
						if colorpickeropen then
						    game:GetService("TweenService"):Create(Interactables.Colorpicker, TweenInfo.new(0.2), {Size = UDim2.new(0, 172, 0, 203)}):Play()
						end
					end)

					Interactables.Done.MouseButton1Click:Connect(function()
						colorpickeropen = not colorpickeropen
						for i,v in pairs(Main.Motherframe:GetChildren()) do
						    if v.Name == "Colorpicker" then
						        game:GetService("TweenService"):Create(v, TweenInfo.new(0.2), {Size = UDim2.new(0, 0, 0, 203)}):Play()
						    end
			            end
					end)

					local h,s,v = 0,0,1
					local color = Color3.fromRGB(255,255,255)
					local r,g,b = 255,255,255

					local hueconnection
					local darknessconnection

					local function Update()

						Interactables.R.Text = math.floor(r)
						Interactables.G.Text = math.floor(g)
						Interactables.B.Text = math.floor(b)
						
						TS:Create(Interactables.HueRing, TweenInfo.new(0.12), {Position = UDim2.new(0, -1, h, -6)}):Play()
						TS:Create(Interactables.DarknessRing, TweenInfo.new(0.12), {Position = UDim2.new(s, 0, 1 - v, 0)}):Play()
					
						Interactables.DarknessPicker.ImageColor3 = Color3.fromHSV(h,1,1)

						Interactables.Input.ImageColor3 = Color3.fromRGB(r,g,b)
					
						local colorvalue = Color3.fromHSV(h,s,v)
					
						if Callback then 
							Callback(colorvalue)
						end
					end
					
					Interactables.HuePicker.MouseButton1Down:Connect(function()
						hueconnection = RS.Heartbeat:Connect(function()
							h = 1 - math.clamp(1 - ((mouse.Y - Interactables.HuePicker.AbsolutePosition.Y) / Interactables.HuePicker.AbsoluteSize.Y), 0, 1)
							color = Color3.fromHSV(h,s,v)
					
							r,g,b = math.floor(color.r * 255), math.floor(color.g * 255), math.floor(color.b * 255)
					
							Update()
						end)
					end)
					
					Interactables.DarknessPicker.MouseButton1Down:Connect(function()
						darknessconnection = RS.Heartbeat:Connect(function()
							s = math.clamp((mouse.X - Interactables.DarknessPicker.AbsolutePosition.X) / Interactables.DarknessPicker.AbsoluteSize.X, 0, 1)
							v = 1 - math.clamp((mouse.Y - Interactables.DarknessPicker.AbsolutePosition.Y) / Interactables.DarknessPicker.AbsoluteSize.Y, 0, 1)
							color = Color3.fromHSV(h,s,v)
					
							r,g,b = math.floor(color.r * 255), math.floor(color.g * 255), math.floor(color.b * 255)
					
							Update()
						end)
					end)
					
					Interactables.R:GetPropertyChangedSignal("Text"):Connect(function()
						if not hueconnection and not darknessconnection then  
							local Text = Interactables.R.Text
					
							if not tonumber(Text) then 
								Interactables.R.Text = Interactables.R.Text:gsub("%D", "")
							elseif tonumber(Text) > 255 then 
								Interactables.R.Text = "255"
							elseif tonumber(Text) and tonumber(Text) <= 255 then 
								r = Text
								local color = Color3.fromRGB(r,g,b)
								h,s,v = Color3.toHSV(color)
								Update()
							end
						end 
					end)
					
					Interactables.G:GetPropertyChangedSignal("Text"):Connect(function()
						if not hueconnection and not darknessconnection then 
							local Text = Interactables.G.Text
					
							if not tonumber(Text) then 
								Interactables.G.Text = Interactables.G.Text:gsub("%D", "")
							elseif tonumber(Text) > 255 then 
								Interactables.G.Text = "255"
							elseif tonumber(Text) and tonumber(Text) <= 255 then 
								g = Text
								local color = Color3.fromRGB(r,g,b)
								h,s,v = Color3.toHSV(color)
								Update()
							end
						end 
					end)
					
					Interactables.B:GetPropertyChangedSignal("Text"):Connect(function()
						if not hueconnection and not darknessconnection then 
							local Text = Interactables.B.Text
					
							if not tonumber(Text) then 
								Interactables.B.Text = Interactables.B.Text:gsub("%D", "")
							elseif tonumber(Text) > 255 then 
								Interactables.B.Text = "255"
							elseif tonumber(Text) and tonumber(Text) <= 255 then 
								b = Text
								local color = Color3.fromRGB(r,g,b)
								h,s,v = Color3.toHSV(color)
								Update()
							end
						end 
					end)

					if Options then 
						if Options.default then 
							r,g,b = Options.default.r * 255, Options.default.g * 255, Options.default.b * 255
							h,s,v = Color3.toHSV(Options.default)
							Update()
						end 
					end 
					
					function Interactables:SetColor(Color)
						r,g,b = Color.r * 255, Color.g * 255, Color.b * 255
						h,s,v = Color3.toHSV(Color)
						Update()
					end
					
					UIS.InputEnded:Connect(function(Mouse)
						if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
							if hueconnection then
								hueconnection:Disconnect()
								hueconnection = nil
							end
							if darknessconnection then
								darknessconnection:Disconnect()
								darknessconnection = nil
							end
						end
					end)
					
					-- Set Colorpicker Object Parents
    				Interactables.ColorpickerObject.Parent = Category.Container
    				Interactables.BaseObject.Parent = Interactables.ColorpickerObject
    				Interactables.ColorpickerText.Parent = Interactables.BaseObject
    				Interactables.Input.Parent = Interactables.BaseObject
    				-- Set Colorpicker GUI Parents
    				Interactables.Colorpicker.Parent = Main.Motherframe
    				Interactables.ColorpickerE.Parent = Interactables.Colorpicker
    				Interactables.ColorpickerShadow.Parent = Interactables.ColorpickerE
    				Interactables.Done.Parent = Interactables.ColorpickerE
    				Interactables.UICorner1.Parent = Interactables.ColorpickerE
    				Interactables.UICorner2.Parent = Interactables.Done
    				Interactables.UICorner3.Parent = Interactables.G
    				Interactables.UICorner4.Parent = Interactables.R
    				Interactables.UICorner5.Parent = Interactables.B
    				Interactables.DarknessPicker.Parent = Interactables.ColorpickerE
    				Interactables.Light.Parent = Interactables.DarknessPicker
    				Interactables.DarknessRing.Parent = Interactables.DarknessPicker
    				Interactables.G.Parent = Interactables.ColorpickerE
    				Interactables.GText.Parent = Interactables.G
    				Interactables.R.Parent = Interactables.ColorpickerE
    				Interactables.RText.Parent = Interactables.R
    				Interactables.B.Parent = Interactables.ColorpickerE
    				Interactables.BText.Parent = Interactables.B
    				Interactables.HuePicker.Parent = Interactables.ColorpickerE
    				Interactables.HueRing.Parent = Interactables.HuePicker
    				Interactables.Colorpicker.ClipsDescendants = true
				end
                
                return Interactables
            end
    		Category.Container.CanvasSize = Category.Container.CanvasSize + UDim2.new(0,0,0,41)
    		
    		Section.SectionTitle.Parent = Category.Container
    		Section.Line.Parent = Section.SectionTitle
    		Section.UIListLayout.Parent = Category.Container
    		return Section
        end
    	
    	Category.NewCategory.Parent = Main.Sidebar
    	Category.Container.Parent = Main.Interactables
    	Category.UIListLayout.Parent = Main.Sidebar
    	firstCategory = false
    	return Category
	end
	
    Main.MainUI.Parent = game:GetService("CoreGui")
	Main.Motherframe.Parent = Main.MainUI
	Main.MotherframeE.Parent = Main.Motherframe
	Main.Shadow.Parent = Main.Motherframe
	Main.UICorner.Parent = Main.Motherframe
	Main.Title.Parent = Main.Motherframe
	Main.TitleLine.Parent = Main.Motherframe
	Main.Sidebar.Parent = Main.Motherframe
	Main.SidebarLine.Parent = Main.Motherframe
	Main.SidebarLineGradient.Parent = Main.SidebarLine
	Main.Interactables.Parent = Main.Motherframe
	Main.Interactables.ClipsDescendants = true
	return Main
end

return HexUI
