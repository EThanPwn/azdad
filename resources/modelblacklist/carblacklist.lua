-- CONFIG --

-- Blacklisted vehicle models
carblacklist = {
	"RHINO",
	"CRUSADER",
	"BARRACKS"
}

-- CODE --

Citizen.CreateThread(function()
	while true do
		Wait(1)

		playerPed = GetPlayerPed(-1)
		if playerPed then
			playerCar = GetVehiclePedIsIn(playerPed, false)
			if playerCar then
				playerCarModel = GetEntityModel(playerCar)
				playerCarName = IsVehicleModel(playerCarModel)

				if isCarBlacklisted(playerCarName) or isCarBlacklisted(playerCarModel) then
					_DeleteEntity(playerCar)
					sendForbiddenMessage("This vehicle is blacklisted!")
				end
			end
		end
	end
end)

function isCarBlacklisted(model)
	for _, blacklistedCar in pairs(carblacklist) do
		if string.upper(model) == blacklistedCar then
			return true
		end
	end

	return false
end