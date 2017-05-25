--Coded by timnboys

AddEventHandler("chatMessage",function(Source,Name,Msg)
		cm = stringsplit(Msg, " ")
		if(cm[1] == "/removeban") then
		CancelEvent()
		local adminidentifiers = GetPlayerIdentifiers(source)
	for i = 1, #adminidentifiers do
		local ipadmin = string.sub(adminidentifiers[i], 4)
		local identifiers = tonumber(cm[2])
		local ip = identifiers
			local reflection = clr.System.Reflection
--print("Loaded Reflection Variable...Now Load DLL")
local assembly = reflection.Assembly.LoadFrom('resources/your-resource/lib/FiveRebornHttp.dll')
--print("Loaded Reflection Assembly DLL!")
local fiveRebornHttp = clr.FiveRebornHttp.HttpHandler
--print("FiveRebornHttp DLL Fully Loaded!")
-- Gets content of page from http://pastebin.com/raw/8SK5pT0e 
--local ip = tostring(Msg:sub(5))
local url = "http(s)://yoururl.org/removefromban.php?ip="..ip.."&callinguser="..ipadmin
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
			TriggerClientEvent('chatMessage', -1, 'UnBan System', { 0, 0, 0 }, GetPlayerName(source)..' Not Admin'..'Command will Not Run!')
		else
		print("Player Banned Removed"..GetPlayerName(ip).."by user:"..GetPlayerName(source))
		TriggerClientEvent('chatMessage', source, 'UnBan System', { 0, 0, 0 }, GetPlayerName(source)..' Removed an Users Ban')
	end
end
end
end
end)
print('RemoveIPFromBan Command by timnboys (LUA, FiveReborn). Type /removeban ip in chat (T) to remove a player with the IP from the ban list (if IP is not entered, it will not work! IP argument is required!).')
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
