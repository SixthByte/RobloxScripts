function FinderLoop()
local FOUND_THAT_FUCKER = false
    for i, v in ipairs(game.Workspace:GetChildren()) do
        if v.Name == "TreeRegion" then
            for j, k in ipairs(v:GetChildren()) do
                if k:FindFirstChild("TreeClass") ~= nil and k.TreeClass.Value == "Spooky" then
                    game.Players.LocalPlayer.Character:MoveTo(k.WoodSection.Position)
                    print("[HEX] Spook Tree Found!")
                    game.StarterGui:SetCore("SendNotification",{
    	                Title    = "Spook/Sinister Finder",
    	                Text     = "Found a Spook Tree!",
    	                Icon     = "rbxassetid://6577862839",
    	                Duration = 1.5,
                    })
                    FOUND_THAT_FUCKER = true
                    break
                end
            end
        end
    end
    for i, v in ipairs(game.Workspace:GetChildren()) do
        if v.Name == "TreeRegion" then
            for j, k in ipairs(v:GetChildren()) do
                if k:FindFirstChild("TreeClass") ~= nil and k.TreeClass.Value == "SpookyGlow" then
                    game.Players.LocalPlayer.Character:MoveTo(k.WoodSection.Position)
                    print("[HEX] Sinister Tree Found!")
                    game.StarterGui:SetCore("SendNotification",{
    	                Title    = "Spook/Sinister Finder",
    	                Text     = "Found a Sinister Tree!",
    	                Icon     = "rbxassetid://6577862839",
    	                Duration = 1.5,
                    })
                    FOUND_THAT_FUCKER = true
                    break
                end
            end
        end
    end
    if FOUND_THAT_FUCKER == false then
        game.StarterGui:SetCore("SendNotification",{
    	   Title    = "Spook/Sinister Finder",
    	   Text     = "No Spook/Sinister Tree found, server hopping...",
    	   Icon     = "rbxassetid://6577862839",
    Duration = 1.5,
        })
        print("[HEX] Could not find a Spook or Sinister tree, joining a new server...")
        game:GetService("TeleportService"):Teleport(4019937000)
    end
end
FinderLoop()
