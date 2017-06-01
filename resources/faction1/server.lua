--require "resources/essentialmode/lib/MySQL"
--MySQL:open("localhost", "gta5_gamemode_essential", "root", "18020603")

-- nouvelle config globale ! 
require "resources/gconfig/gconfig"

local inServiceF1s = {}

function addF1(identifier)
	MySQL:executeQuery("INSERT INTO f1 (`identifier`) VALUES ('@identifier')", { ['@identifier'] = identifier})
end

function remF1(identifier)
	MySQL:executeQuery("DELETE FROM f1 WHERE identifier = '@identifier'", { ['@identifier'] = identifier})
end

function checkIsF1(identifier)
	local query = MySQL:executeQuery("SELECT * FROM f1 WHERE identifier = '@identifier'", { ['@identifier'] = identifier})
	local result = MySQL:getResults(query, {'rank'}, "identifier")
	
	if(not result[1]) then
		TriggerClientEvent('faction1:receiveIsF1', source, "inconnu")
	else
		TriggerClientEvent('faction1:receiveIsF1', source, result[1].rank)
	end
end

function s_checkIsF1(identifier)
	local query = MySQL:executeQuery("SELECT * FROM f1 WHERE identifier = '@identifier'", { ['@identifier'] = identifier})
	local result = MySQL:getResults(query, {'rank'}, "identifier")
	
	if(not result[1]) then
		return "nil"
	else
		return result[1].rank
	end
end

AddEventHandler('playerDropped', function()
	if(inServiceF1s[source]) then
		inServiceF1s[source] = nil
		
		for i, c in pairs(inServiceF1s) do
			TriggerClientEvent("faction1:resultAllF1sInService", i, inServiceF1s)
		end
	end
end)

AddEventHandler('es:playerDropped', function(player)
		local isF1 = s_checkIsF1(player.identifier)
		if(isF1 ~= "nil") then
			TriggerEvent("jobssystem:disconnectReset", player, 1)
		end
end)

RegisterServerEvent('faction1:checkIsF1')
AddEventHandler('faction1:checkIsF1', function()
	TriggerEvent("es:getPlayerFromId", source, function(user)
		local identifier = user.identifier
		checkIsF1(identifier)
	end)
end)

RegisterServerEvent('faction1:takeService')
AddEventHandler('faction1:takeService', function()

	if(not inServiceF1s[source]) then
		inServiceF1s[source] = GetPlayerName(source)
		
		for i, c in pairs(inServiceF1s) do
			TriggerClientEvent("faction1:resultAllF1sInService", i, inServiceF1s)
		end
	end
end)

RegisterServerEvent('faction1:breakService')
AddEventHandler('faction1:breakService', function()

	if(inServiceF1s[source]) then
		inServiceF1s[source] = nil
		
		for i, c in pairs(inServiceF1s) do
			TriggerClientEvent("faction1:resultAllF1sInService", i, inServiceF1s)
		end
	end
end)

RegisterServerEvent('faction1:getAllF1sInService')
AddEventHandler('faction1:getAllF1sInService', function()
	TriggerClientEvent("faction1:resultAllF1sInService", source, inServiceF1s)
end)

-----------------------------------------------------------------------
----------------------EVENT SPAWN F1 VEH---------------------------
-----------------------------------------------------------------------
RegisterServerEvent('CheckFaction1Veh')
AddEventHandler('CheckFaction1Veh', function(vehicle)
	TriggerEvent('es:getPlayerFromId', source, function(user)

			TriggerClientEvent('FinishF1CheckForVeh',source)
			-- Spawn F1 vehicle
			TriggerClientEvent('F1veh:spawnVehicle', source, vehicle)
	end)
end)

-----------------------------------------------------------------------
---------------------COMMANDE ADMIN AJOUT / SUPP F1-------------------
-----------------------------------------------------------------------
TriggerEvent('es:addGroupCommand', 'taxiadd', "admin", function(source, args, user)
     if(not args[2]) then
		TriggerClientEvent('chatMessage', source, 'Faction', {255, 0, 0}, "Usage : /taxiadd [ID]")	
	else
		if(GetPlayerName(tonumber(args[2])) ~= nil)then
			local player = tonumber(args[2])
			TriggerEvent("es:getPlayerFromId", player, function(target)
				addF1(target.identifier)
				TriggerClientEvent('chatMessage', source, 'Faction', {255, 0, 0}, "Roger that !")
				TriggerClientEvent("es_freeroam:notify", player, "CHAR_ANDREAS", 1, "Faction", false, "Congrats, you're now a F1 !~w~.")
				TriggerClientEvent('faction1:nowF1', player)
			end)
		else
			TriggerClientEvent('chatMessage', source, 'Faction', {255, 0, 0}, "No player with this ID !")
		end
	end
end, function(source, args, user) 
	TriggerClientEvent('chatMessage', source, 'Faction', {255, 0, 0}, "You haven't the permission to do that !")
end)

TriggerEvent('es:addGroupCommand', 'taxirem', "admin", function(source, args, user) 
     if(not args[2]) then
		TriggerClientEvent('chatMessage', source, 'Faction', {255, 0, 0}, "Usage : /taxirem [ID]")	
	else
		if(GetPlayerName(tonumber(args[2])) ~= nil)then
			local player = tonumber(args[2])
			TriggerEvent("es:getPlayerFromId", player, function(target)
				remF1(target.identifier)
				TriggerClientEvent("es_freeroam:notify", player, "CHAR_ANDREAS", 1, "Faction", false, "You're no longer a F1 !~w~.")
				TriggerClientEvent('chatMessage', source, 'Faction', {255, 0, 0}, "Roger that !")
				--TriggerClientEvent('chatMessage', player, 'Faction', {255, 0, 0}, "You're no longer a F1 !")
				TriggerClientEvent('faction1:noLongerF1', player)
			end)
		else
			TriggerClientEvent('chatMessage', source, 'Faction', {255, 0, 0}, "No player with this ID !")
		end
	end
end, function(source, args, user) 
	TriggerClientEvent('chatMessage', source, 'Faction', {255, 0, 0}, "You haven't the permission to do that !")
end)