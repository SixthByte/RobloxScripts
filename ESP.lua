local ESP = {
    Container = {},
    Settings = {
        Enabled = true,
        Distance = true,
        Health = true,
        Tracers = true,
        Rainbow = false,
    }
}

-- Services

local Players = game:GetService("Players")
local RS = game:GetService("RunService")

-- Variables

local Plr = Players.LocalPlayer
local Char = Plr.Character or Plr.CharacterAdded:Wait()
local RootPart = Char:WaitForChild("HumanoidRootPart")

local Cam = workspace.CurrentCamera
local BottomMiddle = Vector2.new(Cam.ViewportSize.X/2, Cam.ViewportSize.Y)

function ESP.Add(plr, root, colour, nameOverwrite)
    if ESP.Container[root] then
        ESP.Remove(root)
    end

    local Holder = {
        Draw = {
            Name = Drawing.new("Text"),
            Display = Drawing.new("Text"),
            Tracer = Drawing.new("Line"),
        },
        Connections = {},
        Colour = colour,
    }

    ESP.Container[root] = Holder

    Holder.Draw.Name.Text = nameOverwrite or plr.Name
    Holder.Draw.Name.Color = Holder.Colour
    Holder.Draw.Name.Outline = true
    Holder.Draw.Name.Center = true

    Holder.Draw.Display.Color = Color3.fromRGB(255,255,255)
    Holder.Draw.Display.Outline = true
    Holder.Draw.Display.Center = true

    Holder.Draw.Tracer.Color = Holder.Colour
    Holder.Draw.Tracer.From = BottomMiddle

    root.AncestryChanged:Connect(function()
        if not root:IsDescendantOf(workspace) then
            ESP.Remove(root)
        end
    end)

    Holder.Connections.Connection = RS.Stepped:Connect(function()
        if ESP.Settings.Enabled then
            local Pos, onScreen = ESP.WTVPoint(root.CFrame)
            if Pos and onScreen then
                local NamePos = Vector2.new(Pos.X, Pos.Y - 14)
                local DisplayPos = Vector2.new(Pos.X, Pos.Y)

                Holder.Draw.Name.Position = NamePos
                Holder.Draw.Display.Position = DisplayPos
                Holder.Draw.Tracer.To = Vector2.new(Pos.X, Pos.Y)

                ESP.UpdateDisplay(Holder, root, (ESP.IsPlayer(plr) and plr.Character:FindFirstChild("Humanoid")) or nil)
            end
            ESP.UpdateVisibility(Holder, root)
            ESP.UpdateColour(Holder)

        elseif Holder.Draw.Name.Visible then
            for i, v in next, Holder.Draw do
                v.Visible = false
            end
        end
    end)
end

function ESP.Remove(root)
    for i, v in next, ESP.Container do
        if i == root then
            for _, x in next, v.Draw do
                x:Remove()
            end
            for _, x in next, v.Connections do
                x:Disconnect()
            end
            ESP.Container[i] = nil
        end
    end
end

function ESP.IsPlayer(plr)
    return plr.Parent == Players
end

function ESP.GetXZMagnitude(root)
    return (Vector3.new(RootPart.Position.X, 0, RootPart.Position.Z) - Vector3.new(root.Position.X, 0, root.Position.Z)).Magnitude
end

function ESP.GetHealth(hum)
    return math.floor(hum.Health / hum.MaxHealth * 100)
end

function ESP.WTVPoint(pos)
    return Cam:WorldToViewportPoint(Vector3.new(pos.Position.X, pos.Position.Y, pos.Position.Z))
end

function ESP.UpdateVisibility(holder, root)
    local Pos, onScreen = ESP.WTVPoint(root.CFrame)
    holder.Draw.Name.Visible = (Pos and onScreen) and ESP.Settings.Enabled
    holder.Draw.Display.Visible = (Pos and onScreen) and (ESP.Settings.Distance or ESP.Settings.Health) and ESP.Settings.Enabled
    holder.Draw.Tracer.Visible = (Pos and onScreen) and ESP.Settings.Tracers and ESP.Settings.Enabled
end

function ESP.UpdateDisplay(holder, root, hum)
    local Health = (hum and ESP.Settings.Health) and "["..ESP.GetHealth(hum).."%] " or ""
    local Dist = (root and ESP.Settings.Distance) and "["..math.floor(ESP.GetXZMagnitude(root.CFrame)).." studs]" or ""
    holder.Draw.Display.Text = Health..Dist
end

function ESP.UpdateColour(holder)
    local colour = ESP.Settings.Rainbow and Color3.fromHSV(tick() % 5 / 5, 1, 1) or holder.Colour
    holder.Draw.Name.Color = colour
    holder.Draw.Tracer.Color = colour
end

Plr.CharacterAdded:Connect(function(char)
    Char, RootPart = char, char:WaitForChild("HumanoidRootPart")
end)

return ESP
