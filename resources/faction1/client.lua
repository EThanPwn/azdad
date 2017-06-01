local isF1 = false
local isInService = false
local rank = "inconnu"
local checkpoints = {}
local existingVeh = nil
--local handCuffed = false
local isAlreadyDead = false
local allServiceF1s = {}
local blipsF1s = {}

local takingService = {
	{895.313415527344,-179.498260498047,74.7002792358398}
}

local stationGarage = {
	{916.350646972656,-162.645233154297,74.7103042602539}
}

AddEventHandler("playerSpawned", function()
	TriggerServerEvent("faction1:checkIsF1")
end)

RegisterNetEvent('faction1:receiveIsF1')
AddEventHandler('faction1:receiveIsF1', function(result)
	if(result == "inconnu") then
		isF1 = false
	else
		isF1 = true
		rank = result
	end
end)

RegisterNetEvent('faction1:nowF1')
AddEventHandler('faction1:nowF1', function()
	isF1 = true
end)

RegisterNetEvent('faction1:noLongerF1')
AddEventHandler('faction1:noLongerF1', function()
	isF1 = false
	isInService = false
	
	local playerPed = GetPlayerPed(-1)
						
	--TriggerServerEvent("skin_customization:SpawnPlayer")
	--RemoveAllPedWeapons(playerPed)
	
	if(existingVeh ~= nil) then
		SetEntityAsMissionEntity(existingVeh, true, true)
		Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(existingVeh))
		existingVeh = nil
	end
	
	ServiceOff()
end)

--[[RegisterNetEvent('faction1:getArrested')
AddEventHandler('faction1:getArrested', function()
	if(isF1 == false) then
		handCuffed = not handCuffed
		if(handCuffed) then
			TriggerEvent('chatMessage', 'SYSTEM', {255, 0, 0}, "Tu es menotté.")
		else
			TriggerEvent('chatMessage', 'SYSTEM', {255, 0, 0}, "Tu es libre !")
		end
	end
end)]]

RegisterNetEvent('faction1:resultAllF1sInService')
AddEventHandler('faction1:resultAllF1sInService', function(array)
	allServiceF1s = array
	enableF1Blips()
end)

function enableF1Blips()

	for k, existingBlip in pairs(blipsF1s) do
        RemoveBlip(existingBlip)
    end
	blipsF1s = {}
	
	local localIdF1s = {}
	for id = 0, 64 do
		if(NetworkIsPlayerActive(id) and GetPlayerPed(id) ~= GetPlayerPed(-1)) then
			for i,c in pairs(allServiceF1s) do
				if(i == GetPlayerServerId(id)) then
					localIdF1s[id] = c
					break
				end
			end
		end
	end
	
	for id, c in pairs(localIdF1s) do
		local ped = GetPlayerPed(id)
		local blip = GetBlipFromEntity(ped)
		
		if not DoesBlipExist( blip ) then

			blip = AddBlipForEntity( ped )
			SetBlipSprite( blip, 1 )
			Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, true )
			HideNumberOnBlip( blip )
			SetBlipNameToPlayerName( blip, id )
			
			SetBlipScale( blip,  0.85 )
			SetBlipAlpha( blip, 255 )
			
			table.insert(blipsF1s, blip)
		else
			
			blipSprite = GetBlipSprite( blip )
			
			HideNumberOnBlip( blip )
			if blipSprite ~= 1 then
				SetBlipSprite( blip, 1 )
				Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, true )
			end
			
			Citizen.Trace("Nom : "..GetPlayerName(id))
			SetBlipNameToPlayerName( blip, id )
			SetBlipScale( blip,  0.85 )
			SetBlipAlpha( blip, 255 )
			
			table.insert(blipsF1s, blip)
		end
	end
end

function GetPlayers()
    local players = {}

    for i = 0, 31 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end

    return players
end

