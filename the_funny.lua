-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local ImageLabel = Instance.new("ImageLabel")
local UICorner = Instance.new("UICorner")
local UIScale = Instance.new("UIScale")
local TextLabel = Instance.new("TextLabel")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ImageLabel.Parent = ScreenGui
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel.BorderSizePixel = 0
ImageLabel.Position = UDim2.new(0.296200424, 0, 0.201277956, 0)
ImageLabel.Size = UDim2.new(0, 510, 0, 374)
ImageLabel.Image = "rbxassetid://16746653331"

UICorner.CornerRadius = UDim.new(0, 50)
UICorner.Parent = ImageLabel

UIScale.Parent = ImageLabel

TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.300951004, 0, 0.718849838, 0)
TextLabel.Size = UDim2.new(0, 501, 0, 50)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "JOIN DISCORD LINKED BELOW FOR MORE"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextStrokeColor3 = Color3.fromRGB(85, 0, 255)
TextLabel.TextStrokeTransparency = 0.000
TextLabel.TextWrapped = true
