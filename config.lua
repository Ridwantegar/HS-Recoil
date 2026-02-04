Config = {}

Config.Debug = true
-- Efek recoil: "shake" atau "drunk"
Config.RecoilEffectType = "shake"
Config.Stress = {
    enabled = true,
    defaultPerShot = 0.5,
    shotCooldown = 300,
    min = 0,
    max = 100
}
-- Daftar senjata + prop + recoil + damage multiplier
Config.Weapons = {  
    {
        name = 'WEAPON_PETROLCAN',
        model = 'w_am_jerrycan',
        recoil = 0.0,
        damage = 0.0,
        stress = nil,
        officer = { bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0 },
        usual  = { bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0 }
    },

    {
        name = 'WEAPON_NIGHTSTICK',
        model = 'w_me_nightstick',
        recoil = 0.001,
        damage = 0.25,
        stress = nil,
        officer = { bone = 51826, x = -0.01, y = 0.0, z = 0.1, xRot = -90.0, yRot = 180.0, zRot = 90.0 },
        usual  = { bone = 51826, x = -0.01, y = 0.0, z = 0.1, xRot = -90.0, yRot = 180.0, zRot = 90.0 }
    },

    {
        name = 'WEAPON_FLASHLIGHT',
        model = 'w_me_flashlight',
        recoil = 0.001,
        damage = 0.15,
        stress = nil,
        officer = { bone = 57597, x = 0.1, y = -0.13, z = -0.1, xRot = 180.0, yRot = -180.0, zRot = 0.0 },
        usual  = { bone = 57597, x = 0.1, y = -0.13, z = -0.1, xRot = 180.0, yRot = -180.0, zRot = 0.0 }
    },

    {
        name = 'WEAPON_KNIFE',
        model = 'prop_w_me_knife_01',
        recoil = 0.001,
        damage = 0.35,
        stress = nil,
        officer = { bone = 57597, x = 0.1, y = -0.13, z = -0.12, xRot = 180.0, yRot = -180.0, zRot = 0.0 },
        usual  = { bone = 57597, x = 0.1, y = -0.13, z = -0.12, xRot = 180.0, yRot = -180.0, zRot = 0.0 }
    },

    {
        name = 'WEAPON_KNUCKLE',
        model = 'w_me_knuckle',
        recoil = 0.001,
        damage = 0.1,
        stress = nil,
        officer = { bone = 57597, x = 0.1, y = -0.13, z = -0.05, xRot = 180.0, yRot = -180.0, zRot = 90.0 },
        usual  = { bone = 57597, x = 0.1, y = -0.13, z = -0.05, xRot = 180.0, yRot = -180.0, zRot = 90.0 }
    },

    {
        name = 'WEAPON_BAT',
        model = 'w_me_bat',
        recoil = 0.001,
        damage = 0.2,
        stress = nil,
        officer = { bone = 24818, x = 0.25, y = -0.135, z = -0.2, xRot = -180.0, yRot = 225.0, zRot = 0.0 },
        usual  = { bone = 24818, x = 0.25, y = -0.135, z = -0.2, xRot = -180.0, yRot = 225.0, zRot = 0.0 }
    },

    {
        name = 'WEAPON_HATCHET',
        model = 'w_me_hatchet',
        recoil = 0.001,
        damage = 0.25,
        stress = nil,
        officer = { bone = 57597, x = 0.1, y = -0.13, z = -0.2, xRot = 180.0, yRot = -180.0, zRot = 0.0 },
        usual  = { bone = 57597, x = 0.1, y = -0.13, z = -0.2, xRot = 180.0, yRot = -180.0, zRot = 0.0 }
    },

    {
        name = 'WEAPON_MACHETE',
        model = 'prop_ld_w_me_machette',
        recoil = 0.001,
        damage = 0.5,
        stress = nil,
        officer = { bone = 57597, x = 0.1, y = -0.13, z = -0.2, xRot = 180.0, yRot = -180.0, zRot = 0.0 },
        usual  = { bone = 57597, x = 0.1, y = -0.13, z = -0.2, xRot = 180.0, yRot = -180.0, zRot = 0.0 }
    },

    {
        name = 'WEAPON_SWITCHBLADE',
        model = 'w_me_switchblade',
        recoil = 0.001,
        damage = 0.35,
        stress = nil,
        officer = { bone = 57597, x = 0.1, y = -0.13, z = -0.1, xRot = 180.0, yRot = -180.0, zRot = 0.0 },
        usual  = { bone = 57597, x = 0.1, y = -0.13, z = -0.1, xRot = 180.0, yRot = -180.0, zRot = 0.0 }
    },

    {
        name = 'WEAPON_KARAMBITKNIFE',
        model = 'w_me_karambitknife_01',
        recoil = 0.001,
        damage = 0.45,
        stress = nil,
        officer = { bone = 57597, x = 0.1, y = -0.13, z = -0.1, xRot = 180.0, yRot = -180.0, zRot = 0.0 },
        usual  = { bone = 57597, x = 0.1, y = -0.13, z = -0.1, xRot = 180.0, yRot = -180.0, zRot = 0.0 }
    },

    {
        name = 'WEAPON_SLEDGEHAMMER',
        model = 'w_me_sledgehammer',
        recoil = 0.001,
        damage = 0.45,
        stress = nil,
        officer = { bone = 24818, x = 0.5, y = -0.14, z = 0.0, xRot = 190.0, yRot = 185.0, zRot = 290.0 },
        usual  = { bone = 24818, x = 0.5, y = -0.14, z = 0.0, xRot = 190.0, yRot = 185.0, zRot = 290.0 }
    },

    {
        name = 'WEAPON_WRENCH',
        model = 'w_me_wrench',
        recoil = 0.001,
        damage = 0.35,
        stress = nil,
        officer = { bone = 57597, x = 0.1, y = -0.13, z = -0.1, xRot = 180.0, yRot = -180.0, zRot = 0.0 },
        usual  = { bone = 57597, x = 0.1, y = -0.13, z = -0.1, xRot = 180.0, yRot = -180.0, zRot = 0.0 }
    },

    {
        name = 'WEAPON_BATTLEAXE',
        model = 'w_me_battleaxe',
        recoil = 0.001,
        damage = 0.35,
        stress = nil,
        officer = { bone = 57597, x = 0.1, y = -0.13, z = -0.1, xRot = 180.0, yRot = -180.0, zRot = 0.0 },
        usual  = { bone = 57597, x = 0.1, y = -0.13, z = -0.1, xRot = 180.0, yRot = -180.0, zRot = 0.0 }
    },

    {
        name = 'WEAPON_KATANA',
        model = 'w_me_katana',
        recoil = 0.001,
        damage = 0.35,
        stress = nil,
        officer = { bone = 24818, x = 0.2, y = -0.15, z = 0.12, xRot = 0.0, yRot = -120.0, zRot = 0.0 },
        usual  = { bone = 24818, x = 0.2, y = -0.15, z = 0.12, xRot = 0.0, yRot = -120.0, zRot = 0.0 }
    },

    {
        name = 'WEAPON_CHERRYKATANAS',
        model = 'w_me_cherrykat_lr',
        recoil = 0.001,
        damage = 2.0,
        stress = nil,
        officer = { bone = 24818, x = 0.2, y = -0.15, z = 0.12, xRot = 0.0, yRot = -120.0, zRot = 0.0 },
        usual  = { bone = 24818, x = 0.2, y = -0.15, z = 0.12, xRot = 0.0, yRot = -120.0, zRot = 0.0 }
    },
        {
        name = 'WEAPON_STUNGUN',
        model = 'w_pi_stungun',
        recoil = 0.1,
        damage = 0.0,
        stress = nil,
        officer = { bone = 58271, x = -0.01, y = 0.05, z = -0.1, xRot = -70.0, yRot = 0.0, zRot = 0.0 },
        usual  = { bone = 58271, x = -0.01, y = 0.05, z = -0.1, xRot = -70.0, yRot = 0.0, zRot = 0.0 }
    },

    {
        name = 'WEAPON_HEAVYPISTOL',
        model = 'w_pi_heavypistol',
        recoil = 0.10,
        damage = 0.85,
        stress = 0.25,
        officer = { bone = 51826, x = -0.01, y = 0.1, z = 0.07, xRot = -115.0, yRot = 0.0, zRot = 0.0 },
        usual  = { bone = 57597, x = -0.01, y = -0.175, z = 0.0, xRot = -180.0, yRot = 135.0, zRot = 0.0 }
    },

    {
        name = 'WEAPON_REVOLVER',
        model = 'w_pi_revolver',
        recoil = 0.6,
        damage = 0.33,
        stress = nil,
        officer = { bone = 51826, x = -0.01, y = 0.1, z = 0.07, xRot = -115.0, yRot = 0.0, zRot = 0.0 },
        usual  = { bone = 57597, x = -0.01, y = -0.175, z = 0.0, xRot = -180.0, yRot = 135.0, zRot = 0.0 }
    },

    {
        name = 'WEAPON_APPISTOL',
        model = 'w_pi_appistol',
        recoil = 0.08,
        damage = 0.45,
        stress = 1.2,
        officer = { bone = 51826, x = -0.01, y = 0.1, z = 0.07, xRot = -115.0, yRot = 0.0, zRot = 0.0 },
        usual  = { bone = 57597, x = -0.01, y = -0.175, z = 0.0, xRot = -180.0, yRot = 135.0, zRot = 0.0 }
    },

    {
        name = 'WEAPON_PISTOL50',
        model = 'w_pi_pistol50',
        recoil = 0.17,
        damage = 0.43,
        stress = nil,
        officer = { bone = 51826, x = -0.01, y = 0.1, z = 0.07, xRot = -115.0, yRot = 0.0, zRot = 0.0 },
        usual  = { bone = 57597, x = 0.15, y = -0.175, z = -0.05, xRot = -180.0, yRot = 135.0, zRot = 0.0 }
    },
    {
        name = 'WEAPON_MINISMG',
        model = 'w_sb_minismg',
        recoil = 0.07,
        damage = 0.70,
        stress = 30.0,
        officer = { bone = 24818, x = 0.0, y = -0.135, z = 0.0, xRot = -180.0, yRot = 180.0, zRot = 0.0 },
        usual  = { bone = 24818, x = 0.0, y = -0.135, z = 0.0, xRot = -180.0, yRot = 180.0, zRot = 0.0 }
    },

    {
        name = 'WEAPON_MICROSMG',
        model = 'w_sb_microsmg',
        recoil = 2.0,
        damage = 0.0,
        stress = nil,
        officer = { bone = 24818, x = 0.05, y = -0.135, z = 0.0, xRot = -180.0, yRot = 180.0, zRot = 0.0 },
        usual  = { bone = 24818, x = 0.05, y = -0.135, z = 0.0, xRot = -180.0, yRot = 180.0, zRot = 0.0 }
    },
    {
        name = 'WEAPON_ASSAULTRIFLE',
        model = 'w_ar_assaultrifle',
        recoil = 0.11,
        damage = 0.69,
        stress = nil,
        officer = { bone = 24818, x = 0.125, y = -0.175, z = -0.125, xRot = 90.0, yRot = 180.0, zRot = 0.0 },
        usual  = { bone = 24818, x = 0.125, y = -0.175, z = -0.125, xRot = 90.0, yRot = 180.0, zRot = 0.0 }
    },

    {
        name = 'WEAPON_CARBINERIFLE',
        model = 'w_ar_carbinerifle',
        recoil = 0.11,
        damage = 0.72,
        stress = nil,
        officer = { bone = 24818, x = 0.125, y = -0.175, z = -0.125, xRot = 90.0, yRot = 180.0, zRot = 0.0 },
        usual  = { bone = 24818, x = 0.125, y = -0.175, z = -0.125, xRot = 90.0, yRot = 180.0, zRot = 0.0 }
    },
    {
        name = 'WEAPON_BULLPUPSHOTGUN',
        model = 'w_sg_bullpupshotgun',
        recoil = 0.2,
        damage = 0.7,
        stress = nil,
        officer = { bone = 24818, x = 0.0, y = -0.15, z = 0.0, xRot = 0.0, yRot = 0.0, zRot = 0.0 },
        usual  = { bone = 24818, x = 0.0, y = -0.15, z = 0.0, xRot = 0.0, yRot = 0.0, zRot = 0.0 }
    },
    {
        name = 'WEAPON_HEAVYSNIPER',
        model = 'w_sr_heavysnipermk2',
        recoil = 0.11,
        damage = 2.0,
        stress = nil,
        officer = { bone = 24818, x = 0.2, y = -0.175, z = 0.125, xRot = 90.0, yRot = 180.0, zRot = 0.0 },
        usual  = { bone = 24818, x = 0.2, y = -0.175, z = 0.125, xRot = 90.0, yRot = 180.0, zRot = 0.0 }
    },
    {
        name = 'WEAPON_RPG',
        model = 'w_lr_rpg',
        recoil = 1.0,
        damage = 5.0,
        stress = nil,
        officer = { bone = 24818, x = -0.2, y = -0.135, z = 0.0, xRot = -180.0, yRot = 180.0, zRot = 0.0 },
        usual  = { bone = 24818, x = -0.2, y = -0.135, z = 0.0, xRot = -180.0, yRot = 180.0, zRot = 0.0 }
    }
}
