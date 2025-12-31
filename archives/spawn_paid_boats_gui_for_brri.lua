--old

-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local GUI = Instance.new("ImageLabel")
local UICorner = Instance.new("UICorner")
local Wait = Instance.new("TextBox")
local UICorner_2 = Instance.new("UICorner")
local Dinghy = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local PartyBoat = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")
local WeirdBoat = Instance.new("TextButton")
local UICorner_5 = Instance.new("UICorner")
local IronClad = Instance.new("TextButton")
local UICorner_6 = Instance.new("UICorner")

--Properties:

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Name = game.HttpService:GenerateGUID()

GUI.Name = "GUI"
GUI.Parent = ScreenGui
GUI.Active = true
GUI.AnchorPoint = Vector2.new(0.5, 0.5)
GUI.BackgroundColor3 = Color3.fromRGB(75, 0, 130)
GUI.BorderSizePixel = 0
GUI.Position = UDim2.new(0.5, 0, 0.516932249, 0)
GUI.Size = UDim2.new(0, 147, 0, 232)
GUI.Image = "rbxassetid://1490323181"
GUI.ImageColor3 = Color3.fromRGB(255, 0, 255)

UICorner.Parent = GUI

Wait.Name = "Wait"
Wait.Parent = GUI
Wait.AnchorPoint = Vector2.new(0.5, 0.5)
Wait.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Wait.Position = UDim2.new(0.5, 0, 0.106014438, 0)
Wait.Size = UDim2.new(0, 131, 0, 26)
Wait.Font = Enum.Font.GothamBlack
Wait.PlaceholderText = "Wait"
Wait.Text = ""
Wait.TextColor3 = Color3.fromRGB(0, 0, 0)
Wait.TextScaled = true
Wait.TextSize = 14.000
Wait.TextWrapped = true

UICorner_2.Parent = Wait

Dinghy.Name = "Dinghy"
Dinghy.Parent = GUI
Dinghy.BackgroundColor3 = Color3.fromRGB(85, 0, 127)
Dinghy.Position = UDim2.new(0.0510204136, 0, 0.245758638, 0)
Dinghy.Size = UDim2.new(0, 131, 0, 26)
Dinghy.Font = Enum.Font.GothamBlack
Dinghy.Text = "Spawn Dinghy"
Dinghy.TextColor3 = Color3.fromRGB(255, 255, 255)
Dinghy.TextScaled = true
Dinghy.TextSize = 14.000
Dinghy.TextWrapped = true

UICorner_3.Parent = Dinghy

PartyBoat.Name = "PartyBoat"
PartyBoat.Parent = GUI
PartyBoat.BackgroundColor3 = Color3.fromRGB(85, 0, 127)
PartyBoat.Position = UDim2.new(0.0510204136, 0, 0.44178912, 0)
PartyBoat.Size = UDim2.new(0, 131, 0, 26)
PartyBoat.Font = Enum.Font.GothamBlack
PartyBoat.Text = "Spawn Party Boat"
PartyBoat.TextColor3 = Color3.fromRGB(255, 255, 255)
PartyBoat.TextScaled = true
PartyBoat.TextSize = 14.000
PartyBoat.TextWrapped = true

UICorner_4.Parent = PartyBoat

WeirdBoat.Name = "WeirdBoat"
WeirdBoat.Parent = GUI
WeirdBoat.BackgroundColor3 = Color3.fromRGB(85, 0, 127)
WeirdBoat.Position = UDim2.new(0.0510204136, 0, 0.641789079, 0)
WeirdBoat.Size = UDim2.new(0, 131, 0, 26)
WeirdBoat.Font = Enum.Font.GothamBlack
WeirdBoat.Text = "Spawn Weird Boat"
WeirdBoat.TextColor3 = Color3.fromRGB(255, 255, 255)
WeirdBoat.TextScaled = true
WeirdBoat.TextSize = 14.000
WeirdBoat.TextWrapped = true

UICorner_5.Parent = WeirdBoat

IronClad.Name = "IronClad"
IronClad.Parent = GUI
IronClad.BackgroundColor3 = Color3.fromRGB(85, 0, 127)
IronClad.Position = UDim2.new(0.0510204136, 0, 0.83180517, 0)
IronClad.Size = UDim2.new(0, 131, 0, 26)
IronClad.Font = Enum.Font.GothamBlack
IronClad.Text = "Spawn Iron Clad"
IronClad.TextColor3 = Color3.fromRGB(255, 255, 255)
IronClad.TextScaled = true
IronClad.TextSize = 14.000
IronClad.TextWrapped = true

UICorner_6.Parent = IronClad

-- Scripts:

