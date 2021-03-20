local noclip = true -- Gets if you want the noclip
char = game.Players.LocalPlayer.Character -- Gets your player
while true do -- Make sure someone is in game
if noclip == true then
for _,v in pairs(char:children()) do
pcall(function()
if v.className == "Part" then
v.CanCollide = false
end
end)
end
end
game:service("RunService").Stepped:wait()
end
