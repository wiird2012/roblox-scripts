--Credits to puer aeternus on v3rm
do
getgenv().funcs = funcs or {}
local playerservice = game:GetService("Players")
local function desfunc(x) if x~=nil then x:Destroy() end end local deb={['AddItem']=function(s,x,t) task.delay(t or 0,desfunc,x) end} deb.r=deb.AddItem
local lplr = playerservice.LocalPlayer
local runservice = game:GetService("RunService")
local rustepped = runservice.Stepped
local ruhb = runservice.Heartbeat
local tpserv = game:GetService("TeleportService")
funcs.tpsrv=tpserv
local ffind=table.find
local checkcaller=clonefunction(checkcaller)
getgenv().oldwait=wait
getgenv().wait = task.wait
getgenv().spawn=task.spawn --use task.spawn instead noob, locals faster we no want use globals
getgenv().funcs.runs = runservice
getgenv().funcs.deb = deb
getgenv().funcs.plrs = playerservice
getgenv().funcs.lplr = lplr
getgenv().funcs.uip=game:GetService("UserInputService")
getgenv().funcs.rawmeta=getrawmetatable(game)
funcs.protectedlist=funcs.protectedlist or {};
local newind
funcs.newind=funcs.newind or hookmetamethod(game,"__index",newcclosure(function(...)
local ret={rawget(funcs,"newind")(...)}
if not checkcaller() and #ret>=1 and ffind(rawget(funcs,"protectedlist"),ret[1]) then
return
end
return unpack(ret)
end))
funcs.nmcall=funcs.nmcall or hookmetamethod(game,"__namecall",newcclosure(function(...)
local ret={rawget(funcs,"nmcall")(...)}
if not checkcaller() and #ret>=1 and ffind(rawget(funcs,"protectedlist"),ret[1]) then
return
end
return unpack(ret)
end))
local function normalizeblue(nnnn) --changed from global to local, you most likely don't need this in your script or globals.
return "%"..nnnn
end
getgenv().funcs.normalizemagic = function(magic,p)
local str=string.gsub(magic,"[%(+%)+%^+%*+%$+%.+%[+%]+%++%-+%?+%%+]",normalizeblue)
return p and str[1] or str
end

local oldgp=getproperties
funcs.getproperties=syn and oldgp or function(ins)
local gpr=oldgp(ins)
if #gpr>=1 then
local tb={} for i,v in next,gpr do local s,r=pcall(gethiddenproperty,ins,v) if s then tb[v]=r end end gpr=tb
end
return gpr
end
getgenv().oldgetprop=funcs.getproperties
getgenv().getproperties=funcs.getproperties

funcs.rndmstr=function(minim,lenim)
local array = {}
local length = math.random(minim or 10,lenim or 20)
for i = 1, length do
array[i] = string.char(math.random(32, 126))
end
array=table.concat(array)
local rndm=math.random(1,4);
if rndm==1 then
array=array..tostring(math.random(1,9999999))
elseif rndm==2 then
array=tostring(math.random(1,9999999))..array
end
return array
end
getgenv().getchar=function(x,y,p)
p=p or funcs.lplr
local ch=p.Character or p.CharacterAdded:Wait()
if ch and x~=nil then
return y and ch:FindFirstChildWhichIsA(x) or not y and ch:FindFirstChild(x)
else
return ch
end
end
getgenv().funcs.rebindsl = function(KEYS)
local mouseLockController = funcs.lplr.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("CameraModule"):WaitForChild("MouseLockController")
local obj = mouseLockController:FindFirstChild("BoundKeys")
if obj then
obj.Value = KEYS
else
obj = Instance.new("StringValue")
obj.Name = "BoundKeys"
obj.Value = KEYS
obj.Parent = mouseLockController
end
end

local con
getgenv().funcs.autoc1 = function()
if not con then
funcs.sendnotif("autoclicker","loaded","rbxassetid://8209859518",3)

