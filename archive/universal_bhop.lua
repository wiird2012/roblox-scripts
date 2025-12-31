--broken

getgenv().bhopinfo = {
  CurrentVel = 0, -- DONT TOUCH
  VelCap = 3,
  JumpBoostAmt=3/5,
  groundamt=4,
  RolvePatch=false, -- enables autojumping
  JPatch=false, -- if game somehow does not fire JumpRequest causing it to break
  evpatch=true, --stops disabling jumping
}
if not funcs then
loadstring(game:HttpGet("https://raw.githubusercontent.com/wiird2012/roblox-scripts/master/funcs.lua"))()
end

if bhopinfo.evpatch then
getgenv().bhopinfo.jp=getchar():WaitForChild("Humanoid",10).JumpPower
getgenv().bhopinfo.jh=getchar():WaitForChild("Humanoid",10).JumpHeight
end
getgenv().bhopinfo.JumpBoostAmt=getgenv().bhopinfo.VelCap/5

local function checkOnGround(char,setg)
  local ray = Ray.new(char:WaitForChild("HumanoidRootPart",5).Position,-(char:WaitForChild("HumanoidRootPart",5).CFrame.UpVector * 100))
  local part, pos = workspace:FindPartOnRay(ray,char)
 
  if part then
      if pos then
          local farness = math.ceil((char:WaitForChild("HumanoidRootPart",10).Position - pos).Magnitude)
          if setg then        
  return farness        
  end
         
if farness > getgenv().bhopinfo.groundamt then    -- works with normal blocky r15 avatars.. sooo :l
              --print(farness,"False")
return false
          elseif farness <= getgenv().bhopinfo.groundamt then
            --print(farness,"true")    
return true
          end
      end
  end
end


getgenv().bhopinfo.setg=function()
getgenv().bhopinfo.groundamt=checkOnGround(getchar(),true)
end



funcs.uip.JumpRequest:Connect(function()

if getgenv().bhopinfo.CurrentVel < getgenv().bhopinfo.VelCap then
    getgenv().bhopinfo.CurrentVel = getgenv().bhopinfo.CurrentVel + getgenv().bhopinfo.JumpBoostAmt
    end
  --print("jreq")
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
if bhopinfo.JPatch then
funcs.uip.InputBegan:Connect(function(inp)
if inp.UserInputType == Enum.UserInputType.Keyboard then
if inp.KeyCode == Enum.KeyCode.Space then
while funcs.uip:IsKeyDown(Enum.KeyCode.Space) do
if not getchar():WaitForChild("Humanoid",10).Jump then
firesignal(funcs.uip.JumpRequest)
end
task.wait(.0033333333333333)
end

end
end
end)

end
local function theroundabout()

      if checkOnGround(getchar()) == false and getgenv().bhopinfo.CurrentVel ~= 0 then
          getchar():PivotTo(getchar():GetPivot() + (getchar():GetPivot().LookVector * getgenv().bhopinfo.CurrentVel/6))
          --print('hopping')
else
--print(funcs.uip:IsKeyDown(Enum.KeyCode.Space),funcs.uip:IsKeyDown(Enum.KeyCode.W),getgenv().bhopinfo.CurrentVel,checkOnGround(getchar()) )
      end

      if funcs.uip:IsKeyDown(Enum.KeyCode.Space) == false then
          getgenv().bhopinfo.CurrentVel = 0
     -- elseif funcs.uip:IsKeyDown(Enum.KeyCode.Space) == true and funcs.uip:IsKeyDown(Enum.KeyCode.W) then
     --    getgenv().bhopinfo.CurrentVel = math.clamp(getgenv().bhopinfo.CurrentVel - 0.01,0,getgenv().bhopinfo.VelCap)
      elseif bhopinfo.RolvePatch then
       getchar():WaitForChild("Humanoid",10).Jump = true -- patches rolve games
      end
end
task.spawn(function() -- spawn, wait, delay, and Debris are ALL SO BAD. NEVER RELY ON THEM. I am relying on them though because this is a exploit script, not much effort put into it
  while true do
  pcall(theroundabout)
      task.wait()
  end
end)
bhopinfo.setg()
