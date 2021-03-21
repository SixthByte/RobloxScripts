Character = game.Players.LocalPlayer.Character
game:GetService("RunService").Stepped:Connect(function()
    Character.Head.CanCollide = false
    Character.Torso.CanCollide = false
end)
