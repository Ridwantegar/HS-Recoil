Config = {}

-- [[ QB ]] --
Config.Core         = 'QB'
Config.CoreFolder   = 'qb-core'
Config.PlayerLoaded = 'QBCore:Client:OnPlayerLoaded'
Config.PlayerUnload = 'QBCore:Client:OnPlayerUnload'

Config.CheckForUpdates  = true
Config.Command          = 'fixweapon'
Config.DisplayAmmo      = false
Config.DisplayCrosshair = false
Config.WhitelistWeapon  = false
Config.DefaultDamage    = 0.0
Config.DefaultRecoil    = 5.0
Config.RecoilType       = 'mix' -- 'shakes', 'top', 'mix'
Config.DisableStealth   = true
Config.PropsOnBack      = true
Config.StressSystem     = '0r-hud' -- '0r-hud' atau 'qb-hud'

Config.Officer = {
  ['police'] = true,
  ['offpolice'] = true,
}

Config.Stress = {
    enabled = true,
    shotCooldown = 500,
    shotsRequired = 5 -- default global
}

Config.Stress = {
    enabled = true,

    -- 🔥 Delay antar penambahan stress (ms)
    shotCooldown = 500,

    -- 🔥 Default kalau weapon tidak ada di config
    defaultPerShot = 1,

    -- 🔥 Default jumlah peluru sebelum nambah stress
    shotsRequired = 5,
}

-- IMPORTANT!
-- IF YOU ADD WEAPONS TO THE LIST MAKE SURE YOU USE `` QUOTES FOR THE WEAPON HASH INSTEAD OF '' QUOTES
-- YOU CAN GET WEAPON MODEL ON https://gtahash.ru/

