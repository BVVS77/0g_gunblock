local isWeaponBlocked = false
local lastNotify = 0

local function isFireWeapon(weaponHash)
    for _, weaponName in pairs(Config.FireWeapons) do
        if weaponHash == GetHashKey(weaponName) then
            return true
        end
    end
    return false
end

Citizen.CreateThread(function()
    while true do
        Wait(0)
        local playerPed = PlayerPedId()
        local weapon = GetSelectedPedWeapon(playerPed)

        if isWeaponBlocked and isFireWeapon(weapon) then
            DisableControlAction(0, 24, true)
            DisableControlAction(0, 25, true)

            if IsDisabledControlJustPressed(0, 24) or IsDisabledControlJustPressed(0, 25) then
                if GetGameTimer() - lastNotify > Config.NotifyCooldown then
                    lib.notify({
                        title = 'Broń zablokowana',
                        description = 'Naciśnij [L], aby odblokować broń!',
                        type = 'error'
                    })
                    lastNotify = GetGameTimer()
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        if IsControlJustPressed(0, Config.ToggleKey) then
            local playerPed = PlayerPedId()
            local weapon = GetSelectedPedWeapon(playerPed)

            if not isWeaponBlocked and isFireWeapon(weapon) then
                isWeaponBlocked = true
                lib.notify({ title = 'Broń', description = 'Broń zablokowana', type = 'error' })
            elseif isWeaponBlocked then
                lib.progressBar({
                    duration = Config.UnlockTime,
                    label = 'Odblokowywanie broni...',
                    canCancel = false
                })
                isWeaponBlocked = false
                lib.notify({ title = 'Broń', description = 'Broń odblokowana', type = 'success' })
            else
                lib.notify({ title = 'Info', description = 'Nie trzymasz broni palnej', type = 'inform' })
            end
        end
    end
end)
