plrName = game.Players.LocalPlayer.Name

game:GetService('RunService').Stepped:connect(function()
    for a, b in pairs(game.Workspace:GetChildren()) do
        if b.Name == plrName then
            for i, v in pairs(game.Workspace[plrName]:GetChildren()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false

                end
            end
        end
    end
end)

Workspace[plrName].Head.Changed:connect(function()
    for a, b in pairs(game.Workspace:GetChildren()) do
        if b.Name == plrName then
            for i, v in pairs(game.Workspace[plrName]:GetChildren()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false

                end
            end
        end
    end
end)
