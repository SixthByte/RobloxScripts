local a0 = getrawmetatable(game)
		local a1 = a0.__namecall;
		local a2 = a0.__index;
		local a3 = Instance.new("IntValue", workspace)
		a3.Name = game:GetService("HttpService"):GenerateGUID(false)
		local a4 = Instance.new("RemoteEvent", game.ReplicatedStorage)
		a4.Name = game:GetService("HttpService"):GenerateGUID(false)
		function isProtected(v)
			return v == a4
		end;
		setreadonly(a0, false)
		a0.__namecall = function(self, ...)
			local j = getnamecallmethod()
			if isProtected(self) and not b then
				if j:lower() ~= "isa" and j:lower() ~= "findfirstchild" and j:lower() ~= "fireserver" then
            		return
				end
			end;
			if j == "InvokeServer" and tostring(self) == "RequestSave" and k then
				return {
					true
				}
			elseif j == "Kick" then
				wait(9e9)
				return
			else
				return a1(self, ...)
			end
		end;
		spawn(function()
			while wait(1) and not b do
				a4:FireServer(game:GetService("HttpService"):GenerateGUID(false))
				repeat
				until not game.CoreGui:FindFirstChild("Hydroxide C")
			end
		end)
		local a5 = print;
		print = function(...)
			repeat
			until table.concat({
				...
			}, ""):find(a4.Name, 1, true) == nil;
			return a5(...)
		end;
		getgenv().print = print;
		getrenv().print = print;
		local a6 = {
			game.ReplicatedStorage.Interaction:FindFirstChild("Ban"),
			game.ReplicatedStorage.Transactions:FindFirstChild("SetMod"),
			game.ReplicatedStorage.OwnershipDebug:FindFirstChild("BedRegionDebug")
		}
		for J, v in pairs(a6) do
			if v ~= nil then
				v.Name = game:GetService("HttpService"):GenerateGUID(false)
				v:Destroy()
			end
		end
