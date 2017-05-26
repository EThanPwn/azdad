--Coded by timnboys

AddEventHandler("chatMessage",function(source,Name,Msg)
	cm = stringsplit(Msg, " ")
    if(cm[1] == "/addip") then
    CancelEvent()
	for i = 1, #adminidentifiers do
		local ipadmin = string.sub(adminidentifiers[i], 4)
		local reflection = clr.System.Reflection
--print("Loaded Reflection Variable...Now Load DLL")
local assembly = reflection.Assembly.LoadFrom('resources/your-resource/lib/FiveRebornHttp.dll')
--print("Loaded Reflection Assembly DLL!")
local fiveRebornHttp = clr.FiveRebornHttp.HttpHandler
--print("FiveRebornHttp DLL Fully Loaded!")
-- Gets content of page from http://pastebin.com/raw/8SK5pT0e 
local function12 = tostring(cm[2])
local ip = tostring(cm[3]))
local url = "http(s)://yoururl.org/addtowhitelist.php?function="..function12.."&ip="..ip.."&callinguser="..ipadmin
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
			TriggerClientEvent('chatMessage', -1, 'Whitelist System', { 0, 0, 0 }, GetPlayerName(source) ..' Not Admin'..'Command will Not Run!')
		else
		print("Player Added to Whitelist"..ip.."by user:"..GetPlayerName(source))
		TriggerClientEvent('chatMessage', -1, 'Whitelist System', { 0, 0, 0 }, GetPlayerName(source) ..' Added IP to Whitelist'..ip)
		CancelEvent()
end
end
end
end)
print('AddIPToWhitelist Command by timnboys (LUA, FiveReborn). Type /addip ip in chat (T) to add a player with the IP to the whitelist (if IP is not entered, it will not work! IP argument is required!).')
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