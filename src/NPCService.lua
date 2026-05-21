local NPCService = {}

function NPCService:GetNearestTarget(origin, targets, maxDistance)
	local nearestTarget = nil
	local nearestDistanceSquared = maxDistance * maxDistance

	for _, target in ipairs(targets) do
		local character = target.Character

		if character then
			local humanoid = character:FindFirstChildOfClass("Humanoid")
			local root = character:FindFirstChild("HumanoidRootPart")

			if humanoid and humanoid.Health > 0 and root then
				local offset = root.Position - origin
				local distanceSquared = offset:Dot(offset)

				if distanceSquared < nearestDistanceSquared then
					nearestTarget = target
					nearestDistanceSquared = distanceSquared
				end
			end
		end
	end

	return nearestTarget
end

return NPCService
