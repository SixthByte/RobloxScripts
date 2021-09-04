local StartupGui = Instance.new("ScreenGui")
local ImageFrame = Instance.new("Frame")
local Image = Instance.new("ImageLabel")

StartupGui.Name = "StartupGui"
StartupGui.Parent = game.CoreGui
StartupGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ImageFrame.Name = "ImageFrame"
ImageFrame.Parent = StartupGui
ImageFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageFrame.BackgroundTransparency = 1.000
ImageFrame.Position = UDim2.new(0.463396788, 0, 0.449752897, 0)
ImageFrame.Size = UDim2.new(0, 100, 0, 100)

Image.Name = "Image"
Image.Parent = ImageFrame
Image.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Image.BackgroundTransparency = 1.000
Image.Position = UDim2.new(-1.00641286, 0, -1.19648433, 0)
Image.Size = UDim2.new(0, 300, 0, 300)
Image.Image = "rbxassetid://7403268958"

wait(1.5)

Image.ImageTransparency = 0.1
wait(0.05)
Image.ImageTransparency = 0.2
wait(0.05)
Image.ImageTransparency = 0.3
wait(0.05)
Image.ImageTransparency = 0.4
wait(0.05)
Image.ImageTransparency = 0.5
wait(0.05)
Image.ImageTransparency = 0.6
wait(0.05)
Image.ImageTransparency = 0.7
wait(0.05)
Image.ImageTransparency = 0.8
wait(0.05)
Image.ImageTransparency = 0.9
wait(0.05)
StartupGui:Destroy()
