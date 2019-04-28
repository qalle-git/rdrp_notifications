AddNotification = function(text, ms)
    table.insert(cachedNotifications, { ["text"] = text, ["time"] = ms, ["startTime"] = GetGameTimer() })
end

RemoveNotification = function(id)
    table.remove(cachedNotifications, id)
end

Draw3D = function(coords, text, opacity)
    if opacity > 255 then
        opacity = 255
    elseif opacity < 0 then
        opacity = 0
    end

	local onScreen, _x, _y = World3dToScreen2d(coords["x"], coords["y"], coords["z"])
    
    if onScreen then
        SetTextScale(0.35, 0.35)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, math.floor(opacity))
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
        
        local factor = string.len(text) / 370
        
        DrawRect(_x,_y + 0.0125, 0.015 + factor, 0.03, 41, 11, 41, 68)
    end
end