-- ==================== onback.lua ====================
local Weapons = Config.Weapons or {}
local weaponCache = {}   -- { [hash] = { entity = obj } }
local ped = cache.ped

-- Perbaikan 1: Deklarasikan variabel agar tidak nil (undefined)
local onVehicle = false
local PlayerLoaded = false

-- Perbaikan 2: Fungsi helper untuk cek item (Sesuaikan dengan inventory yang dipakai)
-- Jika pakai ox_inventory:
local function CheckItem(itemName)
    if not itemName then return false end
    -- Cek apakah item ada di inventory
    local count = exports.ox_inventory:Search('count', itemName)
    return count and count > 0
end

----------------------------------------------------------------
-- REMOVE WEAPON PROP
----------------------------------------------------------------
function removeWeapon(hash)
    if not weaponCache[hash] then return end

    local data = weaponCache[hash]
    if data.entity and DoesEntityExist(data.entity) then
        DetachEntity(data.entity, true, true)
        DeleteEntity(data.entity)
    end
    weaponCache[hash] = nil
end

----------------------------------------------------------------
-- CLEAN INVALID ENTITIES
----------------------------------------------------------------
function checkEntityExist()
    for hash, data in pairs(weaponCache) do
        if not data.entity or not DoesEntityExist(data.entity) or not IsEntityAttachedToEntity(data.entity, ped) then
            weaponCache[hash] = nil
        end
    end
end

----------------------------------------------------------------
-- PUT WEAPON ON BACK
----------------------------------------------------------------
function putOnBack(hash)
    if weaponCache[hash] then return end
    if not Weapons[hash] then return end

    local weaponData = Weapons[hash]
    if not weaponData.model then return end

    -- Pilih posisi berdasarkan job
    local position = weaponData.usual
    
    -- Perbaikan 3: Cek PlayerData dengan aman agar tidak error jika nil
    -- Pastikan variabel PlayerData bisa diakses (Global / StateBag)
    -- Jika pakai QBCore, biasanya ada di global atau perlu di-Get
    local playerData = PlayerData or QBCore.Functions.GetPlayerData() -- Fallback safe check
    
    if playerData and playerData.job and playerData.job.name then
        local job = playerData.job.name
        if Config.Officer and Config.Officer[job] and weaponData.officer then
            position = weaponData.officer
        end
    end

    if not position or position.x == 65536.0 then return end

    checkEntityExist()

    lib.requestModel(weaponData.model, 1500)

    local boneIndex = GetPedBoneIndex(ped, position.bone)

    local prop = CreateObjectNoOffset(weaponData.model, 0.0, 0.0, 0.0, true, false, false)

    AttachEntityToEntity(
        prop,
        ped,
        boneIndex,
        position.x, position.y, position.z,
        position.xRot, position.yRot, position.zRot,
        true, true, false, false, 2, true
    )

    weaponCache[hash] = { entity = prop }
    SetModelAsNoLongerNeeded(weaponData.model)
end

----------------------------------------------------------------
-- REFRESH ALL BACK WEAPONS
----------------------------------------------------------------
function RefreshBackWeapons()
    if not PlayerLoaded or onVehicle then return end

    -- Gunakan cache.weapon dari ox_lib
    local currentWeapon = cache.weapon or `WEAPON_UNARMED`

    for hash, data in pairs(Weapons) do
        if hash == currentWeapon then
            removeWeapon(hash)
        else
            if CheckItem(data.name) then
                putOnBack(hash)
            else
                removeWeapon(hash)
            end
        end
    end
end

----------------------------------------------------------------
-- PED CACHE
----------------------------------------------------------------
lib.onCache('ped', function(value)
    ped = value
    Wait(500)
    RefreshBackWeapons()
end)

----------------------------------------------------------------
-- WEAPON CHANGE HANDLER
----------------------------------------------------------------
lib.onCache('weapon', function(newWeapon, oldWeapon)
    if not PlayerLoaded or onVehicle then return end

    -- Beri jeda sedikit agar animasi equip selesai
    Wait(200)

    -- Hanya perlu refresh, logika remove sudah tertangani di RefreshBackWeapons
    -- Tapi memanggil remove explisit untuk senjata yang lama baru lebih 'responsif'
    if oldWeapon and oldWeapon ~= `WEAPON_UNARMED` then
        removeWeapon(oldWeapon)
    end
    
    RefreshBackWeapons()
end)

----------------------------------------------------------------
-- VEHICLE HANDLER
----------------------------------------------------------------
lib.onCache('vehicle', function(vehicle)
    onVehicle = vehicle ~= false

    if onVehicle then
        -- Hapus semua senjata saat masuk kendaraan
        for hash, _ in pairs(weaponCache) do
            removeWeapon(hash)
        end
    else
        -- Munculkan lagi setelah keluar kendaraan
        Wait(500)
        RefreshBackWeapons()
    end
end)

----------------------------------------------------------------
-- OX_INVENTORY ITEM CHANGE
----------------------------------------------------------------
RegisterNetEvent('ox_inventory:itemCount', function(itemName, totalCount)
    if not PlayerLoaded or onVehicle then return end

    -- Optimasi: Cek dulu apakah itemName ini ada di Config
    local needsRefresh = false
    for hash, data in pairs(Weapons) do
        if data.name == itemName then
            needsRefresh = true
            break
        end
    end

    if needsRefresh then
        RefreshBackWeapons()
    end
end)

----------------------------------------------------------------
-- PLAYER LOADED
----------------------------------------------------------------
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Wait(1500)
    PlayerLoaded = true
    RefreshBackWeapons()
end)

-- Tambahan: Handle Player Unloaded (logout)
RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    PlayerLoaded = false
    -- Bersihkan punggung saat logout
    for hash, _ in pairs(weaponCache) do
        removeWeapon(hash)
    end
end)

----------------------------------------------------------------
-- COMMAND CLEAR
----------------------------------------------------------------
RegisterCommand(Config.Command or 'clearback', function()
    for hash, _ in pairs(weaponCache) do
        removeWeapon(hash)
    end
    print("^2Semua weapon di punggung sudah dihapus.")
end, false)

----------------------------------------------------------------
-- CLEANUP
----------------------------------------------------------------
AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        for hash, _ in pairs(weaponCache) do
            removeWeapon(hash)
        end
    end
end)