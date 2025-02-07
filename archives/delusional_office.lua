-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Header = Instance.new("TextLabel")
local Destroy = Instance.new("TextButton")
local Godmode = Instance.new("TextButton")
local Nodash = Instance.new("TextButton")
local Dashboost = Instance.new("TextButton")
local Credits = Instance.new("TextLabel")
local UIScale = Instance.new("UIScale")
local Toggle = Instance.new("TextButton")
local UIScale_2 = Instance.new("UIScale")

--Properties:

ScreenGui.Parent = game:WaitForChild("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
Frame.BorderColor3 = Color3.fromRGB(170, 0, 0)
Frame.Position = UDim2.new(0.308080822, 0, 0.341346145, 0)
Frame.Size = UDim2.new(0, 304, 0, 197)

Header.Name = "Header"
Header.Parent = Frame
Header.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
Header.BorderColor3 = Color3.fromRGB(170, 0, 0)
Header.Size = UDim2.new(0, 266, 0, 25)
Header.Font = Enum.Font.Unknown
Header.Text = "Delusional_Office // 06/02/2025"
Header.TextColor3 = Color3.fromRGB(255, 255, 255)
Header.TextScaled = true
Header.TextSize = 14.000
Header.TextStrokeTransparency = 0.000
Header.TextWrapped = true

Destroy.Name = "Destroy"
Destroy.Parent = Frame
Destroy.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
Destroy.BorderColor3 = Color3.fromRGB(170, 0, 0)
Destroy.Position = UDim2.new(0.875, 0, 0, 0)
Destroy.Size = UDim2.new(0, 38, 0, 25)
Destroy.Font = Enum.Font.SourceSans
Destroy.Text = ""
Destroy.TextColor3 = Color3.fromRGB(0, 0, 0)
Destroy.TextSize = 14.000

Godmode.Name = "Godmode"
Godmode.Parent = Frame
Godmode.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
Godmode.BorderColor3 = Color3.fromRGB(170, 0, 0)
Godmode.Position = UDim2.new(0.0888157859, 0, 0.203184098, 0)
Godmode.Size = UDim2.new(0, 249, 0, 25)
Godmode.Font = Enum.Font.Code
Godmode.Text = "Godmode"
Godmode.TextColor3 = Color3.fromRGB(255, 255, 255)
Godmode.TextScaled = true
Godmode.TextSize = 14.000
Godmode.TextWrapped = true

Nodash.Name = "Nodash"
Nodash.Parent = Frame
Nodash.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
Nodash.BorderColor3 = Color3.fromRGB(170, 0, 0)
Nodash.Position = UDim2.new(0.0888157859, 0, 0.432048976, 0)
Nodash.Size = UDim2.new(0, 249, 0, 25)
Nodash.Font = Enum.Font.Code
Nodash.Text = "No dash cooldown"
Nodash.TextColor3 = Color3.fromRGB(255, 255, 255)
Nodash.TextScaled = true
Nodash.TextSize = 14.000
Nodash.TextWrapped = true

Dashboost.Name = "Dashboost"
Dashboost.Parent = Frame
Dashboost.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
Dashboost.BorderColor3 = Color3.fromRGB(170, 0, 0)
Dashboost.Position = UDim2.new(0.0890000015, 0, 0.661000013, 0)
Dashboost.Size = UDim2.new(0, 249, 0, 25)
Dashboost.Font = Enum.Font.Code
Dashboost.Text = "Dash boost"
Dashboost.TextColor3 = Color3.fromRGB(255, 255, 255)
Dashboost.TextScaled = true
Dashboost.TextSize = 14.000
Dashboost.TextWrapped = true

Credits.Name = "Credits"
Credits.Parent = Frame
Credits.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
Credits.BorderColor3 = Color3.fromRGB(170, 0, 0)
Credits.Position = UDim2.new(0, 0, 0.873096466, 0)
Credits.Size = UDim2.new(0, 304, 0, 25)
Credits.Font = Enum.Font.Unknown
Credits.Text = "Scripts by stx // UI by wiird2012"
Credits.TextColor3 = Color3.fromRGB(255, 255, 255)
Credits.TextScaled = true
Credits.TextSize = 14.000
Credits.TextStrokeTransparency = 0.000
Credits.TextWrapped = true

UIScale.Parent = Frame

Toggle.Name = "Toggle"
Toggle.Parent = ScreenGui
Toggle.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
Toggle.BorderColor3 = Color3.fromRGB(170, 0, 0)
Toggle.BorderSizePixel = 2
Toggle.Position = UDim2.new(0.896464646, 0, 0.459935904, 0)
Toggle.Size = UDim2.new(0, 50, 0, 50)
Toggle.Font = Enum.Font.SourceSans
Toggle.Text = ""
Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
Toggle.TextSize = 14.000

UIScale_2.Parent = Toggle

-- Scripts:

local function WEXN_fake_script() -- ScreenGui.Base 
	local script = Instance.new('LocalScript', ScreenGui)

	local Players = game:GetService("Players")
	
	local LocalPlayer = Players.LocalPlayer
	local Character = LocalPlayer.Character
	
	local Connection = getconnections(Character.AttributeChanged)[1]
	
	local EditDashCooldown = debug.getupvalue(Connection.Function, 2)
end
coroutine.wrap(WEXN_fake_script)()
local function XGIXRUV_fake_script() -- Destroy.LocalScript 
	local script = Instance.new('LocalScript', Destroy)

	local gui = script.Parent.Parent.Parent
	
	script.Parent.MouseButton1Click:Connect(function() 
		gui:Destroy()
	end)
end
coroutine.wrap(XGIXRUV_fake_script)()
local function HRPF_fake_script() -- Godmode.LocalScript 
	local script = Instance.new('LocalScript', Godmode)

	script.Parent.MouseButton1Click:Connect(function() 
		game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("EditValueCall"):FireServer("maxhealth", 1/0)
	end)
end
coroutine.wrap(HRPF_fake_script)()
local function FVBFIPS_fake_script() -- Nodash.LocalScript 
	local script = Instance.new('LocalScript', Nodash)

	script.Parent.MouseButton1Click:Connect(function() 
		debug.setupvalue(EditDashCooldown, 2, 0)
	end)
end
coroutine.wrap(FVBFIPS_fake_script)()
local function EGTBVRN_fake_script() -- Dashboost.LocalScript 
	local script = Instance.new('LocalScript', Dashboost)

	script.Parent.MouseButton1Click:Connect(function() 
		debug.setupvalue(EditDashCooldown, 3, 100)
	end)
end
coroutine.wrap(EGTBVRN_fake_script)()
local function GONA_fake_script() -- Frame.Drag 
	local script = Instance.new('LocalScript', Frame)

	local UserInputService = game:GetService("UserInputService")
	local runService = (game:GetService("RunService"));
	
	local gui = script.Parent
	
	local dragging
	local dragInput
	local dragStart
	local startPos
	
	function Lerp(a, b, m)
		return a + (b - a) * m
	end;
	
	local lastMousePos
	local lastGoalPos
	local DRAG_SPEED = (8); -- // The speed of the UI darg.
	function Update(dt)
		if not (startPos) then return end;
		if not (dragging) and (lastGoalPos) then
			gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, lastGoalPos.X.Offset, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, lastGoalPos.Y.Offset, dt * DRAG_SPEED))
			return 
		end;
	
		local delta = (lastMousePos - UserInputService:GetMouseLocation())
		local xGoal = (startPos.X.Offset - delta.X);
		local yGoal = (startPos.Y.Offset - delta.Y);
		lastGoalPos = UDim2.new(startPos.X.Scale, xGoal, startPos.Y.Scale, yGoal)
		gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, xGoal, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, yGoal, dt * DRAG_SPEED))
	end;
	
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
			lastMousePos = UserInputService:GetMouseLocation()
	
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	runService.Heartbeat:Connect(Update)
end
coroutine.wrap(GONA_fake_script)()
local function UYJL_fake_script() -- Toggle.LocalScript 
	local script = Instance.new('LocalScript', Toggle)

	local frame = script.Parent.Parent.Frame
	
	script.Parent.MouseButton1Click:Connect(function() 
		if frame.Visible == true then
			frame.Visible = false
		else
			frame.Visible = true
		end
	end)
end
coroutine.wrap(UYJL_fake_script)()
