--require "resources/[essential]/essentialmode/lib/MySQL"

-- MySQL:open("IP", "databasname", "user", "password")
--MySQL:open("127.0.0.1", "gta5_gamemode_essential", "root", "18020603")

-- nouvelle config globale ! 
require "resources/gconfig/gconfig"

AddEventHandler('onResourceStart', function(resource)
  MySQL:executeQuery("UPDATE user_vehicle SET `vehicle_state`='@value' WHERE `vehicle_state`='Sorti'",
  {['@value'] = "Rentré"})
end)
