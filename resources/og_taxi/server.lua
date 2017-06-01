--require "resources/essentialmode/lib/MySQL"
--MySQL:open("localhost", "gta5_gamemode_essential", "root", "18020603")

-- nouvelle config globale ! 
require "resources/gconfig/gconfig"

local inServiceCops = {}

function addCop(identifier)
	MySQL:executeQuery("INSERT INTO taxi (`identifier`) VALUES ('@identifier')", { ['@identifier'] = identifier})
end

function remCop(identifier)
	MySQL:executeQuery("DELETE FROM taxi WHERE identifier = '@identifier'", { ['@identifier'] = identifier})
end

function checkIsCop(identifier)
	local query = MySQL:executeQuery("SELECT * FROM taxi WHERE identifier = '@identifier'", { ['@identifier'] = identifier})
	local result = MySQL:getResults(query, {'rank'}, "identifier")
	
	if(not result[1]) then
		TriggerClientEvent('taxi:receiveIsCop', source, "inconnu")
	else
		TriggerClientEvent('taxi:receiveIsCop', source, result[1].rank)
	end
end

function s_checkIsCop(identifier)
	local query = MySQL:executeQuery("SELECT * FROM taxi WHERE identifier = '@identifier'", { ['@identifier'] = identifier})
	local result = MySQL:getResults(query, {'rank'}, "identifier")
	
	if(not result[1]) then
		return "nil"
	else
		return result[1].rank
	end
end

function checkInventory(target)
	local strResult = GetPlayerName(target).." own : "
	local identifier = ""
    TriggerEvent("es:getPlayerFromId", target, function(player)
		identifier = player.identifier
		local executed_query = MySQL:executeQuery("SELECT * FROM `user_inventory` JOIN items ON items.id = user_inventory.item_id WHERE user_id = '@username'", { ['@username'] = identifier })
		local result = MySQL:getResults(executed_query, { 'quantity', 'libelle', 'item_id', 'isIllegal' }, "item_id")
		if (result) then
			for _, v in ipairs(result) do
				if(v.quantity ~= 0) then
					strResult = strResult .. v.quantity .. " de " .. v.libelle .. ", "
				end
				print("DEBUG" .. v.isIllegal)
				if(v.isIllegal == "1") then
					TriggerClientEvent('taxi:dropIllegalItem', target, v.item_id)
				end
			end
		end
		
		strResult = strResult .. " / "
		
		local executed_query = MySQL:executeQuery("SELECT * FROM user_weapons WHERE identifier = '@username'", { ['@username'] = identifier })
		local result = MySQL:getResults(executed_query, { 'weapon_model' }, 'identifier' )
		if (result) then
			for _, v in ipairs(result) do
					strResult = strResult .. "possession de " .. v.weapon_model .. ", "
			end
		end
	end)
	
    return strResult
end

AddEventHandler('playerDropped', function()
	if(inServiceCops[source]) then
		inServiceCops[source] = nil
		
		for i, c in pairs(inServiceCops) do
			TriggerClientEvent("taxi:resultAllCopsInService", i, inServiceCops)
		end
	end
end)

AddEventHandler('es:playerDropped', function(player)
		local isCop = s_checkIsCop(player.identifier)
		if(isCop ~= "nil") then
			TriggerEvent("jobssystem:disconnectReset", player, 7)
		end
end)

RegisterServerEvent('taxi:checkIsCop')
AddEventHandler('taxi:checkIsCop', function()
	TriggerEvent("es:getPlayerFromId", source, function(user)
		local identifier = user.identifier
		checkIsCop(identifier)
	end)
end)

RegisterServerEvent('taxi:takeService')
AddEventHandler('taxi:takeService', function()

	if(not inServiceCops[source]) then
		inServiceCops[source] = GetPlayerName(source)
		
		for i, c in pairs(inServiceCops) do
			TriggerClientEvent("taxi:resultAllCopsInService", i, inServiceCops)
		end
	end
end)

RegisterServerEvent('taxi:breakService')
AddEventHandler('taxi:breakService', function()

	if(inServiceCops[source]) then
		inServiceCops[source] = nil
		
		for i, c in pairs(inServiceCops) do
			TriggerClientEvent("taxi:resultAllCopsInService", i, inServiceCops)
		end
	end
end)

