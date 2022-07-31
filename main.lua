--Made by Mouad#4819

local plr = game.Players.LocalPlayer;
local chr = plr.Character;
local hum = chr.Humanoid;
local mov = {};
local mov2 = {};
for i,v in next, game:GetService("Players").LocalPlayer.Character:GetDescendants() do
	if v:IsA("BasePart") and v.Name ~="HumanoidRootPart" then 
		game:GetService("RunService").Heartbeat:connect(function()
			v.Velocity = Vector3.new(0,100,0)
		end)
	end
end

local function main()
	for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
		if v:IsA("Accessory") then
			if v.Handle:FindFirstChildOfClass("Mesh") or v.Handle:FindFirstChildOfClass("SpecialMesh") then
				if v.Handle:FindFirstChildOfClass("SpecialMesh") then
					v.Handle:FindFirstChildOfClass("SpecialMesh"):Remove()
				end
			end
		end
	end
	for _, v in pairs(hum:GetAccessories()) do
		local b = v.Handle;
		b.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0);
		b.CanCollide = false;
		b:BreakJoints();
		for _, k in pairs(v:GetChildren()) do
			if not k:IsA'SpecialMesh' and not k:IsA'Part' then
				k:Destroy();
			end
		end
		local still = Instance.new('BodyAngularVelocity', b);
		still.MaxTorque = Vector3.new(math.huge, math.huge, math.huge);
		still.AngularVelocity = Vector3.new(0, 0, 0);
		local align = Instance.new('AlignPosition', b);
		align.MaxForce = 1000000;
		align.MaxVelocity = math.huge;
		align.RigidityEnabled = false;
		align.ApplyAtCenterOfMass = true;
		align.Responsiveness = 200;
		local AO = Instance.new("AlignOrientation", b)
		AO.ReactionTorqueEnabled = false
		AO.PrimaryAxisOnly = false
		AO.MaxTorque = 9999999
		AO.MaxAngularVelocity = math.huge
		AO.Responsiveness = 9999999
		local a0 = Instance.new('Attachment', b);
		local a1 = Instance.new('Attachment', chr.Torso);
		a1.Name = "Attachment_"..v.Name
		AO.Attachment0 = a0
		AO.Attachment1 = a1
		align.Attachment0 = a0;
		align.Attachment1 = a1;
		table.insert(mov, a1);
		table.insert(mov2, still);
	end
	local par = {};
	for _, v in pairs(mov) do
		local parr = Instance.new('Part', workspace);
		parr.Anchored = true;
		parr.Size = Vector3.new(1, 1, 1);
		parr.Transparency = 1;
		parr.CanCollide = false;
		table.insert(par, parr);
	end
	game['Run Service'].RenderStepped:Connect(function()
		for i, v in pairs(mov) do
			if v.Name == "Attachment_Pal Hair" then
				v.Position = Vector3.new(0,-1,-1.5)
			elseif v.Name == "Attachment_BrownCharmerHair" then
				v.Position = Vector3.new(0, -1.5,-0.5)
				v.CFrame = CFrame.new(v.Position) * CFrame.Angles(0, math.rad(90), 0)
			else
				v.CFrame = CFrame.new(Vector3.new(0,-1,-2.5))
			end
		end
	end)
end
main()
function getPlayer(shortcut)
  local player = nil
  local g = game.Players:GetPlayers()
  for i = 1, #g do
    if string.lower(string.sub(g[i].Name, 1, string.len(shortcut))) == string.lower(shortcut) then
      player = g[i]
      break
		end
 	end
    return player
end
game.Players.LocalPlayer.Chatted:Connect(function(c)
	local stupid = Instance.new('Animation')
	stupid.AnimationId = 'rbxassetid://148840371'
	hummy = game:GetService("Players").LocalPlayer.Character.Humanoid
	local notfunny = hummy:LoadAnimation(stupid)
	if string.sub(c, 1, #"!bang"):lower() == "!bang" then
		_G.stop = false
		local args = string.split(c, " "); --split string message via space, and iterate them into a table
		local plr = getPlayer(args[2])
		local PlayerHumanoid = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
		local TargetHumanoid = plr.Character:WaitForChild("Humanoid")
		hummy = game:GetService("Players").LocalPlayer.Character.Humanoid
		pcall(function()
			hummy.Parent.Pants:Destroy()
		end)
		notfunny:Play()
		notfunny:AdjustSpeed(10)
		task.spawn(function()
			while hummy.Parent.Parent ~= nil and _G.stop == false do
				wait()
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,2.5)
			end
		end)
		task.spawn(function()
			while wait() do
				if _G.stop == true then
					notfunny:Stop()
				end
			end
		end)
	elseif string.sub(c, 1, #"!mbang"):lower() == "!mbang" then
		_G.stop = false
		local args = string.split(c, " "); --split string message via space, and iterate them into a table
		local plr = getPlayer(args[2])
		local PlayerHumanoid = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
		local TargetHumanoid = plr.Character:WaitForChild("Humanoid")
		hummy = game:GetService("Players").LocalPlayer.Character.Humanoid
		pcall(function()
			hummy.Parent.Pants:Destroy()
		end)
		notfunny:Play()
		notfunny:AdjustSpeed(10)
		task.spawn(function()
			while hummy.Parent.Parent ~= nil and _G.stop == false do
				wait()
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = plr.Character.Head.CFrame * CFrame.new(0,0,2.5)
			end
		end)
		task.spawn(function()
			while wait() do
				if _G.stop == true then
					notfunny:Stop()
				end
			end
		end)
	elseif string.sub(c, 1, #"!tp"):lower() == "!tp" then
		local args = string.split(c, " ");
		local plr = getPlayer(args[2])
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,0)
	end
	if c == "!stop" then
		_G.stop = true
	elseif c == "!nopp" then
		for i, v in pairs(mov) do
			v:Destroy()
		end
	elseif c == "!pp" then
		pcall(function ()
			main()
		end)
	end
end)
