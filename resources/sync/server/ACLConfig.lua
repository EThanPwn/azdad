

--
-- THIS IS AN EXAMPLE FILE. CHANGES HERE WON'T AFFECT ANYTHING AT ALL!
--
--                YOU SHOULD EDIT THE 'ACLConfig.lua'!
--


-- Check the ping of the client attempting to connect. Set to 0 to disable this check
ACL.maxPing = 120

-- Set to false to disable whitelisting
ACL.enableWhitelist = true

-- Set to true to enable the /kick and /playerlist commands
ACL.enablePlayerManagement = false

-- The whitelist can handle IP's, Steam ID's and words
ACL.whitelist = {
	"steam:110000104615927", -- JackToshx
	"steam:11000010691f003", -- ChrisToshx
	"steam:1100001119ca150", -- Carry MacRoy
	"steam:1100001190f80bd", -- Bobby McRoy
	"steam:11000010a0d6624", -- Ken Kenaki
	"steam:1100001040245a4", -- Rick johnson
	"steam:110000104c5f34c", -- Zemog
	"steam:11000010c6a536b", -- Yuri Sokolov	
	"steam:11000011149aace",  -- biobu
	"steam:11000010445a741" -- wreax
	
}

-- Handles only IP's and Steam ID's
-- Mods don't need to be whitelisted, they will always have access unless banned
-- Mods are currently indistinguishable from admins
ACL.mods = {
	--"ip:4.4.4.4",				-- Appoint this IP as moderator
	--"steam:1100001deadbeef"		-- Appoint this Steam ID as moderator
}

-- Handles only IP's and Steam ID's
-- Admins don't need to be whitelisted, they will always have access unless banned
-- Admins don't need to be added to mods list
ACL.admins = {
	--"ip:5.5.5.5",				-- Appoint this IP as administrator
	--"steam:11000011badbabe"		-- Appoint this Steam ID as administrator
	"steam:110000104615927", -- JackToshx
	"steam:11000010691f003",-- ChrisToshx
	"steam:11000010445a741" -- wreax
}

-- The banlist supersedes allow rules. Handles IP's, Steam ID's and words
ACL.banlist = {
	--"ip:6.6.6.6",				-- Disallow this IP to connect
	--"steam:1100001deadc0de",	-- Disallow this Steam ID to connect
	--"bannedword"				-- Disallow this word in someone's name
}