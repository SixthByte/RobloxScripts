local noclip = true
char = game.Players.LocalPlayer.Character
while true do
if noclip == true then
for _,v in pairs(char:children()) do
pcall(function()
if v.className == "MeshPart" then
v.CanCollide = false
end
end)
end
end
game:service("RunService").Stepped:wait()
end