RegisterServerEvent('taxi:getAllCopsInService')
AddEventHandler('taxi:getAllCopsInService', function()
	TriggerClientEvent("taxi:resultAllCopsInService", source, inServiceCops)
end)

RegisterServerEvent('taxi:checkingPlate')
AddEventHandler('taxi:checkingPlate', function(plate)
	local executed_query = MySQL:executeQuery("SELECT Nom FROM user_vehicle JOIN users ON user_vehicle.identifier = users.identifier WHERE vehicle_plate = '@plate'", { ['@plate'] = plate })
	local result = MySQL:getResults(executed_query, { 'Nom' }, "identifier")
	if (result[1]) then
		for _, v in ipairs(result) do
			TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Le vehicule imatriculé #"..plate.." appartient à " .. v.Nom)
		end
	else
		TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "le vehicule imatriculé #"..plate.." est déclaré volé !")
	end
end)

RegisterServerEvent('taxi:confirmUnseat')
AddEventHandler('taxi:confirmUnseat', function(t)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, GetPlayerName(t).. " is out !")
	TriggerClientEvent('taxi:unseatme', t)
end)

RegisterServerEvent('taxi:targetCheckInventory')
AddEventHandler('taxi:targetCheckInventory', function(t)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, checkInventory(t))
end)

RegisterServerEvent('taxi:finesGranted')
AddEventHandler('taxi:finesGranted', function(t, amount)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, GetPlayerName(t).. " paid a $"..amount.." fines.")
	TriggerClientEvent('taxi:payFines', t, amount)
end)

RegisterServerEvent('taxi:cuffGranted')
AddEventHandler('taxi:cuffGranted', function(t)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, GetPlayerName(t).. " toggle cuff (except if it's a cop :3 ) !")
	TriggerClientEvent('taxi:getArrested', t)
end)

RegisterServerEvent('taxi:forceEnterAsk')
AddEventHandler('taxi:forceEnterAsk', function(t, v)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, GetPlayerName(t).. " get to the car ! (if he's cuffed :) )")
	TriggerClientEvent('taxi:forcedEnteringVeh', t, v)
end)

-----------------------------------------------------------------------
----------------------EVENT SPAWN taxi VEH---------------------------
-----------------------------------------------------------------------
RegisterServerEvent('CheckTaxiVeh')
AddEventHandler('CheckTaxiVeh', function(vehicle)
	TriggerEvent('es:getPlayerFromId', source, function(user)

			TriggerClientEvent('FinishTaxiCheckForVeh',source)
			-- Spawn Taxi vehicle
			TriggerClientEvent('taxiveh:spawnVehicle', source, vehicle)
	end)
end)

-----------------------------------------------------------------------
---------------------COMMANDE ADMIN AJOUT / SUPP COP-------------------
-----------------------------------------------------------------------
TriggerEvent('es:addGroupCommand', 'copadd', "admin", function(source, args, user)
     if(not args[2]) then
		TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Usage : /copadd [ID]")	
	else
		if(GetPlayerName(tonumber(args[2])) ~= nil)then
			local player = tonumber(args[2])
			TriggerEvent("es:getPlayerFromId", player, function(target)
				addCop(target.identifier)
				TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Roger that !")
				TriggerClientEvent("es_freeroam:notify", player, "CHAR_ANDREAS", 1, "Government", false, "Congrats, you're now a cop !~w~.")
				TriggerClientEvent('taxi:nowCop', player)
			end)
		else
			TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "No player with this ID !")
		end
	end
end, function(source, args, user) 
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "You haven't the permission to do that !")
end)

TriggerEvent('es:addGroupCommand', 'coprem', "admin", function(source, args, user) 
     if(not args[2]) then
		TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Usage : /coprem [ID]")	
	else
		if(GetPlayerName(tonumber(args[2])) ~= nil)then
			local player = tonumber(args[2])
			TriggerEvent("es:getPlayerFromId", player, function(target)
				remCop(target.identifier)
				TriggerClientEvent("es_freeroam:notify", player, "CHAR_ANDREAS", 1, "Government", false, "You're no longer a cop !~w~.")
				TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Roger that !")
				--TriggerClientEvent('chatMessage', player, 'GOVERNMENT', {255, 0, 0}, "You're no longer a cop !")
				TriggerClientEvent('taxi:noLongerCop', player)
			end)
		else
			TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "No player with this ID !")
		end
	end
end, function(source, args, user) 
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "You haven't the permission to do that !")
end)