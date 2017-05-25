RegisterServerEvent('playerConnecting')
AddEventHandler('playerConnecting', function(name, setCallback)
	local identifiers = GetPlayerIdentifiers(source)
	for i = 1, #identifiers do
		local ip = string.sub(identifiers[i], 4)
local reflection = clr.System.Reflection
--print("Loaded Reflection Variable...Now Load DLL")
local assembly = reflection.Assembly.LoadFrom('resources/your-resource/lib/FiveRebornHttp.dll')
--print("Loaded Reflection Assembly DLL!")
local fiveRebornHttp = clr.FiveRebornHttp.HttpHandler
--print("FiveRebornHttp DLL Fully Loaded!")
-- Gets content of page from http://pastebin.com/raw/8SK5pT0e 

local url = "http(s)://yoururl.org/whitelist.php"
local method = "post"
local data = "ipval="..ip
local headers = { ["Content-Type"] = "application/x-www-form-urlencoded" }
local mediaType = "application/x-www-form-urlencoded"
--print("About to do API Call!")
local result = fiveRebornHttp.MakeRequest(url, method, data, headers, mediaType)
--print("Finished API Call Succesfully!")
print("Result:"..tostring(result))
		if tostring(result) == "403" then 
			print('Player that is not in whitelist/or banned tried to join: ' .. ip)
			setCallback("This is a private community . Apply Here : yoururl.org".." ".."You are either banned or not in our whitelist")
			CancelEvent()
			return
		if tostring(result) == "401" then
		print('Player that is banned tried to join: ' .. ip)
		setCallback("You are Banned from Your Community Name!")
		CancelEvent()
		return
		end
		end
	end
end)