local mym = funcs.lplr:GetMouse()
getgenv().XxautocxX = false
con = funcs.uip.InputBegan:Connect(function(inpuut,proc)
if inpuut.UserInputType == Enum.UserInputType.Keyboard and funcs.uip:IsKeyDown(Enum.KeyCode.Q) and inpuut.KeyCode == Enum.KeyCode.X then
getgenv().XxautocxX = not getgenv().XxautocxX
if XxautocxX then funcs.sendnotif("autoclicker","enabled (q+x)","rbxassetid://8209859518",3) else funcs.sendnotif("autoclicker","disabled","rbxassetid://8209859518",3) end
while XxautocxX and con do
mouse1click()
mouse1click()
task.wait()
end
end
end)
else
funcs.sendnotif("autoclicker","removed","rbxassetid://8209859518",7)
con:Disconnect() con=nil
end
end
getgenv().funcs.instanceholder = funcs.instanceholder or Instance.new("Folder")
funcs.instanceholder.Name=math.random(1,99999999)
table.insert(funcs.protectedlist,funcs.instanceholder)
funcs.instanceholder.Parent=game:GetService("CoreGui")
getgenv().funcs.getholder=function(name)
local fd=name and funcs.instanceholder:FindFirstChild(name)
if not fd then
fd=Instance.new("Folder")
fd.Name=tostring(name) or #funcs.instanceholder:GetChildren()+1
fd.Parent=funcs.instanceholder
end
return fd
end
local function verval(vals,def)

