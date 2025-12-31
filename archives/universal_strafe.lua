if not funcs then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/wiird2012/roblox-scripts/master/funcs_2.lua"))()
end

getgenv().bhopinfo = {
    CurrentVel = 0, -- DONT TOUCH
    VelCap = 5.5,
    JumpBoostAmt = 5.5/5,
    groundamt = 4,
    RolvePatch = false, -- CHANGE false to true IF YOU WANT TO USE THIS ON ROLVE GAMES (CB:RO ARSENAL)
    JPatch = false -- if game somehow does not fire JumpRequest causing it to break
}

getgenv().bhopinfo.JumpBoostAmt = getgenv().bhopinfo.VelCap/5

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
                return false
            elseif farness <= getgenv().bhopinfo.groundamt then
                return true
            end
        end
    end
end

getgenv().bhopinfo.setg = function()
    getgenv().bhopinfo.groundamt = checkOnGround(getchar(),true)
end

funcs.uip.JumpRequest:Connect(function()
    if (funcs.uip:IsKeyDown(Enum.KeyCode.W) == false) and (funcs.uip:IsKeyDown(Enum.KeyCode.A) or funcs.uip:IsKeyDown(Enum.KeyCode.D) ) == true and getgenv().bhopinfo.CurrentVel < getgenv().bhopinfo.VelCap then
        getgenv().bhopinfo.CurrentVel = getgenv().bhopinfo.CurrentVel + getgenv().bhopinfo.JumpBoostAmt
    end
end)

-- patchs games like restrict jumping honestly really any other game --
local function stt(thech)
    local hum = thech:WaitForChild("Humanoid",20)
    if hum and hum:IsA("Humanoid") then
        hum.StateChanged:Connect(function(oldstate,newstate)
            if newstate == Enum.HumanoidStateType.Landed then -- if we've landed after we've jumped then allow us to jump again, essentially breaking the jump cooldown
                hum:SetStateEnabled(Enum.HumanoidStateType.Jumping,true)
            end
        end)
    end
end
stt(getchar())
funcs.lplr.CharacterAdded:Connect(stt)
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
    end
    if funcs.uip:IsKeyDown(Enum.KeyCode.Space) == false then
        getgenv().bhopinfo.CurrentVel = 0
    elseif funcs.uip:IsKeyDown(Enum.KeyCode.Space) == true and funcs.uip:IsKeyDown(Enum.KeyCode.W) then
        getgenv().bhopinfo.CurrentVel = math.clamp(getgenv().bhopinfo.CurrentVel - 0.01,0,getgenv().bhopinfo.VelCap)
    elseif funcs.uip:IsKeyDown(Enum.KeyCode.Space) == true then
        if bhopinfo.RolvePatch then 
            getchar():WaitForChild("Humanoid",10).Jump = true
        end -- patches rolve games
    end
end

task.spawn(function() -- spawn, wait, delay, and Debris are ALL SO BAD. NEVER RELY ON THEM. I am relying on them though because this is a exploit script, not much effort put into it
  while true do
    pcall(theroundabout)
        task.wait()
    end
end)

bhopinfo.setg()
