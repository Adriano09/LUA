print("Anti-Player Script 1.0 ")

-- On Collision the player Dies

function onTouched(Part)
	local h = Part.Parent:FindFirstChild("Humanoid")
	if h then
		h.Health = 0
	end
end

script.Parent.Touched:Connect(onTouched)