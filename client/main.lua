cachedNotifications = {}

RegisterNetEvent("rdrp_notifications:sendNotification")
AddEventHandler("rdrp_notifications:sendNotification", function(text, ms)
    if text and ms then
        AddNotification(text, ms)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if #cachedNotifications > 0 then
            for notificationIndex = 1, #cachedNotifications do
                local notification = cachedNotifications[notificationIndex]

                if notification then
                    notification["opacity"] = (notification["opacity"] or (notification["time"] / 1000) * 60) - 1

                    local offset = 0.5 + (notificationIndex * .1)
                    local notificationTimer = (GetGameTimer() - notification["startTime"]) / notification["time"] * 100

                    Draw3D(GetEntityCoords(PlayerPedId()) + vector3(GetEntityForwardX(PlayerPedId()) * 0.20, GetEntityForwardY(PlayerPedId()) * 0.20, offset) + GetEntityForwardVector(PlayerPedId()), notification["text"], notification["opacity"])

                    if notificationTimer >= 100 then
                        RemoveNotification(notificationIndex)
                    end
                end
            end
        end
    end
end)