local F1veh = {
	opened = false,
	title = "Garage de Taxi",
	currentmenu = "main",
	lastmenu = nil,
	currentpos = nil,
	selectedbutton = 0,
	marker = { r = 0, g = 155, b = 255, a = 200, type = 1 }, -- ???
	menu = {
		x = 0.11,
		y = 0.25,
		width = 0.2,
		height = 0.04,
		buttons = 10,
		from = 1,
		to = 10,
		scale = 0.4,
		font = 0,
		["main"] = {
			title = "CATEGORIES",
			name = "main",
			buttons = {
				--{name = "Peugeot Banalisée", costs = 0, description = {}, model = "fbi"},
				{name = "Taxi", costs = 0, description = {}, model = "police3"},
				--{name = "Patrouille 2", costs = 0, description = {}, model = "police2"},
				--{name = "Patrouille 3", costs = 0, description = {}, model = "police"},
				--{name = "Voiture banalisée", costs = 0, description = {}, model = "police4"},
				--{name = "Moto de police", costs = 0, description = {}, model = "policeb"},			
			}
		},
	}
}

local fakecar = {model = '', car = nil}
local boughtcar = false
local vehicle_price = 0

function LocalPed()
return GetPlayerPed(-1)
end
-------------------------------------------------
----------------CONFIG SELECTION----------------
-------------------------------------------------
function ButtonSelected(button)
	local ped = GetPlayerPed(-1)
	local this = F1veh.currentmenu
	if this == "main" then
		TriggerServerEvent('CheckF1Veh',button.model)
	end
end
-------------------------------------------------
------------------FINISH AND CLOSE---------------
-------------------------------------------------
RegisterNetEvent('FinishF1CheckForVeh')
AddEventHandler('FinishF1CheckForVeh', function()
	boughtcar = true
	CloseVeh()
end)
-------------------------------------------------
-------------------PLAYER HAVE VEH---------------
-------------------------------------------------
function DoesPlayerHaveVehicle(model,button,y,selected)
		local t = false
		--TODO:check if player own car
		if t then
			drawMenuRight("OWNED",F1veh.menu.x,y,selected)
		end
end
-------------------------------------------------
----------------CONFIG OPEN MENU-----------------
-------------------------------------------------
function OpenMenuVeh(menu)
	fakecar = {model = '', car = nil}
	F1veh.lastmenu = F1veh.currentmenu
	if menu == "main" then
		F1veh.lastmenu = "main"
	end
	F1veh.menu.from = 1
	F1veh.menu.to = 10
	F1veh.selectedbutton = 0
	F1veh.currentmenu = menu
end
-------------------------------------------------
------------------DRAW NOTIFY--------------------
-------------------------------------------------
function drawNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end
-------------------------------------------------
------------------DRAW TITLE MENU----------------
-------------------------------------------------
function drawMenuTitle(txt,x,y)
local menu = F1veh.menu
	SetTextFont(2)
	SetTextProportional(0)
	SetTextScale(0.5, 0.5)
	SetTextColour(255, 255, 255, 255)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawRect(x,y,menu.width,menu.height,0,0,0,150)
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end
-------------------------------------------------
------------------DRAW MENU BOUTON---------------
-------------------------------------------------
function drawMenuButton(button,x,y,selected)
	local menu = F1veh.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(menu.scale, menu.scale)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(button.name)
	if selected then
		DrawRect(x,y,menu.width,menu.height,255,255,255,255)
	else
		DrawRect(x,y,menu.width,menu.height,0,0,0,150)
	end
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end
-------------------------------------------------
------------------DRAW MENU INFO-----------------
-------------------------------------------------
function drawMenuInfo(text)
	local menu = F1veh.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(0.45, 0.45)
	SetTextColour(255, 255, 255, 255)
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawRect(0.675, 0.95,0.65,0.050,0,0,0,150)
	DrawText(0.365, 0.934)
end
-------------------------------------------------
----------------DRAW MENU DROIT------------------
-------------------------------------------------
function drawMenuRight(txt,x,y,selected)
	local menu = F1veh.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(menu.scale, menu.scale)
	--SetTextRightJustify(1)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawText(x + menu.width/2 - 0.03, y - menu.height/2 + 0.0028)
