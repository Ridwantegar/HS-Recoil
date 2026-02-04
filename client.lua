local props = {}
local lastWeapon = nil

-- ================= STRESS SYSTEM (0r-hud compatible) =================
local lastStressTick = 0

local function GetWeaponStress()
    local ped = PlayerPedId()
    local weapon = GetSelectedPedWeapon(ped)
    if weapon == 0 then return nil end

    for _, data in pairs(Config.Weapons) do
        if GetHashKey(data.name) == weapon then
            -- PENTING: tidak pakai defaultPerShot
            return data.stress
        end
    end

    return nil
end

local function AddStressFromWeapon()
    if not Config.Stress.enabled then return end

    local stressAmount = GetWeaponStress()
    if not stressAmount or stressAmount <= 0 then
        return
    end

    local now = GetGameTimer()
    if now - lastStressTick < Config.Stress.shotCooldown then return end
    lastStressTick = now

    TriggerServerEvent("0r-hud:addStress", stressAmount)
end


-- ================= MODEL LOADER =================
local function LoadModel(model)
    if HasModelLoaded(model) then return true end

    RequestModel(model)
    local timeout = 0
    while not HasModelLoaded(model) do
        Wait(10)
        timeout += 1
        if timeout > 100 then
            print("^1[WEAPON]^7 Failed loading model:", model)
            return false
        end
    end
    return true
end

-- ================= PROP HANDLER =================
local function AttachWeaponProp(ped, weapon, mode)
    if not weapon or not weapon.model or not weapon[mode] then return end
    if props[weapon.name] then return end

    local data = weapon[mode]
    local model = GetHashKey(weapon.model)
    if not LoadModel(model) then return end

    local prop = CreateObject(model, 1.0, 1.0, 1.0, false, false, false)
    SetEntityAsMissionEntity(prop, true, true)

    AttachEntityToEntity(
        prop,
        ped,
        GetPedBoneIndex(ped, data.bone),
        data.x, data.y, data.z,
        data.xRot, data.yRot, data.zRot,
        true, true, false, true, 1, true
    )

    props[weapon.name] = prop
end

local function RemoveWeaponProp(name)
    if props[name] then
        DeleteEntity(props[name])
        props[name] = nil
    end
end

-- ================= DAMAGE MODIFIER =================
local function ApplyDamageModifiers()
    for _, weapon in ipairs(Config.Weapons) do
        SetWeaponDamageModifier(GetHashKey(weapon.name), weapon.damage or 1.0)
    end
end

-- ================= INVENTORY / PROP LOOP =================
CreateThread(function()
    while true do
        Wait(500)

        local ped = PlayerPedId()
        local currentWeapon = GetSelectedPedWeapon(ped)

        if currentWeapon ~= lastWeapon then
            lastWeapon = currentWeapon

            for _, weapon in ipairs(Config.Weapons) do
                local hasWeapon = exports.ox_inventory:GetItemCount(weapon.name, false) > 0

                if hasWeapon then
                    if currentWeapon == GetHashKey(weapon.name) then
                        RemoveWeaponProp(weapon.name)
                    else
                        AttachWeaponProp(ped, weapon, "usual")
                    end
                else
                    RemoveWeaponProp(weapon.name)
                end
            end
        end
    end
end)

-- ================= RECOIL + STRESS =================
CreateThread(function()
    while true do
        Wait(0)

        local ped = PlayerPedId()
        if not IsPedShooting(ped) then goto skip end

        local weaponHash = GetSelectedPedWeapon(ped)

        for _, weapon in ipairs(Config.Weapons) do
            if weaponHash == GetHashKey(weapon.name) then
                -- ===== RECOIL =====
                local recoil = weapon.recoil or 0.1
                local pitch = GetGameplayCamRelativePitch()
                SetGameplayCamRelativePitch(
                    math.min(pitch + recoil * 3.0, 89.0),
                    0.1
                )

                if Config.RecoilEffectType == "shake" then
                    ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", recoil)
                end
                AddStressFromWeapon()

                break
            end
        end

        ::skip::
    end
end)

-- ================= PLAYER SPAWN =================
AddEventHandler('playerSpawned', function()
    ApplyDamageModifiers()
    if Config.Debug then
        print("^2[WEAPON]^7 Damage modifier applied")
    end
end)
