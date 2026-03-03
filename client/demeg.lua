Citizen.CreateThread(function()
  N_0x4757f00bc6323cfe(GetHashKey('WEAPON_UNARMED'), Config.Weapons[`WEAPON_UNARMED`].damage)
  while true do
    Citizen.Wait(0)
    local playerPed = GetPlayerPed(-1)
    local weaponsConfig = Config.Weapons[curWeapon]

    if weaponsConfig ~= nil then
      SetPedConfigFlag(playerPed, 69, weaponsConfig.critical)
      SetPedConfigFlag(playerPed, 70, weaponsConfig.critical)
      SetPedSuffersCriticalHits(playerPed, weaponsConfig.critical)
      N_0x4757f00bc6323cfe(curWeapon, weaponsConfig.damage)
    else
      if Config.WhitelistWeapon then
        RemoveWeaponFromPed(playerPed, curWeapon)
      else
        N_0x4757f00bc6323cfe(curWeapon, Config.DefaultDamage)
      end
      Citizen.Wait(500)
    end
  end
end)