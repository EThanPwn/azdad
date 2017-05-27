players = {}
host = nil
local adverts = {
	"En cas de probleme vennez en parler sur discord à un admin. On ne repond pas norp par du norp ",
	"Utiliser '/v' pour regler la portée de votre voix",
	"Un /help est à disposition si vous ne trouvez pas une commande",
	"Un bug? Une suggestion? N'hésitez pas a passer sur le discord ! (/discord pour le trouver) ",
	"Bientôt le serveur passera en Whitelist ! Vous serez conviés sur le discord afin d'etre whitlisté"
}
local nextadvert = 1

RegisterServerEvent("Z:newplayer")
AddEventHandler("Z:newplayer", function()
    players[source] = true

    if not host then
        host = source
        TriggerClientEvent("Z:adverthost", source)
    end
end)

AddEventHandler("playerDropped", function(reason)
    players[source] = nil

    if source == host then
        if #players > 0 then
            for mSource, _ in pairs(players) do
                host = mSource
                TriggerClientEvent("Z:adverthost", source)
                break
            end
        else
            host = nil
        end
    end
end)

RegisterServerEvent("Z:timeleftsync")
AddEventHandler("Z:timeleftsync", function(nTimeLeft)
	timeLeft = nTimeLeft
    if timeLeft < 1 then
	   
      TriggerClientEvent("chatMessage", -1, "^1NOTE", {255, 255, 255}, adverts[nextadvert])
	  nextadvert = nextadvert + 1
	  
	  if nextadvert == 8 then
		nextadvert = 1
	  end
    end
end)
