Character = game.Players.LocalPlayer.Character
game:GetService("RunService").Stepped:Connect(function()
    Character.Head.CanCollide = true
    Character.Torso.CanCollide = true
end)
