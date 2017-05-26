--Coded by timnboys

RegisterServerEvent("chatCommandEntered")
AddEventHandler('chatCommandEntered', function(fullcommand)
		    cm = stringsplit(fullcommand, " ")
    if(cm[1] == "/removeip") then
		local adminidentifiers = GetPlayerIdentifiers(source)
	for i = 1, #adminidentifiers do
		local ipadmin = string.sub(adminidentifiers[i], 4)
		local identifiers = tonumber(cm[2])
		local ip = identifiers
		local result = PerformHttpRequest("https://c2cj.keyedinsoftware.org/removefromwhitelist.php?ip="..ip.."&callinguser="..ipadmin)
		if tostring(result) == "403" then 
			print('Player Not Admin'..source)
			TriggerClientEvent('chatMessage', -1, 'Whitelist System', { 0, 0, 0 }, GetPlayerName(source) ..' Not Admin'..'Command will Not Run!')
		else
		print("Player Removed From Whitelist"..ip.."by user:"..GetPlayerName(source))
		TriggerClientEvent('chatMessage', -1, 'Whitelist System', { 0, 0, 0 }, GetPlayerName(source) ..' Removed IP from Whitelist'..ip)
	end
end
end
end)
print('RemoveIPFromWhitelist Command by timnboys (LUA, FiveReborn). Type /removeip ip in chat (T) to remove a player with the IP from the whitelist (if IP is not entered, it will not work! IP argument is required!).')
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