Config.Weapons = {
  [`WEAPON_UNARMED`] = {
    name = 'WEAPON_UNARMED',
    damage = 0.25,
    critical = false,
    recoil = 0.0,
    shotsRequired = 999, -- Melee tidak menimbulkan stress suara ledakan
    officer = nil,
    usual = nil,
    model = nil,
    category = 'melee'
  },

  [`WEAPON_PETROLCAN`] = {
    name = 'WEAPON_PETROLCAN',
    damage = 0.0,
    critical = false,
    recoil = 0.0,
    shotsRequired = 20, -- Api menyembur agak lama baru stress
    officer = { bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0},
    usual = { bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0},
    model = 'w_am_jerrycan',
    category = 'melee'
  },

  [`WEAPON_NIGHTSTICK`] = {
    name = 'WEAPON_NIGHTSTICK',
    damage = 0.25,
    critical = false,
    recoil = 0.001,
    shotsRequired = 999, -- Melee
    officer = { bone = 51826, x = -0.01, y = 0.0, z = 0.1, xRot = -90.0, yRot = 180.0, zRot = 90.0},
    usual = { bone = 51826, x = -0.01, y = 0.0, z = 0.1, xRot = -90.0, yRot = 180.0, zRot = 90.0},
    model = 'w_me_nightstick',
    category = 'melee'
  },

  [`WEAPON_FLASHLIGHT`] = {
    name = 'WEAPON_FLASHLIGHT',
    damage = 0.15, 
    critical = false,
    recoil = 0.001,
    shotsRequired = 999, -- Melee
    officer = { bone = 57597, x = 0.1, y = -0.13, z = -0.1, xRot = 180.0, yRot = -180.0, zRot = 0.0},
    usual = { bone = 57597, x = 0.1, y = -0.13, z = -0.1, xRot = 180.0, yRot = -180.0, zRot = 0.0},
    model = 'w_me_flashlight',
    category = 'melee'
  },

  [`WEAPON_KNIFE`] = {
    name = 'WEAPON_KNIFE',
    damage = 0.35, 
    critical = false,
    recoil = 0.001,
    shotsRequired = 999, -- Melee
    officer = { bone = 57597, x = 0.1, y = -0.13, z = -0.12, xRot = 180.0, yRot = -180.0, zRot = 0.0},
    usual = { bone = 57597, x = 0.1, y = -0.13, z = -0.12, xRot = 180.0, yRot = -180.0, zRot = 0.0},
    model = 'prop_w_me_knife_01',
    category = 'melee'
  },

  [`WEAPON_KNUCKLE`] = {
    name = 'WEAPON_KNUCKLE',
    damage = 0.1, 
    critical = false,
    recoil = 0.001,
    shotsRequired = 999, -- Melee
    officer = { bone = 57597, x = 0.1, y = -0.13, z = -0.05, xRot = 180.0, yRot = -180.0, zRot = 90.0},
    usual = { bone = 57597, x = 0.1, y = -0.13, z = -0.05, xRot = 180.0, yRot = -180.0, zRot = 90.0},
    model = 'w_me_knuckle',
    category = 'melee'
  },

  [`WEAPON_BAT`] = {
    name = 'WEAPON_BAT',
    damage = 0.2, 
    critical = false,
    recoil = 0.001,
    shotsRequired = 999, -- Melee
    officer = { bone = 24818, x = 0.25, y = -0.135, z = -0.2, xRot = -180.0, yRot = 225.0, zRot = 0.0},
    usual = { bone = 24818, x = 0.25, y = -0.135, z = -0.2, xRot = -180.0, yRot = 225.0, zRot = 0.0},
    model = 'w_me_bat',
    category = 'melee'
  },

  [`WEAPON_HATCHET`] = {
    name = 'WEAPON_HATCHET',
    damage = 0.25, 
    critical = false,
    recoil = 0.001,
    shotsRequired = 999, -- Melee
    officer = { bone = 57597, x = 0.1, y = -0.13, z = -0.2, xRot = 180.0, yRot = -180.0, zRot = 0.0},
    usual = { bone = 57597, x = 0.1, y = -0.13, z = -0.2, xRot = 180.0, yRot = -180.0, zRot = 0.0},
    model = 'w_me_hatchet',
    category = 'melee'
  },

  [`WEAPON_MACHETE`] = {
    name = 'WEAPON_MACHETE',
    damage = 0.5, 
    critical = false,
    recoil = 0.001,
    shotsRequired = 999, -- Melee
    officer = { bone = 57597, x = 0.1, y = -0.13, z = -0.2, xRot = 180.0, yRot = -180.0, zRot = 0.0},
    usual = { bone = 57597, x = 0.1, y = -0.13, z = -0.2, xRot = 180.0, yRot = -180.0, zRot = 0.0},
    model = 'prop_ld_w_me_machette',
    category = 'melee'
  },
  
  [`WEAPON_SWITCHBLADE`] = {
    name = 'WEAPON_SWITCHBLADE',
    damage = 0.35, 
    critical = false,
    recoil = 0.001,
    shotsRequired = 999, -- Melee
    officer = { bone = 57597, x = 0.1, y = -0.13, z = -0.1, xRot = 180.0, yRot = -180.0, zRot = 0.0},
    usual = { bone = 57597, x = 0.1, y = -0.13, z = -0.1, xRot = 180.0, yRot = -180.0, zRot = 0.0},
    model = 'w_me_switchblade',
    category = 'melee'
  },
  
  [`WEAPON_KARAMBITKNIFE`] = {
    name = 'WEAPON_KARAMBITKNIFE',
    damage = 0.45, 
    critical = false,
    recoil = 0.001,
    shotsRequired = 999, -- Melee
    officer = { bone = 57597, x = 0.1, y = -0.13, z = -0.1, xRot = 180.0, yRot = -180.0, zRot = 0.0},
    usual = { bone = 57597, x = 0.1, y = -0.13, z = -0.1, xRot = 180.0, yRot = -180.0, zRot = 0.0},
    model = 'w_me_karambitknife_01',
    category = 'melee'
  },
  
  [`WEAPON_SLEDGEHAMMER`] = {
    name = 'WEAPON_SLEDGEHAMMER',
    damage = 0.45, 
    critical = false,
    recoil = 0.001,
    shotsRequired = 999, -- Melee
    officer = { bone = 24818, x = 0.5, y = -0.14, z = 0.0, xRot = 190.0, yRot = 185.0, zRot = 290.0},
    usual = { bone = 24818, x = 0.5, y = -0.14, z = 0.0, xRot = 190.0, yRot = 185.0, zRot = 290.0},
    model = 'w_me_sledgehammer',
    category = 'melee'
  },

  [`WEAPON_WRENCH`] = {
    name = 'WEAPON_WRENCH',
    damage = 0.35, 
    critical = false,
    recoil = 0.001,
    shotsRequired = 999, -- Melee
    officer = { bone = 57597, x = 0.1, y = -0.13, z = -0.1, xRot = 180.0, yRot = -180.0, zRot = 0.0},
    usual = { bone = 57597, x = 0.1, y = -0.13, z = -0.1, xRot = 180.0, yRot = -180.0, zRot = 0.0},
    model = 'w_me_wrench',
    category = 'melee'
  },

  [`WEAPON_BATTLEAXE`] = {
    name = 'WEAPON_BATTLEAXE',
    damage = 0.35, 
    critical = false,
    recoil = 0.001,
    shotsRequired = 999, -- Melee
    officer = { bone = 57597, x = 0.1, y = -0.13, z = -0.1, xRot = 180.0, yRot = -180.0, zRot = 0.0},
    usual = { bone = 57597, x = 0.1, y = -0.13, z = -0.1, xRot = 180.0, yRot = -180.0, zRot = 0.0},
    model = 'w_me_battleaxe',
    category = 'melee'
  },

  [`WEAPON_KATANA`] = {
    name = 'WEAPON_KATANA',
    damage = 0.35, 
    critical = false,
    recoil = 0.001,
    shotsRequired = 999, -- Melee
    officer = { bone = 24818, x = 0.2, y = -0.15, z = 0.12, xRot = 0.0, yRot = -120.0, zRot = 0.0},
    usual = { bone = 24818, x = 0.2, y = -0.15, z = 0.12, xRot = 0.0, yRot = -120.0, zRot = 0.0},
    model = 'w_me_katana',
    category = 'melee'
  },

  [`WEAPON_CHERRYKATANAS`] = {
    name = 'WEAPON_CHERRYKATANAS',
    damage = 2.0, 
    critical = false,
    recoil = 0.001,
    shotsRequired = 999, -- Melee
    officer = { bone = 24818, x = 0.2, y = -0.15, z = 0.12, xRot = 0.0, yRot = -120.0, zRot = 0.0},
    usual = { bone = 24818, x = 0.2, y = -0.15, z = 0.12, xRot = 0.0, yRot = -120.0, zRot = 0.0},
    model = 'w_me_cherrykat_lr',
    category = 'melee'
  },

  -- [[ PISTOL ]] --
  [`WEAPON_STUNGUN`] = {
    name = 'WEAPON_STUNGUN',
    damage = 0.0, 
    critical = false,
    recoil = 0.1,
    shotsRequired = 999, -- Taser suaranya kecil/nyetrum, tidak menimbulkan stress ledakan
    officer = { bone = 58271, x = -0.01, y = 0.05, z = -0.1, xRot = -70.0, yRot = 0.0, zRot = 0.0},
    usual = { bone = 58271, x = -0.01, y = 0.05, z = -0.1, xRot = -70.0, yRot = 0.0, zRot = 0.0},
    model = 'w_pi_stungun',
    category = 'pistol'
  },

  [`WEAPON_HEAVYPISTOL`] = {
    name = 'WEAPON_HEAVYPISTOL',
    damage = 0.85, 
    critical = false,
    recoil = 0.20,
    shotsRequired = 5,
    officer = { bone = 51826, x = -0.01, y = 0.1, z = 0.07, xRot = -115.0, yRot = 0.0, zRot = 0.0},
    usual = { bone = 57597, x = -0.01, y = -0.175, z = 0.0, xRot = -180.0, yRot = 135.0, zRot = 0.0},
    model = 'w_pi_heavypistol',
    category = 'pistol'
  },

  [`WEAPON_REVOLVER`] = {
    name = 'WEAPON_REVOLVER',
    damage = 0.33, 
    critical = false,
    recoil = 0.6,
    shotsRequired = 5,
    officer = { bone = 51826, x = -0.01, y = 0.1, z = 0.07, xRot = -115.0, yRot = 0.0, zRot = 0.0},
    usual = { bone = 57597, x = -0.01, y = -0.175, z = 0.0, xRot = -180.0, yRot = 135.0, zRot = 0.0},
    model = 'w_pi_revolver',
    category = 'pistol'
  },

  [`WEAPON_NAVYREVOLVER`] = {
    name = 'WEAPON_NAVYREVOLVER',
    damage = 0.55, 
    critical = false,
    recoil = 0.9,
    shotsRequired = 5,
    officer = { bone = 51826, x = -0.01, y = 0.1, z = 0.07, xRot = -115.0, yRot = 0.0, zRot = 0.0},
    usual = { bone = 57597, x = -0.01, y = -0.175, z = 0.0, xRot = -180.0, yRot = 135.0, zRot = 0.0},
    model = 'w_pi_wep2_gun',
    category = 'pistol'
  },

  [`WEAPON_APPISTOL`] = {
    name = 'WEAPON_APPISTOL',
    damage = 0.45, 
    critical = false,
    recoil = 0.08,
    shotsRequired = 5,
    officer = { bone = 51826, x = -0.01, y = 0.1, z = 0.07, xRot = -115.0, yRot = 0.0, zRot = 0.0},
    usual = { bone = 57597, x = -0.01, y = -0.175, z = 0.0, xRot = -180.0, yRot = 135.0, zRot = 0.0},
    model = 'w_pi_appistol',
    category = 'pistol'
  },

  [`WEAPON_CERAMICPISTOL`] = {
    name = 'WEAPON_CERAMICPISTOL',
    damage = 0.50, 
    critical = false,
    recoil = 0.10,
    shotsRequired = 5,
    officer = { bone = 51826, x = -0.01, y = 0.1, z = 0.07, xRot = -115.0, yRot = 0.0, zRot = 0.0},
    usual = { bone = 57597, x = -0.01, y = -0.175, z = 0.0, xRot = -180.0, yRot = 135.0, zRot = 0.0},
    model = 'w_pi_ceramic_pistol',
    category = 'pistol'
  },

  [`WEAPON_FNX45`] = {
    name = 'WEAPON_FNX45',
    damage = 0.80, 
    critical = false,
    recoil = 0.18,
    shotsRequired = 5,
    officer = { bone = 51826, x = -0.01, y = 0.1, z = 0.07, xRot = -115.0, yRot = 0.0, zRot = 0.0},
    usual = { bone = 57597, x = -0.01, y = -0.175, z = 0.0, xRot = -180.0, yRot = 135.0, zRot = 0.0},
    model = 'w_pi_fnx45',
    category = 'pistol'
  },

  [`WEAPON_GLOCK22`] = {
    name = 'WEAPON_GLOCK22',
    damage = 0.65, 
    critical = false,
    recoil = 0.15,
    shotsRequired = 5,
    officer = { bone = 51826, x = -0.01, y = 0.1, z = 0.07, xRot = -115.0, yRot = 0.0, zRot = 0.0},
    usual = { bone = 57597, x = -0.01, y = -0.175, z = 0.0, xRot = -180.0, yRot = 135.0, zRot = 0.0},
    model = 'w_pi_glock22',
    category = 'pistol'
  },

  [`WEAPON_GLOCK18C`] = {
    name = 'WEAPON_GLOCK18C',
    damage = 0.40, 
    critical = false,
    recoil = 0.15,
    shotsRequired = 5,
    officer = { bone = 51826, x = -0.01, y = 0.1, z = 0.07, xRot = -115.0, yRot = 0.0, zRot = 0.0},
    usual = { bone = 57597, x = -0.01, y = -0.175, z = 0.0, xRot = -180.0, yRot = 135.0, zRot = 0.0},
    model = 'w_pi_glock18c',
    category = 'pistol'
  },

  [`WEAPON_PISTOL`] = {
    name = 'WEAPON_PISTOL',
    damage = 0.45, 
    critical = false,
    recoil = 0.18,
    shotsRequired = 5,
	stress = 1,
    officer = { bone = 51826, x = -0.01, y = 0.1, z = 0.07, xRot = -115.0, yRot = 0.0, zRot = 0.0},
    usual = { bone = 57597, x = -0.01, y = -0.175, z = 0.0, xRot = -180.0, yRot = 135.0, zRot = 0.0},
    model = 'w_pi_pistol',
    category = 'pistol'
  },

  [`WEAPON_COMBATPISTOL`] = {
    name = 'WEAPON_COMBATPISTOL',
    damage = 0.55, 
    critical = false,
    recoil = 0.1,
    shotsRequired = 5,
    officer = { bone = 51826, x = -0.01, y = 0.1, z = 0.07, xRot = -115.0, yRot = 0.0, zRot = 0.0},
    usual = { bone = 57597, x = -0.01, y = -0.175, z = 0.0, xRot = -180.0, yRot = 135.0, zRot = 0.0},
    model = 'w_pi_combatpistol',
    category = 'pistol'
  },

  [`WEAPON_PISTOLXM3`] = {
    name = 'WEAPON_PISTOLXM3',
    damage = 0.72, 
    critical = false,
    recoil = 0.15,
    shotsRequired = 5,
    officer = { bone = 51826, x = -0.01, y = 0.1, z = 0.07, xRot = -115.0, yRot = 0.0, zRot = 0.0},
    usual = { bone = 57597, x = -0.01, y = -0.175, z = 0.0, xRot = -180.0, yRot = 135.0, zRot = 0.0},
    model = 'w_pi_pistol_xm3',
    category = 'pistol'
  },

  [`WEAPON_REVOLVER_MK2`] = {
    name = 'WEAPON_REVOLVER_MK2',
    damage = 0.3, 
    critical = false,
    recoil = 0.85,
	stress = 1,
    shotsRequired = 5,
    officer = { bone = 51826, x = -0.01, y = 0.1, z = 0.07, xRot = -115.0, yRot = 0.0, zRot = 0.0},
    usual = { bone = 57597, x = 0.15, y = -0.175, z = -0.05, xRot = -180.0, yRot = 135.0, zRot = 0.0},
    model = 'w_pi_revolvermk2',
    category = 'pistol'
  },

  [`WEAPON_PISTOL50`] = {
    name = 'WEAPON_PISTOL50',
    damage = 0.43, 
    critical = false,
    recoil = 0.17,
    shotsRequired = 5,
    officer = { bone = 51826, x = -0.01, y = 0.1, z = 0.07, xRot = -115.0, yRot = 0.0, zRot = 0.0},
    usual = { bone = 57597, x = 0.15, y = -0.175, z = -0.05, xRot = -180.0, yRot = 135.0, zRot = 0.0},
    model = 'w_pi_pistol50',
    category = 'pistol'
  },

  [`WEAPON_MACHINEPISTOL`] = {
    name = 'WEAPON_MACHINEPISTOL',
    damage = 0.39, 
    critical = false,
    recoil = 0.14,
    shotsRequired = 5,
    officer = { bone = 24818, x = 0.05, y = -0.135, z = 0.0, xRot = -180.0, yRot = 200.0, zRot = 0.0},
    usual = { bone = 24818, x = 0.05, y = -0.135, z = 0.0, xRot = -180.0, yRot = 200.0, zRot = 0.0},
    model = 'w_sb_compactsmg',
    category = 'pistol'
  },

  [`WEAPON_DOUBLEACTION`] = {
    name = 'WEAPON_DOUBLEACTION',
    damage = 0.60, 
    critical = false,
    recoil = 0.8,
    shotsRequired = 5,
    officer = { bone = 51826, x = -0.01, y = 0.1, z = 0.07, xRot = -115.0, yRot = 0.0, zRot = 0.0},
    usual = { bone = 57597, x = -0.01, y = -0.175, z = 0.0, xRot = -180.0, yRot = 135.0, zRot = 0.0},
    model = 'w_pi_wep1_gun',
    category = 'pistol'
  },

  -- [[ SMG ]] --
  [`WEAPON_MINISMG`] = {
    name = 'WEAPON_MINISMG',
    damage = 0.70, 
    critical = false,
    recoil = 0.07,
    shotsRequired = 5,
    officer = { bone = 24818, x = 0.0, y = -0.135, z = 0.0, xRot = -180.0, yRot = 180.0, zRot = 0.0},
    usual = { bone = 24818, x = 0.0, y = -0.135, z = 0.0, xRot = -180.0, yRot = 180.0, zRot = 0.0},
    model = 'w_sb_minismg',
    category = 'machine'
  },

  [`WEAPON_MICROSMG`] = {
    name = 'WEAPON_MICROSMG',
    damage = 0.35, 
    critical = false,
    recoil = 0.08,
    shotsRequired = 5,
    officer = { bone = 24818, x = 0.05, y = -0.135, z = 0.0, xRot = -180.0, yRot = 180.0, zRot = 0.0},
    usual = { bone = 24818, x = 0.05, y = -0.135, z = 0.0, xRot = -180.0, yRot = 180.0, zRot = 0.0},
    model = 'w_sb_microsmg',
    category = 'machine'
  },

  [`WEAPON_SMG`] = {
    name = 'WEAPON_SMG',
    damage = 0.82, 
    critical = false,
    recoil = 0.07,
    shotsRequired = 5,
	stress = 0.5,
    officer = { bone = 24818, x = 0.05, y = -0.135, z = 0.0, xRot = -180.0, yRot = 180.0, zRot = 0.0},
    usual = { bone = 24818, x = 0.05, y = -0.135, z = 0.0, xRot = -180.0, yRot = 180.0, zRot = 0.0},
    model = 'w_sb_smg',
    category = 'machine'
  },

  -- [[ RIFLE ]] --
  [`WEAPON_CARBINERIFLE`] = {
    name = 'WEAPON_CARBINERIFLE',
    damage = 0.72, 
    critical = false,
    recoil = 0.11,
    shotsRequired = 15, -- Rifle full auto, stress agak lama baru penuh
    officer = { bone = 24818, x = 0.125, y = -0.175, z = -0.125, xRot = 90.0, yRot = 180.0, zRot = 0.0},
    usual = { bone = 24818, x = 0.125, y = -0.175, z = -0.125, xRot = 90.0, yRot = 180.0, zRot = 0.0},
    model = 'w_ar_carbinerifle',
    category = 'assault'
  },

  [`WEAPON_ASSAULTRIFLE`] = {
    name = 'WEAPON_ASSAULTRIFLE',
    damage = 0.69, 
    critical = false,
    recoil = 0.11,
	stress = 0.8,
    shotsRequired = 15,
    officer = { bone = 24818, x = 0.125, y = -0.175, z = -0.125, xRot = 90.0, yRot = 180.0, zRot = 0.0},
    usual = { bone = 24818, x = 0.125, y = -0.175, z = -0.125, xRot = 90.0, yRot = 180.0, zRot = 0.0},
    model = 'w_ar_assaultrifle',
    category = 'assault'
  },

  [`WEAPON_SPECIALCARBINE`] = {
    name = 'WEAPON_SPECIALCARBINE',
    damage = 0.69, 
    critical = false,
    recoil = 0.11,
    shotsRequired = 15,
    officer = { bone = 24818, x = 0.125, y = -0.175, z = -0.125, xRot = 90.0, yRot = 180.0, zRot = 0.0},
    usual = { bone = 24818, x = 0.125, y = -0.175, z = -0.125, xRot = 90.0, yRot = 180.0, zRot = 0.0},
    model = 'w_ar_specialcarbine',
    category = 'assault'
  },


  -- [[ SHOTGUN ]] --
  [`WEAPON_BULLPUPSHOTGUN`] = {
    name = 'WEAPON_BULLPUPSHOTGUN',
    damage = 0.7,
    critical = false,
    recoil = 0.2,
    shotsRequired = 5,
    officer = { bone = 24818, x = 0.0, y = -0.15, z = 0.0, xRot = 0.0, yRot = 0.0, zRot = 0.0},
    usual = { bone = 24818, x = 0.0, y = -0.15, z = 0.0, xRot = 0.0, yRot = 0.0, zRot = 0.0},
    model = 'w_sg_bullpupshotgun',
    category = 'shotgun'
  },
  [`WEAPON_MUSKET`] = {
    name = 'WEAPON_MUSKET',
    damage = 0.85,
    critical = false,
    recoil = 0.3,
    shotsRequired = 5,
    officer = { bone = 24818, x = -0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 0.0, zRot = 0.0},
    usual = { bone = 24818, x = -0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 0.0, zRot = 0.0},
    model = 'w_ar_musket',
    category = 'shotgun'
  },

  -- [[ SNIPER ]] --
  [`WEAPON_HEAVYSNIPER`] = {
    name = 'WEAPON_HEAVYSNIPER',
    damage = 2.0, 
    critical = false,
    recoil = 0.11,
    shotsRequired = 3, -- Sniper suaranya keras, stress naik cepat
    officer = { bone = 24818, x = 0.2, y = -0.175, z = 0.125, xRot = 90.0, yRot = 180.0, zRot = 0.0},
    usual = { bone = 24818, x = 0.2, y = -0.175, z = 0.125, xRot = 90.0, yRot = 180.0, zRot = 0.0},
    model = 'w_sr_heavysniper',
    category = 'sniper'
  },

  [`WEAPON_HEAVYSNIPER_MK2`] = {
    name = 'WEAPON_HEAVYSNIPER_MK2',
    damage = 2.0, 
    critical = false,
    recoil = 0.11,
    shotsRequired = 3,
    officer = { bone = 24818, x = 0.2, y = -0.175, z = 0.125, xRot = 90.0, yRot = 180.0, zRot = 0.0},
    usual = { bone = 24818, x = 0.2, y = -0.175, z = 0.125, xRot = 90.0, yRot = 180.0, zRot = 0.0},
    model = 'w_sr_heavysnipermk2',
    category = 'sniper'
  },

  [`WEAPON_SNIPERRIFLE`] = {
    name = 'WEAPON_SNIPERRIFLE',
    damage = 2.0, 
    critical = false,
    recoil = 0.11,
    shotsRequired = 3,
    officer = { bone = 24818, x = 0.2, y = -0.175, z = 0.125, xRot = 90.0, yRot = 180.0, zRot = 0.0},
    usual = { bone = 24818, x = 0.2, y = -0.175, z = 0.125, xRot = 90.0, yRot = 180.0, zRot = 0.0},
    model = 'w_sr_sniperrifle',
    category = 'sniper'
  },

  [`WEAPON_RPG`] = {
    name = 'WEAPON_RPG',
    damage = 5.0, 
    critical = false,
    recoil = 1.0,
    shotsRequired = 5,
    officer = { bone = 24818, x = -0.2, y = -0.135, z = 0.0, xRot = -180.0, yRot = 180.0, zRot = 0.0},
    usual = { bone = 24818, x = -0.2, y = -0.135, z = 0.0, xRot = -180.0, yRot = 180.0, zRot = 0.0},
    model = 'w_lr_rpg',
    category = 'heavy',
  },
}

exports('GetWeaponName', function(hash)
  for k, v in pairs(Config.Weapons) do
    if hash == k then
      return v.name
    end
  end
end)