local function ZZUJPL_fake_script() -- Dinghy.Spawn 
	local script = Instance.new('LocalScript', Dinghy)

	script.Parent.MouseButton1Click:Connect(function()
	
	local W = script.Parent.Parent.Wait
	local NumberValue = tonumber(W.Text)
	local mouse = game.Players.LocalPlayer:GetMouse()
	wait(tonumber(W.Text))
	local A_1 = "Dinghy"
	local A_2 = Vector3.new(mouse.Hit.x, mouse.Hit.y + 5, mouse.Hit.z)
	local Event = game:GetService("Workspace").SpawnBoat.RequestBoat
	Event:FireServer(A_1, A_2)
	end)
end
coroutine.wrap(ZZUJPL_fake_script)()
local function VTCEXZH_fake_script() -- GUI.SmoothDrag 
	local script = Instance.new('LocalScript', GUI)

	local Drag = script.Parent.Parent.GUI
	gsCoreGui = game:GetService("CoreGui")
	gsTween = game:GetService("TweenService")
	local UserInputService = game:GetService("UserInputService")
		local dragging
		local dragInput
		local dragStart
		local startPos
		local function update(input)
			local delta = input.Position - dragStart
			local dragTime = 0.09
			local SmoothDrag = {}
			SmoothDrag.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
			local dragSmoothFunction = gsTween:Create(Drag, TweenInfo.new(dragTime, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), SmoothDrag)
			dragSmoothFunction:Play()
		end
		Drag.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				dragging = true
				dragStart = input.Position
				startPos = Drag.Position
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragging = false
					end
				end)
			end
		end)
		Drag.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				dragInput = input
			end
		end)
		UserInputService.InputChanged:Connect(function(input)
			if input == dragInput and dragging and Drag.Size then
				update(input)
			end
		end)
	
end
coroutine.wrap(VTCEXZH_fake_script)()
local function EBRFUZ_fake_script() -- PartyBoat.Spawn 
	local script = Instance.new('LocalScript', PartyBoat)

	script.Parent.MouseButton1Click:Connect(function()
	
	local W = script.Parent.Parent.Wait
	local NumberValue = tonumber(W.Text)
	local mouse = game.Players.LocalPlayer:GetMouse()
	wait(tonumber(W.Text))
	local A_1 = "PartyBoat"
	local A_2 = Vector3.new(mouse.Hit.x, mouse.Hit.y + 5, mouse.Hit.z)
	local Event = game:GetService("Workspace").SpawnBoat.RequestBoat
	Event:FireServer(A_1, A_2)
	end)
end
coroutine.wrap(EBRFUZ_fake_script)()
local function NXOW_fake_script() -- WeirdBoat.Spawn 
	local script = Instance.new('LocalScript', WeirdBoat)

	script.Parent.MouseButton1Click:Connect(function()
	
	local W = script.Parent.Parent.Wait
	local NumberValue = tonumber(W.Text)
	local mouse = game.Players.LocalPlayer:GetMouse()
	wait(tonumber(W.Text))
	local A_1 = "WeirdBoat"
	local A_2 = Vector3.new(mouse.Hit.x, mouse.Hit.y + 5, mouse.Hit.z)
	local Event = game:GetService("Workspace").SpawnBoat.RequestBoat
	Event:FireServer(A_1, A_2)
	end)
end
coroutine.wrap(NXOW_fake_script)()
local function HUFCR_fake_script() -- IronClad.Spawn 
	local script = Instance.new('LocalScript', IronClad)

	script.Parent.MouseButton1Click:Connect(function()
	
	local W = script.Parent.Parent.Wait
	local NumberValue = tonumber(W.Text)
	local mouse = game.Players.LocalPlayer:GetMouse()
	wait(tonumber(W.Text))
	local A_1 = "IronClad"
	local A_2 = Vector3.new(mouse.Hit.x, mouse.Hit.y + 5, mouse.Hit.z)
	local Event = game:GetService("Workspace").SpawnBoat.RequestBoat
	Event:FireServer(A_1, A_2)
	end)
end
coroutine.wrap(HUFCR_fake_script)()
local function KMETRP_fake_script() -- ScreenGui.Toggle 
	local script = Instance.new('LocalScript', ScreenGui)

	local mouse = game.Players.LocalPlayer:GetMouse()
	local gui = script.Parent.GUI
	
	mouse.KeyDown:connect(function(key)
	    if key ==  "q" then
	        gui.Visible = not gui.Visible
	    end
	end)
	
end
coroutine.wrap(KMETRP_fake_script)()
local function UVUJB_fake_script() -- ScreenGui.Notification 
	local script = Instance.new('LocalScript', ScreenGui)

	game.StarterGui:SetCore("SendNotification", {
	Title = "Press Q to toggle the GUI";
	Text = "";
	Button1 = "Close";
	Duration = 5;
	})
	
end
coroutine.wrap(UVUJB_fake_script)()
