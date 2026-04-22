local scopedWeapons = {
	100416529,  -- WEAPON_SNIPERRIFLE
	205991906,  -- WEAPON_HEAVYSNIPER
	3342088282, -- WEAPON_MARKSMANRIFLE
	177293209,   -- WEAPON_HEAVYSNIPER MKII
	1785463520  -- WEAPON_MARKSMANRIFLE_MK2
}

function HashInTable(hash)
	for k, v in pairs(scopedWeapons) do 
		if (hash == v) then 
			return true 
		end 
	end 
	return false 
end 

function ManageReticle(status, hash)
	if not status then
		if not HashInTable(hash) then 
			HideHudComponentThisFrame(14)
		end 
	end
end

function IgnoreWeapon(hash)
	if Config.Weapons[hash] then
		if Config.Weapons[hash].category ~= 'melee' then
			return true
		else
			return false
		end
	end
end

function ManageRecoil(_type, recoilStrength)
	if _type == 'shakes' then
		ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', recoilStrength)
	elseif _type == 'top' then
		local _,wep = GetCurrentPedWeapon(PlayerPedId())
		_,cAmmo = GetAmmoInClip(PlayerPedId(), wep)
		if recoilStrength and recoilStrength ~= 0 then
			tv = 0
			if GetFollowPedCamViewMode() ~= 4 then
				repeat 
					Wait(0)
					ManageReticle(Config.DisplayCrosshair, curWeapon)
					p = GetGameplayCamRelativePitch()
					SetGameplayCamRelativePitch(p+0.1, 0.5)
					tv = tv+0.1
				until tv >= (recoilStrength * 3)
			else
				repeat 
					Wait(0)
					ManageReticle(Config.DisplayCrosshair, curWeapon)
					p = GetGameplayCamRelativePitch()
					if recoilStrength > 0.1 then
						SetGameplayCamRelativePitch(p+0.6, 1.2)
						tv = tv+0.6
					else
						SetGameplayCamRelativePitch(p+0.016, 0.333)
						tv = tv+0.1
					end
				until tv >= (recoilStrength * 3)
			end
		end
	elseif _type == 'mix' then
		ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', recoilStrength/2)
		local _,wep = GetCurrentPedWeapon(PlayerPedId())
		_,cAmmo = GetAmmoInClip(PlayerPedId(), wep)
		if recoilStrength and recoilStrength ~= 0 then
			tv = 0
			if GetFollowPedCamViewMode() ~= 4 then
				repeat 
					Wait(0)
					ManageReticle(Config.DisplayCrosshair, curWeapon)
					p = GetGameplayCamRelativePitch()
					SetGameplayCamRelativePitch(p+0.1, 0.5)
					tv = tv+0.1
				until tv >= (recoilStrength * 3)
			else
				repeat 
					Wait(0)
					ManageReticle(Config.DisplayCrosshair, curWeapon)
					p = GetGameplayCamRelativePitch()
					if recoilStrength > 0.1 then
						SetGameplayCamRelativePitch(p+0.6, 1.0)
						tv = tv+0.6
					else
						SetGameplayCamRelativePitch(p+0.016, 0.333)
						tv = tv+0.1
					end
				until tv >= (recoilStrength * 3)
			end
		end
	end
end

Citizen.CreateThread(function()
	while true do
		local Sleep = 500
		if hasWeapon then 
			Sleep = 0
			local weaponConfig = Config.Weapons[curWeapon]
			if weaponConfig then
				ManageReticle(Config.DisplayCrosshair, curWeapon)
				DisplayAmmoThisFrame(Config.DisplayAmmo)
	
				if IsPedShooting(ped) then
					ManageRecoil(Config.RecoilType ,weaponConfig.recoil)
				end
			end
		end
		Citizen.Wait(Sleep)
	end
end)

Citizen.CreateThread(function()
	while true do 
		if IgnoreWeapon(curWeapon) then
			DisableControlAction(0, 140, true)
			DisableControlAction(0, 141, true)
			DisableControlAction(0, 142, true)
			DisableControlAction(0, 263, true)
			DisableControlAction(0, 264, true)
		end
		
    if Config.DisableStealth then
      if GetPedStealthMovement(ped) then
        SetPedStealthMovement(ped, 0)
      end
    end

		Wait(5)
	end
end)