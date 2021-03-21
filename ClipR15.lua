Character = game.Players.LocalPlayer.Character
game:GetService("RunService").Stepped:Connect(function()
    Character.Head.CanCollide = true
    Character.UpperTorso.CanCollide = true
    Character.LowerTorso.CanCollide = true
end)
