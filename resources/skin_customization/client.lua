skins = {
	{
		name = "mp_f_freemode_01",
		display = "Femme"
	},
	{
		name = "mp_m_freemode_01",
		display = "Homme"
	}
}

local isSpawnedInHospitalOnDeath = true

RegisterNetEvent("skin_customization:Customization")
RegisterNetEvent("skin_customization:OnDeath")


local changeYourSkin = {
  {name="magasin", colour=15, id=73, x=1864.44, y=3747.34, z=33.0318},
  {name="magasin", colour=15, id=73, x=1693.26, y=4822.27, z=42.0630},
  {name="magasin", colour=15, id=73, x=125.83, y=-223.16, z=54.5578},
  {name="magasin", colour=15, id=73, x=-710.16, y=-153.26, z=37.4151},
  {name="magasin", colour=15, id=73, x=-821.69, y=-1073.90, z=11.3280},
  {name="magasin", colour=15, id=73, x=-1192.81, y=-768.24, z=17.3193},
  {name="magasin", colour=15, id=73, x=4.25, y=6512.88, z=31.8778},
}



function IsNearStore()
  local ply = GetPlayerPed(-1)
  local plyCoords = GetEntityCoords(ply, 0)
  for _, item in pairs(changeYourSkin) do
    local distance = GetDistanceBetweenCoords(item.x, item.y, item.z,  plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
    if(distance <= 5) then
      return true
    end
  end
end



function InitMenu()
	ClearMenu()
	Menu.addTitle("Choisissez un skin");
   	Menu.addButton(skins[2].display, "SendSkin", skins[2].name);
	Menu.addButton(skins[1].display, "SendSkin", skins[1].name);
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

function SendSkin(skin)
    TriggerServerEvent("skin_customization:ChoosenSkin",skin)
end

--Notification joueur
function Notify(text)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
    DrawNotification(false, false)
end

AddEventHandler("skin_customization:Customization",function(skin)
    ChangeSkin(skin,nil)
	--Notify("Skin chargé")
	InitDrawMenu()
end)

AddEventHandler("skin_customization:OnDeath",function()
	print("ondeath")
	if isSpawnedInHospitalOnDeath then
		SetEntityCoords(GetPlayerPed(-1), 295.83, -1446.94, 29.97, 1, 0, 0, 1) -- Hospital
		print("spawn")
	end
	TriggerServerEvent("skin_customization:SpawnPlayer")
end)

RegisterNetEvent("skin_customization:updateComponents")
AddEventHandler("skin_customization:updateComponents",function(args)
		ChangeComponent({0,0,args[1],args[2]})-- 1:componentID; 2: page; 3: drawbleID; 4: textureID
		ChangeComponent({2,0,args[3],args[4]})
		ChangeComponent({4,0,args[5],args[6]})
		ChangeComponent({6,0,args[7],args[8]})
		ChangeComponent({11,0,args[9],args[10]})
		ChangeComponent({8,0,args[11],args[12]})
		Notify("Skin et composants chargés")
end)

function InitDrawMenu()
	ClearMenu()
	Menu.addButton("Visage","DrawableChoice",{0,0})
	Menu.addButton("Cheveux","DrawableChoice",{2,0})
	Menu.addButton("Torse","DrawableChoice",{11,0})
	Menu.addButton("T-shirt","DrawableChoice",{8,0})
	Menu.addButton("Pantalon","DrawableChoice",{4,0})
	Menu.addButton("Chaussures","DrawableChoice",{6,0})
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

function DrawableChoice(args)
	ClearMenu()
	local max = GetNumberOfPedDrawableVariations(GetPlayerPed(-1), args[1])

	if max > (args[2]+1)*8 then
		max = (args[2]+1)*8
	end
	if args[2] > 0 then
		Menu.addButton("Page précédente","DrawableChoice",{args[1],args[2]-1})
	end
	for i = args[2]*8,max-1 do				
		Menu.addButton("Draw: "..i,"TextureChoice",{args[1],0,i})
	end
	if max <= (args[2]+1)*8 then
		Menu.addButton("Page suivante","DrawableChoice",{args[1],args[2]+1})
	end
	Menu.addButton("Retour","InitDrawMenu","")
end

function TextureChoice(args)
	ClearMenu()
	local max = GetNumberOfPedTextureVariations(GetPlayerPed(-1),args[1],args[3])
	if max > (args[2]+1)*8 then
		max = (args[2]+1)*8
	end
	if args[2] > 0 then
		Menu.addButton("Page précédente","TextureChoice",{args[1],args[2]-1,args[3]})
	end
	for i = args[2]*8,max-1 do
		if IsPedComponentVariationValid(GetPlayerPed(-1), args[1], args[3], i) then
			Menu.addButton("Text: "..i,"ChangeComponent",{args[1],args[2],args[3],i})
		end
	end
	if max <= (args[2]+1)*8 then
		Menu.addButton("Page suivante","TextureChoice",{args[1],args[2]+1,args[3]})
	end
	Menu.addButton("Retour","DrawableChoice",args)
end

function ChangeComponent(args)-- 1:componentID; 2: page; 3: drawbleID; 4: textureID
	SetPedComponentVariation(GetPlayerPed(-1), args[1], args[3], args[4], 2)
	TriggerServerEvent("skin_customization:SaveComponents",args)
end
AddEventHandler('onPlayerDied', function(playerId, reason, position)
	print("ondeath")
	if isSpawnedInHospitalOnDeath then
		SetEntityCoords(GetPlayerPed(-1), 295.83, -1446.94, 29.97, 1, 0, 0, 1) -- Hospital
		print("spawn")
	end
	TriggerServerEvent("skin_customization:SpawnPlayer")
end)

--Action lors du spawn du joueur
local firstspawn = 0
AddEventHandler('playerSpawned', function(spawn)
--On verifie que c'est bien le premier spawn du joueur
if firstspawn == 0 then
	TriggerServerEvent("skin_customization:SpawnPlayer")
	firstspawn = 1
end
end)

function ChangeSkin(skin,components)
	--Menu.hidden = true
	-- Get model hash.
	local modelhashed = GetHashKey(skin)

    
    -- Request the model, and wait further triggering untill fully loaded.
	RequestModel(modelhashed)
	while not HasModelLoaded(modelhashed) do 
	    RequestModel(modelhashed)
	    Citizen.Wait(0)
	end
    -- Set playermodel.
	SetPlayerModel(PlayerId(), modelhashed)

	if components == nil then
		local playerPed = GetPlayerPed(-1)
	 	--SET_PED_COMPONENT_VARIATION(Ped ped, int componentId, int drawableId, int textureId, int paletteId)
		 --SetPedComponentVariation(playerPed, 0, 0, 0, 2) --Face
		 --SetPedComponentVariation(playerPed, 2, 11, 4, 2) --Hair 
		 --SetPedComponentVariation(playerPed, 4, 1, 5, 2) -- Pantalon
		 --SetPedComponentVariation(playerPed, 6, 1, 0, 2) -- Shoes
		 --SetPedComponentVariation(playerPed, 11, 7, 2, 2) -- Jacket
		 TriggerServerEvent("skin_customization:ChoosenComponents")
	end
	local a = "" -- nil doesnt work
	 TriggerServerEvent("weaponshop:playerSpawned",a)
	 TriggerServerEvent("item:getItems")
	SetModelAsNoLongerNeeded(modelhashed)
end


Citizen.CreateThread(function()
    for _, item in pairs(changeYourSkin) do
      item.blip = AddBlipForCoord(item.x, item.y, item.z)
      SetBlipSprite(item.blip, item.id)
      SetBlipAsShortRange(item.blip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(item.name)
      EndTextCommandSetBlipName(item.blip)
    end
end)


Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if (IsNearStore() == true) then
      drawTxt('Appuyer sur ~g~F5~s~ pour accéder au magasin',0,1,0.5,0.8,0.6,255,255,255,255)
    if (IsControlJustPressed(1, 166) and IsNearStore() == true) then
      InitMenu()
      Menu.hidden = not Menu.hidden 
    end
  end
    Menu.renderGUI()
  end
end)