if type(vals)=='table' then
for i,v in next,vals do
if v~= nil then
return v
end
end
elseif vals~=nil then
return vals
end
return def
end
funcs.hookedinst={}
getgenv().funcs.addhook=function(v,tb)
v=v:IsA("Model") and (v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Head") or v.PrimaryPart or v:FindFirstChildOfClass("BasePart")) or v
if not v then return 'fish_not_found' end
tb=tb or {}
tb={["maxdis"]=verval({tb.maxdis,tb.maxdist,tb.maxdistance},math.huge),
["color"]=verval({tb.color;tb.txtcolor},Color3.fromRGB(255,255,255)),
} and v.Name or v.Parent.Name
local fh=tb["1h"] and funcs.hookedinst[v]
for x,n in next,funcs.hookedinst do if not x or not n then table.remove(funcs.hookedinst,x) end end
if fh and fh.toreturn and fh.toreturn.justquit then fh.toreturn.justquit() end
funcs.hookedinst[v]=tb
if getproperties(v).Size then
       local a = Instance.new("BoxHandleAdornment")
       a.Size = v.Size
       a.AlwaysOnTop = tb['aot']
       a.Parent = tb.job
       a.ZIndex = 1
       a.Transparency = tb.transp
       a.Adornee = v
       a.Color3 = tb.color
a.Name=v.Name
tb.toreturn.box=a
end
if tb.txtenabled then
       local b = Instance.new("BillboardGui")
       b.Adornee = v
       b.MaxDistance = tb.maxdis
       b.AlwaysOnTop = true
       b.Parent = tb.job
       b.ExtentsOffset = tb.offset
       b.Size = UDim2.fromScale(4,2)
b.Name=v.Name
tb.toreturn.billboardgui=b
       local c = Instance.new("TextLabel")
       c.Text = tb.text or v.Parent.Name
       c.BackgroundTransparency = 1
       c.Size = UDim2.fromScale(1,1)
       c.TextScaled = true
       c.Parent = b
       c.TextColor3 = tb.txtcolor
tb.toreturn.textbox=c
if tb["rez"] and tb.toreturn.box then
local function M_e_M_e_M_e()
if c~=nil then
c.TextWrap=false
c.TextScaled=false
end
end
local function M_L_M_L_M_L()
if c~=nil then
c.TextWrap=true
c.TextScaled=true
end
end
tb.toreturn.box.MouseEnter:Connect(M_e_M_e_M_e)
tb.toreturn.box.MouseLeave:Connect(M_L_M_L_M_L)
end
end

tb.toreturn.justquit=function()
if not tb then return end
for i,vv in next,tb.toreturn do
if typeof(vv)=='Instance' then
funcs.deb:AddItem(vv,0)
end
tb.toreturn[i]=nil
end
for i,vv in next,tb.cons do
if vv then vv:Disconnect() end
end
funcs.hookedinst[v]=nil
v,tb=nil,nil
end
if tb.autorem then
--if a then a:GetPropertyChangedSignal("Adornee"):Connect(tb.autorema) end
--if b then b:GetPropertyChangedSignal("Adornee"):Connect(tb.autoremb) end
table.insert(tb.cons,v.AncestryChanged:Connect(function(x,y) if not y and tb and tb.toreturn and tb.toreturn.justquit then tb.toreturn.justquit() end end))
table.insert(tb.cons,v.Destroying:Connect(tb.toreturn.justquit))
end

for i,x in next,tb.dep do
if typeof(x)=="Instance" then
table.insert(tb.cons,x.Destroying:Connect(tb.toreturn.justquit))
elseif typeof(x)=="RBXScriptSignal" then
table.insert(tb.cons,x:Connect(tb.toreturn.justquit))
end
end
return tb.toreturn
end

getgenv().funcs.toplaceid = function(id,jid)
funcs.lplr:Kick()
task.wait(.5)
if not jid then tpserv:Teleport(id,Lplr) else  tpserv:TeleportToPlaceInstance(id or game.PlaceId, jid or game.JobId, funcs.lplr) end
end
getgenv().funcs.sg = game:GetService("StarterGui")
getgenv().funcs.sendnotif = function(top,bottomtextuwu,icopain,durrrrr)
funcs.sg:SetCore("SendNotification", {
['Title'] = top or "";
['Text'] = bottomtextuwu or ""; -- bottom text uwu
['Icon'] = icopain or "rbxassetid://9101806464";
['Duration'] = durrrrr or 5; -- durrrrr in seconds
})
end
local http=game:GetService('HttpService')
funcs.httpsrv=http
getgenv().funcs.save = function(name,data,encode)
if encode then
writefile(name,http:JSONEncode(data))
else
writefile(name,data)
end
end
getgenv().funcs.load = function(name,default)

if not isfile(name) then writefile(name, http:JSONEncode(default)) end

return http:JSONDecode(readfile(name))
end
getgenv().funcs.sl = function()
funcs.lplr.DevEnableMouseLock = not funcs.lplr.DevEnableMouseLock
end
getgenv().funcs.xgetplr = function(String,mode) --Timeless/xFunnieuss/reviz admin/oofkohls v2
   local Found = {}
   local Target = String:lower()
local curp=playerservice:GetPlayers()
       for i,v in next,curp do
           if v.Name:lower():sub(1, #String) == String:lower() then
               table.insert(Found,v)
           end
       end
  for i,v in next,curp do
           if not table.find(Found,v) and v.DisplayName:lower():sub(1, #String) == String:lower() then
               table.insert(Found,v)
           end
       end
   return not mode and Found or Found[1]    
end
getgenv().funcs.kickblur = function()
runservice:SetRobloxGuiFocused(false)
end
getgenv().funcs.rem = function(x,xx)
local im = x:WaitForChild(tostring(xx),20)
if im ~= nil then
deb:AddItem(im,0)
end
end
local function tablematch(x,y)
for ii,vv in next,x do if y[ii] and y[ii]~=vv then return false end end
return true
end
options=options or {}
funcs.wfcofclass(parent: Instance, class: string, RELEASEDATE: number?, recursive: boolean?, options: table?)
options={
reqprop={"Name"="amongus"} --only return if Instance.Name=amongus
reqhprop={"HiddenImpostor"="Coral"} -- only return if <hidden> Instance.HiddenImpostor="Coral"
}
--infinite yield fe code (rj)
getgenv().rj = function() --infinite yield
funcs.lplr:Kick("\nRejoining...")
task.wait(.5)
if #playerservice:GetPlayers() <= 1 then tpserv:Teleport(game.PlaceId, funcs.lplr) else tpserv:TeleportToPlaceInstance(game.PlaceId, game.JobId, funcs.lplr) end
end
--charfuncs ^
getgenv().funcs_loaded = true