end
-------------------------------------------------
-------------------DRAW TEXT---------------------
-------------------------------------------------
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
-------------------------------------------------
----------------CONFIG BACK MENU-----------------
-------------------------------------------------
function Back()
	if backlock then
		return
	end
	backlock = true
	if F1veh.currentmenu == "main" then
		CloseVeh()
	elseif vehshop.currentmenu == "main" then
		if DoesEntityExist(fakecar.car) then
			Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(fakecar.car))
		end
		fakecar = {model = '', car = nil}
	else
		OpenMenuVeh(F1veh.lastmenu)
	end
end
-------------------------------------------------
----------------FONCTION ???????-----------------
-------------------------------------------------
function f(n)
return n + 0.0001
end

function LocalPed()
return GetPlayerPed(-1)
end

function try(f, catch_f)
local status, exception = pcall(f)
if not status then
catch_f(exception)
end
end
function firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

function round(num, idp)
  if idp and idp>0 then
    local mult = 10^idp
    return math.floor(num * mult + 0.5) / mult
  end
  return math.floor(num + 0.5)
end

function stringstarts(String,Start)
   return string.sub(String,1,string.len(Start))==Start
end
-------------------------------------------------
----------------FONCTION OPEN--------------------
-------------------------------------------------
function OpenVeh() --OpenCreator
	boughtcar = false
	local ped = LocalPed()
	local pos = {452.115,-1018.106,28.478}
	FreezeEntityPosition(ped,true)
	SetEntityVisible(ped,false)
	local g = Citizen.InvokeNative(0xC906A7DAB05C8D2B,pos[1],pos[2],pos[3],Citizen.PointerValueFloat(),0)
	SetEntityCoords(ped,pos[1],pos[2],g)
	SetEntityHeading(ped,pos[4])
	F1veh.currentmenu = "main"
	F1veh.opened = true
	F1veh.selectedbutton = 0
end
-------------------------------------------------
----------------FONCTION CLOSE-------------------
-------------------------------------------------
function CloseVeh() -- Close Creator
	Citizen.CreateThread(function()
		local ped = LocalPed()
		if not boughtcar then
			FreezeEntityPosition(ped,false)
			SetEntityVisible(ped,true)
		else
			local veh = GetVehiclePedIsUsing(ped)
			local model = GetEntityModel(veh)
			local colors = table.pack(GetVehicleColours(veh))
			local extra_colors = table.pack(GetVehicleExtraColours(veh))
			local plyCoords = GetEntityCoords(ped, 0)

			local mods = {}
			for i = 0,24 do
				mods[i] = GetVehicleMod(veh,i)
			end
			Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(veh))

			FreezeEntityPosition(ped,false)
			RequestModel(model)
			while not HasModelLoaded(model) do
				Citizen.Wait(0)
			end
			F1vehicle = CreateVehicle(model, plyCoords["x"], plyCoords["y"], plyCoords["z"],90.0,true,false)
			SetModelAsNoLongerNeeded(model)
			--[[for i,mod in pairs(mods) do
				SetVehicleModKit(F1vehicle,0)
				SetVehicleMod(F1vehicle,i,mod)
			end]]
			
			SetVehicleMod(F1vehicle, 11, 2)
			SetVehicleMod(F1vehicle, 12, 2)
			SetVehicleMod(F1vehicle, 13, 2)
			SetVehicleEnginePowerMultiplier(F1vehicle, 35.0)
			
			SetVehicleOnGroundProperly(F1vehicle)
			SetVehicleHasBeenOwnedByPlayer(F1vehicle,true)
			local id = NetworkGetNetworkIdFromEntity(F1vehicle)
			SetNetworkIdCanMigrate(id, true)
			Citizen.InvokeNative(0x629BFA74418D6239,Citizen.PointerValueIntInitialized(F1vehicle))
			SetVehicleColours(F1vehicle,colors[1],colors[2])
			SetVehicleExtraColours(F1vehicle,extra_colors[1],extra_colors[2])
			TaskWarpPedIntoVehicle(GetPlayerPed(-1),F1vehicle,-1)
			SetEntityVisible(ped,true)
			
			if DoesEntityExist(fakecar.car) then
				Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(fakecar.car))
			end
		end
		
		F1veh.opened = false
		F1veh.menu.from = 1
		F1veh.menu.to = 10
	end)
