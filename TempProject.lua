local AM = loadstring(game:HttpGet("https://pastebin.com/raw/7Z6TzFnv"))():CreateWindow({
  text = "Azure Mines"
})

AM:AddBox("TP to Ore", function(object, focus)
  if focus then
    for _,v in pairs(game.Workspace.Mine:GetChildren()) do
    if string.match(v.Name, object.Text) then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
	game:GetService("Workspace").Players[game.Players.LocalPlayer.Name].Pickaxe.SetTarget:InvokeServer(v)
	game:GetService("Workspace").Players[game.Players.LocalPlayer.Name].Pickaxe.Activation:FireServer(true)
end
end
end
end)

AM:AddButton("Ore List", function()
  local OL = library:CreateWindow({
    text = "Ores List"
  })
  OL:AddLabel('Stone');
  OL:AddLabel('Coal');
  OL:AddLabel('Copper');
  OL:AddLabel('Iron');
  OL:AddLabel('Silver');
  OL:AddLabel('Ruby');
  OL:AddLabel('Sapphire');
  OL:AddLabel('Emerald');
  OL:AddLabel('Sulfur');
  OL:AddLabel('Gold');
  OL:AddLabel('Diamond');
  OL:AddLabel('Opal');
  OL:AddLabel('Uranium');
  OL:AddLabel('Moonstone');
  OL:AddLabel('Baryte');
  OL:AddLabel('Topaz');
  OL:AddLabel('Unobtainium');
  OL:AddLabel('Plutonium');
  OL:AddLabel('Illuminunium');
  OL:AddLabel('Amethyst');
  OL:AddLabel('Dragonglass');
  OL:AddLabel('Rainbonite');
  OL:AddLabel('Serendibite');
  OL:AddLabel('Azure');
  OL:AddLabel('Painite');
  OL:AddLabel('Kappite');
  OL:AddLabel('Boomite');
  OL:AddLabel('Ambrosia');
  OL:AddLabel('Twitchite');
  OL:AddLabel('Platinum');
  OL:AddLabel('Mithril');
end)

AM:AddButton("Remove Stone", function()
  for i,v in pairs(game.Workspace.Mine:GetChildren()) do
  if string.match(v.Name, "Stone") then
  v:Remove()
end
end
end)

AM:AddButton("Max Level", function()
  game:GetService("Players").LocalPlayer.Level.Value = 12
end)

AM:AddButton("Hide Name", function()
  game:GetService("Workspace").Players[game.Players.LocalPlayer.Name].PlayerBillboard:Destroy()
end)

AM:AddButton("Reload Character", function()
  game:GetService("ReplicatedStorage").LoadData:InvokeServer()
  game:GetService("ReplicatedStorage").IsWhitelisted:InvokeServer()
  game:GetService("ReplicatedStorage").GetData:InvokeServer()
  game:GetService("ReplicatedStorage").LoadCharacter:InvokeServer()
end)

AM:AddButton("Re-Stock Market", function()
  game:GetService("ReplicatedStorage").RefreshDeals:InvokeServer()
end)

AM:AddButton("Collect XP", function()
  for i,v in pairs(game:GetService("Workspace").Tycoons:GetChildren()) do
	  if v.Owner.Value == game:GetService("Players")[game.Players.LocalPlayer.Name] then
	    local XP = Instance.new("Part", workspace)
        XP.Name = "XP"
        XP.CFrame = CFrame.new(v.Items.Data.Pad.Position)
        XP.Anchored = true
        XP.CanCollide = false
        XP.Transparency = 1
	end
	end
    for i,v in pairs(game:GetService("Workspace").Tycoons:GetChildren()) do
	  if v.Owner.Value == game:GetService("Players")[game.Players.LocalPlayer.Name] then
		v.Items.Data.Pad.CanCollide = false
	    v.Items.Data.Pad.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
		wait(5)
	    v.Items.Data.Pad.CFrame = CFrame.new(game.Workspace:FindFirstChild("XP").Position)
	    v.Items.Data.Pad.CanCollide = true
end
end
end)

AM:AddButton("Collect Coins", function()
  for i,v in pairs(game:GetService("Workspace").Tycoons:GetChildren()) do
	  if v.Owner.Value == game:GetService("Players")[game.Players.LocalPlayer.Name] then
	    local CC = Instance.new("Part", workspace)
        CC.Name = "CC"
        CC.CFrame = CFrame.new(v.Items.Mine.Pad.Position)
        CC.Anchored = true
        CC.CanCollide = false
        CC.Transparency = 1
	end
	end
    for i,v in pairs(game:GetService("Workspace").Tycoons:GetChildren()) do
	  if v.Owner.Value == game:GetService("Players")[game.Players.LocalPlayer.Name] then
		v.Items.Mine.Pad.CanCollide = false
	    v.Items.Mine.Pad.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
		wait(5)
	    v.Items.Mine.Pad.CFrame = CFrame.new(game.Workspace:FindFirstChild("CC").Position)
	    v.Items.Mine.Pad.CanCollide = true
end
end
end)

