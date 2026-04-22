-- Weapon Damage
CreateThread(function()
    for weaponHash, data in pairs(Config.Weapons) do
        SetWeaponDamageModifier(weaponHash, data.damage)
    end
end)

-- PvP Fix (WAJIB)
CreateThread(function()
    while true do
        Wait(500)

        local ped = PlayerPedId()

        -- bikin kepala = badan
        SetPedSuffersCriticalHits(ped, false)

        -- stabilin damage
        SetPlayerWeaponDamageModifier(PlayerId(), 1.0)
    end
end)