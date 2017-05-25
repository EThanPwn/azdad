--Coded by timnboys

AddEventHandler("chatMessage",function(Source,Name,Msg)
	cm = stringsplit(Msg, " ")
    if(cm[1] == "/kick") then
    CancelEvent()
	local adminidentifiers = GetPlayerIdentifiers(source)
	for i = 1, #adminidentifiers do
		local steamidadmin = string.sub(adminidentifiers[i], 4)
		local identifiers = GetPlayerIdentifiers(tonumber(cm[2]))
	for i = 1, #identifiers do
		local ip = string.sub(identifiers[i], 4)
			local reflection = clr.System.Reflection
--print("Loaded Reflection Variable...Now Load DLL")
local assembly = reflection.Assembly.LoadFrom('resources/your-resource/lib/FiveRebornHttp.dll')
--print("Loaded Reflection Assembly DLL!")
local fiveRebornHttp = clr.FiveRebornHttp.HttpHandler
--print("FiveRebornHttp DLL Fully Loaded!")
-- Gets content of page from http://pastebin.com/raw/8SK5pT0e 
--local ip = tostring(Msg:sub(5))
local url = "http(s)://yoururl.org/checkadminstatus.php?steamid="..steamidadmin
local method = "get"
local data = ""
-- local headers = { }
-- local mediaType = ""
--print("About to do API Call!")
local result = fiveRebornHttp.MakeRequest(url, method, data, headers, mediaType)
--print("Finished API Call Succesfully!")
print("Result:"..tostring(result))
	if tostring(result) == "403" then 
			print('Player Not Admin'..source)
			TriggerClientEvent('chatMessage', -1, 'Kick System', { 0, 0, 0 }, GetPlayerName(source)..' Not Admin'..'Command will Not Run!')
		else
		print("Player Kicked"..GetPlayerName(ip).."by user:"..GetPlayerName(source))
		DropPlayer(tonumber(ip), "You got kicked.")
		TriggerClientEvent('chatMessage', -1, 'Kick System', { 0, 0, 0 }, GetPlayerName(source)..' Kicked User')
	end
end
end
end
end)
print('Kick Command by timnboys (LUA, FiveReborn). Type /kick ID in chat (T) to kick a player with the ID (if ID is not entered, affects self).')
function stringsplit(self, delimiter)
  local a = self:Split(delimiter)
  local t = {}

  for i = 0, #a - 1 do
     table.insert(t, a[i])
  end

  return t
end

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end