-- ==============================
-- STRESS SYSTEM
-- ==============================

local lastStressTick = 0

local function AddStress(amount)
    if not Config.Stress.enabled then return end

    local now = GetGameTimer()
    if now - lastStressTick < Config.Stress.shotCooldown then return end
    lastStressTick = now

    if Config.StressSystem == '0r-hud' then
        TriggerServerEvent("0r-hud:addStress", amount)

    elseif Config.StressSystem == 'qb-hud' then
        TriggerServerEvent("hud:server:GainStress", amount)
    end
end

-- ==============================
-- STRESS FROM SHOOTING
-- ==============================

CreateThread(function()
    while true do
        Wait(0)

        local ped = PlayerPedId()

        if IsPedShooting(ped) then
            local weaponHash = GetSelectedPedWeapon(ped)

            local stressAmount = Config.Stress.defaultPerShot

            if Config.Weapons and Config.Weapons[weaponHash] then
                local weaponStress = Config.Weapons[weaponHash].stress
                if weaponStress ~= nil then
                    stressAmount = weaponStress
                end
            end

            AddStress(stressAmount)
        end
    end
end)