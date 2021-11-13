local StartupGui = Instance.new("ScreenGui")
local ImageFrame = Instance.new("Frame")
local Image = Instance.new("ImageLabel")
local Hex = Instance.new("ImageLabel")
local Sound = Instance.new("Sound")

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
Image.Image = "rbxassetid://7826686602"
Image.ImageTransparency = 1

Hex.Name = "Hex"
Hex.Parent = ImageFrame
Hex.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Hex.BackgroundTransparency = 1.000
Hex.Position = UDim2.new(-0.8, 0, -0.23, 0)
Hex.Size = UDim2.new(0, 270, 0, 100)
Hex.Image = "rbxassetid://7990079445"
Hex.ImageTransparency = 1

Sound.Name = "Windows11"
Sound.Parent = ImageFrame
Sound.SoundId = "rbxassetid://6958727243"
Sound.TimePosition = 1
Sound.Volume = 1.5
Sound:Play()
wait(0.1)
for i = 1, 0.3, -0.05 do
    Image.ImageTransparency = i
    wait(0.01)
end
wait(0.3)
for i = 0.03, 0, -0.5 do
    Image.ImageTransparency = i
    wait(0.01)
end
wait(1)

for v = 0, 1, 0.15 do
    Image.ImageTransparency = v
    wait(0.01)
end
StartupGui:Destroy()
