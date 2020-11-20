Framework = nil

Citizen.CreateThread(function() 
    while true do
        Citizen.Wait(1)
        if Framework == nil then
            TriggerEvent("XD:GetObject", function(obj) Framework = obj end)     ------//// Just change "XD:GetObject" to your respective framework. Example "QBCore:GetObject" etc.
			Citizen.Wait(200)
        end
	end
end)

Notify = "XD:Notify"
