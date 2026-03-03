local Weapons = Config.Weapons
local weaponCache = {}
local ped = cache.ped

----------------------------------------------------------------
-- REMOVE WEAPON PROP
----------------------------------------------------------------
function removeWeapon(hash)
    if weaponCache[hash] then
        if DoesEntityExist(weaponCache[hash].entity) then
            DetachEntity(weaponCache[hash].entity, true, true)
            DeleteEntity(weaponCache[hash].entity)
        end
        weaponCache[hash] = nil
    end
end

----------------------------------------------------------------
-- CLEAN INVALID ENTITIES
----------------------------------------------------------------
function checkEntityExist()
    for k, v in pairs(weaponCache) do
        if not DoesEntityExist(v.entity) then
            weaponCache[k] = nil
        elseif not IsEntityAttachedToEntity(v.entity, ped) then
            DeleteEntity(v.entity)
            weaponCache[k] = nil
        end
    end
end

----------------------------------------------------------------
-- PUT WEAPON ON BACK
----------------------------------------------------------------
function putOnBack(hash)
    if not Weapons[hash] then return end
    if weaponCache[hash] then return end

    while not PlayerData or not PlayerData.job do
        Wait(50)
    end

    local job = PlayerData.job.name
    local weaponData = Weapons[hash]

    local position = weaponData.usual
    if Config.Officer and Config.Officer[job] then
        position = weaponData.officer
    end

    if not position then return end

    -- 🔥 65536 = disable attach
    if position.x == 65536.0 then
        return
    end

    checkEntityExist()

    local model = weaponData.model
    if not model then return end

    lib.requestModel(model, 1000)

    local coords = GetEntityCoords(ped)
    local boneIndex = GetPedBoneIndex(ped, position.bone)

    local prop = CreateObjectNoOffset(model, coords.x, coords.y, coords.z, true, false, false)

    AttachEntityToEntity(
        prop,
        ped,
        boneIndex,
        position.x,
        position.y,
        position.z,
        position.xRot,
        position.yRot,
        position.zRot,
        true,
        true,
        false,
        true,
        2,
        true
    )

    weaponCache[hash] = {
        entity = prop,
        hash = hash
    }
end

----------------------------------------------------------------
-- UPDATE PED CACHE (ox_lib)
----------------------------------------------------------------
lib.onCache('ped', function(value)
    ped = value
end)

----------------------------------------------------------------
-- COMMAND TO CLEAR BACK WEAPONS
----------------------------------------------------------------
RegisterCommand(Config.Command, function()
    for k, v in pairs(Weapons) do
        if CheckItem(v.name) then
            local hash = joaat(v.name)
            removeWeapon(hash)
        end
    end
end)