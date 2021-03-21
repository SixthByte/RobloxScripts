Character = game.Players.LocalPlayer.Character
game:GetService("RunService").Stepped:Connect(function()
    Character.Head.CanCollide = false
    Character.UpperTorso.CanCollide = false
    Character.LowerTorso.CanCollide = false
end)
