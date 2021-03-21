Character = game.Players.LocalPlayer.Character
game:GetService("RunService").Stepped:Connect(function()
    Character.HumanoidRootPart.CanCollide = false
    Character.Head.CanCollide = true
    Character.UpperTorso.CanCollide = true
    Character.LowerTorso.CanCollide = true
    Character.LeftUpperArm.CanCollide = false
    Character.LeftLowerArm.CanCollide = false
    Character.LeftHand.CanCollide = false
    Character.RightUpperArm.CanCollide = false
    Character.RightLowerArm.CanCollide = false
    Character.RightHand.CanCollide = false
end)
