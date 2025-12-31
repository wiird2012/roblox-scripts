--BROKEN

local player = game.Players.LocalPlayer

while wait(1) do
local snovel = workspace.WaitForChild("Snovel")
snovel.CFrame = CFrame.new("player.Character.HumanoidRootPart")
end
wait(10)
player:Kick("Rejoining\nif this fails report it")
while wait(1) do
game.TeleportService:Teleport(game.PlaceId, player)
end