function GetClosestPlayer()
	local players = GetPlayers()
	local closestDistance = -1
	local closestPlayer = -1
	local ply = GetPlayerPed(-1)
	local plyCoords = GetEntityCoords(ply, 0)
	
	for index,value in ipairs(players) do
		local target = GetPlayerPed(value)
		if(target ~= ply) then
			local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
			local distance = GetDistanceBetweenCoords(targetCoords["x"], targetCoords["y"], targetCoords["z"], plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
			if(closestDistance == -1 or closestDistance > distance) then
				closestPlayer = value
				closestDistance = distance
			end
		end
	end
	
	return closestPlayer, closestDistance
end

function drawTxt(text,font,centre,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(centre)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x , y)
end

function getIsInService()
	return isInService
end

function isNearTakeService()
	for i = 1, #takingService do
		local ply = GetPlayerPed(-1)
		local plyCoords = GetEntityCoords(ply, 0)
		local distance = GetDistanceBetweenCoords(takingService[i].x, takingService[i].y, takingService[i].z, plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
		if(distance < 30) then
			DrawMarker(1, takingService[i].x, takingService[i].y, takingService[i].z-1, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 0, 155, 255, 200, 0, 0, 2, 0, 0, 0, 0)
		end
		if(distance < 2) then
			return true
		end
	end
end

function isNearStationGarage()
	for i = 1, #stationGarage do
		local ply = GetPlayerPed(-1)
		local plyCoords = GetEntityCoords(ply, 0)
		local distance = GetDistanceBetweenCoords(stationGarage[i].x, stationGarage[i].y, stationGarage[i].z, plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
		if(distance < 30) then
			DrawMarker(1, stationGarage[i].x, stationGarage[i].y, stationGarage[i].z-1, 0, 0, 0, 0, 0, 0, 2.0, 2.0, 1.0, 0, 155, 255, 200, 0, 0, 2, 0, 0, 0, 0)
		end
		if(distance < 2) then
			return true
		end
	end
end

function ServiceOn()
	isInService = true
	TriggerServerEvent("jobssystem:jobs", 2)
	TriggerServerEvent("faction1:takeService")
end

function ServiceOff()
	isInService = false
	TriggerServerEvent("jobssystem:jobs", 1)
	TriggerServerEvent("faction1:breakService")
	
	allServiceF1s = {}
	
	for k, existingBlip in pairs(blipsF1s) do
        RemoveBlip(existingBlip)
    end
	blipsF1s = {}
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if(isF1) then
			if(isNearTakeService()) then
			
				DisplayHelpText('Appuie sur ~INPUT_CONTEXT~ pour ouvrir le ~b~casier de XXX',0,1,0.5,0.8,0.6,255,255,255,255) -- ~g~E~s~
				if IsControlJustPressed(1,51) then
					OpenMenuVest()
				end
			end
			if(isInService) then
				if IsControlJustPressed(1,166) then 
					OpenF1Menu()
				end
			end
			
			if(isInService) then
				if(isNearStationGarage()) then
					if(F1vehicle ~= nil) then --existingVeh
						DisplayHelpText('Appuie sur ~INPUT_CONTEXT~ pour ranger ton ~b~véhicule',0,1,0.5,0.8,0.6,255,255,255,255)
					else
						DisplayHelpText('Appuie sur ~INPUT_CONTEXT~ pour ouvrir le ~b~garage de XXX',0,1,0.5,0.8,0.6,255,255,255,255)
					end
					
					if IsControlJustPressed(1,51) then
						if(F1vehicle ~= nil) then
							SetEntityAsMissionEntity(F1vehicle, true, true)
							Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(F1vehicle))
							F1vehicle = nil
						else
							OpenVeh()
						end
					end
				end
				
				
			end
		end
    end
end)
---------------------------------------------------------------------------------------
-------------------------------SPAWN HELI AND CHECK DEATH------------------------------
---------------------------------------------------------------------------------------
--[[local alreadyDead = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if(isF1) then
			if(isInService) then
			
				if(IsPlayerDead(PlayerId())) then
					if(alreadyDead == false) then
						ServiceOff()
						alreadyDead = true
					end
				else
					alreadyDead = false
				end
			
				DrawMarker(1,449.113,-981.084,42.691,0,0,0,0,0,0,2.0,2.0,2.0,0,155,255,200,0,0,0,0)
			
				if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 449.113,-981.084,43.691, true ) < 5 then
					if(existingVeh ~= nil) then
						DisplayHelpText('Appuie sur ~INPUT_CONTEXT~ pour ranger ~b~ton ~b~hélicoptère',0,1,0.5,0.8,0.6,255,255,255,255)
					else
						DisplayHelpText('Appuie sur ~INPUT_CONTEXT~ pour sortir un hélicoptère',0,1,0.5,0.8,0.6,255,255,255,255)
					end
					
					if IsControlJustPressed(1,51)  then
						if(existingVeh ~= nil) then
							SetEntityAsMissionEntity(existingVeh, true, true)
							Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(existingVeh))
							existingVeh = nil
						else
							local car = GetHashKey("polmav")
							local ply = GetPlayerPed(-1)
							local plyCoords = GetEntityCoords(ply, 0)
							
							RequestModel(car)
							while not HasModelLoaded(car) do
									Citizen.Wait(0)
							end
							
							existingVeh = CreateVehicle(car, plyCoords["x"], plyCoords["y"], plyCoords["z"], 90.0, true, false)
							local id = NetworkGetNetworkIdFromEntity(existingVeh)
							SetNetworkIdCanMigrate(id, true)
							TaskWarpPedIntoVehicle(ply, existingVeh, -1)
						end
					end
				end
			end
		end
    end
end)]]