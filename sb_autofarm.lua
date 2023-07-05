if game.PlaceId == 6403373529 or game.PlaceId == 11520107397 or game.PlaceId == 9015014224 then

if not game:IsLoaded() then
game.Loaded:Wait() --waits until the game is loaded to execute (remove if you want faster farming, removing this will make the autofarm more unstable)
end

local Http = game:GetService("HttpService")
local TPS = game:GetService("TeleportService")
local Api = "https://games.roblox.com/v1/games/"

local _place = game.PlaceId
local _servers = Api.._place.."/servers/Public?sortOrder=Asc&limit=100"
	
local char = game.Players.LocalPlayer.Character
if not char then continue end
	

print("[SB AutoFarm] Entering Arena...")

if not game.Players.LocalPlayer.Character:WaitForChild("entered") and game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then                            
	repeat task.wait(.005)                                
		firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1.TouchInterest.Parent, 0)
		firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1.TouchInterest.Parent, 1)
	until game.Players.LocalPlayer.Character:WaitForChild("entered")
end


print("[SB AutoFarm] Grabbing Slapples...")

for Index, Instance in next, workspace.Arena.island5.Slapples:GetDescendants() do
	if Instance.ClassName == "TouchTransmitter" then
		firetouchinterest(game.Players.LocalPlayer.Character.Head, Instance.Parent, 0)
		firetouchinterest(game.Players.LocalPlayer.Character.Head, Instance.Parent, 1)
	end
end


warn("[SB AutoFarm] Attempting Server Hop...")

function ListServers(cursor)
   local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
   return Http:JSONDecode(Raw)
end

local Server, Next; repeat
   local Servers = ListServers(Next)
   Server = Servers.data[1]
   Next = Servers.nextPageCursor
until Server

TPS:TeleportToPlaceInstance(_place,Server.id,game.Players.LocalPlayer)


wait(10) --secs before retrying serverhop, edit to ur liking

while true do

warn("[SB AutoFarm] Attempting Server Hop (again)...")

wait(10) --secs before retrying serverhop, edit to ur liking
	function ListServers(cursor)
	   local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
	   return Http:JSONDecode(Raw)
	end

	local Server, Next; repeat
	   local Servers = ListServers(Next)
	   Server = Servers.data[1]
	   Next = Servers.nextPageCursor
	until Server

	TPS:TeleportToPlaceInstance(_place,Server.id,game.Players.LocalPlayer)
end

else

warn("[SB AutoFarm] Invalid/Unsupported Game!\nSupported Games: SB Regular, Killstreak Only, No OneShots")

end
