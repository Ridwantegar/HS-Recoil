local QBCore = exports['qb-core']:GetCoreObject()

local props = {}
local damageEvents = {}
local lastStressTick = 0

-- ==============================
-- LOAD MODEL
-- ==============================
local function LoadModel(model)
    if not HasModelLoaded(model) then
        RequestModel(model)
        while not HasModelLoaded(model) do
            Wait(10)
        end
    end
    return true
end

-- ==============================
-- GET WEAPON DATA
-- ==============================
local function GetWeaponData(hash)
    for _, weapon in ipairs(Config.Weapons) do
        if GetHashKey(weapon.name) == hash then
            return weapon
        end
    end
    return nil
end

-- ==============================
-- REMOVE PROP
-- ==============================
local function RemoveWeaponProp(name)
    if props[name] then
        if DoesEntityExist(props[name]) then
            DeleteEntity(props[name])
        end
        props[name] = nil
    end
end

-- ==============================
-- ATTACH PROP (NETWORKED FIXED)
-- ==============================
local function AttachWeaponProp(ped, weapon, mode)
    if not weapon or not weapon.model or not weapon[mode] then return end
    if props[weapon.name] then return end

    local data = weapon[mode]
    local model = GetHashKey(weapon.model)

    LoadModel(model)

    -- 🔥 NETWORKED OBJECT (WAJIB)
    local prop = CreateObject(model, 0.0, 0.0, 0.0, true, true, false)

    local netId = NetworkGetNetworkIdFromEntity(prop)
    SetNetworkIdExistsOnAllMachines(netId, true)
    SetNetworkIdCanMigrate(netId, true)

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

-- ==============================
-- DAMAGE SYSTEM
-- ==============================
CreateThread(function()
    while true do
        Wait(0)

        local ped = PlayerPedId()
        local weaponHash = GetSelectedPedWeapon(ped)
        local weaponData = GetWeaponData(weaponHash)

        if weaponData then
            N_0x4757f00bc6323cfe(
                weaponHash,
                weaponData.damage or 0.1
            )

            SetPedConfigFlag(ped, 69, false)
            SetPedConfigFlag(ped, 70, false)
            SetPedSuffersCriticalHits(ped, false)
        else
            Wait(300)
        end
    end
end)

-- ==============================
-- INVENTORY + PROP LOOP (FIXED)
-- ==============================
CreateThread(function()
    while true do
        Wait(1000)

        local ped = PlayerPedId()
        local currentWeapon = GetSelectedPedWeapon(ped)

        for _, weapon in ipairs(Config.Weapons) do

            -- 🔥 FIX OX INVENTORY NAME
            local itemName = string.lower(weapon.name)

            local hasItem = exports.ox_inventory:GetItemCount(itemName) > 0

            if hasItem then
                if currentWeapon ~= GetHashKey(weapon.name) then
                    AttachWeaponProp(ped, weapon, "usual")
                else
                    RemoveWeaponProp(weapon.name)
                end
            else
                RemoveWeaponProp(weapon.name)
            end
        end
    end
end)

-- ==============================
-- STRESS SYSTEM
-- ==============================
local function AddStress(amount)
    if not Config.Stress.enabled then return end

    local now = GetGameTimer()
    if now - lastStressTick < Config.Stress.shotCooldown then return end
    lastStressTick = now

    TriggerServerEvent("0r-hud:addStress", amount)
end

-- ==============================
-- RECOIL + STRESS
-- ==============================
CreateThread(function()
    while true do
        Wait(0)

        local ped = PlayerPedId()

        if IsPedShooting(ped) then
            local weaponHash = GetSelectedPedWeapon(ped)
            local weaponData = GetWeaponData(weaponHash)

            if weaponData then
                local recoil = weaponData.recoil or 0.1
                local pitch = GetGameplayCamRelativePitch()

                SetGameplayCamRelativePitch(
                    math.min(pitch + recoil * 3.0, 89.0),
                    0.1
                )

                if Config.RecoilEffectType == "shake" then
                    ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", recoil)
                end

                local stressAmount =
                    weaponData.stress or Config.Stress.defaultPerShot

                AddStress(stressAmount)
            end
        end
    end
end)

-- ==============================
-- CLEAR PROP ON DEATH
-- ==============================
AddEventHandler('baseevents:onPlayerDied', function()
    for name in pairs(props) do
        RemoveWeaponProp(name)
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    for name in pairs(props) do
        RemoveWeaponProp(name)
    end
end)
-- =========================
-- DRAW 3D TEXT
-- =========================
local function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local camCoords = GetGameplayCamCoords()
    local dist = #(vector3(x, y, z) - camCoords)

    local scale = (1 / dist) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    scale = scale * fov

    if onScreen then
        SetTextScale(0.0 * scale, 0.55 * scale)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 0, 0, 215)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end
-- =========================
-- RENDER DAMAGE FLOATING
-- =========================
CreateThread(function()
    while true do
        Wait(0)

        for i = #damageEvents, 1, -1 do
            local data = damageEvents[i]

            if GetGameTimer() - data.time > 1000 then
                table.remove(damageEvents, i)
            else
                local coords = GetEntityCoords(data.ped)
                DrawText3D(coords.x, coords.y, coords.z + 1.0, "-" .. data.damage)
            end
        end
    end
end)
-- =========================
-- DAMAGE DETECT
-- =========================
CreateThread(function()
    while true do
        Wait(0)

        local playerPed = PlayerPedId()

        for _, player in ipairs(GetActivePlayers()) do
            local ped = GetPlayerPed(player)

            if ped ~= playerPed then
                if HasEntityBeenDamagedByEntity(ped, playerPed, true) then
                    local health = GetEntityHealth(ped)

                    damageEvents[#damageEvents+1] = {
                        ped = ped,
                        damage = health,
                        time = GetGameTimer()
                    }

                    ClearEntityLastDamageEntity(ped)
                end
            end
        end
    end
end)