AM:AddButton("Set Warp", function()
  if game.Workspace:FindFirstChild("WarpPoint", true) then 
	game.Workspace.WarpPoint.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
  else
	local warpPoint = Instance.new("Part", workspace)
    warpPoint.Name = "WarpPoint"
    warpPoint.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
    warpPoint.Anchored = true
    warpPoint.CanCollide = false
    warpPoint.Transparency = 1
end
end)

AM:AddButton("Teleport to Warp", function()
  if game.Workspace:FindFirstChild("WarpPoint", true) then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Workspace.WarpPoint.Position)
  else return end
end)

AM:AddButton("Teleport to Zombie", function()
  for i, v in pairs(game:GetService("Workspace").Mine:GetChildren()) do
      if (v.Name == "Zombie" or "Zwambie" and v:IsA("Model")) then
	    if v:FindFirstChild("Humanoid", true) then
	      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Torso.Position)
end
end
end
end)

AM:AddButton("Teleport to Sword", function()
  if game.Workspace:FindFirstChild("TPS", true) then 
	game.Workspace.TPS.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
  else
	local tpsPoint = Instance.new("Part", workspace)
    tpsPoint.Name = "TPS"
    tpsPoint.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
    tpsPoint.Anchored = true
    tpsPoint.CanCollide = false
    tpsPoint.Transparency = 1
  end
  wait(0.1)
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Workspace").Sword.Position)
  wait(0.1)
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Workspace.TPS.Position)
end)

AM:AddToggle("Remove Zombies", function(state)
  _G.RZ = not state
  while true do wait(0.5)
    if _G.RZ then return end
      for i, v in pairs(game:GetService("Workspace").Mine:GetChildren()) do
        if (v.Name == "Zombie" or "Zwambie" and v:IsA("Model")) then
	      v:Destroy()
end
end
end
end)

AM:AddToggle("Remove Boomite", function(state)
  _G.RB = not state
  while true do wait(0.5)
    if _G.RB then return end
      for i,v in pairs(game:GetService("Workspace"):FindFirstChild("Mine"):GetChildren()) do
        if (v.Name == "Boomite" and v:IsA("BasePart")) then
          v:Destroy()
end
end
end
end)

AM:AddToggle("Remove Fog", function(state)
  _G.RF = not state
  while true do wait(0.5)
    if _G.RF then return end
    game:GetService("Lighting").FogStart = 0
    wait(1)
    game:GetService("Lighting").FogEnd  = 9e9
    game:GetService("Lighting").GlobalShadows = false
    if game:GetService("Workspace").Players[game.Players.LocalPlayer.Name]:FindFirstChild("FixTheDark", true) then
	  game:GetService("Workspace").Players[game.Players.LocalPlayer.Name].FixTheDark:Destroy()
end
end
end)

AM:AddToggle("X-Ray", function(state)
  if state then
  local model = game.Workspace.Mine
  local children = model:GetChildren()
  for i =1, #children do
  if children[i] ~= nil then
  if children[i].Name == "Stone" then
  children[i].Transparency = 0.8
end
end
end
  elseif not state then
  local model = game.Workspace.Mine
  local children = model:GetChildren()
  for i =1, #children do
  if children[i] ~= nil then
  if children[i].Name == "Stone" then
  children[i].Transparency = 0
end
end
end
end
end)

AM:AddToggle("Auto-Storage", function(state)
  _G.AS = not state
  while true do wait(0.5)
    if _G.AS then return end
    game:GetService("ReplicatedStorage").MoveAllItems:InvokeServer()
end
end)

AM:AddToggle("Auto-Mine", function(state)
  if state then
	game:GetService("Workspace").Players[game.Players.LocalPlayer.Name].Pickaxe.Activation:FireServer(true)
  elseif not state then
	game:GetService("Workspace").Players[game.Players.LocalPlayer.Name].Pickaxe.Activation:FireServer(false)
  else return end
end)

AM:AddToggle("Brightness", function(state)
  _G.B = not state
  while true do wait(1)
    if _G.B then game.Players.LocalPlayer.Character.Head.HeadLit:remove() return end
    local lit = Instance.new("PointLight")
    lit.Name = "HeadLit"
    lit.Brightness = 10000000
    lit.Range = math.huge
    lit.Parent = game.Players.LocalPlayer.Character.Head
end
end)

AM:AddLabel("Open a gui while mining");

local dropdown;
dropdown = AM:AddDropdown({'None', 'Forge', 'Marketplace', 'Storage', 'Build'}, function(a)
if a == 'None' then
return end
if a == 'Forge' then
game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild('Forge').Visible = true
elseif a == 'Marketplace' then
game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild('Marketplace').Visible = true
elseif a == 'Storage' then
game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild('Storage').Visible = true
elseif a == 'Build' then
game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild('Build').Visible = true
end
end)
