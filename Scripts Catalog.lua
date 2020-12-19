-- Catalog Scripts

-- Walking Camera Bobble Effect
-- https://developer.roblox.com/en-us/api-reference/class/Humanoid

local RunService = game:GetService("RunService")
 
local playerModel = script.Parent
local humanoid = playerModel:WaitForChild("Humanoid")
 
local function updateBobbleEffect()
	local now = tick()
	if humanoid.MoveDirection.Magnitude > 0 then -- Are we walking?
		local velocity = humanoid.RootPart.Velocity
		local bobble_X = math.cos(now * 9) / 5
		local bobble_Y = math.abs(math.sin(now * 12)) / 5
		
		local bobble = Vector3.new(bobble_X,bobble_Y,0) * math.min(1, velocity.Magnitude / humanoid.WalkSpeed)
		humanoid.CameraOffset = humanoid.CameraOffset:lerp(bobble,.25)
	else
		-- Scale down the CameraOffset so that it shifts back to its regular position.
		humanoid.CameraOffset = humanoid.CameraOffset * 0.75
	end
end
 
-- Update the effect on every single frame.
RunService.RenderStepped:Connect(updateBobbleEffect)

-- Fire
-- https://developer.roblox.com/en-us/api-reference/class/Fire

for _, child in pairs(workspace:GetChildren()) do
	if child.Name == "Torch" and child:IsA("BasePart") then
		local fire = Instance.new("Fire")
		fire.Heat = 10
		fire.Color = child.Color
		fire.SecondaryColor = Color3.new(1, 1, 1) -- White
		fire.Size = math.max(child.Size.X, child.Size.Z) -- Pick the larger of the two dimensions
		fire.Parent = child
	end
end


-- Chat create a Part
-- https://developer.roblox.com/en-us/api-reference/function/Chat/Chat

local ChatService = game:GetService("Chat")
 
local part = Instance.new("Part")
part.Anchored = true
part.Parent = workspace
 
ChatService:Chat(part, "Blame John!", "Red")

