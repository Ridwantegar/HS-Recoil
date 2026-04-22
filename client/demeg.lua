-- Damage
CreateThread(function()
    for weaponHash, data in pairs(Config.Weapons) do
        SetWeaponDamageModifier(weaponHash, data.damage)
    end
end)

-- Disable headshot
CreateThread(function()
    while true do
        Wait(1000)
        SetPedSuffersCriticalHits(PlayerPedId(), false)
    end
end)