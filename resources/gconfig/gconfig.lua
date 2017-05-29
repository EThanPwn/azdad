-- utilisation : mettre le require en en-tête de fichier.
-- et dégager le MySQL:open
-- pour usages futurs : implémentation d'un futur "nouveau" driver mysql

local esmode = true
local newmysql = false

if esmode then
	require "resources/essentialmode/lib/MySQL"
else 
	--require "resources/gconfig/lib/newmysql"
	print("NOT IMPLEMENTED YET !")
end


-- 
-- require "resources/gconfig/gconfig"
-- MySQL:open("127.0.0.1", "gta5_dv", "root", "")
-- 
database = {
    host = "127.0.0.1",
    name = "gta5_gamemode_essential",
    username = "root",
    password = "18020603"
}
MySQL:open(database.host, database.name, database.username, database.password)
--print("GCONFIG IS LOADED !!!")