local options = {
    x = 0.1,
    y = 0.2,
    width = 0.2,
    height = 0.04,
    scale = 0.4,
    font = 0,
    menu_title = "Model Menu",
    menu_subtitle = "Categories",
    color_r = 30,
    color_g = 144,
    color_b = 255,
}

AddEventHandler('playerSpawned', function(spawn)
	TriggerServerEvent("mm:spawn")
end)

RegisterNetEvent("mm:changemodel")
AddEventHandler("mm:changemodel",function(model)
    changemodel(model,nil)
	Notify("~r~Skin chargé")	
end)

RegisterNetEvent("mm:changempmodel")
AddEventHandler("mm:changempmodel",function(model)
    changempmodel(model,nil)
	Notify("~r~MP Skin chargé")
end)

RegisterNetEvent("mm:changemodelspawn")
AddEventHandler("mm:changemodelspawn",function(model)
    changemodel(model,nil)
	Notify("~r~Skin chargé")
	TriggerServerEvent("mm:spawn2")
end)

RegisterNetEvent("mm:changempmodelspawn")
AddEventHandler("mm:changempmodelspawn",function(model)
    changempmodel(model,nil)
	Notify("~r~MP Skin chargé")
	TriggerServerEvent("mm:spawn2")
end)

RegisterNetEvent("mm:firstspawn")
AddEventHandler("mm:firstspawn",function()
	Main() -- Menu to draw
    Menu.hidden = not Menu.hidden -- Hide/Show the menu
    Menu.renderGUI(options) -- Draw menu on each tick if Menu.hidden = false
end)

RegisterNetEvent("mm:change_components_spawn") --Sets mask and texture when spawned
AddEventHandler("mm:change_components_spawn",function(componentstuff)
    SetPedComponentVariation(GetPlayerPed(-1), 1, tonumber(componentstuff.mask), tonumber(componentstuff.mask_txt), 0)
end)

function changemodel(model)
	
	local modelhashed = GetHashKey(model)

	RequestModel(modelhashed)
	while not HasModelLoaded(modelhashed) do 
	    RequestModel(modelhashed)
	    Citizen.Wait(0)
	end

	SetPlayerModel(PlayerId(), modelhashed)
	SetPedRandomComponentVariation(GetPlayerPed(-1), true)
	local a = "" -- nil doesnt work
	SetModelAsNoLongerNeeded(modelhashed)
end

function changempmodel(model)
	
	local modelhashed = GetHashKey(model)

	RequestModel(modelhashed)
	while not HasModelLoaded(modelhashed) do 
	    RequestModel(modelhashed)
	    Citizen.Wait(0)
	end

	SetPlayerModel(PlayerId(), modelhashed)
	local a = "" -- nil doesnt work
	SetPedComponentVariation(GetPlayerPed(-1), 7, 0, 0, 0)
	if model == 'mp_f_freemode_01' then
		SetPedComponentVariation(GetPlayerPed(-1), 0, 34, 0, 0)
	end
	SetModelAsNoLongerNeeded(modelhashed)
end

function Notify(text)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
    DrawNotification(false, false)
end

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function savemodel(model)
	TriggerServerEvent("mm:savemodel", model)
end

function savempmodel(model)
	TriggerServerEvent("mm:savempmodel", model)
end

function Main()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
	Notify("~g~Press F5 pour ouvrir/fermer")
    options.menu_subtitle = "Categories"
    ClearMenu()
	Menu.addButton("Accessoires", "Accessories", nil)
    Menu.addButton("Skin Hommes", "MaleMenu", nil)
    Menu.addButton("Female Models", "FemaleMenu", nil)
