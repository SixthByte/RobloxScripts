local Auto_Teleport = true


local SpookCallback = Instance.new("BindableFunction", workspace)
SpookCallback.Name = "SpookCallback"
SpookCallback.OnInvoke = function(ans)
	if ans ~= "Claim" then
		for i, v in ipairs(game.Workspace:GetChildren()) do
            if v.Name == "TreeRegion" then
                for j, k in ipairs(v:GetChildren()) do
                    if k:FindFirstChild("TreeClass") ~= nil and k.TreeClass.Value == "Spooky" then
                        game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(k)
    					game.ReplicatedStorage.Interaction.ClientRequestOwnership:FireServer(k)
    					game.ReplicatedStorage.Interaction.ClientRequestOwnership:FireServer(k:FindFirstChildOfClass("Part"))
                        break
                    end
                end
            end
        end
	end
end
local SinCallback = Instance.new("BindableFunction", workspace)
SinCallback.Name = "SinCallback"
SinCallback.OnInvoke = function(ans)
	if ans ~= "No" then
		for i, v in ipairs(game.Workspace:GetChildren()) do
            if v.Name == "TreeRegion" then
                for j, k in ipairs(v:GetChildren()) do
                    if k:FindFirstChild("TreeClass") ~= nil and k.TreeClass.Value == "SpookyGlow" then
                        game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(k)
    					game.ReplicatedStorage.Interaction.ClientRequestOwnership:FireServer(k)
    					game.ReplicatedStorage.Interaction.ClientRequestOwnership:FireServer(k:FindFirstChildOfClass("Part"))
                        break
                    end
                end
            end
        end
	end
end
function FinderLoop()
local FOUND_THAT_FUCKER = false
    for i, v in ipairs(game.Workspace:GetChildren()) do
        if v.Name == "TreeRegion" then
            for j, k in ipairs(v:GetChildren()) do
                if k:FindFirstChild("TreeClass") ~= nil and k.TreeClass.Value == "Spooky" then
                    game.Players.LocalPlayer.Character:MoveTo(k.WoodSection.Position)
                    print("[HEX] Spook Tree Found!")
                    game.StarterGui:SetCore("SendNotification",{
    	                Title    = "Spook/Sinister ESP",
    	                Text     = "Found a Spook Tree! Claim?",
    	                Icon     = "rbxassetid://7618326037",
    	                Duration = 7,
    	                Button1 = "Claim",
	                    Button2 = "No",
	                    Callback = SpookCallback
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
    	                Title    = "Spook/Sinister ESP",
    	                Text     = "Found a Sinister Tree! Claim?",
    	                Icon     = "rbxassetid://7618326598",
    	                Duration = 7,
    	                Button1 = "Claim",
	                    Button2 = "No",
	                    Callback = SinCallback
                    })
                    FOUND_THAT_FUCKER = true
                    break
                end
            end
        end
    end
    if FOUND_THAT_FUCKER == false then
        if Auto_Teleport then
            game.StarterGui:SetCore("SendNotification",{
        	    Title    = "Spook/Sinister ESP",
        	    Text     = "No Spook/Sinister Tree found, server hopping...",
        	    Icon     = "rbxassetid://7403270296", -- 7403270296
                Duration = 1.5,
            })
            print("[HEX] Could not find a Spook or Sinister tree, joining a new server...")
            game:GetService("TeleportService"):Teleport(7540273637)
            wait(10)
            game.StarterGui:SetCore("SendNotification",{
        	    Title    = "Spook/Sinister ESP",
        	    Text     = "The server hop is taking a while, retrying...",
        	    Icon     = "rbxassetid://7403270296", -- 7403270296
                Duration = 3,
            })
            game:GetService("TeleportService"):Teleport(7540273637)
        else
            game.StarterGui:SetCore("SendNotification",{
        	    Title    = "Spook/Sinister ESP",
        	    Text     = "No Spook/Sinister Tree found.",
        	    Icon     = "rbxassetid://7403270296", -- 7403270296
                Duration = 3,
            })
            print("[HEX] Could not find a Spook or Sinister tree.")
        end
    end
end
FinderLoop()
syn.queue_on_teleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/WolfGod746/RobloxScripts/main/LT2%20Spook%20Hunter.lua'))()")
