local UIS = game:GetService("UserInputService")

local bhopinfo = {
    CurrentVel = 0, -- DONT TOUCH
    VelCap = 3,
    JumpBoostAmt = 0.1
    local evpatch = true
}

local RolvePatch = false -- CHANGE false to true IF YOU WANT TO USE THIS ON ROLVE GAMES (CB:RO ARSENAL)

if bhopinfo.evpatch then

getgenv().bhopinfo.jp=getchar():WaitForChild("Humanoid",10).JumpPower
getgenv().bhopinfo.jh=getchar():WaitForChild("Humanoid",10).JumpHeight
end
getgenv().bhopinfo.JumpBoostAmt=getgenv().bhopinfo.VelCap/5

local helper = {
    getChar = function()
        return game.Players.LocalPlayer.Character
    end
}

local function checkOnGround(char)
    local ray = Ray.new(char.HumanoidRootPart.Position,-(char.HumanoidRootPart.CFrame.UpVector * 100))
    local part, pos = workspace:FindPartOnRay(ray,char)
    
    if part then
        if pos then
            local farness = math.ceil((char.HumanoidRootPart.Position - pos).Magnitude)
            if farness > 3 then    -- works with normal blocky r15 avatars.. sooo :l
                return false
            elseif farness <= 3 then
                return true
            end
        end
    end
end



UIS.JumpRequest:Connect(function()

    if (UIS:IsKeyDown(Enum.KeyCode.W) == false) and (UIS:IsKeyDown(Enum.KeyCode.A) or UIS:IsKeyDown(Enum.KeyCode.D)) == true and BhopInfo.CurrentVel < BhopInfo.VelCap then
        BhopInfo.CurrentVel = BhopInfo.CurrentVel + BhopInfo.JumpBoostAmt
    end
end)

-- patchs games like restrict jumping honestly really any other game --

local char = helper.getChar()

char.Humanoid.StateChanged:Connect(function(oldstate,newstate)
    if newstate == Enum.HumanoidStateType.Landed then -- if we've landed after we've jumped then allow us to jump again, essentially breaking the jump cooldown
        char.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,true)

        print("resetting jump cd")
    end
end)

-- patchs games like restrict jumping honestly really any other game --
local hum
local sttyp=Enum.HumanoidStateType.Jumping
local function stt(thech)
hum=thech:WaitForChild("Humanoid",20)
if hum and hum:IsA("Humanoid") then
if bhopinfo.evpatch then
bhopinfo.jp=hum.JumpPower>0 and hum.JumpPower
bhopinfo.jh=hum.JumpHeight>0 and hum.JumpHeight
hum:GetPropertyChangedSignal("JumpPower"):Connect(function(num)
if num and num >0 then bhopinfo.jp=num else hum.JumpPower=bhopinfo.jp end
end)
hum:GetPropertyChangedSignal("JumpHeight"):Connect(function(num)
if num and num >0 then bhopinfo.jh=num else hum.JumpHeight=bhopinfo.jh end
end)

end

hum.StateChanged:Connect(function(oldstate,newstate)
  if newstate == Enum.HumanoidStateType.Landed then -- if we've landed after we've jumped then allow us to jump again, essentially breaking the jump cooldown
      hum:SetStateEnabled(sttyp,true)

      --print("resetting jump cd")
  end
end)
end
end
stt(getchar())
funcs.lplr.CharacterAdded:Connect(stt)

if bhopinfo.evpatch then
local oldst_typ=hum:GetStateEnabled(sttyp)
local md
md=hookmetamethod(game,"__namecall",newcclosure(function(ins,...)
if not checkcaller() and hum then
local nmc=getnamecallmethod()
local args={...}
--local scr=getcallingscript()
if nmc=="GetStateEnabled" and ins==hum then
return oldst_typ
elseif #args>=1 and nmc=="SetStateEnabled" and ins==hum and args[1]==sttyp then
oldst_typ=not args[2] and false or true
return
elseif #args>=1 and nmc=="GetAttribute" and args[1]=="JumpingEnabled" then
return true
end

end

return md(ins,...)
end))

end

----------------------------------------

spawn(function() -- spawn, wait, delay, and Debris are ALL SO BAD. NEVER RELY ON THEM. I am relying on them though because this is a exploit script, not much effort put into it
    while true do
        local char = helper.getChar()
    
        if checkOnGround(char) == false and BhopInfo.CurrentVel ~= 0 then
            char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame + (char.HumanoidRootPart.CFrame.LookVector * BhopInfo.CurrentVel/6)
            print('hopping')
        end

        if UIS:IsKeyDown(Enum.KeyCode.Space) == false then
            BhopInfo.CurrentVel = 0
        elseif UIS:IsKeyDown(Enum.KeyCode.Space) == true and UIS:IsKeyDown(Enum.KeyCode.W) then
            BhopInfo.CurrentVel = math.clamp(BhopInfo.CurrentVel - 0.01,0,BhopInfo.VelCap)
        elseif UIS:IsKeyDown(Enum.KeyCode.Space) == true then
            if RolvePatch == true then char.Humanoid.Jump = true end -- patches rolve games
        end

        game:GetService("RunService").Stepped:Wait()
    end
end)