--    Menu.addButton("EMS Models","EMSMenu",nil)
--    Menu.addButton("Animals", "AnimalMenu", nil)
    Menu.addButton("Others", "OtherMenu", nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Male Menu Page 1/16
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaleMenu()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Male Models            Page 1 of 16"
    ClearMenu()
    Menu.addButton(male_models[Menu.buttonCount+1], "savemodel", male_models[Menu.buttonCount+1])
    Menu.addButton(male_models[Menu.buttonCount+1], "savemodel", male_models[Menu.buttonCount+1])
    Menu.addButton(male_models[Menu.buttonCount+1], "savemodel", male_models[Menu.buttonCount+1])
    Menu.addButton(male_models[Menu.buttonCount+1], "savemodel", male_models[Menu.buttonCount+1])
    Menu.addButton(male_models[Menu.buttonCount+1], "savemodel", male_models[Menu.buttonCount+1])
    Menu.addButton(male_models[Menu.buttonCount+1], "savemodel", male_models[Menu.buttonCount+1])
    Menu.addButton(male_models[Menu.buttonCount+1], "savemodel", male_models[Menu.buttonCount+1])
    Menu.addButton(male_models[Menu.buttonCount+1], "savemodel", male_models[Menu.buttonCount+1])
    Menu.addButton("Next Page","MaleMenu2",nil)
    Menu.addButton("Previous Page","MaleMenu16",nil)	
    Menu.addButton("Return","Main",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Male Menu Page 2/16
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaleMenu2()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Male Models            Page 2 of 16"
    ClearMenu()
    Menu.addButton(male_models2[Menu.buttonCount+1], "savemodel", male_models2[Menu.buttonCount+1])
    Menu.addButton(male_models2[Menu.buttonCount+1], "savemodel", male_models2[Menu.buttonCount+1])
    Menu.addButton(male_models2[Menu.buttonCount+1], "savemodel", male_models2[Menu.buttonCount+1])
    Menu.addButton(male_models2[Menu.buttonCount+1], "savemodel", male_models2[Menu.buttonCount+1])
    Menu.addButton(male_models2[Menu.buttonCount+1], "savemodel", male_models2[Menu.buttonCount+1])
    Menu.addButton(male_models2[Menu.buttonCount+1], "savemodel", male_models2[Menu.buttonCount+1])
    Menu.addButton(male_models2[Menu.buttonCount+1], "savemodel", male_models2[Menu.buttonCount+1])
    Menu.addButton(male_models2[Menu.buttonCount+1], "savemodel", male_models2[Menu.buttonCount+1])
    Menu.addButton("Next Page","MaleMenu3",nil)
    Menu.addButton("Previous Page","MaleMenu",nil)	
    Menu.addButton("Return","Main",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Male Menu Page 3/16
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaleMenu3()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Male Models            Page 3 of 16"
    ClearMenu()
    Menu.addButton(male_models3[Menu.buttonCount+1], "savemodel", male_models3[Menu.buttonCount+1])
    Menu.addButton(male_models3[Menu.buttonCount+1], "savemodel", male_models3[Menu.buttonCount+1])
    Menu.addButton(male_models3[Menu.buttonCount+1], "savemodel", male_models3[Menu.buttonCount+1])
    Menu.addButton(male_models3[Menu.buttonCount+1], "savemodel", male_models3[Menu.buttonCount+1])
    Menu.addButton(male_models3[Menu.buttonCount+1], "savemodel", male_models3[Menu.buttonCount+1])
    Menu.addButton(male_models3[Menu.buttonCount+1], "savemodel", male_models3[Menu.buttonCount+1])
    Menu.addButton(male_models3[Menu.buttonCount+1], "savemodel", male_models3[Menu.buttonCount+1])
    Menu.addButton(male_models3[Menu.buttonCount+1], "savemodel", male_models3[Menu.buttonCount+1])
    Menu.addButton("Next Page","MaleMenu4",nil)
    Menu.addButton("Previous Page","MaleMenu2",nil)	
    Menu.addButton("Return","Main",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Male Menu Page 4/16
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaleMenu4()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Male Models            Page 4 of 16"
    ClearMenu()
    Menu.addButton(male_models4[Menu.buttonCount+1], "savemodel", male_models4[Menu.buttonCount+1])
    Menu.addButton(male_models4[Menu.buttonCount+1], "savemodel", male_models4[Menu.buttonCount+1])
    Menu.addButton(male_models4[Menu.buttonCount+1], "savemodel", male_models4[Menu.buttonCount+1])
    Menu.addButton(male_models4[Menu.buttonCount+1], "savemodel", male_models4[Menu.buttonCount+1])
    Menu.addButton(male_models4[Menu.buttonCount+1], "savemodel", male_models4[Menu.buttonCount+1])
    Menu.addButton(male_models4[Menu.buttonCount+1], "savemodel", male_models4[Menu.buttonCount+1])
    Menu.addButton(male_models4[Menu.buttonCount+1], "savemodel", male_models4[Menu.buttonCount+1])
    Menu.addButton(male_models4[Menu.buttonCount+1], "savemodel", male_models4[Menu.buttonCount+1])
    Menu.addButton("Next Page","MaleMenu5",nil)
    Menu.addButton("Previous Page","MaleMenu3",nil)	
    Menu.addButton("Return","Main",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Male Menu Page 5/16
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaleMenu5()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Male Models            Page 5 of 16"
    ClearMenu()
    Menu.addButton(male_models5[Menu.buttonCount+1], "savemodel", male_models5[Menu.buttonCount+1])
    Menu.addButton(male_models5[Menu.buttonCount+1], "savemodel", male_models5[Menu.buttonCount+1])
    Menu.addButton(male_models5[Menu.buttonCount+1], "savemodel", male_models5[Menu.buttonCount+1])
    Menu.addButton(male_models5[Menu.buttonCount+1], "savemodel", male_models5[Menu.buttonCount+1])
    Menu.addButton(male_models5[Menu.buttonCount+1], "savemodel", male_models5[Menu.buttonCount+1])
    Menu.addButton(male_models5[Menu.buttonCount+1], "savemodel", male_models5[Menu.buttonCount+1])
    Menu.addButton(male_models5[Menu.buttonCount+1], "savemodel", male_models5[Menu.buttonCount+1])
    Menu.addButton(male_models5[Menu.buttonCount+1], "savemodel", male_models5[Menu.buttonCount+1])
    Menu.addButton("Next Page","MaleMenu6",nil)
    Menu.addButton("Previous Page","MaleMenu4",nil)	
    Menu.addButton("Return","Main",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Male Menu Page 6/16
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaleMenu6()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Male Models            Page 6 of 16"
    ClearMenu()
    Menu.addButton(male_models6[Menu.buttonCount+1], "savemodel", male_models6[Menu.buttonCount+1])
    Menu.addButton(male_models6[Menu.buttonCount+1], "savemodel", male_models6[Menu.buttonCount+1])
    Menu.addButton(male_models6[Menu.buttonCount+1], "savemodel", male_models6[Menu.buttonCount+1])
    Menu.addButton(male_models6[Menu.buttonCount+1], "savemodel", male_models6[Menu.buttonCount+1])
    Menu.addButton(male_models6[Menu.buttonCount+1], "savemodel", male_models6[Menu.buttonCount+1])
    Menu.addButton(male_models6[Menu.buttonCount+1], "savemodel", male_models6[Menu.buttonCount+1])
    Menu.addButton(male_models6[Menu.buttonCount+1], "savemodel", male_models6[Menu.buttonCount+1])
    Menu.addButton(male_models6[Menu.buttonCount+1], "savemodel", male_models6[Menu.buttonCount+1])
    Menu.addButton("Next Page","MaleMenu7",nil)
    Menu.addButton("Previous Page","MaleMenu5",nil)	
    Menu.addButton("Return","Main",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Male Menu Page 7/16
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaleMenu7()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Male Models            Page 7 of 16"
    ClearMenu()
    Menu.addButton(male_models7[Menu.buttonCount+1], "savemodel", male_models7[Menu.buttonCount+1])
    Menu.addButton(male_models7[Menu.buttonCount+1], "savemodel", male_models7[Menu.buttonCount+1])
    Menu.addButton(male_models7[Menu.buttonCount+1], "savemodel", male_models7[Menu.buttonCount+1])
    Menu.addButton(male_models7[Menu.buttonCount+1], "savemodel", male_models7[Menu.buttonCount+1])
    Menu.addButton(male_models7[Menu.buttonCount+1], "savemodel", male_models7[Menu.buttonCount+1])
    Menu.addButton(male_models7[Menu.buttonCount+1], "savemodel", male_models7[Menu.buttonCount+1])
    Menu.addButton(male_models7[Menu.buttonCount+1], "savemodel", male_models7[Menu.buttonCount+1])
    Menu.addButton(male_models7[Menu.buttonCount+1], "savemodel", male_models7[Menu.buttonCount+1])
    Menu.addButton("Next Page","MaleMenu8",nil)
    Menu.addButton("Previous Page","MaleMenu6",nil)	
    Menu.addButton("Return","Main",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Male Menu Page 8/16
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaleMenu8()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Male Models            Page 8 of 16"
    ClearMenu()
    Menu.addButton(male_models8[Menu.buttonCount+1], "savemodel", male_models8[Menu.buttonCount+1])
    Menu.addButton(male_models8[Menu.buttonCount+1], "savemodel", male_models8[Menu.buttonCount+1])
    Menu.addButton(male_models8[Menu.buttonCount+1], "savemodel", male_models8[Menu.buttonCount+1])
    Menu.addButton(male_models8[Menu.buttonCount+1], "savemodel", male_models8[Menu.buttonCount+1])
    Menu.addButton(male_models8[Menu.buttonCount+1], "savemodel", male_models8[Menu.buttonCount+1])
    Menu.addButton(male_models8[Menu.buttonCount+1], "savemodel", male_models8[Menu.buttonCount+1])
    Menu.addButton(male_models8[Menu.buttonCount+1], "savemodel", male_models8[Menu.buttonCount+1])
    Menu.addButton(male_models8[Menu.buttonCount+1], "savemodel", male_models8[Menu.buttonCount+1])
    Menu.addButton("Next Page","MaleMenu9",nil)
    Menu.addButton("Previous Page","MaleMenu7",nil)	
    Menu.addButton("Return","Main",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Male Menu Page 9/16
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaleMenu9()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Male Models            Page 9 of 16"
    ClearMenu()
    Menu.addButton(male_models9[Menu.buttonCount+1], "savemodel", male_models9[Menu.buttonCount+1])
    Menu.addButton(male_models9[Menu.buttonCount+1], "savemodel", male_models9[Menu.buttonCount+1])
    Menu.addButton(male_models9[Menu.buttonCount+1], "savemodel", male_models9[Menu.buttonCount+1])
    Menu.addButton(male_models9[Menu.buttonCount+1], "savemodel", male_models9[Menu.buttonCount+1])
    Menu.addButton(male_models9[Menu.buttonCount+1], "savemodel", male_models9[Menu.buttonCount+1])
    Menu.addButton(male_models9[Menu.buttonCount+1], "savemodel", male_models9[Menu.buttonCount+1])
    Menu.addButton(male_models9[Menu.buttonCount+1], "savemodel", male_models9[Menu.buttonCount+1])
    Menu.addButton(male_models9[Menu.buttonCount+1], "savemodel", male_models9[Menu.buttonCount+1])
    Menu.addButton("Next Page","MaleMenu10",nil)
    Menu.addButton("Previous Page","MaleMenu8",nil)	
    Menu.addButton("Return","Main",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Male Menu Page 10/16
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaleMenu10()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Male Models            Page 10 of 16"
    ClearMenu()
    Menu.addButton(male_models10[Menu.buttonCount+1], "savemodel", male_models10[Menu.buttonCount+1])
    Menu.addButton(male_models10[Menu.buttonCount+1], "savemodel", male_models10[Menu.buttonCount+1])
    Menu.addButton(male_models10[Menu.buttonCount+1], "savemodel", male_models10[Menu.buttonCount+1])
    Menu.addButton(male_models10[Menu.buttonCount+1], "savemodel", male_models10[Menu.buttonCount+1])
    Menu.addButton(male_models10[Menu.buttonCount+1], "savemodel", male_models10[Menu.buttonCount+1])
    Menu.addButton(male_models10[Menu.buttonCount+1], "savemodel", male_models10[Menu.buttonCount+1])
    Menu.addButton(male_models10[Menu.buttonCount+1], "savemodel", male_models10[Menu.buttonCount+1])
    Menu.addButton(male_models10[Menu.buttonCount+1], "savemodel", male_models10[Menu.buttonCount+1])
    Menu.addButton("Next Page","MaleMenu11",nil)
    Menu.addButton("Previous Page","MaleMenu9",nil)	
    Menu.addButton("Return","Main",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Male Menu Page 11/16
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaleMenu11()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Male Models            Page 11 of 16"
    ClearMenu()
    Menu.addButton(male_models11[Menu.buttonCount+1], "savemodel", male_models11[Menu.buttonCount+1])
    Menu.addButton(male_models11[Menu.buttonCount+1], "savemodel", male_models11[Menu.buttonCount+1])
    Menu.addButton(male_models11[Menu.buttonCount+1], "savemodel", male_models11[Menu.buttonCount+1])
    Menu.addButton(male_models11[Menu.buttonCount+1], "savemodel", male_models11[Menu.buttonCount+1])
    Menu.addButton(male_models11[Menu.buttonCount+1], "savemodel", male_models11[Menu.buttonCount+1])
    Menu.addButton(male_models11[Menu.buttonCount+1], "savemodel", male_models11[Menu.buttonCount+1])
    Menu.addButton(male_models11[Menu.buttonCount+1], "savemodel", male_models11[Menu.buttonCount+1])
    Menu.addButton(male_models11[Menu.buttonCount+1], "savemodel", male_models11[Menu.buttonCount+1])
    Menu.addButton("Next Page","MaleMenu12",nil)
    Menu.addButton("Previous Page","MaleMenu10",nil)	
    Menu.addButton("Return","Main",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Male Menu Page 12/16
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaleMenu12()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Male Models            Page 12 of 16"
    ClearMenu()
    Menu.addButton(male_models12[Menu.buttonCount+1], "savemodel", male_models12[Menu.buttonCount+1])
    Menu.addButton(male_models12[Menu.buttonCount+1], "savemodel", male_models12[Menu.buttonCount+1])
    Menu.addButton(male_models12[Menu.buttonCount+1], "savemodel", male_models12[Menu.buttonCount+1])
    Menu.addButton(male_models12[Menu.buttonCount+1], "savemodel", male_models12[Menu.buttonCount+1])
    Menu.addButton(male_models12[Menu.buttonCount+1], "savemodel", male_models12[Menu.buttonCount+1])
    Menu.addButton(male_models12[Menu.buttonCount+1], "savemodel", male_models12[Menu.buttonCount+1])
    Menu.addButton(male_models12[Menu.buttonCount+1], "savemodel", male_models12[Menu.buttonCount+1])
    Menu.addButton(male_models12[Menu.buttonCount+1], "savemodel", male_models12[Menu.buttonCount+1])
    Menu.addButton("Next Page","MaleMenu13",nil)
    Menu.addButton("Previous Page","MaleMenu11",nil)	
    Menu.addButton("Return","Main",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Male Menu Page 13/16
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaleMenu13()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Male Models            Page 13 of 16"
    ClearMenu()
    Menu.addButton(male_models13[Menu.buttonCount+1], "savemodel", male_models13[Menu.buttonCount+1])
    Menu.addButton(male_models13[Menu.buttonCount+1], "savemodel", male_models13[Menu.buttonCount+1])
    Menu.addButton(male_models13[Menu.buttonCount+1], "savemodel", male_models13[Menu.buttonCount+1])
    Menu.addButton(male_models13[Menu.buttonCount+1], "savemodel", male_models13[Menu.buttonCount+1])
    Menu.addButton(male_models13[Menu.buttonCount+1], "savemodel", male_models13[Menu.buttonCount+1])
    Menu.addButton(male_models13[Menu.buttonCount+1], "savemodel", male_models13[Menu.buttonCount+1])
    Menu.addButton(male_models13[Menu.buttonCount+1], "savemodel", male_models13[Menu.buttonCount+1])
    Menu.addButton(male_models13[Menu.buttonCount+1], "savemodel", male_models13[Menu.buttonCount+1])
    Menu.addButton("Next Page","MaleMenu14",nil)
    Menu.addButton("Previous Page","MaleMenu12",nil)	
    Menu.addButton("Return","Main",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Male Menu Page 14/16
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaleMenu14()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Male Models            Page 14 of 16"
    ClearMenu()
    Menu.addButton(male_models14[Menu.buttonCount+1], "savemodel", male_models14[Menu.buttonCount+1])
    Menu.addButton(male_models14[Menu.buttonCount+1], "savemodel", male_models14[Menu.buttonCount+1])
    Menu.addButton(male_models14[Menu.buttonCount+1], "savemodel", male_models14[Menu.buttonCount+1])
    Menu.addButton(male_models14[Menu.buttonCount+1], "savemodel", male_models14[Menu.buttonCount+1])
    Menu.addButton(male_models14[Menu.buttonCount+1], "savemodel", male_models14[Menu.buttonCount+1])
    Menu.addButton(male_models14[Menu.buttonCount+1], "savemodel", male_models14[Menu.buttonCount+1])
    Menu.addButton(male_models14[Menu.buttonCount+1], "savemodel", male_models14[Menu.buttonCount+1])
    Menu.addButton(male_models14[Menu.buttonCount+1], "savemodel", male_models14[Menu.buttonCount+1])
    Menu.addButton("Next Page","MaleMenu15",nil)
    Menu.addButton("Previous Page","MaleMenu13",nil)	
    Menu.addButton("Return","Main",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Male Menu Page 15/16
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaleMenu15()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Male Models            Page 15 of 16"
    ClearMenu()
    Menu.addButton(male_models15[Menu.buttonCount+1], "savemodel", male_models15[Menu.buttonCount+1])
    Menu.addButton(male_models15[Menu.buttonCount+1], "savemodel", male_models15[Menu.buttonCount+1])
    Menu.addButton(male_models15[Menu.buttonCount+1], "savemodel", male_models15[Menu.buttonCount+1])
    Menu.addButton(male_models15[Menu.buttonCount+1], "savemodel", male_models15[Menu.buttonCount+1])
    Menu.addButton(male_models15[Menu.buttonCount+1], "savemodel", male_models15[Menu.buttonCount+1])
    Menu.addButton(male_models15[Menu.buttonCount+1], "savemodel", male_models15[Menu.buttonCount+1])
    Menu.addButton(male_models15[Menu.buttonCount+1], "savemodel", male_models15[Menu.buttonCount+1])
    Menu.addButton(male_models15[Menu.buttonCount+1], "savemodel", male_models15[Menu.buttonCount+1])
    Menu.addButton("Next Page","MaleMenu16",nil)
    Menu.addButton("Previous Page","MaleMenu14",nil)	
    Menu.addButton("Return","Main",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Male Menu Page 16/16
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaleMenu16()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Male Models            Page 16 of 16"
    ClearMenu()
    Menu.addButton(male_models16[Menu.buttonCount+1], "savemodel", male_models16[Menu.buttonCount+1])
    Menu.addButton(male_models16[Menu.buttonCount+1], "savemodel", male_models16[Menu.buttonCount+1])
    Menu.addButton(male_models16[Menu.buttonCount+1], "savemodel", male_models16[Menu.buttonCount+1])
    Menu.addButton("Next Page","MaleMenu",nil)
    Menu.addButton("Previous Page","MaleMenu15",nil)	
    Menu.addButton("Return","Main",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Female Menu Page 1/9
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleMenu()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Female Models           Page 1 of 9"
    ClearMenu()
    Menu.addButton(female_models[Menu.buttonCount+1], "savemodel", female_models[Menu.buttonCount+1])
    Menu.addButton(female_models[Menu.buttonCount+1], "savemodel", female_models[Menu.buttonCount+1])
    Menu.addButton(female_models[Menu.buttonCount+1], "savemodel", female_models[Menu.buttonCount+1])
    Menu.addButton(female_models[Menu.buttonCount+1], "savemodel", female_models[Menu.buttonCount+1])
    Menu.addButton(female_models[Menu.buttonCount+1], "savemodel", female_models[Menu.buttonCount+1])
    Menu.addButton(female_models[Menu.buttonCount+1], "savemodel", female_models[Menu.buttonCount+1])
    Menu.addButton(female_models[Menu.buttonCount+1], "savemodel", female_models[Menu.buttonCount+1])
    Menu.addButton(female_models[Menu.buttonCount+1], "savemodel", female_models[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemaleMenu2",nil)
    Menu.addButton("Previous Page","FemaleMenu9",nil)	
    Menu.addButton("Return","Main",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Female Menu Page 2/9
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleMenu2()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Female Models           Page 2 of 9"
    ClearMenu()
    Menu.addButton(female_models2[Menu.buttonCount+1], "savemodel", female_models2[Menu.buttonCount+1])
    Menu.addButton(female_models2[Menu.buttonCount+1], "savemodel", female_models2[Menu.buttonCount+1])
    Menu.addButton(female_models2[Menu.buttonCount+1], "savemodel", female_models2[Menu.buttonCount+1])
    Menu.addButton(female_models2[Menu.buttonCount+1], "savemodel", female_models2[Menu.buttonCount+1])
    Menu.addButton(female_models2[Menu.buttonCount+1], "savemodel", female_models2[Menu.buttonCount+1])
    Menu.addButton(female_models2[Menu.buttonCount+1], "savemodel", female_models2[Menu.buttonCount+1])
    Menu.addButton(female_models2[Menu.buttonCount+1], "savemodel", female_models2[Menu.buttonCount+1])
    Menu.addButton(female_models2[Menu.buttonCount+1], "savemodel", female_models2[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemaleMenu3",nil)
    Menu.addButton("Previous Page","FemaleMenu",nil)	
    Menu.addButton("Return","Main",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Female Menu Page 3/9
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleMenu3()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Female Models           Page 3 of 9"
    ClearMenu()
    Menu.addButton(female_models3[Menu.buttonCount+1], "savemodel", female_models3[Menu.buttonCount+1])
    Menu.addButton(female_models3[Menu.buttonCount+1], "savemodel", female_models3[Menu.buttonCount+1])
    Menu.addButton(female_models3[Menu.buttonCount+1], "savemodel", female_models3[Menu.buttonCount+1])
    Menu.addButton(female_models3[Menu.buttonCount+1], "savemodel", female_models3[Menu.buttonCount+1])
    Menu.addButton(female_models3[Menu.buttonCount+1], "savemodel", female_models3[Menu.buttonCount+1])
    Menu.addButton(female_models3[Menu.buttonCount+1], "savemodel", female_models3[Menu.buttonCount+1])
    Menu.addButton(female_models3[Menu.buttonCount+1], "savemodel", female_models3[Menu.buttonCount+1])
    Menu.addButton(female_models3[Menu.buttonCount+1], "savemodel", female_models3[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemaleMenu4",nil)
    Menu.addButton("Previous Page","FemaleMenu2",nil)	
    Menu.addButton("Return","Main",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Female Menu Page 4/9
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleMenu4()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Female Models           Page 4 of 9"
    ClearMenu()
    Menu.addButton(female_models4[Menu.buttonCount+1], "savemodel", female_models4[Menu.buttonCount+1])
    Menu.addButton(female_models4[Menu.buttonCount+1], "savemodel", female_models4[Menu.buttonCount+1])
    Menu.addButton(female_models4[Menu.buttonCount+1], "savemodel", female_models4[Menu.buttonCount+1])
    Menu.addButton(female_models4[Menu.buttonCount+1], "savemodel", female_models4[Menu.buttonCount+1])
    Menu.addButton(female_models4[Menu.buttonCount+1], "savemodel", female_models4[Menu.buttonCount+1])
    Menu.addButton(female_models4[Menu.buttonCount+1], "savemodel", female_models4[Menu.buttonCount+1])
    Menu.addButton(female_models4[Menu.buttonCount+1], "savemodel", female_models4[Menu.buttonCount+1])
    Menu.addButton(female_models4[Menu.buttonCount+1], "savemodel", female_models4[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemaleMenu5",nil)
    Menu.addButton("Previous Page","FemaleMenu3",nil)	
    Menu.addButton("Return","Main",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Female Menu Page 5/9
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleMenu5()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Female Models           Page 5 of 9"
    ClearMenu()
    Menu.addButton(female_models5[Menu.buttonCount+1], "savemodel", female_models5[Menu.buttonCount+1])
    Menu.addButton(female_models5[Menu.buttonCount+1], "savemodel", female_models5[Menu.buttonCount+1])
    Menu.addButton(female_models5[Menu.buttonCount+1], "savemodel", female_models5[Menu.buttonCount+1])
    Menu.addButton(female_models5[Menu.buttonCount+1], "savemodel", female_models5[Menu.buttonCount+1])
    Menu.addButton(female_models5[Menu.buttonCount+1], "savemodel", female_models5[Menu.buttonCount+1])
    Menu.addButton(female_models5[Menu.buttonCount+1], "savemodel", female_models5[Menu.buttonCount+1])
    Menu.addButton(female_models5[Menu.buttonCount+1], "savemodel", female_models5[Menu.buttonCount+1])
    Menu.addButton(female_models5[Menu.buttonCount+1], "savemodel", female_models5[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemaleMenu6",nil)
    Menu.addButton("Previous Page","FemaleMenu4",nil)	
    Menu.addButton("Return","Main",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Female Menu Page 6/9
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleMenu6()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Female Models           Page 6 of 9"
    ClearMenu()
    Menu.addButton(female_models6[Menu.buttonCount+1], "savemodel", female_models6[Menu.buttonCount+1])
    Menu.addButton(female_models6[Menu.buttonCount+1], "savemodel", female_models6[Menu.buttonCount+1])
    Menu.addButton(female_models6[Menu.buttonCount+1], "savemodel", female_models6[Menu.buttonCount+1])
    Menu.addButton(female_models6[Menu.buttonCount+1], "savemodel", female_models6[Menu.buttonCount+1])
    Menu.addButton(female_models6[Menu.buttonCount+1], "savemodel", female_models6[Menu.buttonCount+1])
    Menu.addButton(female_models6[Menu.buttonCount+1], "savemodel", female_models6[Menu.buttonCount+1])
    Menu.addButton(female_models6[Menu.buttonCount+1], "savemodel", female_models6[Menu.buttonCount+1])
    Menu.addButton(female_models6[Menu.buttonCount+1], "savemodel", female_models6[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemaleMenu7",nil)
    Menu.addButton("Previous Page","FemaleMenu5",nil)	
    Menu.addButton("Return","Main",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Female Menu Page 7/9
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleMenu7()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Female Models           Page 7 of 9"
    ClearMenu()
    Menu.addButton(female_models7[Menu.buttonCount+1], "savemodel", female_models7[Menu.buttonCount+1])
    Menu.addButton(female_models7[Menu.buttonCount+1], "savemodel", female_models7[Menu.buttonCount+1])
    Menu.addButton(female_models7[Menu.buttonCount+1], "savemodel", female_models7[Menu.buttonCount+1])
    Menu.addButton(female_models7[Menu.buttonCount+1], "savemodel", female_models7[Menu.buttonCount+1])
    Menu.addButton(female_models7[Menu.buttonCount+1], "savemodel", female_models7[Menu.buttonCount+1])
    Menu.addButton(female_models7[Menu.buttonCount+1], "savemodel", female_models7[Menu.buttonCount+1])
    Menu.addButton(female_models7[Menu.buttonCount+1], "savemodel", female_models7[Menu.buttonCount+1])
    Menu.addButton(female_models7[Menu.buttonCount+1], "savemodel", female_models7[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemaleMenu8",nil)
    Menu.addButton("Previous Page","FemaleMenu6",nil)	
    Menu.addButton("Return","Main",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Female Menu Page 8/9
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleMenu8()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Female Models           Page 8 of 9"
    ClearMenu()
    Menu.addButton(female_models8[Menu.buttonCount+1], "savemodel", female_models8[Menu.buttonCount+1])
    Menu.addButton(female_models8[Menu.buttonCount+1], "savemodel", female_models8[Menu.buttonCount+1])
    Menu.addButton(female_models8[Menu.buttonCount+1], "savemodel", female_models8[Menu.buttonCount+1])
    Menu.addButton(female_models8[Menu.buttonCount+1], "savemodel", female_models8[Menu.buttonCount+1])
    Menu.addButton(female_models8[Menu.buttonCount+1], "savemodel", female_models8[Menu.buttonCount+1])
    Menu.addButton(female_models8[Menu.buttonCount+1], "savemodel", female_models8[Menu.buttonCount+1])
    Menu.addButton(female_models8[Menu.buttonCount+1], "savemodel", female_models8[Menu.buttonCount+1])
    Menu.addButton(female_models8[Menu.buttonCount+1], "savemodel", female_models8[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemaleMenu9",nil)
    Menu.addButton("Previous Page","FemaleMenu7",nil)	
    Menu.addButton("Return","Main",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Female Menu Page 9/9
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleMenu9()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Female Models           Page 9 of 9"
    ClearMenu()
    Menu.addButton(female_models9[Menu.buttonCount+1], "savemodel", female_models9[Menu.buttonCount+1])
    Menu.addButton(female_models9[Menu.buttonCount+1], "savemodel", female_models9[Menu.buttonCount+1])
    Menu.addButton(female_models9[Menu.buttonCount+1], "savemodel", female_models9[Menu.buttonCount+1])
    Menu.addButton(female_models9[Menu.buttonCount+1], "savemodel", female_models9[Menu.buttonCount+1])
    Menu.addButton(female_models9[Menu.buttonCount+1], "savemodel", female_models9[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemaleMenu",nil)
    Menu.addButton("Previous Page","FemaleMenu8",nil)	
    Menu.addButton("Return","Main",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--COP/EMS/MARINES/SHERIFF/SECURITY Menu        Page 1/4
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--[[
function EMSMenu()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "EMS                     Page 1 of 4"
    ClearMenu()
    Menu.addButton(ems_models[Menu.buttonCount+1], "savemodel", ems_models[Menu.buttonCount+1])
    Menu.addButton(ems_models[Menu.buttonCount+1], "savemodel", ems_models[Menu.buttonCount+1])
    Menu.addButton(ems_models[Menu.buttonCount+1], "savemodel", ems_models[Menu.buttonCount+1])
    Menu.addButton(ems_models[Menu.buttonCount+1], "savemodel", ems_models[Menu.buttonCount+1])
    Menu.addButton(ems_models[Menu.buttonCount+1], "savemodel", ems_models[Menu.buttonCount+1])
    Menu.addButton(ems_models[Menu.buttonCount+1], "savemodel", ems_models[Menu.buttonCount+1])
    Menu.addButton(ems_models[Menu.buttonCount+1], "savemodel", ems_models[Menu.buttonCount+1])
    Menu.addButton(ems_models[Menu.buttonCount+1], "savemodel", ems_models[Menu.buttonCount+1])
    Menu.addButton("Next Page","EMSMenu",nil)
    Menu.addButton("Previous Page","EMSMenu4",nil)	
    Menu.addButton("Return","Main",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--COP/EMS/MARINES/SHERIFF/SECURITY Menu        Page 2/4
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function EMSMenu2()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "EMS                     Page 2 of 4"
    ClearMenu()
    Menu.addButton(ems_models2[Menu.buttonCount+1], "savemodel", ems_models2[Menu.buttonCount+1])
    Menu.addButton(ems_models2[Menu.buttonCount+1], "savemodel", ems_models2[Menu.buttonCount+1])
    Menu.addButton(ems_models2[Menu.buttonCount+1], "savemodel", ems_models2[Menu.buttonCount+1])
    Menu.addButton(ems_models2[Menu.buttonCount+1], "savemodel", ems_models2[Menu.buttonCount+1])
    Menu.addButton(ems_models2[Menu.buttonCount+1], "savemodel", ems_models2[Menu.buttonCount+1])
    Menu.addButton(ems_models2[Menu.buttonCount+1], "savemodel", ems_models2[Menu.buttonCount+1])
    Menu.addButton(ems_models2[Menu.buttonCount+1], "savemodel", ems_models2[Menu.buttonCount+1])
    Menu.addButton(ems_models2[Menu.buttonCount+1], "savemodel", ems_models2[Menu.buttonCount+1])
    Menu.addButton("Next Page","EMSMenu3",nil)
    Menu.addButton("Previous Page","EMSMenu",nil)	
    Menu.addButton("Return","Main",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--COP/EMS/MARINES/SHERIFF/SECURITY Menu        Page 3/4
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function EMSMenu3()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "EMS                     Page 3 of 4"
    ClearMenu()
    Menu.addButton(ems_models3[Menu.buttonCount+1], "savemodel", ems_models3[Menu.buttonCount+1])
    Menu.addButton(ems_models3[Menu.buttonCount+1], "savemodel", ems_models3[Menu.buttonCount+1])
    Menu.addButton(ems_models3[Menu.buttonCount+1], "savemodel", ems_models3[Menu.buttonCount+1])
    Menu.addButton(ems_models3[Menu.buttonCount+1], "savemodel", ems_models3[Menu.buttonCount+1])
    Menu.addButton(ems_models3[Menu.buttonCount+1], "savemodel", ems_models3[Menu.buttonCount+1])
    Menu.addButton(ems_models3[Menu.buttonCount+1], "savemodel", ems_models3[Menu.buttonCount+1])
    Menu.addButton(ems_models3[Menu.buttonCount+1], "savemodel", ems_models3[Menu.buttonCount+1])
    Menu.addButton(ems_models3[Menu.buttonCount+1], "savemodel", ems_models3[Menu.buttonCount+1])
    Menu.addButton("Next Page","EMSMenu4",nil)
    Menu.addButton("Previous Page","EMSMenu2",nil)	
    Menu.addButton("Return","Main",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--COP/EMS/MARINES/SHERIFF/SECURITY Menu        Page 4/4
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function EMSMenu4()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "EMS                     Page 4 of 4"
    ClearMenu()
    Menu.addButton(ems_models4[Menu.buttonCount+1], "savemodel", ems_models4[Menu.buttonCount+1])
    Menu.addButton(ems_models4[Menu.buttonCount+1], "savemodel", ems_models4[Menu.buttonCount+1])
    Menu.addButton(ems_models4[Menu.buttonCount+1], "savemodel", ems_models4[Menu.buttonCount+1])
    Menu.addButton(ems_models4[Menu.buttonCount+1], "savemodel", ems_models4[Menu.buttonCount+1])
    Menu.addButton(ems_models4[Menu.buttonCount+1], "savemodel", ems_models4[Menu.buttonCount+1])
    Menu.addButton(ems_models4[Menu.buttonCount+1], "savemodel", ems_models4[Menu.buttonCount+1])
    Menu.addButton("Next Page","EMSMenu",nil)
    Menu.addButton("Previous Page","EMSMenu3",nil)	
    Menu.addButton("Return","Main",nil)
end 
]]
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Animal Menu Page 1/2
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--[[
function AnimalMenu()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Animal Models           Page 1 of 2"
    ClearMenu()
    Menu.addButton(animal_models[Menu.buttonCount+1], "savemodel", animal_models[Menu.buttonCount+1])
    Menu.addButton(animal_models[Menu.buttonCount+1], "savemodel", animal_models[Menu.buttonCount+1])
    Menu.addButton(animal_models[Menu.buttonCount+1], "savemodel", animal_models[Menu.buttonCount+1])
    Menu.addButton(animal_models[Menu.buttonCount+1], "savemodel", animal_models[Menu.buttonCount+1])
    Menu.addButton(animal_models[Menu.buttonCount+1], "savemodel", animal_models[Menu.buttonCount+1])
    Menu.addButton(animal_models[Menu.buttonCount+1], "savemodel", animal_models[Menu.buttonCount+1])
    Menu.addButton(animal_models[Menu.buttonCount+1], "savemodel", animal_models[Menu.buttonCount+1])
    Menu.addButton(animal_models[Menu.buttonCount+1], "savemodel", animal_models[Menu.buttonCount+1])
    Menu.addButton("Next Page","AnimalMenu2",nil)
    Menu.addButton("Previous Page","AnimalMenu2",nil)	
    Menu.addButton("Return","Main",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Animal Menu Page 2/2
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AnimalMenu2()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Animal Models           Page 2 of 2"
    ClearMenu()
    Menu.addButton(animal_models2[Menu.buttonCount+1], "savemodel", animal_models2[Menu.buttonCount+1])
    Menu.addButton(animal_models2[Menu.buttonCount+1], "savemodel", animal_models2[Menu.buttonCount+1])
    Menu.addButton(animal_models2[Menu.buttonCount+1], "savemodel", animal_models2[Menu.buttonCount+1])
    Menu.addButton(animal_models2[Menu.buttonCount+1], "savemodel", animal_models2[Menu.buttonCount+1])
    Menu.addButton(animal_models2[Menu.buttonCount+1], "savemodel", animal_models2[Menu.buttonCount+1])
    Menu.addButton("Next Page","AnimalMenu",nil)
    Menu.addButton("Previous Page","AnimalMenu",nil)	
    Menu.addButton("Return","Main",nil)
end
]]
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Others Menu
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function OtherMenu()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Other Models"
    ClearMenu()
    Menu.addButton("Male","OtherMenuMale",nil)
    Menu.addButton("Female","OtherMenuFemale",nil)	
    Menu.addButton("Multiplayer","MPMenu",nil)	
    Menu.addButton("Return","Main",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Others Menu        Page 1/30
--Male
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function OtherMenuMale()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Other Males            Page 1 of 30"
    ClearMenu()
    Menu.addButton(other_male_models[Menu.buttonCount+1], "savemodel", other_male_models[Menu.buttonCount+1])
    Menu.addButton(other_male_models[Menu.buttonCount+1], "savemodel", other_male_models[Menu.buttonCount+1])
    Menu.addButton(other_male_models[Menu.buttonCount+1], "savemodel", other_male_models[Menu.buttonCount+1])
    Menu.addButton(other_male_models[Menu.buttonCount+1], "savemodel", other_male_models[Menu.buttonCount+1])
    Menu.addButton(other_male_models[Menu.buttonCount+1], "savemodel", other_male_models[Menu.buttonCount+1])
    Menu.addButton(other_male_models[Menu.buttonCount+1], "savemodel", other_male_models[Menu.buttonCount+1])
    Menu.addButton(other_male_models[Menu.buttonCount+1], "savemodel", other_male_models[Menu.buttonCount+1])
    Menu.addButton(other_male_models[Menu.buttonCount+1], "savemodel", other_male_models[Menu.buttonCount+1])
    Menu.addButton("Next Page","OtherMenuMale2",nil)
    Menu.addButton("Previous Page","OtherMenuMale30",nil)	
    Menu.addButton("Return","OtherMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Others Menu        Page 2/30
--Male
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function OtherMenuMale2()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Other Males            Page 2 of 30"
    ClearMenu()
    Menu.addButton(other_male_models2[Menu.buttonCount+1], "savemodel", other_male_models2[Menu.buttonCount+1])
    Menu.addButton(other_male_models2[Menu.buttonCount+1], "savemodel", other_male_models2[Menu.buttonCount+1])
    Menu.addButton(other_male_models2[Menu.buttonCount+1], "savemodel", other_male_models2[Menu.buttonCount+1])
    Menu.addButton(other_male_models2[Menu.buttonCount+1], "savemodel", other_male_models2[Menu.buttonCount+1])
    Menu.addButton(other_male_models2[Menu.buttonCount+1], "savemodel", other_male_models2[Menu.buttonCount+1])
    Menu.addButton(other_male_models2[Menu.buttonCount+1], "savemodel", other_male_models2[Menu.buttonCount+1])
    Menu.addButton(other_male_models2[Menu.buttonCount+1], "savemodel", other_male_models2[Menu.buttonCount+1])
    Menu.addButton(other_male_models2[Menu.buttonCount+1], "savemodel", other_male_models2[Menu.buttonCount+1])
    Menu.addButton("Next Page","OtherMenuMale3",nil)
    Menu.addButton("Previous Page","OtherMenuMale",nil)	
    Menu.addButton("Return","OtherMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Others Menu        Page 3/30
--Male
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function OtherMenuMale3()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Other Males            Page 3 of 30"
    ClearMenu()
    Menu.addButton(other_male_models3[Menu.buttonCount+1], "savemodel", other_male_models3[Menu.buttonCount+1])
    Menu.addButton(other_male_models3[Menu.buttonCount+1], "savemodel", other_male_models3[Menu.buttonCount+1])
    Menu.addButton(other_male_models3[Menu.buttonCount+1], "savemodel", other_male_models3[Menu.buttonCount+1])
    Menu.addButton(other_male_models3[Menu.buttonCount+1], "savemodel", other_male_models3[Menu.buttonCount+1])
    Menu.addButton(other_male_models3[Menu.buttonCount+1], "savemodel", other_male_models3[Menu.buttonCount+1])
    Menu.addButton(other_male_models3[Menu.buttonCount+1], "savemodel", other_male_models3[Menu.buttonCount+1])
    Menu.addButton(other_male_models3[Menu.buttonCount+1], "savemodel", other_male_models3[Menu.buttonCount+1])
    Menu.addButton(other_male_models3[Menu.buttonCount+1], "savemodel", other_male_models3[Menu.buttonCount+1])
    Menu.addButton("Next Page","OtherMenuMale4",nil)
    Menu.addButton("Previous Page","OtherMenuMale2",nil)	
    Menu.addButton("Return","OtherMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Others Menu        Page 4/30
--Male
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function OtherMenuMale4()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Other Males            Page 4 of 30"
    ClearMenu()
    Menu.addButton(other_male_models4[Menu.buttonCount+1], "savemodel", other_male_models4[Menu.buttonCount+1])
    Menu.addButton(other_male_models4[Menu.buttonCount+1], "savemodel", other_male_models4[Menu.buttonCount+1])
    Menu.addButton(other_male_models4[Menu.buttonCount+1], "savemodel", other_male_models4[Menu.buttonCount+1])
    Menu.addButton(other_male_models4[Menu.buttonCount+1], "savemodel", other_male_models4[Menu.buttonCount+1])
    Menu.addButton(other_male_models4[Menu.buttonCount+1], "savemodel", other_male_models4[Menu.buttonCount+1])
    Menu.addButton(other_male_models4[Menu.buttonCount+1], "savemodel", other_male_models4[Menu.buttonCount+1])
    Menu.addButton(other_male_models4[Menu.buttonCount+1], "savemodel", other_male_models4[Menu.buttonCount+1])
    Menu.addButton(other_male_models4[Menu.buttonCount+1], "savemodel", other_male_models4[Menu.buttonCount+1])
    Menu.addButton("Next Page","OtherMenuMale5",nil)
    Menu.addButton("Previous Page","OtherMenuMale3",nil)	
    Menu.addButton("Return","OtherMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Others Menu        Page 5/30
--Male
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function OtherMenuMale5()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Other Males            Page 5 of 30"
    ClearMenu()
    Menu.addButton(other_male_models5[Menu.buttonCount+1], "savemodel", other_male_models5[Menu.buttonCount+1])
    Menu.addButton(other_male_models5[Menu.buttonCount+1], "savemodel", other_male_models5[Menu.buttonCount+1])
    Menu.addButton(other_male_models5[Menu.buttonCount+1], "savemodel", other_male_models5[Menu.buttonCount+1])
    Menu.addButton(other_male_models5[Menu.buttonCount+1], "savemodel", other_male_models5[Menu.buttonCount+1])
    Menu.addButton(other_male_models5[Menu.buttonCount+1], "savemodel", other_male_models5[Menu.buttonCount+1])
    Menu.addButton(other_male_models5[Menu.buttonCount+1], "savemodel", other_male_models5[Menu.buttonCount+1])
    Menu.addButton(other_male_models5[Menu.buttonCount+1], "savemodel", other_male_models5[Menu.buttonCount+1])
    Menu.addButton(other_male_models5[Menu.buttonCount+1], "savemodel", other_male_models5[Menu.buttonCount+1])
    Menu.addButton("Next Page","OtherMenuMale6",nil)
    Menu.addButton("Previous Page","OtherMenuMale4",nil)	
    Menu.addButton("Return","OtherMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Others Menu        Page 6/30
--Male
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function OtherMenuMale6()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Other Males            Page 6 of 30"
    ClearMenu()
    Menu.addButton(other_male_models6[Menu.buttonCount+1], "savemodel", other_male_models6[Menu.buttonCount+1])
    Menu.addButton(other_male_models6[Menu.buttonCount+1], "savemodel", other_male_models6[Menu.buttonCount+1])
    Menu.addButton(other_male_models6[Menu.buttonCount+1], "savemodel", other_male_models6[Menu.buttonCount+1])
    Menu.addButton(other_male_models6[Menu.buttonCount+1], "savemodel", other_male_models6[Menu.buttonCount+1])
    Menu.addButton(other_male_models6[Menu.buttonCount+1], "savemodel", other_male_models6[Menu.buttonCount+1])
    Menu.addButton(other_male_models6[Menu.buttonCount+1], "savemodel", other_male_models6[Menu.buttonCount+1])
    Menu.addButton(other_male_models6[Menu.buttonCount+1], "savemodel", other_male_models6[Menu.buttonCount+1])
    Menu.addButton(other_male_models6[Menu.buttonCount+1], "savemodel", other_male_models6[Menu.buttonCount+1])
    Menu.addButton("Next Page","OtherMenuMale7",nil)
    Menu.addButton("Previous Page","OtherMenuMale5",nil)	
    Menu.addButton("Return","OtherMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Others Menu        Page 7/30
--Male
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function OtherMenuMale7()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Other Males            Page 7 of 30"
    ClearMenu()
    Menu.addButton(other_male_models7[Menu.buttonCount+1], "savemodel", other_male_models7[Menu.buttonCount+1])
    Menu.addButton(other_male_models7[Menu.buttonCount+1], "savemodel", other_male_models7[Menu.buttonCount+1])
    Menu.addButton(other_male_models7[Menu.buttonCount+1], "savemodel", other_male_models7[Menu.buttonCount+1])
    Menu.addButton(other_male_models7[Menu.buttonCount+1], "savemodel", other_male_models7[Menu.buttonCount+1])
    Menu.addButton(other_male_models7[Menu.buttonCount+1], "savemodel", other_male_models7[Menu.buttonCount+1])
    Menu.addButton(other_male_models7[Menu.buttonCount+1], "savemodel", other_male_models7[Menu.buttonCount+1])
    Menu.addButton(other_male_models7[Menu.buttonCount+1], "savemodel", other_male_models7[Menu.buttonCount+1])
    Menu.addButton(other_male_models7[Menu.buttonCount+1], "savemodel", other_male_models7[Menu.buttonCount+1])
    Menu.addButton("Next Page","OtherMenuMale8",nil)
    Menu.addButton("Previous Page","OtherMenuMale6",nil)	
    Menu.addButton("Return","OtherMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Others Menu        Page 8/30
--Male
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function OtherMenuMale8()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Other Males            Page 8 of 30"
    ClearMenu()
    Menu.addButton(other_male_models8[Menu.buttonCount+1], "savemodel", other_male_models8[Menu.buttonCount+1])
    Menu.addButton(other_male_models8[Menu.buttonCount+1], "savemodel", other_male_models8[Menu.buttonCount+1])
    Menu.addButton(other_male_models8[Menu.buttonCount+1], "savemodel", other_male_models8[Menu.buttonCount+1])
    Menu.addButton(other_male_models8[Menu.buttonCount+1], "savemodel", other_male_models8[Menu.buttonCount+1])
    Menu.addButton(other_male_models8[Menu.buttonCount+1], "savemodel", other_male_models8[Menu.buttonCount+1])
    Menu.addButton(other_male_models8[Menu.buttonCount+1], "savemodel", other_male_models8[Menu.buttonCount+1])
    Menu.addButton(other_male_models8[Menu.buttonCount+1], "savemodel", other_male_models8[Menu.buttonCount+1])
    Menu.addButton(other_male_models8[Menu.buttonCount+1], "savemodel", other_male_models8[Menu.buttonCount+1])
    Menu.addButton("Next Page","OtherMenuMale9",nil)
    Menu.addButton("Previous Page","OtherMenuMale7",nil)	
    Menu.addButton("Return","OtherMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Others Menu        Page 9/30
--Male
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function OtherMenuMale9()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Other Males            Page 9 of 30"
    ClearMenu()
    Menu.addButton(other_male_models9[Menu.buttonCount+1], "savemodel", other_male_models9[Menu.buttonCount+1])
    Menu.addButton(other_male_models9[Menu.buttonCount+1], "savemodel", other_male_models9[Menu.buttonCount+1])
    Menu.addButton(other_male_models9[Menu.buttonCount+1], "savemodel", other_male_models9[Menu.buttonCount+1])
    Menu.addButton(other_male_models9[Menu.buttonCount+1], "savemodel", other_male_models9[Menu.buttonCount+1])
    Menu.addButton(other_male_models9[Menu.buttonCount+1], "savemodel", other_male_models9[Menu.buttonCount+1])
    Menu.addButton(other_male_models9[Menu.buttonCount+1], "savemodel", other_male_models9[Menu.buttonCount+1])
    Menu.addButton(other_male_models9[Menu.buttonCount+1], "savemodel", other_male_models9[Menu.buttonCount+1])
    Menu.addButton(other_male_models9[Menu.buttonCount+1], "savemodel", other_male_models9[Menu.buttonCount+1])
    Menu.addButton("Next Page","OtherMenuMale10",nil)
    Menu.addButton("Previous Page","OtherMenuMale8",nil)	
    Menu.addButton("Return","OtherMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Others Menu        Page 10/30
--Male
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function OtherMenuMale10()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Other Males            Page 10 of 30"
    ClearMenu()
    Menu.addButton(other_male_models10[Menu.buttonCount+1], "savemodel", other_male_models10[Menu.buttonCount+1])
    Menu.addButton(other_male_models10[Menu.buttonCount+1], "savemodel", other_male_models10[Menu.buttonCount+1])
    Menu.addButton(other_male_models10[Menu.buttonCount+1], "savemodel", other_male_models10[Menu.buttonCount+1])
    Menu.addButton(other_male_models10[Menu.buttonCount+1], "savemodel", other_male_models10[Menu.buttonCount+1])
    Menu.addButton(other_male_models10[Menu.buttonCount+1], "savemodel", other_male_models10[Menu.buttonCount+1])
    Menu.addButton(other_male_models10[Menu.buttonCount+1], "savemodel", other_male_models10[Menu.buttonCount+1])
    Menu.addButton(other_male_models10[Menu.buttonCount+1], "savemodel", other_male_models10[Menu.buttonCount+1])
    Menu.addButton(other_male_models10[Menu.buttonCount+1], "savemodel", other_male_models10[Menu.buttonCount+1])
    Menu.addButton("Next Page","OtherMenuMale11",nil)
    Menu.addButton("Previous Page","OtherMenuMale9",nil)	
    Menu.addButton("Return","OtherMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Others Menu        Page 11/30
--Male
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function OtherMenuMale11()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Other Males            Page 11 of 30"
    ClearMenu()
    Menu.addButton(other_male_models11[Menu.buttonCount+1], "savemodel", other_male_models11[Menu.buttonCount+1])
    Menu.addButton(other_male_models11[Menu.buttonCount+1], "savemodel", other_male_models11[Menu.buttonCount+1])
    Menu.addButton(other_male_models11[Menu.buttonCount+1], "savemodel", other_male_models11[Menu.buttonCount+1])
    Menu.addButton(other_male_models11[Menu.buttonCount+1], "savemodel", other_male_models11[Menu.buttonCount+1])
    Menu.addButton(other_male_models11[Menu.buttonCount+1], "savemodel", other_male_models11[Menu.buttonCount+1])
    Menu.addButton(other_male_models11[Menu.buttonCount+1], "savemodel", other_male_models11[Menu.buttonCount+1])
    Menu.addButton(other_male_models11[Menu.buttonCount+1], "savemodel", other_male_models11[Menu.buttonCount+1])
    Menu.addButton(other_male_models11[Menu.buttonCount+1], "savemodel", other_male_models11[Menu.buttonCount+1])
    Menu.addButton("Next Page","OtherMenuMale12",nil)
    Menu.addButton("Previous Page","OtherMenuMale10",nil)	
    Menu.addButton("Return","OtherMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Others Menu        Page 12/30
--Male
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function OtherMenuMale12()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Other Males            Page 12 of 30"
    ClearMenu()
    Menu.addButton(other_male_models12[Menu.buttonCount+1], "savemodel", other_male_models12[Menu.buttonCount+1])
    Menu.addButton(other_male_models12[Menu.buttonCount+1], "savemodel", other_male_models12[Menu.buttonCount+1])
    Menu.addButton(other_male_models12[Menu.buttonCount+1], "savemodel", other_male_models12[Menu.buttonCount+1])
    Menu.addButton(other_male_models12[Menu.buttonCount+1], "savemodel", other_male_models12[Menu.buttonCount+1])
    Menu.addButton(other_male_models12[Menu.buttonCount+1], "savemodel", other_male_models12[Menu.buttonCount+1])
    Menu.addButton(other_male_models12[Menu.buttonCount+1], "savemodel", other_male_models12[Menu.buttonCount+1])
    Menu.addButton(other_male_models12[Menu.buttonCount+1], "savemodel", other_male_models12[Menu.buttonCount+1])
    Menu.addButton(other_male_models12[Menu.buttonCount+1], "savemodel", other_male_models12[Menu.buttonCount+1])
    Menu.addButton("Next Page","OtherMenuMale13",nil)
    Menu.addButton("Previous Page","OtherMenuMale11",nil)	
    Menu.addButton("Return","OtherMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Others Menu        Page 13/30
--Male
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function OtherMenuMale13()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Other Males            Page 13 of 30"
    ClearMenu()
    Menu.addButton(other_male_models13[Menu.buttonCount+1], "savemodel", other_male_models13[Menu.buttonCount+1])
    Menu.addButton(other_male_models13[Menu.buttonCount+1], "savemodel", other_male_models13[Menu.buttonCount+1])
    Menu.addButton(other_male_models13[Menu.buttonCount+1], "savemodel", other_male_models13[Menu.buttonCount+1])
    Menu.addButton(other_male_models13[Menu.buttonCount+1], "savemodel", other_male_models13[Menu.buttonCount+1])
    Menu.addButton(other_male_models13[Menu.buttonCount+1], "savemodel", other_male_models13[Menu.buttonCount+1])
    Menu.addButton(other_male_models13[Menu.buttonCount+1], "savemodel", other_male_models13[Menu.buttonCount+1])
    Menu.addButton(other_male_models13[Menu.buttonCount+1], "savemodel", other_male_models13[Menu.buttonCount+1])
    Menu.addButton(other_male_models13[Menu.buttonCount+1], "savemodel", other_male_models13[Menu.buttonCount+1])
    Menu.addButton("Next Page","OtherMenuMale14",nil)
    Menu.addButton("Previous Page","OtherMenuMale12",nil)	
    Menu.addButton("Return","OtherMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Others Menu        Page 14/30
--Male
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function OtherMenuMale14()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Other Males            Page 14 of 30"
    ClearMenu()
    Menu.addButton(other_male_models14[Menu.buttonCount+1], "savemodel", other_male_models14[Menu.buttonCount+1])
    Menu.addButton(other_male_models14[Menu.buttonCount+1], "savemodel", other_male_models14[Menu.buttonCount+1])
    Menu.addButton(other_male_models14[Menu.buttonCount+1], "savemodel", other_male_models14[Menu.buttonCount+1])
    Menu.addButton(other_male_models14[Menu.buttonCount+1], "savemodel", other_male_models14[Menu.buttonCount+1])
    Menu.addButton(other_male_models14[Menu.buttonCount+1], "savemodel", other_male_models14[Menu.buttonCount+1])
    Menu.addButton(other_male_models14[Menu.buttonCount+1], "savemodel", other_male_models14[Menu.buttonCount+1])
    Menu.addButton(other_male_models14[Menu.buttonCount+1], "savemodel", other_male_models14[Menu.buttonCount+1])
    Menu.addButton(other_male_models14[Menu.buttonCount+1], "savemodel", other_male_models14[Menu.buttonCount+1])
    Menu.addButton("Next Page","OtherMenuMale15",nil)
    Menu.addButton("Previous Page","OtherMenuMale13",nil)	
    Menu.addButton("Return","OtherMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Others Menu        Page 15/30
--Male
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function OtherMenuMale15()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Other Males            Page 15 of 30"
    ClearMenu()
    Menu.addButton(other_male_models15[Menu.buttonCount+1], "savemodel", other_male_models15[Menu.buttonCount+1])
    Menu.addButton(other_male_models15[Menu.buttonCount+1], "savemodel", other_male_models15[Menu.buttonCount+1])
    Menu.addButton(other_male_models15[Menu.buttonCount+1], "savemodel", other_male_models15[Menu.buttonCount+1])
    Menu.addButton(other_male_models15[Menu.buttonCount+1], "savemodel", other_male_models15[Menu.buttonCount+1])
    Menu.addButton(other_male_models15[Menu.buttonCount+1], "savemodel", other_male_models15[Menu.buttonCount+1])
    Menu.addButton(other_male_models15[Menu.buttonCount+1], "savemodel", other_male_models15[Menu.buttonCount+1])
    Menu.addButton(other_male_models15[Menu.buttonCount+1], "savemodel", other_male_models15[Menu.buttonCount+1])
    Menu.addButton(other_male_models15[Menu.buttonCount+1], "savemodel", other_male_models15[Menu.buttonCount+1])
    Menu.addButton("Next Page","OtherMenuMale16",nil)
    Menu.addButton("Previous Page","OtherMenuMale14",nil)	
    Menu.addButton("Return","OtherMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Others Menu        Page 16/30
--Male
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function OtherMenuMale16()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Other Males            Page 16 of 30"
    ClearMenu()
    Menu.addButton(other_male_models16[Menu.buttonCount+1], "savemodel", other_male_models16[Menu.buttonCount+1])
    Menu.addButton(other_male_models16[Menu.buttonCount+1], "savemodel", other_male_models16[Menu.buttonCount+1])
    Menu.addButton(other_male_models16[Menu.buttonCount+1], "savemodel", other_male_models16[Menu.buttonCount+1])
    Menu.addButton(other_male_models16[Menu.buttonCount+1], "savemodel", other_male_models16[Menu.buttonCount+1])
    Menu.addButton(other_male_models16[Menu.buttonCount+1], "savemodel", other_male_models16[Menu.buttonCount+1])
    Menu.addButton(other_male_models16[Menu.buttonCount+1], "savemodel", other_male_models16[Menu.buttonCount+1])
    Menu.addButton(other_male_models16[Menu.buttonCount+1], "savemodel", other_male_models16[Menu.buttonCount+1])
    Menu.addButton(other_male_models16[Menu.buttonCount+1], "savemodel", other_male_models16[Menu.buttonCount+1])
    Menu.addButton("Next Page","OtherMenuMale17",nil)
    Menu.addButton("Previous Page","OtherMenuMale15",nil)	
    Menu.addButton("Return","OtherMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Others Menu        Page 17/30
--Male
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function OtherMenuMale17()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Other Males            Page 17 of 30"
    ClearMenu()
    Menu.addButton(other_male_models17[Menu.buttonCount+1], "savemodel", other_male_models17[Menu.buttonCount+1])
    Menu.addButton(other_male_models17[Menu.buttonCount+1], "savemodel", other_male_models17[Menu.buttonCount+1])
    Menu.addButton(other_male_models17[Menu.buttonCount+1], "savemodel", other_male_models17[Menu.buttonCount+1])
    Menu.addButton(other_male_models17[Menu.buttonCount+1], "savemodel", other_male_models17[Menu.buttonCount+1])
    Menu.addButton(other_male_models17[Menu.buttonCount+1], "savemodel", other_male_models17[Menu.buttonCount+1])
    Menu.addButton(other_male_models17[Menu.buttonCount+1], "savemodel", other_male_models17[Menu.buttonCount+1])
    Menu.addButton(other_male_models17[Menu.buttonCount+1], "savemodel", other_male_models17[Menu.buttonCount+1])
    Menu.addButton(other_male_models17[Menu.buttonCount+1], "savemodel", other_male_models17[Menu.buttonCount+1])
    Menu.addButton("Next Page","OtherMenuMale18",nil)
    Menu.addButton("Previous Page","OtherMenuMale16",nil)	
    Menu.addButton("Return","OtherMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Others Menu        Page 18/30
--Male
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function OtherMenuMale18()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Other Males            Page 18 of 30"
    ClearMenu()
    Menu.addButton(other_male_models18[Menu.buttonCount+1], "savemodel", other_male_models18[Menu.buttonCount+1])
    Menu.addButton(other_male_models18[Menu.buttonCount+1], "savemodel", other_male_models18[Menu.buttonCount+1])
    Menu.addButton(other_male_models18[Menu.buttonCount+1], "savemodel", other_male_models18[Menu.buttonCount+1])
    Menu.addButton(other_male_models18[Menu.buttonCount+1], "savemodel", other_male_models18[Menu.buttonCount+1])
    Menu.addButton(other_male_models18[Menu.buttonCount+1], "savemodel", other_male_models18[Menu.buttonCount+1])
    Menu.addButton(other_male_models18[Menu.buttonCount+1], "savemodel", other_male_models18[Menu.buttonCount+1])
    Menu.addButton(other_male_models18[Menu.buttonCount+1], "savemodel", other_male_models18[Menu.buttonCount+1])
    Menu.addButton(other_male_models18[Menu.buttonCount+1], "savemodel", other_male_models18[Menu.buttonCount+1])
    Menu.addButton("Next Page","OtherMenuMale19",nil)
    Menu.addButton("Previous Page","OtherMenuMale17",nil)	
    Menu.addButton("Return","OtherMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Others Menu        Page 19/30
--Male
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function OtherMenuMale19()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Other Males            Page 19 of 30"
    ClearMenu()
    Menu.addButton(other_male_models19[Menu.buttonCount+1], "savemodel", other_male_models19[Menu.buttonCount+1])
    Menu.addButton(other_male_models19[Menu.buttonCount+1], "savemodel", other_male_models19[Menu.buttonCount+1])
    Menu.addButton(other_male_models19[Menu.buttonCount+1], "savemodel", other_male_models19[Menu.buttonCount+1])
    Menu.addButton(other_male_models19[Menu.buttonCount+1], "savemodel", other_male_models19[Menu.buttonCount+1])
    Menu.addButton(other_male_models19[Menu.buttonCount+1], "savemodel", other_male_models19[Menu.buttonCount+1])
    Menu.addButton(other_male_models19[Menu.buttonCount+1], "savemodel", other_male_models19[Menu.buttonCount+1])
    Menu.addButton(other_male_models19[Menu.buttonCount+1], "savemodel", other_male_models19[Menu.buttonCount+1])
    Menu.addButton(other_male_models19[Menu.buttonCount+1], "savemodel", other_male_models19[Menu.buttonCount+1])
    Menu.addButton("Next Page","OtherMenuMale20",nil)
    Menu.addButton("Previous Page","OtherMenuMale18",nil)	
    Menu.addButton("Return","OtherMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Others Menu        Page 20/30
--Male
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function OtherMenuMale20()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Other Males            Page 20 of 30"
    ClearMenu()
    Menu.addButton(other_male_models20[Menu.buttonCount+1], "savemodel", other_male_models20[Menu.buttonCount+1])
    Menu.addButton(other_male_models20[Menu.buttonCount+1], "savemodel", other_male_models20[Menu.buttonCount+1])
    Menu.addButton(other_male_models20[Menu.buttonCount+1], "savemodel", other_male_models20[Menu.buttonCount+1])
    Menu.addButton(other_male_models20[Menu.buttonCount+1], "savemodel", other_male_models20[Menu.buttonCount+1])
    Menu.addButton(other_male_models20[Menu.buttonCount+1], "savemodel", other_male_models20[Menu.buttonCount+1])
    Menu.addButton(other_male_models20[Menu.buttonCount+1], "savemodel", other_male_models20[Menu.buttonCount+1])
    Menu.addButton(other_male_models20[Menu.buttonCount+1], "savemodel", other_male_models20[Menu.buttonCount+1])
    Menu.addButton(other_male_models20[Menu.buttonCount+1], "savemodel", other_male_models20[Menu.buttonCount+1])
    Menu.addButton("Next Page","OtherMenuMale21",nil)
    Menu.addButton("Previous Page","OtherMenuMale19",nil)	
    Menu.addButton("Return","OtherMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Others Menu        Page 21/30
--Male
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function OtherMenuMale21()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Other Males            Page 21 of 30"
    ClearMenu()
    Menu.addButton(other_male_models21[Menu.buttonCount+1], "savemodel", other_male_models21[Menu.buttonCount+1])
    Menu.addButton(other_male_models21[Menu.buttonCount+1], "savemodel", other_male_models21[Menu.buttonCount+1])
    Menu.addButton(other_male_models21[Menu.buttonCount+1], "savemodel", other_male_models21[Menu.buttonCount+1])
    Menu.addButton(other_male_models21[Menu.buttonCount+1], "savemodel", other_male_models21[Menu.buttonCount+1])
    Menu.addButton(other_male_models21[Menu.buttonCount+1], "savemodel", other_male_models21[Menu.buttonCount+1])
    Menu.addButton(other_male_models21[Menu.buttonCount+1], "savemodel", other_male_models21[Menu.buttonCount+1])
    Menu.addButton(other_male_models21[Menu.buttonCount+1], "savemodel", other_male_models21[Menu.buttonCount+1])
    Menu.addButton(other_male_models21[Menu.buttonCount+1], "savemodel", other_male_models21[Menu.buttonCount+1])
    Menu.addButton("Next Page","OtherMenuMale22",nil)
    Menu.addButton("Previous Page","OtherMenuMale20",nil)	
    Menu.addButton("Return","OtherMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Others Menu        Page 22/30
--Male
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function OtherMenuMale22()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Other Males            Page 22 of 30"
    ClearMenu()
    Menu.addButton(other_male_models22[Menu.buttonCount+1], "savemodel", other_male_models22[Menu.buttonCount+1])
    Menu.addButton(other_male_models22[Menu.buttonCount+1], "savemodel", other_male_models22[Menu.buttonCount+1])
    Menu.addButton(other_male_models22[Menu.buttonCount+1], "savemodel", other_male_models22[Menu.buttonCount+1])
    Menu.addButton(other_male_models22[Menu.buttonCount+1], "savemodel", other_male_models22[Menu.buttonCount+1])
    Menu.addButton(other_male_models22[Menu.buttonCount+1], "savemodel", other_male_models22[Menu.buttonCount+1])
    Menu.addButton(other_male_models22[Menu.buttonCount+1], "savemodel", other_male_models22[Menu.buttonCount+1])
    Menu.addButton(other_male_models22[Menu.buttonCount+1], "savemodel", other_male_models22[Menu.buttonCount+1])
    Menu.addButton(other_male_models22[Menu.buttonCount+1], "savemodel", other_male_models22[Menu.buttonCount+1])
    Menu.addButton("Next Page","OtherMenuMale23",nil)
    Menu.addButton("Previous Page","OtherMenuMale21",nil)	
    Menu.addButton("Return","OtherMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Others Menu        Page 23/30
--Male
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function OtherMenuMale23()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Other Males            Page 23 of 30"
    ClearMenu()
    Menu.addButton(other_male_models23[Menu.buttonCount+1], "savemodel", other_male_models23[Menu.buttonCount+1])
    Menu.addButton(other_male_models23[Menu.buttonCount+1], "savemodel", other_male_models23[Menu.buttonCount+1])
    Menu.addButton(other_male_models23[Menu.buttonCount+1], "savemodel", other_male_models23[Menu.buttonCount+1])
    Menu.addButton(other_male_models23[Menu.buttonCount+1], "savemodel", other_male_models23[Menu.buttonCount+1])
    Menu.addButton(other_male_models23[Menu.buttonCount+1], "savemodel", other_male_models23[Menu.buttonCount+1])
    Menu.addButton(other_male_models23[Menu.buttonCount+1], "savemodel", other_male_models23[Menu.buttonCount+1])
    Menu.addButton(other_male_models23[Menu.buttonCount+1], "savemodel", other_male_models23[Menu.buttonCount+1])
    Menu.addButton(other_male_models23[Menu.buttonCount+1], "savemodel", other_male_models23[Menu.buttonCount+1])
    Menu.addButton("Next Page","OtherMenuMale24",nil)
    Menu.addButton("Previous Page","OtherMenuMale22",nil)	
    Menu.addButton("Return","OtherMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Others Menu        Page 24/30
--Male
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function OtherMenuMale24()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Other Males            Page 24 of 30"
    ClearMenu()
    Menu.addButton(other_male_models24[Menu.buttonCount+1], "savemodel", other_male_models24[Menu.buttonCount+1])
    Menu.addButton(other_male_models24[Menu.buttonCount+1], "savemodel", other_male_models24[Menu.buttonCount+1])
    Menu.addButton(other_male_models24[Menu.buttonCount+1], "savemodel", other_male_models24[Menu.buttonCount+1])
    Menu.addButton(other_male_models24[Menu.buttonCount+1], "savemodel", other_male_models24[Menu.buttonCount+1])
    Menu.addButton(other_male_models24[Menu.buttonCount+1], "savemodel", other_male_models24[Menu.buttonCount+1])
    Menu.addButton(other_male_models24[Menu.buttonCount+1], "savemodel", other_male_models24[Menu.buttonCount+1])
    Menu.addButton(other_male_models24[Menu.buttonCount+1], "savemodel", other_male_models24[Menu.buttonCount+1])
    Menu.addButton(other_male_models24[Menu.buttonCount+1], "savemodel", other_male_models24[Menu.buttonCount+1])
    Menu.addButton("Next Page","OtherMenuMale25",nil)
    Menu.addButton("Previous Page","OtherMenuMale23",nil)	
    Menu.addButton("Return","OtherMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Others Menu        Page 25/30
--Male
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function OtherMenuMale25()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Other Males            Page 25 of 30"
    ClearMenu()
    Menu.addButton(other_male_models25[Menu.buttonCount+1], "savemodel", other_male_models25[Menu.buttonCount+1])
    Menu.addButton(other_male_models25[Menu.buttonCount+1], "savemodel", other_male_models25[Menu.buttonCount+1])
    Menu.addButton(other_male_models25[Menu.buttonCount+1], "savemodel", other_male_models25[Menu.buttonCount+1])
    Menu.addButton(other_male_models25[Menu.buttonCount+1], "savemodel", other_male_models25[Menu.buttonCount+1])
    Menu.addButton(other_male_models25[Menu.buttonCount+1], "savemodel", other_male_models25[Menu.buttonCount+1])
    Menu.addButton(other_male_models25[Menu.buttonCount+1], "savemodel", other_male_models25[Menu.buttonCount+1])
    Menu.addButton(other_male_models25[Menu.buttonCount+1], "savemodel", other_male_models25[Menu.buttonCount+1])
    Menu.addButton(other_male_models25[Menu.buttonCount+1], "savemodel", other_male_models25[Menu.buttonCount+1])
    Menu.addButton("Next Page","OtherMenuMale26",nil)
    Menu.addButton("Previous Page","OtherMenuMale24",nil)	
    Menu.addButton("Return","OtherMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Others Menu        Page 26/30
--Male
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function OtherMenuMale26()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Other Males            Page 26 of 30"
    ClearMenu()
    Menu.addButton(other_male_models26[Menu.buttonCount+1], "savemodel", other_male_models26[Menu.buttonCount+1])
    Menu.addButton(other_male_models26[Menu.buttonCount+1], "savemodel", other_male_models26[Menu.buttonCount+1])
    Menu.addButton(other_male_models26[Menu.buttonCount+1], "savemodel", other_male_models26[Menu.buttonCount+1])
    Menu.addButton(other_male_models26[Menu.buttonCount+1], "savemodel", other_male_models26[Menu.buttonCount+1])
    Menu.addButton(other_male_models26[Menu.buttonCount+1], "savemodel", other_male_models26[Menu.buttonCount+1])
    Menu.addButton(other_male_models26[Menu.buttonCount+1], "savemodel", other_male_models26[Menu.buttonCount+1])
    Menu.addButton(other_male_models26[Menu.buttonCount+1], "savemodel", other_male_models26[Menu.buttonCount+1])
    Menu.addButton(other_male_models26[Menu.buttonCount+1], "savemodel", other_male_models26[Menu.buttonCount+1])
    Menu.addButton("Next Page","OtherMenuMale27",nil)
    Menu.addButton("Previous Page","OtherMenuMale25",nil)	
    Menu.addButton("Return","OtherMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Others Menu        Page 27/30
--Male
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function OtherMenuMale27()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Other Males            Page 27 of 30"
    ClearMenu()
    Menu.addButton(other_male_models27[Menu.buttonCount+1], "savemodel", other_male_models27[Menu.buttonCount+1])
    Menu.addButton(other_male_models27[Menu.buttonCount+1], "savemodel", other_male_models27[Menu.buttonCount+1])
    Menu.addButton(other_male_models27[Menu.buttonCount+1], "savemodel", other_male_models27[Menu.buttonCount+1])
    Menu.addButton(other_male_models27[Menu.buttonCount+1], "savemodel", other_male_models27[Menu.buttonCount+1])
    Menu.addButton(other_male_models27[Menu.buttonCount+1], "savemodel", other_male_models27[Menu.buttonCount+1])
    Menu.addButton(other_male_models27[Menu.buttonCount+1], "savemodel", other_male_models27[Menu.buttonCount+1])
    Menu.addButton(other_male_models27[Menu.buttonCount+1], "savemodel", other_male_models27[Menu.buttonCount+1])
    Menu.addButton(other_male_models27[Menu.buttonCount+1], "savemodel", other_male_models27[Menu.buttonCount+1])
    Menu.addButton("Next Page","OtherMenuMale28",nil)
    Menu.addButton("Previous Page","OtherMenuMale26",nil)	
    Menu.addButton("Return","OtherMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Others Menu        Page 28/30
--Male
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function OtherMenuMale28()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Other Males            Page 28 of 30"
    ClearMenu()
    Menu.addButton(other_male_models28[Menu.buttonCount+1], "savemodel", other_male_models28[Menu.buttonCount+1])
    Menu.addButton(other_male_models28[Menu.buttonCount+1], "savemodel", other_male_models28[Menu.buttonCount+1])
    Menu.addButton(other_male_models28[Menu.buttonCount+1], "savemodel", other_male_models28[Menu.buttonCount+1])
    Menu.addButton(other_male_models28[Menu.buttonCount+1], "savemodel", other_male_models28[Menu.buttonCount+1])
    Menu.addButton(other_male_models28[Menu.buttonCount+1], "savemodel", other_male_models28[Menu.buttonCount+1])
    Menu.addButton(other_male_models28[Menu.buttonCount+1], "savemodel", other_male_models28[Menu.buttonCount+1])
    Menu.addButton(other_male_models28[Menu.buttonCount+1], "savemodel", other_male_models28[Menu.buttonCount+1])
    Menu.addButton(other_male_models28[Menu.buttonCount+1], "savemodel", other_male_models28[Menu.buttonCount+1])
    Menu.addButton("Next Page","OtherMenuMale29",nil)
    Menu.addButton("Previous Page","OtherMenuMale27",nil)	
    Menu.addButton("Return","OtherMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Others Menu        Page 29/30
--Male
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function OtherMenuMale29()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Other Males            Page 29 of 30"
    ClearMenu()
    Menu.addButton(other_male_models29[Menu.buttonCount+1], "savemodel", other_male_models29[Menu.buttonCount+1])
    Menu.addButton(other_male_models29[Menu.buttonCount+1], "savemodel", other_male_models29[Menu.buttonCount+1])
    Menu.addButton(other_male_models29[Menu.buttonCount+1], "savemodel", other_male_models29[Menu.buttonCount+1])
    Menu.addButton(other_male_models29[Menu.buttonCount+1], "savemodel", other_male_models29[Menu.buttonCount+1])
    Menu.addButton(other_male_models29[Menu.buttonCount+1], "savemodel", other_male_models29[Menu.buttonCount+1])
    Menu.addButton(other_male_models29[Menu.buttonCount+1], "savemodel", other_male_models29[Menu.buttonCount+1])
    Menu.addButton(other_male_models29[Menu.buttonCount+1], "savemodel", other_male_models29[Menu.buttonCount+1])
    Menu.addButton(other_male_models29[Menu.buttonCount+1], "savemodel", other_male_models29[Menu.buttonCount+1])
    Menu.addButton("Next Page","OtherMenuMale30",nil)
    Menu.addButton("Previous Page","OtherMenuMale28",nil)	
    Menu.addButton("Return","OtherMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Others Menu        Page 30/30
--Male
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function OtherMenuMale30()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Other Males            Page 30 of 30"
    ClearMenu()
    Menu.addButton(other_male_models30[Menu.buttonCount+1], "savemodel", other_male_models30[Menu.buttonCount+1])
    Menu.addButton("Next Page","OtherMenuMale",nil)
    Menu.addButton("Previous Page","OtherMenuMale29",nil)	
    Menu.addButton("Return","OtherMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Others Menu        Page 1/9
--Female
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function OtherMenuFemale()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Other Females           Page 1 of 9"
    ClearMenu()
    Menu.addButton(other_female_models[Menu.buttonCount+1], "savemodel", other_female_models[Menu.buttonCount+1])
    Menu.addButton(other_female_models[Menu.buttonCount+1], "savemodel", other_female_models[Menu.buttonCount+1])
    Menu.addButton(other_female_models[Menu.buttonCount+1], "savemodel", other_female_models[Menu.buttonCount+1])
    Menu.addButton(other_female_models[Menu.buttonCount+1], "savemodel", other_female_models[Menu.buttonCount+1])
    Menu.addButton(other_female_models[Menu.buttonCount+1], "savemodel", other_female_models[Menu.buttonCount+1])
    Menu.addButton(other_female_models[Menu.buttonCount+1], "savemodel", other_female_models[Menu.buttonCount+1])
    Menu.addButton(other_female_models[Menu.buttonCount+1], "savemodel", other_female_models[Menu.buttonCount+1])
    Menu.addButton(other_female_models[Menu.buttonCount+1], "savemodel", other_female_models[Menu.buttonCount+1])
    Menu.addButton("Next Page","OtherMenuFemale2",nil)
    Menu.addButton("Previous Page","OtherMenuFemale9",nil)	
    Menu.addButton("Return","OtherMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Others Menu        Page 2/9
--Female
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function OtherMenuFemale2()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Other Females           Page 2 of 9"
    ClearMenu()
    Menu.addButton(other_female_models2[Menu.buttonCount+1], "savemodel", other_female_models2[Menu.buttonCount+1])
    Menu.addButton(other_female_models2[Menu.buttonCount+1], "savemodel", other_female_models2[Menu.buttonCount+1])
    Menu.addButton(other_female_models2[Menu.buttonCount+1], "savemodel", other_female_models2[Menu.buttonCount+1])
    Menu.addButton(other_female_models2[Menu.buttonCount+1], "savemodel", other_female_models2[Menu.buttonCount+1])
    Menu.addButton(other_female_models2[Menu.buttonCount+1], "savemodel", other_female_models2[Menu.buttonCount+1])
    Menu.addButton(other_female_models2[Menu.buttonCount+1], "savemodel", other_female_models2[Menu.buttonCount+1])
    Menu.addButton(other_female_models2[Menu.buttonCount+1], "savemodel", other_female_models2[Menu.buttonCount+1])
    Menu.addButton(other_female_models2[Menu.buttonCount+1], "savemodel", other_female_models2[Menu.buttonCount+1])
    Menu.addButton("Next Page","OtherMenuFemale3",nil)
    Menu.addButton("Previous Page","OtherMenuFemale",nil)	
    Menu.addButton("Return","OtherMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Others Menu        Page 3/9
--Female
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function OtherMenuFemale3()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Other Females           Page 3 of 9"
    ClearMenu()
    Menu.addButton(other_female_models3[Menu.buttonCount+1], "savemodel", other_female_models3[Menu.buttonCount+1])
    Menu.addButton(other_female_models3[Menu.buttonCount+1], "savemodel", other_female_models3[Menu.buttonCount+1])
    Menu.addButton(other_female_models3[Menu.buttonCount+1], "savemodel", other_female_models3[Menu.buttonCount+1])
    Menu.addButton(other_female_models3[Menu.buttonCount+1], "savemodel", other_female_models3[Menu.buttonCount+1])
    Menu.addButton(other_female_models3[Menu.buttonCount+1], "savemodel", other_female_models3[Menu.buttonCount+1])
    Menu.addButton(other_female_models3[Menu.buttonCount+1], "savemodel", other_female_models3[Menu.buttonCount+1])
    Menu.addButton(other_female_models3[Menu.buttonCount+1], "savemodel", other_female_models3[Menu.buttonCount+1])
    Menu.addButton(other_female_models3[Menu.buttonCount+1], "savemodel", other_female_models3[Menu.buttonCount+1])
    Menu.addButton("Next Page","OtherMenuFemale4",nil)
    Menu.addButton("Previous Page","OtherMenuFemale2",nil)	
    Menu.addButton("Return","OtherMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Others Menu        Page 4/9
--Female
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function OtherMenuFemale4()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Other Females           Page 4 of 9"
    ClearMenu()
    Menu.addButton(other_female_models4[Menu.buttonCount+1], "savemodel", other_female_models4[Menu.buttonCount+1])
    Menu.addButton(other_female_models4[Menu.buttonCount+1], "savemodel", other_female_models4[Menu.buttonCount+1])
    Menu.addButton(other_female_models4[Menu.buttonCount+1], "savemodel", other_female_models4[Menu.buttonCount+1])
    Menu.addButton(other_female_models4[Menu.buttonCount+1], "savemodel", other_female_models4[Menu.buttonCount+1])
    Menu.addButton(other_female_models4[Menu.buttonCount+1], "savemodel", other_female_models4[Menu.buttonCount+1])
    Menu.addButton(other_female_models4[Menu.buttonCount+1], "savemodel", other_female_models4[Menu.buttonCount+1])
    Menu.addButton(other_female_models4[Menu.buttonCount+1], "savemodel", other_female_models4[Menu.buttonCount+1])
    Menu.addButton(other_female_models4[Menu.buttonCount+1], "savemodel", other_female_models4[Menu.buttonCount+1])
    Menu.addButton("Next Page","OtherMenuFemale5",nil)
    Menu.addButton("Previous Page","OtherMenuFemale3",nil)	
    Menu.addButton("Return","OtherMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Others Menu        Page 5/9
--Female
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function OtherMenuFemale5()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Other Females           Page 5 of 9"
    ClearMenu()
    Menu.addButton(other_female_models5[Menu.buttonCount+1], "savemodel", other_female_models5[Menu.buttonCount+1])
    Menu.addButton(other_female_models5[Menu.buttonCount+1], "savemodel", other_female_models5[Menu.buttonCount+1])
    Menu.addButton(other_female_models5[Menu.buttonCount+1], "savemodel", other_female_models5[Menu.buttonCount+1])
    Menu.addButton(other_female_models5[Menu.buttonCount+1], "savemodel", other_female_models5[Menu.buttonCount+1])
    Menu.addButton(other_female_models5[Menu.buttonCount+1], "savemodel", other_female_models5[Menu.buttonCount+1])
    Menu.addButton(other_female_models5[Menu.buttonCount+1], "savemodel", other_female_models5[Menu.buttonCount+1])
    Menu.addButton(other_female_models5[Menu.buttonCount+1], "savemodel", other_female_models5[Menu.buttonCount+1])
    Menu.addButton(other_female_models5[Menu.buttonCount+1], "savemodel", other_female_models5[Menu.buttonCount+1])
    Menu.addButton("Next Page","OtherMenuFemale6",nil)
    Menu.addButton("Previous Page","OtherMenuFemale4",nil)	
    Menu.addButton("Return","OtherMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Others Menu        Page 6/9
--Female
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function OtherMenuFemale6()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Other Females           Page 6 of 9"
    ClearMenu()
    Menu.addButton(other_female_models6[Menu.buttonCount+1], "savemodel", other_female_models6[Menu.buttonCount+1])
    Menu.addButton(other_female_models6[Menu.buttonCount+1], "savemodel", other_female_models6[Menu.buttonCount+1])
    Menu.addButton(other_female_models6[Menu.buttonCount+1], "savemodel", other_female_models6[Menu.buttonCount+1])
    Menu.addButton(other_female_models6[Menu.buttonCount+1], "savemodel", other_female_models6[Menu.buttonCount+1])
    Menu.addButton(other_female_models6[Menu.buttonCount+1], "savemodel", other_female_models6[Menu.buttonCount+1])
    Menu.addButton(other_female_models6[Menu.buttonCount+1], "savemodel", other_female_models6[Menu.buttonCount+1])
    Menu.addButton(other_female_models6[Menu.buttonCount+1], "savemodel", other_female_models6[Menu.buttonCount+1])
    Menu.addButton(other_female_models6[Menu.buttonCount+1], "savemodel", other_female_models6[Menu.buttonCount+1])
    Menu.addButton("Next Page","OtherMenuFemale7",nil)
    Menu.addButton("Previous Page","OtherMenuFemale5",nil)	
    Menu.addButton("Return","OtherMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Others Menu        Page 7/9
--Female
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function OtherMenuFemale7()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Other Females           Page 7 of 9"
    ClearMenu()
    Menu.addButton(other_female_models7[Menu.buttonCount+1], "savemodel", other_female_models7[Menu.buttonCount+1])
    Menu.addButton(other_female_models7[Menu.buttonCount+1], "savemodel", other_female_models7[Menu.buttonCount+1])
    Menu.addButton(other_female_models7[Menu.buttonCount+1], "savemodel", other_female_models7[Menu.buttonCount+1])
    Menu.addButton(other_female_models7[Menu.buttonCount+1], "savemodel", other_female_models7[Menu.buttonCount+1])
    Menu.addButton(other_female_models7[Menu.buttonCount+1], "savemodel", other_female_models7[Menu.buttonCount+1])
    Menu.addButton(other_female_models7[Menu.buttonCount+1], "savemodel", other_female_models7[Menu.buttonCount+1])
    Menu.addButton(other_female_models7[Menu.buttonCount+1], "savemodel", other_female_models7[Menu.buttonCount+1])
    Menu.addButton(other_female_models7[Menu.buttonCount+1], "savemodel", other_female_models7[Menu.buttonCount+1])
    Menu.addButton("Next Page","OtherMenuFemale8",nil)
    Menu.addButton("Previous Page","OtherMenuFemale6",nil)	
    Menu.addButton("Return","OtherMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Others Menu        Page 8/9
--Female
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function OtherMenuFemale8()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Other Females           Page 8 of 9"
    ClearMenu()
    Menu.addButton(other_female_models8[Menu.buttonCount+1], "savemodel", other_female_models8[Menu.buttonCount+1])
    Menu.addButton(other_female_models8[Menu.buttonCount+1], "savemodel", other_female_models8[Menu.buttonCount+1])
    Menu.addButton(other_female_models8[Menu.buttonCount+1], "savemodel", other_female_models8[Menu.buttonCount+1])
    Menu.addButton(other_female_models8[Menu.buttonCount+1], "savemodel", other_female_models8[Menu.buttonCount+1])
    Menu.addButton(other_female_models8[Menu.buttonCount+1], "savemodel", other_female_models8[Menu.buttonCount+1])
    Menu.addButton(other_female_models8[Menu.buttonCount+1], "savemodel", other_female_models8[Menu.buttonCount+1])
    Menu.addButton(other_female_models8[Menu.buttonCount+1], "savemodel", other_female_models8[Menu.buttonCount+1])
    Menu.addButton(other_female_models8[Menu.buttonCount+1], "savemodel", other_female_models8[Menu.buttonCount+1])
    Menu.addButton("Next Page","OtherMenuFemale9",nil)
    Menu.addButton("Previous Page","OtherMenuFemale7",nil)	
    Menu.addButton("Return","OtherMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Others Menu        Page 9/9
--Female
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function OtherMenuFemale9()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Other Females           Page 9 of 9"
    ClearMenu()
    Menu.addButton(other_female_models9[Menu.buttonCount+1], "savemodel", other_female_models9[Menu.buttonCount+1])
    Menu.addButton("Next Page","OtherMenuFemale",nil)
    Menu.addButton("Previous Page","OtherMenuFemale8",nil)	
    Menu.addButton("Return","OtherMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Others Menu        Page 1/2
--Multiplayer Models
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MPMenu()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "MP Models               Page 1 of 2"
    ClearMenu()
    Menu.addButton(mp_models[Menu.buttonCount+1], "savemodel", mp_models[Menu.buttonCount+1])
    Menu.addButton(mp_models[Menu.buttonCount+1], "savempmodel", mp_models[Menu.buttonCount+1])
    Menu.addButton(mp_models[Menu.buttonCount+1], "savemodel", mp_models[Menu.buttonCount+1])
    Menu.addButton(mp_models[Menu.buttonCount+1], "savemodel", mp_models[Menu.buttonCount+1])
    Menu.addButton(mp_models[Menu.buttonCount+1], "savempmodel", mp_models[Menu.buttonCount+1])
    Menu.addButton(mp_models[Menu.buttonCount+1], "savemodel", mp_models[Menu.buttonCount+1])
    Menu.addButton(mp_models[Menu.buttonCount+1], "savempmodel", mp_models[Menu.buttonCount+1])
    Menu.addButton("Next Page","MPMenu2",nil)
    Menu.addButton("Previous Page","MPMenu2",nil)	
    Menu.addButton("Return","OtherMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Others Menu        Page 2/2
--Multiplayer Models
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MPMenu2()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "MP Models               Page 2 of 2"
    ClearMenu()
    Menu.addButton(mp_models2[Menu.buttonCount+1], "savemodel", mp_models2[Menu.buttonCount+1])
    Menu.addButton(mp_models2[Menu.buttonCount+1], "savemodel", mp_models2[Menu.buttonCount+1])
    Menu.addButton(mp_models2[Menu.buttonCount+1], "savempmodel", mp_models2[Menu.buttonCount+1])
    Menu.addButton(mp_models2[Menu.buttonCount+1], "savemodel", mp_models2[Menu.buttonCount+1])
    Menu.addButton(mp_models2[Menu.buttonCount+1], "savemodel", mp_models2[Menu.buttonCount+1])
    Menu.addButton(mp_models2[Menu.buttonCount+1], "savemodel", mp_models2[Menu.buttonCount+1])
    Menu.addButton(mp_models2[Menu.buttonCount+1], "savemodel", mp_models2[Menu.buttonCount+1])
    Menu.addButton("Next Page","MPMenu",nil)
    Menu.addButton("Previous Page","MPMenu",nil)	
    Menu.addButton("Return","OtherMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Accessories Menu
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function Accessories()
    options.menu_subtitle = "Accessories"
    ClearMenu()
    Menu.addButton("Hats", "HatChecker")
    Menu.addButton("Glasses", "GlassesChecker")
    Menu.addButton("Earings", "PercingChecker")
    Menu.addButton("Masks (MP Models)", "MaskMenu")
	Menu.addButton("Remove Accessories", "RemoveAccessories")
    Menu.addButton("Return","Main",nil)
end

function RemoveAccessories()
    options.menu_subtitle = "Accessories"
    ClearMenu()
    Menu.addButton("Remove hat", "riphat",nil)
    Menu.addButton("Remove glasses", "ripglasses",nil)
    Menu.addButton("Remove earrings", "ripearrings",nil)
    Menu.addButton("Remove mask", "ripmask",nil)
    Menu.addButton("Return","Accessories",nil)
end

function riphat()
	ClearPedProp(GetPlayerPed(-1),0)
end
function ripglasses()
	ClearPedProp(GetPlayerPed(-1),1)
end
function ripearrings()
	ClearPedProp(GetPlayerPed(-1),2)
end
function ripmask()
	local mask = 0
	TriggerServerEvent("mm:removemask", mask)
end
RegisterNetEvent("mm:maskremove")  
AddEventHandler("mm:maskremove",function(mask)
    changemask(mask,nil)
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Mask Menu                     Page 1/9
--Masks
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function MaskMenu()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Masks                   Page 1 of 9"
    ClearMenu()
    Menu.addButton(acc.masks_pg1[Menu.buttonCount+1], "savemask", ass.masks_pg1[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg1[Menu.buttonCount+1], "savemask", ass.masks_pg1[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg1[Menu.buttonCount+1], "savemask", ass.masks_pg1[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg1[Menu.buttonCount+1], "savemask", ass.masks_pg1[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg1[Menu.buttonCount+1], "savemask", ass.masks_pg1[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg1[Menu.buttonCount+1], "savemask", ass.masks_pg1[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg1[Menu.buttonCount+1], "savemask", ass.masks_pg1[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg1[Menu.buttonCount+1], "savemask", ass.masks_pg1[Menu.buttonCount+1])
    Menu.addButton("Next Page","MaskMenu2",nil)
    Menu.addButton("Previous Page","MaskMenu9",nil)
    Menu.addButton("Return","Accessories",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Mask Menu                     Page 2/9
--Masks
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaskMenu2()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Masks                   Page 2 of 9"
    ClearMenu()
    Menu.addButton(acc.masks_pg2[Menu.buttonCount+1], "savemask", ass.masks_pg2[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg2[Menu.buttonCount+1], "savemask", ass.masks_pg2[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg2[Menu.buttonCount+1], "savemask", ass.masks_pg2[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg2[Menu.buttonCount+1], "savemask", ass.masks_pg2[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg2[Menu.buttonCount+1], "savemask", ass.masks_pg2[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg2[Menu.buttonCount+1], "savemask", ass.masks_pg2[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg2[Menu.buttonCount+1], "savemask", ass.masks_pg2[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg2[Menu.buttonCount+1], "savemask", ass.masks_pg2[Menu.buttonCount+1])
    Menu.addButton("Next Page","MaskMenu3",nil)
    Menu.addButton("Previous Page","MaskMenu",nil)
    Menu.addButton("Return","Accessories",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Mask Menu                     Page 3/9
--Masks
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaskMenu3()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Masks                   Page 3 of 9"
    ClearMenu()
    Menu.addButton(acc.masks_pg3[Menu.buttonCount+1], "savemask", ass.masks_pg3[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg3[Menu.buttonCount+1], "savemask", ass.masks_pg3[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg3[Menu.buttonCount+1], "savemask", ass.masks_pg3[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg3[Menu.buttonCount+1], "savemask", ass.masks_pg3[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg3[Menu.buttonCount+1], "savemask", ass.masks_pg3[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg3[Menu.buttonCount+1], "savemask", ass.masks_pg3[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg3[Menu.buttonCount+1], "savemask", ass.masks_pg3[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg3[Menu.buttonCount+1], "savemask", ass.masks_pg3[Menu.buttonCount+1])
    Menu.addButton("Next Page","MaskMenu4",nil)
    Menu.addButton("Previous Page","MaskMenu2",nil)
    Menu.addButton("Return","Accessories",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Mask Menu                     Page 4/9
--Masks
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaskMenu4()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Masks                   Page 4 of 9"
    ClearMenu()
    Menu.addButton(acc.masks_pg4[Menu.buttonCount+1], "savemask", ass.masks_pg4[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg4[Menu.buttonCount+1], "savemask", ass.masks_pg4[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg4[Menu.buttonCount+1], "savemask", ass.masks_pg4[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg4[Menu.buttonCount+1], "savemask", ass.masks_pg4[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg4[Menu.buttonCount+1], "savemask", ass.masks_pg4[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg4[Menu.buttonCount+1], "savemask", ass.masks_pg4[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg4[Menu.buttonCount+1], "savemask", ass.masks_pg4[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg4[Menu.buttonCount+1], "savemask", ass.masks_pg4[Menu.buttonCount+1])
    Menu.addButton("Next Page","MaskMenu5",nil)
    Menu.addButton("Previous Page","MaskMenu3",nil)
    Menu.addButton("Return","Accessories",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Mask Menu                     Page 5/9
--Masks
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaskMenu5()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Masks                   Page 5 of 9"
    ClearMenu()
    Menu.addButton(acc.masks_pg5[Menu.buttonCount+1], "savemask", ass.masks_pg5[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg5[Menu.buttonCount+1], "savemask", ass.masks_pg5[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg5[Menu.buttonCount+1], "savemask", ass.masks_pg5[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg5[Menu.buttonCount+1], "savemask", ass.masks_pg5[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg5[Menu.buttonCount+1], "savemask", ass.masks_pg5[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg5[Menu.buttonCount+1], "savemask", ass.masks_pg5[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg5[Menu.buttonCount+1], "savemask", ass.masks_pg5[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg5[Menu.buttonCount+1], "savemask", ass.masks_pg5[Menu.buttonCount+1])
    Menu.addButton("Next Page","MaskMenu6",nil)
    Menu.addButton("Previous Page","MaskMenu4",nil)
    Menu.addButton("Return","Accessories",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Mask Menu                     Page 6/9
--Masks
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaskMenu6()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Masks                   Page 6 of 9"
    ClearMenu()
    Menu.addButton(acc.masks_pg6[Menu.buttonCount+1], "savemask", ass.masks_pg6[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg6[Menu.buttonCount+1], "savemask", ass.masks_pg6[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg6[Menu.buttonCount+1], "savemask", ass.masks_pg6[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg6[Menu.buttonCount+1], "savemask", ass.masks_pg6[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg6[Menu.buttonCount+1], "savemask", ass.masks_pg6[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg6[Menu.buttonCount+1], "savemask", ass.masks_pg6[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg6[Menu.buttonCount+1], "savemask", ass.masks_pg6[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg6[Menu.buttonCount+1], "savemask", ass.masks_pg6[Menu.buttonCount+1])
    Menu.addButton("Next Page","MaskMenu7",nil)
    Menu.addButton("Previous Page","MaskMenu6",nil)
    Menu.addButton("Return","Accessories",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Mask Menu                     Page 7/9
--Masks
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaskMenu7()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Masks                   Page 7 of 9"
    ClearMenu()
    Menu.addButton(acc.masks_pg7[Menu.buttonCount+1], "savemask", ass.masks_pg7[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg7[Menu.buttonCount+1], "savemask", ass.masks_pg7[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg7[Menu.buttonCount+1], "savemask", ass.masks_pg7[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg7[Menu.buttonCount+1], "savemask", ass.masks_pg7[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg7[Menu.buttonCount+1], "savemask", ass.masks_pg7[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg7[Menu.buttonCount+1], "savemask", ass.masks_pg7[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg7[Menu.buttonCount+1], "savemask", ass.masks_pg7[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg7[Menu.buttonCount+1], "savemask", ass.masks_pg7[Menu.buttonCount+1])
    Menu.addButton("Next Page","MaskMenu8",nil)
    Menu.addButton("Previous Page","MaskMenu6",nil)
    Menu.addButton("Return","Accessories",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Mask Menu                     Page 8/9
--Masks
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaskMenu8()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Masks                   Page 8 of 9"
    ClearMenu()
    Menu.addButton(acc.masks_pg8[Menu.buttonCount+1], "savemask", ass.masks_pg8[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg8[Menu.buttonCount+1], "savemask", ass.masks_pg8[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg8[Menu.buttonCount+1], "savemask", ass.masks_pg8[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg8[Menu.buttonCount+1], "savemask", ass.masks_pg8[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg8[Menu.buttonCount+1], "savemask", ass.masks_pg8[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg8[Menu.buttonCount+1], "savemask", ass.masks_pg8[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg8[Menu.buttonCount+1], "savemask", ass.masks_pg8[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg8[Menu.buttonCount+1], "savemask", ass.masks_pg8[Menu.buttonCount+1])
    Menu.addButton("Next Page","MaskMenu9",nil)
    Menu.addButton("Previous Page","MaskMenu7",nil)
    Menu.addButton("Return","Accessories",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Mask Menu                     Page 9/9
--Masks
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaskMenu9()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Masks                   Page 9 of 9"
    ClearMenu()
    Menu.addButton(acc.masks_pg9[Menu.buttonCount+1], "savemask", ass.masks_pg9[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg9[Menu.buttonCount+1], "savemask", ass.masks_pg9[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg9[Menu.buttonCount+1], "savemask", ass.masks_pg9[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg9[Menu.buttonCount+1], "savemask", ass.masks_pg9[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg9[Menu.buttonCount+1], "savemask", ass.masks_pg9[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg9[Menu.buttonCount+1], "savemask", ass.masks_pg9[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg9[Menu.buttonCount+1], "savemask", ass.masks_pg9[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg9[Menu.buttonCount+1], "savemask", ass.masks_pg9[Menu.buttonCount+1])
    Menu.addButton("Next Page","MaskMenu",nil)
    Menu.addButton("Previous Page","MaskMenu8",nil)
    Menu.addButton("Return","Accessories",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Mask Menu                     Page 1/4
--Textures
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function maskTextures()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Textures                Page 1 of 4"
    ClearMenu()
    Menu.addButton(ass.txt_pg1[Menu.buttonCount+1], "savetxt", ass.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg1[Menu.buttonCount+1], "savetxt", ass.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg1[Menu.buttonCount+1], "savetxt", ass.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg1[Menu.buttonCount+1], "savetxt", ass.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg1[Menu.buttonCount+1], "savetxt", ass.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg1[Menu.buttonCount+1], "savetxt", ass.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg1[Menu.buttonCount+1], "savetxt", ass.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg1[Menu.buttonCount+1], "savetxt", ass.txt_pg1[Menu.buttonCount+1])
    Menu.addButton("Next Page","maskTextures2",nil)
    Menu.addButton("Previous Page","maskTextures4",nil)
    Menu.addButton("Return","MaskMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Mask Menu                     Page 2/4
--Textures
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function maskTextures2()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Textures                Page 2 of 4"
    ClearMenu()
    Menu.addButton(ass.txt_pg2[Menu.buttonCount+1], "savetxt", ass.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg2[Menu.buttonCount+1], "savetxt", ass.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg2[Menu.buttonCount+1], "savetxt", ass.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg2[Menu.buttonCount+1], "savetxt", ass.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg2[Menu.buttonCount+1], "savetxt", ass.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg2[Menu.buttonCount+1], "savetxt", ass.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg2[Menu.buttonCount+1], "savetxt", ass.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg2[Menu.buttonCount+1], "savetxt", ass.txt_pg2[Menu.buttonCount+1])
    Menu.addButton("Next Page","maskTextures3",nil)
    Menu.addButton("Previous Page","maskTextures",nil)
    Menu.addButton("Return","MaskMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Mask Menu                     Page 3/4
--Textures
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function maskTextures3()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Textures                Page 3 of 4"
    ClearMenu()
    Menu.addButton(ass.txt_pg3[Menu.buttonCount+1], "savetxt", ass.txt_pg3[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg3[Menu.buttonCount+1], "savetxt", ass.txt_pg3[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg3[Menu.buttonCount+1], "savetxt", ass.txt_pg3[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg3[Menu.buttonCount+1], "savetxt", ass.txt_pg3[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg3[Menu.buttonCount+1], "savetxt", ass.txt_pg3[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg3[Menu.buttonCount+1], "savetxt", ass.txt_pg3[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg3[Menu.buttonCount+1], "savetxt", ass.txt_pg3[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg3[Menu.buttonCount+1], "savetxt", ass.txt_pg3[Menu.buttonCount+1])
    Menu.addButton("Next Page","maskTextures4",nil)
    Menu.addButton("Previous Page","maskTextures2",nil)
    Menu.addButton("Return","MaskMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Mask Menu                     Page 4/4
--Textures
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function maskTextures4()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Textures                Page 4 of 4"
    ClearMenu()
    Menu.addButton(ass.txt_pg4[Menu.buttonCount+1], "savetxt", ass.txt_pg4[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg4[Menu.buttonCount+1], "savetxt", ass.txt_pg4[Menu.buttonCount+1])
    Menu.addButton("Next Page","maskTextures",nil)
    Menu.addButton("Previous Page","maskTextures3",nil)
    Menu.addButton("Return","MaskMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Mask Menu             --Credit to izio38 for helping me with one of my annoying errors :)
--Functions
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function savemask(mask) --Sets Players mask in database
	TriggerServerEvent("mm:savemask", mask)
end

function changemask(mask) --Sets Players mask
	SetPedComponentVariation(GetPlayerPed(-1), 1, mask, 0, 0)
end

RegisterNetEvent("mm:changemask")  
AddEventHandler("mm:changemask",function(mask)
    changemask(mask,nil)
	maskTextures()
end)

function savetxt(mask_txt) --Sets mask texture in database
	TriggerServerEvent("mm:savemask_txt", mask_txt)
end

RegisterNetEvent("mm:changemask_txt") -- Sets mask texture
AddEventHandler("mm:changemask_txt",function(maskstuff)
	--Citizen.Trace(maskstuff.mask)
	--Citizen.Trace(maskstuff.mask_txt)
	SetPedComponentVariation(GetPlayerPed(-1), 1, tonumber(maskstuff.mask), tonumber(maskstuff.mask_txt), 0)
end)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Hat, Earrings and Glasses
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Credits to JcPires for this crap \/\/\/
function HatChecker()
	TriggerServerEvent("mm:wearHat")
end

function PercingChecker()
    TriggerServerEvent("mm:wearPercing")
end

function GlassesChecker()
    TriggerServerEvent("mm:wearGlasses")
end


RegisterNetEvent("mm:Hatwear")
AddEventHandler("mm:Hatwear", function(item)
    SetPedPropIndex(GetPlayerPed(-1), 0, item.helmet,item.helmet_txt, 0)
end)

RegisterNetEvent("mm:Percingwear")
AddEventHandler("mm:Percingwear", function(item)
    SetPedPropIndex(GetPlayerPed(-1), 2, item.percing,item.percing_txt, 0)
end)

RegisterNetEvent("mm:Glasseswear")
AddEventHandler("mm:Glasseswear", function(item)
    SetPedPropIndex(GetPlayerPed(-1), 1, item.glasses,item.glasses_txt, 0)
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Main
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Customisation()
    options.menu_subtitle = "Customisation"
    ClearMenu()
    Menu.addButton("Accessories", "Accessories")
    Menu.addButton("Head", "HeadMenu")
    Menu.addButton("Shirt", "ShirtMenu")
    Menu.addButton("Masks (MP Models)", "MaskMenu")
	Menu.addButton("Remove Accessories", "RemoveAccessories")
    Menu.addButton("Return","Main",nil)
end
--Females 34,45,33,21
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu       Page 1 of 6
--Head
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function HeadMenu()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Heads                   Page 1 of 6"
    ClearMenu()
    Menu.addButton(heads.name_pg1[Menu.buttonCount+1], "savehead", heads.drawable_pg1[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg1[Menu.buttonCount+1], "savehead", heads.drawable_pg1[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg1[Menu.buttonCount+1], "savehead", heads.drawable_pg1[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg1[Menu.buttonCount+1], "savehead", heads.drawable_pg1[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg1[Menu.buttonCount+1], "savehead", heads.drawable_pg1[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg1[Menu.buttonCount+1], "savehead", heads.drawable_pg1[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg1[Menu.buttonCount+1], "savehead", heads.drawable_pg1[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg1[Menu.buttonCount+1], "savehead", heads.drawable_pg1[Menu.buttonCount+1])
    Menu.addButton("Next Page","HeadMenu2",nil)
    Menu.addButton("Previous Page","HeadMenu6",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu       Page 2 of 6
--Head
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function HeadMenu2()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Heads                   Page 2 of 6"
    ClearMenu()
    Menu.addButton(heads.name_pg2[Menu.buttonCount+1], "savehead", heads.drawable_pg2[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg2[Menu.buttonCount+1], "savehead", heads.drawable_pg2[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg2[Menu.buttonCount+1], "savehead", heads.drawable_pg2[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg2[Menu.buttonCount+1], "savehead", heads.drawable_pg2[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg2[Menu.buttonCount+1], "savehead", heads.drawable_pg2[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg2[Menu.buttonCount+1], "savehead", heads.drawable_pg2[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg2[Menu.buttonCount+1], "savehead", heads.drawable_pg2[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg2[Menu.buttonCount+1], "savehead", heads.drawable_pg2[Menu.buttonCount+1])
    Menu.addButton("Next Page","HeadMenu3",nil)
    Menu.addButton("Previous Page","HeadMenu",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu       Page 3 of 6
--Head
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function HeadMenu3()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Heads                   Page 3 of 6"
    ClearMenu()
    Menu.addButton(heads.name_pg3[Menu.buttonCount+1], "savehead", heads.drawable_pg3[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg3[Menu.buttonCount+1], "savehead", heads.drawable_pg3[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg3[Menu.buttonCount+1], "savehead", heads.drawable_pg3[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg3[Menu.buttonCount+1], "savehead", heads.drawable_pg3[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg3[Menu.buttonCount+1], "savehead", heads.drawable_pg3[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg3[Menu.buttonCount+1], "savehead", heads.drawable_pg3[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg3[Menu.buttonCount+1], "savehead", heads.drawable_pg3[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg3[Menu.buttonCount+1], "savehead", heads.drawable_pg3[Menu.buttonCount+1])
    Menu.addButton("Next Page","HeadMenu4",nil)
    Menu.addButton("Previous Page","HeadMenu2",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu       Page 4 of 6
--Head
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function HeadMenu4()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Heads                   Page 4 of 6"
    ClearMenu()
    Menu.addButton(heads.name_pg4[Menu.buttonCount+1], "savehead", heads.drawable_pg4[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg4[Menu.buttonCount+1], "savehead", heads.drawable_pg4[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg4[Menu.buttonCount+1], "savehead", heads.drawable_pg4[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg4[Menu.buttonCount+1], "savehead", heads.drawable_pg4[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg4[Menu.buttonCount+1], "savehead", heads.drawable_pg4[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg4[Menu.buttonCount+1], "savehead", heads.drawable_pg4[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg4[Menu.buttonCount+1], "savehead", heads.drawable_pg4[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg4[Menu.buttonCount+1], "savehead", heads.drawable_pg4[Menu.buttonCount+1])
    Menu.addButton("Next Page","HeadMenu5",nil)
    Menu.addButton("Previous Page","HeadMenu3",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu       Page 5 of 6
--Head
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function HeadMenu5()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Heads                   Page 5 of 6"
    ClearMenu()
    Menu.addButton(heads.name_pg5[Menu.buttonCount+1], "savehead", heads.drawable_pg5[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg5[Menu.buttonCount+1], "savehead", heads.drawable_pg5[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg5[Menu.buttonCount+1], "savehead", heads.drawable_pg5[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg5[Menu.buttonCount+1], "savehead", heads.drawable_pg5[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg5[Menu.buttonCount+1], "savehead", heads.drawable_pg5[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg5[Menu.buttonCount+1], "savehead", heads.drawable_pg5[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg5[Menu.buttonCount+1], "savehead", heads.drawable_pg5[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg5[Menu.buttonCount+1], "savehead", heads.drawable_pg5[Menu.buttonCount+1])
    Menu.addButton("Next Page","HeadMenu6",nil)
    Menu.addButton("Previous Page","HeadMenu4",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu       Page 6 of 6
--Head
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function HeadMenu6()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Heads                   Page 6 of 6"
    ClearMenu()
    Menu.addButton(heads.name_pg6[Menu.buttonCount+1], "savehead", heads.drawable_pg6[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg6[Menu.buttonCount+1], "savehead", heads.drawable_pg6[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg6[Menu.buttonCount+1], "savehead", heads.drawable_pg6[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg6[Menu.buttonCount+1], "savehead", heads.drawable_pg6[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg6[Menu.buttonCount+1], "savehead", heads.drawable_pg6[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg6[Menu.buttonCount+1], "savehead", heads.drawable_pg6[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg6[Menu.buttonCount+1], "savehead", heads.drawable_pg6[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg6[Menu.buttonCount+1], "savehead", heads.drawable_pg6[Menu.buttonCount+1])
    Menu.addButton("Next Page","HeadMenu",nil)
    Menu.addButton("Previous Page","HeadMenu5",nil)
    Menu.addButton("Return","Customisation",nil)
end
--[[
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu       Page 2 of 6
--Head
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function HeadMenu2()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Masks                   Page 2 of 6"
    ClearMenu()
    Menu.addButton(heads.name_pg2[Menu.buttonCount+1], "savehead", heads.drawable_pg2[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg2[Menu.buttonCount+1], "savehead", heads.drawable_pg2[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg2[Menu.buttonCount+1], "savehead", heads.drawable_pg2[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg2[Menu.buttonCount+1], "savehead", heads.drawable_pg2[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg2[Menu.buttonCount+1], "savehead", heads.drawable_pg2[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg2[Menu.buttonCount+1], "savehead", heads.drawable_pg2[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg2[Menu.buttonCount+1], "savehead", heads.drawable_pg2[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg2[Menu.buttonCount+1], "savehead", heads.drawable_pg2[Menu.buttonCount+1])
    Menu.addButton("Next Page","HeadMenu",nil)
    Menu.addButton("Previous Page","HeadMenu",nil)
    Menu.addButton("Return","Customisation",nil)
end
]]
--[[
	Head Functions
--]]
function savehead(head) --Sets Players head in database
	TriggerServerEvent("mm:savehead", head)
end

function changehead(head) --Sets Players head
	SetPedComponentVariation(GetPlayerPed(-1), 0, head, 0, 2)
end

RegisterNetEvent("mm:changehead")  
AddEventHandler("mm:changehead",function(head)
    changehead(head,nil)
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Hair
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function HairMenu()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Gender"
    ClearMenu()
	Menu.addButton("Male","MaleHairMenu",nil)
    Menu.addButton("Female","FemaleHairMenu",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu       Page 1 of 6
--Hair
--Male
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaleHairMenu()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Hair                      Page 1 of 4"
    ClearMenu()
    Menu.addButton(hair.m_name_pg1[Menu.buttonCount+1], "savehair", hair.hair_pg1[Menu.buttonCount+1])
    Menu.addButton(hair.m_name_pg1[Menu.buttonCount+1], "savehair", hair.hair_pg1[Menu.buttonCount+1])
    Menu.addButton(hair.m_name_pg1[Menu.buttonCount+1], "savehair", hair.hair_pg1[Menu.buttonCount+1])
    Menu.addButton(hair.m_name_pg1[Menu.buttonCount+1], "savehair", hair.hair_pg1[Menu.buttonCount+1])
    Menu.addButton(hair.m_name_pg1[Menu.buttonCount+1], "savehair", hair.hair_pg1[Menu.buttonCount+1])
    Menu.addButton(hair.m_name_pg1[Menu.buttonCount+1], "savehair", hair.hair_pg1[Menu.buttonCount+1])
    Menu.addButton(hair.m_name_pg1[Menu.buttonCount+1], "savehair", hair.hair_pg1[Menu.buttonCount+1])
    Menu.addButton(hair.m_name_pg1[Menu.buttonCount+1], "savehair", hair.hair_pg1[Menu.buttonCount+1])
    Menu.addButton("Next Page","MaleHairMenu2",nil)
    Menu.addButton("Previous Page","MaleHairMenu4",nil)
    Menu.addButton("Return","HairMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu       Page 2 of 4
--Hair
--Male
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaleHairMenu2()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Hair                      Page 2 of 4"
    ClearMenu()
    Menu.addButton(hair.m_name_pg2[Menu.buttonCount+1], "savehair", hair.hair_pg2[Menu.buttonCount+1])
    Menu.addButton(hair.m_name_pg2[Menu.buttonCount+1], "savehair", hair.hair_pg2[Menu.buttonCount+1])
    Menu.addButton(hair.m_name_pg2[Menu.buttonCount+1], "savehair", hair.hair_pg2[Menu.buttonCount+1])
    Menu.addButton(hair.m_name_pg2[Menu.buttonCount+1], "savehair", hair.hair_pg2[Menu.buttonCount+1])
    Menu.addButton(hair.m_name_pg2[Menu.buttonCount+1], "savehair", hair.hair_pg2[Menu.buttonCount+1])
    Menu.addButton(hair.m_name_pg2[Menu.buttonCount+1], "savehair", hair.hair_pg2[Menu.buttonCount+1])
    Menu.addButton(hair.m_name_pg2[Menu.buttonCount+1], "savehair", hair.hair_pg2[Menu.buttonCount+1])
    Menu.addButton(hair.m_name_pg2[Menu.buttonCount+1], "savehair", hair.hair_pg2[Menu.buttonCount+1])
    Menu.addButton("Next Page","MaleHairMenu3",nil)
    Menu.addButton("Previous Page","MaleHairMenu",nil)
    Menu.addButton("Return","HairMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu       Page 3 of 4
--Hair
--Male
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaleHairMenu3()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Hair                      Page 3 of 4"
    ClearMenu()
    Menu.addButton(hair.m_name_pg3[Menu.buttonCount+1], "savehair", hair.hair_pg3[Menu.buttonCount+1])
    Menu.addButton(hair.m_name_pg3[Menu.buttonCount+1], "savehair", hair.hair_pg3[Menu.buttonCount+1])
    Menu.addButton(hair.m_name_pg3[Menu.buttonCount+1], "savehair", hair.hair_pg3[Menu.buttonCount+1])
    Menu.addButton(hair.m_name_pg3[Menu.buttonCount+1], "savehair", hair.hair_pg3[Menu.buttonCount+1])
    Menu.addButton(hair.m_name_pg3[Menu.buttonCount+1], "savehair", hair.hair_pg3[Menu.buttonCount+1])
    Menu.addButton(hair.m_name_pg3[Menu.buttonCount+1], "savehair", hair.hair_pg3[Menu.buttonCount+1])
    Menu.addButton(hair.m_name_pg3[Menu.buttonCount+1], "savehair", hair.hair_pg3[Menu.buttonCount+1])
    Menu.addButton(hair.m_name_pg3[Menu.buttonCount+1], "savehair", hair.hair_pg3[Menu.buttonCount+1])
    Menu.addButton("Next Page","MaleHairMenu4",nil)
    Menu.addButton("Previous Page","MaleHairMenu2",nil)
    Menu.addButton("Return","HairMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu       Page 4 of 4
--Hair
--Male
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaleHairMenu4()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Hair                      Page 4 of 4"
    ClearMenu()
    Menu.addButton(hair.m_name_pg4[Menu.buttonCount+1], "savehair", hair.hair_pg4[Menu.buttonCount+1])
    Menu.addButton(hair.m_name_pg4[Menu.buttonCount+1], "savehair", hair.hair_pg4[Menu.buttonCount+1])
    Menu.addButton(hair.m_name_pg4[Menu.buttonCount+1], "savehair", hair.hair_pg4[Menu.buttonCount+1])
    Menu.addButton(hair.m_name_pg4[Menu.buttonCount+1], "savehair", hair.hair_pg4[Menu.buttonCount+1])
    Menu.addButton("Next Page","MaleHairMenu",nil)
    Menu.addButton("Previous Page","MaleHairMenu3",nil)
    Menu.addButton("Return","HairMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu       Page 1 of 4
--Hair
--Female
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleHairMenu()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Hair                      Page 1 of 4"
    ClearMenu()
    Menu.addButton(hair.f_name_pg1[Menu.buttonCount+1], "savehair", hair.hair_pg1[Menu.buttonCount+1])
    Menu.addButton(hair.f_name_pg1[Menu.buttonCount+1], "savehair", hair.hair_pg1[Menu.buttonCount+1])
    Menu.addButton(hair.f_name_pg1[Menu.buttonCount+1], "savehair", hair.hair_pg1[Menu.buttonCount+1])
    Menu.addButton(hair.f_name_pg1[Menu.buttonCount+1], "savehair", hair.hair_pg1[Menu.buttonCount+1])
    Menu.addButton(hair.f_name_pg1[Menu.buttonCount+1], "savehair", hair.hair_pg1[Menu.buttonCount+1])
    Menu.addButton(hair.f_name_pg1[Menu.buttonCount+1], "savehair", hair.hair_pg1[Menu.buttonCount+1])
    Menu.addButton(hair.f_name_pg1[Menu.buttonCount+1], "savehair", hair.hair_pg1[Menu.buttonCount+1])
    Menu.addButton(hair.f_name_pg1[Menu.buttonCount+1], "savehair", hair.hair_pg1[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemaleHairMenu2",nil)
    Menu.addButton("Previous Page","FemaleHairMenu4",nil)
    Menu.addButton("Return","HairMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu       Page 2 of 4
--Hair
--Female
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleHairMenu2()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Hair                      Page 2 of 4"
    ClearMenu()
    Menu.addButton(hair.f_name_pg2[Menu.buttonCount+1], "savehair", hair.hair_pg2[Menu.buttonCount+1])
    Menu.addButton(hair.f_name_pg2[Menu.buttonCount+1], "savehair", hair.hair_pg2[Menu.buttonCount+1])
    Menu.addButton(hair.f_name_pg2[Menu.buttonCount+1], "savehair", hair.hair_pg2[Menu.buttonCount+1])
    Menu.addButton(hair.f_name_pg2[Menu.buttonCount+1], "savehair", hair.hair_pg2[Menu.buttonCount+1])
    Menu.addButton(hair.f_name_pg2[Menu.buttonCount+1], "savehair", hair.hair_pg2[Menu.buttonCount+1])
    Menu.addButton(hair.f_name_pg2[Menu.buttonCount+1], "savehair", hair.hair_pg2[Menu.buttonCount+1])
    Menu.addButton(hair.f_name_pg2[Menu.buttonCount+1], "savehair", hair.hair_pg2[Menu.buttonCount+1])
    Menu.addButton(hair.f_name_pg2[Menu.buttonCount+1], "savehair", hair.hair_pg2[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemaleHairMenu3",nil)
    Menu.addButton("Previous Page","FemaleHairMenu",nil)
    Menu.addButton("Return","HairMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu       Page 3 of 4
--Hair
--Female
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleHairMenu3()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Hair                      Page 3 of 4"
    ClearMenu()
    Menu.addButton(hair.f_name_pg3[Menu.buttonCount+1], "savehair", hair.hair_pg3[Menu.buttonCount+1])
    Menu.addButton(hair.f_name_pg3[Menu.buttonCount+1], "savehair", hair.hair_pg3[Menu.buttonCount+1])
    Menu.addButton(hair.f_name_pg3[Menu.buttonCount+1], "savehair", hair.hair_pg3[Menu.buttonCount+1])
    Menu.addButton(hair.f_name_pg3[Menu.buttonCount+1], "savehair", hair.hair_pg3[Menu.buttonCount+1])
    Menu.addButton(hair.f_name_pg3[Menu.buttonCount+1], "savehair", hair.hair_pg3[Menu.buttonCount+1])
    Menu.addButton(hair.f_name_pg3[Menu.buttonCount+1], "savehair", hair.hair_pg3[Menu.buttonCount+1])
    Menu.addButton(hair.f_name_pg3[Menu.buttonCount+1], "savehair", hair.hair_pg3[Menu.buttonCount+1])
    Menu.addButton(hair.f_name_pg3[Menu.buttonCount+1], "savehair", hair.hair_pg3[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemaleHairMenu4",nil)
    Menu.addButton("Previous Page","FemaleHairMenu2",nil)
    Menu.addButton("Return","HairMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu       Page 4 of 4
--Hair
--Female
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleHairMenu4()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Hair                      Page 4 of 4"
    ClearMenu()
    Menu.addButton(hair.f_name_pg4[Menu.buttonCount+1], "savehair", hair.hair_pg4[Menu.buttonCount+1])
    Menu.addButton(hair.f_name_pg4[Menu.buttonCount+1], "savehair", hair.hair_pg4[Menu.buttonCount+1])
    Menu.addButton(hair.f_name_pg4[Menu.buttonCount+1], "savehair", hair.hair_pg4[Menu.buttonCount+1])
    Menu.addButton(hair.f_name_pg4[Menu.buttonCount+1], "savehair", hair.hair_pg4[Menu.buttonCount+1])
    Menu.addButton(hair.f_name_pg4[Menu.buttonCount+1], "savehair", hair.hair_pg4[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemaleHairMenu",nil)
    Menu.addButton("Previous Page","FemaleHairMenu3",nil)
    Menu.addButton("Return","HairMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Hair
--Colour
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function HairColour()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Hair Colour"
    ClearMenu()
    Menu.addButton(hair.hcolour_name[Menu.buttonCount+1], "savecolour", hair.hcolour[Menu.buttonCount+1])
    Menu.addButton(hair.hcolour_name[Menu.buttonCount+1], "savecolour", hair.hcolour[Menu.buttonCount+1])
    Menu.addButton(hair.hcolour_name[Menu.buttonCount+1], "savecolour", hair.hcolour[Menu.buttonCount+1])
    Menu.addButton(hair.hcolour_name[Menu.buttonCount+1], "savecolour", hair.hcolour[Menu.buttonCount+1])
    Menu.addButton(hair.hcolour_name[Menu.buttonCount+1], "savecolour", hair.hcolour[Menu.buttonCount+1])
    Menu.addButton(hair.hcolour_name[Menu.buttonCount+1], "savecolour", hair.hcolour[Menu.buttonCount+1])
    Menu.addButton(hair.hcolour_name[Menu.buttonCount+1], "savecolour", hair.hcolour[Menu.buttonCount+1])
    Menu.addButton("Male Hair","MaleHairMenu",nil)
    Menu.addButton("Female Hair","FemaleHairMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Hair 
--Functions
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function savehair(hair) --Sets Players head in database
	TriggerServerEvent("mm:savehair", hair)
end

function changehair(hair) --Sets Players head
	SetPedComponentVariation(GetPlayerPed(-1), 2, hair, 0, 0)
end

RegisterNetEvent("mm:changehair")  
AddEventHandler("mm:changehair",function(hair)
    changehair(hair,nil)
	HairColour()
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Hair Textures
--Functions
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function savecolour(hcolour) --Sets mask texture in database
	TriggerServerEvent("mm:savehcolour", hcolour)
end

RegisterNetEvent("mm:changehcolour") -- Sets mask texture
AddEventHandler("mm:changehcolour",function(hairstuff)
	--Citizen.Trace(maskstuff.mask)
	--Citizen.Trace(maskstuff.mask_txt)
	SetPedComponentVariation(GetPlayerPed(-1), 2, tonumber(hairstuff.hair), tonumber(hairstuff.hcolour), 0)
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 1/11
--Shirts
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function ShirtMenu()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Shirts                    Page 1 of 11"
    ClearMenu()
    Menu.addButton(shirts.shirts_pg1[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg1[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg1[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg1[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg1[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg1[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg1[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg1[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg1[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg1[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg1[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg1[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg1[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg1[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg1[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg1[Menu.buttonCount+1])
    Menu.addButton("Next Page","ShirtMenu2",nil)
    Menu.addButton("Previous Page","ShirtMenu11",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 2/11
--Shirts
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function ShirtMenu2()
    DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Shirts                    Page 2 of 11"
    ClearMenu()
    Menu.addButton(shirts.shirts_pg2[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg2[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg2[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg2[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg2[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg2[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg2[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg2[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg2[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg2[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg2[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg2[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg2[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg2[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg2[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg2[Menu.buttonCount+1])
    Menu.addButton("Next Page","ShirtMenu3",nil)
    Menu.addButton("Previous Page","ShirtMenu",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 3/11
--Shirts
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function ShirtMenu3()
    DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Shirts                    Page 3 of 11"
    ClearMenu()
    Menu.addButton(shirts.shirts_pg3[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg3[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg3[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg3[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg3[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg3[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg3[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg3[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg3[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg3[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg3[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg3[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg3[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg3[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg3[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg3[Menu.buttonCount+1])
    Menu.addButton("Next Page","ShirtMenu4",nil)
    Menu.addButton("Previous Page","ShirtMenu2",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 4/11
--Shirts
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function ShirtMenu4()
    DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Shirts                    Page 4 of 11"
    ClearMenu()
    Menu.addButton(shirts.shirts_pg4[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg4[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg4[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg4[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg4[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg4[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg4[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg4[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg4[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg4[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg4[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg4[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg4[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg4[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg4[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg4[Menu.buttonCount+1])
    Menu.addButton("Next Page","ShirtMenu5",nil)
    Menu.addButton("Previous Page","ShirtMenu3",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 5/11
--Shirts
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function ShirtMenu5()
    DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Shirts                    Page 5 of 11"
    ClearMenu()
    Menu.addButton(shirts.shirts_pg5[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg5[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg5[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg5[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg5[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg5[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg5[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg5[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg5[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg5[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg5[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg5[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg5[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg5[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg5[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg5[Menu.buttonCount+1])
    Menu.addButton("Next Page","ShirtMenu6",nil)
    Menu.addButton("Previous Page","ShirtMenu4",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 6/11
--Shirts
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function ShirtMenu6()
    DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Shirts                    Page 6 of 11"
    ClearMenu()
    Menu.addButton(shirts.shirts_pg6[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg6[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg6[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg6[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg6[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg6[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg6[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg6[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg6[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg6[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg6[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg6[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg6[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg6[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg6[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg6[Menu.buttonCount+1])
    Menu.addButton("Next Page","ShirtMenu7",nil)
    Menu.addButton("Previous Page","ShirtMenu5",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 7/11
--Shirts
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function ShirtMenu7()
    DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Shirts                    Page 7 of 11"
    ClearMenu()
    Menu.addButton(shirts.shirts_pg7[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg7[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg7[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg7[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg7[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg7[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg7[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg7[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg7[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg7[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg7[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg7[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg7[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg7[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg7[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg7[Menu.buttonCount+1])
    Menu.addButton("Next Page","ShirtMenu8",nil)
    Menu.addButton("Previous Page","ShirtMenu6",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 8/11
--Shirts
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function ShirtMenu8()
    DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Shirts                    Page 8 of 11"
    ClearMenu()
    Menu.addButton(shirts.shirts_pg8[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg8[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg8[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg8[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg8[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg8[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg8[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg8[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg8[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg8[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg8[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg8[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg8[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg8[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg8[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg8[Menu.buttonCount+1])
    Menu.addButton("Next Page","ShirtMenu9",nil)
    Menu.addButton("Previous Page","ShirtMenu7",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 9/11
--Shirts
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function ShirtMenu9()
    DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Shirts                    Page 9 of 11"
    ClearMenu()
    Menu.addButton(shirts.shirts_pg9[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg9[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg9[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg9[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg9[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg9[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg9[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg9[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg9[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg9[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg9[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg9[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg9[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg9[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg9[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg9[Menu.buttonCount+1])
    Menu.addButton("Next Page","ShirtMenu10",nil)
    Menu.addButton("Previous Page","ShirtMenu9",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 10/11
--Shirts
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function ShirtMenu10()
    DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Shirts                    Page 10 of 11"
    ClearMenu()
    Menu.addButton(shirts.shirts_pg10[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg10[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg10[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg10[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg10[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg10[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg10[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg10[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg10[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg10[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg10[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg10[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg10[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg10[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg10[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg10[Menu.buttonCount+1])
    Menu.addButton("Next Page","ShirtMenu11",nil)
    Menu.addButton("Previous Page","ShirtMenu9",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 11/11
--Shirts
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function ShirtMenu11()
    DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Shirts                    Page 11 of 11"
    ClearMenu()
    Menu.addButton(shirts.shirts_pg11[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg11[Menu.buttonCount+1])
    Menu.addButton(shirts.shirts_pg11[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg11[Menu.buttonCount+1])
    Menu.addButton("Next Page","ShirtMenu",nil)
    Menu.addButton("Previous Page","ShirtMenu10",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Shirts
--Textures						Page 1/3
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function shirtTextures()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Textures                   Page 1 of 3"
    ClearMenu()
    Menu.addButton(shirts.txt_pg1[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(shirts.txt_pg1[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(shirts.txt_pg1[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(shirts.txt_pg1[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(shirts.txt_pg1[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(shirts.txt_pg1[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(shirts.txt_pg1[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(shirts.txt_pg1[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg1[Menu.buttonCount+1])
    Menu.addButton("Next Page","shirtTextures2",nil)
    Menu.addButton("Previous Page","shirtTextures",nil)
    Menu.addButton("Return","ShirtMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Shirts
--Textures						Page 2/3
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function shirtTextures2()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Textures                   Page 2 of 3"
    ClearMenu()
    Menu.addButton(shirts.txt_pg2[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(shirts.txt_pg2[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(shirts.txt_pg2[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(shirts.txt_pg2[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(shirts.txt_pg2[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(shirts.txt_pg2[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(shirts.txt_pg2[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(shirts.txt_pg2[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg2[Menu.buttonCount+1])
    Menu.addButton("Next Page","shirtTextures3",nil)
    Menu.addButton("Previous Page","shirtTextures",nil)
    Menu.addButton("Return","ShirtMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Shirts
--Textures						Page 3/3
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function shirtTextures3()
	DisplayHelpText("Utilise ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ pour ~y~se déplacer~w~ et ~y~Enter~w~ pour ~r~selectioner")
    options.menu_subtitle = "Textures                   Page 3 of 3"
    ClearMenu()
    Menu.addButton(shirts.txt_pg3[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg3[Menu.buttonCount+1])
    Menu.addButton(shirts.txt_pg3[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg3[Menu.buttonCount+1])
    Menu.addButton(shirts.txt_pg3[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg3[Menu.buttonCount+1])
    Menu.addButton(shirts.txt_pg3[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg3[Menu.buttonCount+1])
    Menu.addButton(shirts.txt_pg3[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg3[Menu.buttonCount+1])
    Menu.addButton(shirts.txt_pg3[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg3[Menu.buttonCount+1])
    Menu.addButton(shirts.txt_pg3[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg3[Menu.buttonCount+1])
    Menu.addButton(shirts.txt_pg3[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg3[Menu.buttonCount+1])
    Menu.addButton("Next Page","shirtTextures",nil)
    Menu.addButton("Previous Page","shirtTextures2",nil)
    Menu.addButton("Return","ShirtMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Shirts 
--Functions
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function saveshirt(shirt) --Sets Players head in database
	TriggerServerEvent("mm:saveshirt", shirt)
end

function changeshirt(shirt) --Sets Players head
	SetPedComponentVariation(GetPlayerPed(-1), 11, shirt, 0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 3, 4, 0, 0)
end

RegisterNetEvent("mm:changeshirt")  
AddEventHandler("mm:changeshirt",function(shirt)
    changeshirt(shirt,nil)
	shirtTextures()
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Shirt Textures
--Functions
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function saveshirt_txt(shirt_txt) --Sets mask texture in database
	TriggerServerEvent("mm:saveshirt_txt", shirt_txt)
end

RegisterNetEvent("mm:changeshirt_txt") -- Sets mask texture
AddEventHandler("mm:changeshirt_txt",function(shirtstuff)
	--Citizen.Trace(maskstuff.mask)
	--Citizen.Trace(maskstuff.mask_txt)
	SetPedComponentVariation(GetPlayerPed(-1), 11, tonumber(shirtstuff.shirt), tonumber(shirtstuff.shirt_txt), 0)
    SetPedComponentVariation(GetPlayerPed(-1), 8, 0, 240, 0)
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Press F2 to open menu
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustPressed(1, 166) then
            Main() -- Menu to draw
            Menu.hidden = not Menu.hidden -- Hide/Show the menu
        end
        Menu.renderGUI(options) -- Draw menu on each tick if Menu.hidden = false
	end
end)