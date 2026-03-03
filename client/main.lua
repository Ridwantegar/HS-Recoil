Core = nil
PlayerLoaded = false
PlayerData = {}
ped = cache.ped
curWeapon = nil
hasWeapon = false
local onVehicle = false

-- [[ FRAMEWORK LOAD ]] --
Citizen.CreateThread(function()
  if Config.Core == 'ESX' then
    while Core == nil do
      Core = exports[Config.CoreFolder]:getSharedObject()
      Citizen.Wait(10)
    end

    while Core.GetPlayerData().job == nil do
      Citizen.Wait(10)
    end

    PlayerData = Core.GetPlayerData()
    PlayerData.job = Core.GetPlayerData().job  
  elseif Config.Core == 'QB' then
    while Core == nil do
      Core = exports[Config.CoreFolder]:GetCoreObject()
      Citizen.Wait(10)
    end
    
    while Core.Functions.GetPlayerData().job == nil do
      Citizen.Wait(10)
    end

    PlayerData = Core.Functions.GetPlayerData()
    PlayerData.job = Core.Functions.GetPlayerData().job
  end
  PlayerLoaded = true
end)

RegisterNetEvent(Config.PlayerLoaded, function()
  Wait(6000)
  PlayerLoaded = true
end)

RegisterNetEvent(Config.PlayerUnload, function()
  PlayerLoaded = false
  PlayerData = {}
end)

if Config.Core == 'ESX' then
  RegisterNetEvent('esx:setJob')
  AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
  end)
end

Citizen.CreateThread(function()
  while true do
    Wait(500)
    local _, hash = GetCurrentPedWeapon(ped, false)
    local weaponsConfig = Config.Weapons[hash]
    if hash ~= GetHashKey('WEAPON_UNARMED') then
      curWeapon = hash
      hasWeapon = true
    else
      curWeapon = nil
      hasWeapon = false
    end
    if (Core ~= nil and PlayerLoaded) or Config.PropsOnBack then
      if weaponsConfig and not onVehicle then
        for k, v in pairs(Config.Weapons) do
          if hash == k then
            removeWeapon(hash)
          else
            if CheckItem(v.name) then
              putOnBack(k)
            else
              removeWeapon(k)
            end
          end
        end
      end
    end
  end
end)

lib.onCache('vehicle', function(value)
  if (Core ~= nil and PlayerLoaded) or Config.PropsOnBack then
    for k, v in pairs(Config.Weapons) do
      if CheckItem(v.name) then
        if value then
          onVehicle = true
          removeWeapon(k)
        else
          onVehicle = false
          putOnBack(k)
        end
      end
    end
  end
end)

local weaponObjects = {}

function putOnBack(hash)
    if weaponObjects[hash] then return end

    local weaponConfig = Config.Weapons[hash]
    if not weaponConfig then return end
    if not weaponConfig.model then return end

    local ped = PlayerPedId()

    local attachData
    if PlayerData.job and PlayerData.job.name == "police" then
        attachData = weaponConfig.officer
    else
        attachData = weaponConfig.usual
    end

    if not attachData then return end

    -- 🔥 INI BAGIAN PENTING
    if attachData.x == 65536.0 then
        return -- skip attach kalau disable
    end

    RequestModel(weaponConfig.model)
    while not HasModelLoaded(weaponConfig.model) do
        Wait(10)
    end

    local obj = CreateObject(weaponConfig.model, 1.0, 1.0, 1.0, true, true, false)

    AttachEntityToEntity(
        obj,
        ped,
        GetPedBoneIndex(ped, attachData.bone),
        attachData.x,
        attachData.y,
        attachData.z,
        attachData.xRot,
        attachData.yRot,
        attachData.zRot,
        true,
        true,
        false,
        true,
        1,
        true
    )

    weaponObjects[hash] = obj
end

function removeWeapon(hash)
    if weaponObjects[hash] then
        DeleteEntity(weaponObjects[hash])
        weaponObjects[hash] = nil
    end
end
lib.onCache('ped', function(value)
  ped = value
end)

-- [[ CHECK INVENTORY ITEMS ]] --
function CheckItem(item)
  if GetResourceState("ox_inventory") ~= "missing" then
    local hasItem = exports.ox_inventory:Search('count', item)
    if hasItem >= 1 then
      return true
    else
      return false
    end
  else
    if Config.Core == 'ESX' then
      local hasItem = Core.SearchInventory(item, 1)
      if hasItem >= 1 then
        return true
      else
        return false
      end
    elseif Config.Core == 'QB' then
      local hasItem = Core.Functions.HasItem(item)
      return hasItem
    end
  end
end