end
-------------------------------------------------
----------------FONCTION OPEN MENU---------------
-------------------------------------------------
local backlock = false
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if GetDistanceBetweenCoords(452.115, -1018.106, 28.478,GetEntityCoords(GetPlayerPed(-1))) > 5 then
			if F1veh.opened then
				CloseVeh()
			end
		end
		if F1veh.opened then
			local ped = LocalPed()
			local menu = F1veh.menu[F1veh.currentmenu]
			drawTxt(F1veh.title,1,1,F1veh.menu.x,F1veh.menu.y,1.0, 255,255,255,255)
			drawMenuTitle(menu.title, F1veh.menu.x,F1veh.menu.y + 0.08)
			drawTxt(F1veh.selectedbutton.."/"..tablelength(menu.buttons),0,0,F1veh.menu.x + F1veh.menu.width/2 - 0.0385,F1veh.menu.y + 0.067,0.4, 255,255,255,255)
			local y = F1veh.menu.y + 0.12
			buttoncount = tablelength(menu.buttons)
			local selected = false

			for i,button in pairs(menu.buttons) do
				if i >= F1veh.menu.from and i <= F1veh.menu.to then

					if i == F1veh.selectedbutton then
						selected = true
					else
						selected = false
					end
					drawMenuButton(button,F1veh.menu.x,y,selected)
					--if button.distance ~= nil then
						--drawMenuRight(button.distance.."m",F1veh.menu.x,y,selected)
					--end
					y = y + 0.04
					if F1veh.currentmenu == "main" then
						if selected then
								if fakecar.model ~= button.model then
									if DoesEntityExist(fakecar.car) then
										Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(fakecar.car))
									end
									local ped = LocalPed()
									local plyCoords = GetEntityCoords(ped, 0)
									local hash = GetHashKey(button.model)
									RequestModel(hash)
									while not HasModelLoaded(hash) do
										Citizen.Wait(0)
										drawTxt("~b~Chargement...",0,1,0.5,0.5,1.5,255,255,255,255)

									end
									local veh = CreateVehicle(hash,plyCoords["x"], plyCoords["y"], plyCoords["z"],90.0,false,false)
									while not DoesEntityExist(veh) do
										Citizen.Wait(0)
										drawTxt("~b~Chargement...",0,1,0.5,0.5,1.5,255,255,255,255)
									end
									FreezeEntityPosition(veh,true)
									SetEntityInvincible(veh,true)
									SetVehicleDoorsLocked(veh,4)
									--SetEntityCollision(veh,false,false)
									TaskWarpPedIntoVehicle(LocalPed(),veh,-1)
									for i = 0,24 do
										SetVehicleModKit(veh,0)
										RemoveVehicleMod(veh,i)
									end
									fakecar = { model = button.model, car = veh}
								end
						end
					end
					if selected and IsControlJustPressed(1,201) then
						ButtonSelected(button)
					end
				end
			end
		end
		if F1veh.opened then
			if IsControlJustPressed(1,202) then
				Back()
			end
			if IsControlJustReleased(1,202) then
				backlock = false
			end
			if IsControlJustPressed(1,188) then
				if F1veh.selectedbutton > 1 then
					F1veh.selectedbutton = F1veh.selectedbutton -1
					if buttoncount > 10 and F1veh.selectedbutton < F1veh.menu.from then
						F1veh.menu.from = F1veh.menu.from -1
						F1veh.menu.to = F1veh.menu.to - 1
					end
				end
			end
			if IsControlJustPressed(1,187)then
				if F1veh.selectedbutton < buttoncount then
					F1veh.selectedbutton = F1veh.selectedbutton +1
					if buttoncount > 10 and F1veh.selectedbutton > F1veh.menu.to then
						F1veh.menu.to = F1veh.menu.to + 1
						F1veh.menu.from = F1veh.menu.from + 1
					end
				end
			end
		end

	end
end)
---------------------------------------------------
------------------EVENT SPAWN VEH------------------
---------------------------------------------------
RegisterNetEvent('F1veh:spawnVehicle')
AddEventHandler('F1veh:spawnVehicle', function(v)
	local car = GetHashKey(v)
	local playerPed = GetPlayerPed(-1)
	if playerPed and playerPed ~= -1 then
		RequestModel(car)
		while not HasModelLoaded(car) do
				Citizen.Wait(0)
		end
		local playerCoords = GetEntityCoords(playerPed)

		veh = CreateVehicle(car, playerCoords, 0.0, true, false)
		TaskWarpPedIntoVehicle(playerPed, veh, -1)
		SetEntityInvincible(veh, false)
	end
end)