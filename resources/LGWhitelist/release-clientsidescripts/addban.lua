--Coded by timnboys
 
AddEventHandler("chatMessage",function(source,Name,Msg)
    cm = stringsplit(Msg, " ")
    if(cm[1] == "/addban") then
    CancelEvent()
            local adminidentifiers = GetPlayerIdentifiers(source)
    for i = 1, #adminidentifiers do
        local steamidadmin = string.sub(adminidentifiers[i], 4)
        local identifiers = GetPlayerIdentifiers(cm[2])
    for i = 1, #identifiers do
        local steamid = string.sub(identifiers[i], 4)
local reflection = clr.System.Reflection
--print("Loaded Reflection Variable...Now Load DLL")
local assembly = reflection.Assembly.LoadFrom('resources/your-resource/lib/FiveRebornHttp.dll')
--print("Loaded Reflection Assembly DLL!")
local fiveRebornHttp = clr.FiveRebornHttp.HttpHandler
--print("FiveRebornHttp DLL Fully Loaded!")
-- Gets content of page from http://pastebin.com/raw/8SK5pT0e
 
local url = "http(s)://yoururl.org/adminban.php?steamid="..steamid.."&callinguser="..steamidadmin
local method = "get"
local data = ""
--local headers = { }
--local mediaType = ""
--print("About to do API Call!")
local result = fiveRebornHttp.MakeRequest(url, method, data, headers, mediaType)
--print("Finished API Call Succesfully!")
print("Result:"..tostring(result))
        if tostring(result) == "403" then
            print('Player Not Admin'..GetPlayerName(source))
            TriggerClientEvent('chatMessage', -1, 'Ban System', { 0, 0, 0 }, GetPlayerName(source) ..' Not Admin'..'Command will Not Run!')
        else
        print("Player Added to Ban List"..steamid.."by user:"..GetPlayerName(source))
        DropPlayer(tonumber(cm[2]), "You got Banned.")
        TriggerClientEvent('chatMessage', -1, 'Ban System', { 0, 0, 0 }, GetPlayerName(source) ..' Banned IP'..steamid)
        CancelEvent()
end
end
end
end
end)
print('Ban Command by timnboys (LUA, FiveReborn). Type /addban ID in chat (T) to ban a player with the ID (if ID is not entered, affects self).')
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
 
function makeArgs(cmd)
    args = {}
    for i = 2, #cmd, 1 do
        table.insert(args, cmd[i])
    end
    return args
end