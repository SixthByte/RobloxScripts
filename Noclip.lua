Character = game.Players.LocalPlayer.Character
game:GetService("RunService").Stepped:Connect(function()
    Character.HumanoidRootPart.CanCollide = false
    Character.Head.CanCollide = false
    Character.UpperTorso.CanCollide = false
    Character.LowerTorso.CanCollide = false
    Character.LeftUpperArm.CanCollide = false
    Character.LeftLowerArm.CanCollide = false
    Character.LeftHand.CanCollide = false
    Character.RightUpperArm.CanCollide = false
    Character.RightLowerArm.CanCollide = false
    Character.RightHand.CanCollide = false
end)
