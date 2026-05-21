local PathfindingService = game:GetService("PathfindingService")

local Pathfinder = {}

local AGENT_SETTINGS = {
	AgentRadius = 2,
	AgentHeight = 5,
	AgentCanJump = true,
	AgentCanClimb = true,
}

function Pathfinder:CreatePath(startPosition, endPosition)
	local path = PathfindingService:CreatePath(AGENT_SETTINGS)

	local success, errorMessage = pcall(function()
		path:ComputeAsync(startPosition, endPosition)
	end)

	if not success then
		warn("Pathfinding failed:", errorMessage)
		return nil
	end

	if path.Status ~= Enum.PathStatus.Success then
		return nil
	end

	return path, path:GetWaypoints()
end

return Pathfinder
