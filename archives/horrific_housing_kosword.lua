--only works when an anvil is in game

local A_1 = "Cloner"
local A_2 = "Cloner"
local A_3 = "Cloner"
local Event = game:GetService("ReplicatedStorage").EventRemotes.ForgeUltimateSword
Event:FireServer(A_1, A_2, A_3)
