HS Weapon System
QB-Core • 0r-hud • qb-hud Compatible

Custom Weapon Core System untuk FiveM (QB-Core).
Mengatur recoil, stress, damage modifier, dan weapon prop dalam satu sistem terintegrasi.

==================================================

OVERVIEW

Script ini mengontrol:

* Recoil per senjata
* Stress system (0r-hud / qb-hud selectable)
* Damage modifier
* Weapon on back (prop attach system)
* Full config via Config.Weapons

Dirancang untuk:

* Server RP
* Balance gameplay
* Aman dari abuse client

==================================================

FEATURES

QB-Core Integration

* Menggunakan metadata player (stress)
* Stress tersimpan server-side
* Tidak hilang saat relog
* Aman dari exploit client
* Bisa diakses resource lain

Recoil System

* Recoil berbeda tiap weapon
* Mode recoil: shake / top / mix
* Fully configurable
* Tidak mengubah damage kecuali diatur

Stress System
Support:

* 0r-hud
* qb-hud

Dipilih lewat config:

Config.StressSystem = '0r-hud'
atau
Config.StressSystem = 'qb-hud'

Cara Kerja:

* Stress bertambah saat menembak
* Bisa set per-weapon:
  stress = 0.2
* Jika:
  stress = nil
  maka tidak menambah stress
* Menggunakan cooldown per tembakan
* Batas min & max bisa diatur

Damage Modifier
Menggunakan native GTA:
SetWeaponDamageModifier(weaponHash, value)

Contoh:
damage = 0.75

Tidak membuat instant headshot
Tidak mengubah critical hit jika tidak diaktifkan

==================================================

WEAPON ON BACK SYSTEM

* Senjata terlihat di badan player
* Posisi berbeda untuk officer dan civilian
* Disable prop dengan:
  x = 65536.0

==================================================

STRESS CONFIG EXAMPLE

Config.Stress = {
enabled = true,
defaultPerShot = 0.5,
shotCooldown = 300,
min = 0,
max = 100
}

==================================================

WEAPON CONFIG EXAMPLE

[`WEAPON_PISTOL`] = {
name = 'WEAPON_PISTOL',
damage = 0.45,
recoil = 0.18,
stress = 0.2,
officer = { bone = 51826, x = -0.01, y = 0.1, z = 0.07, xRot = -115.0, yRot = 0.0, zRot = 0.0 },
usual = { bone = 57597, x = -0.01, y = -0.175, z = 0.0, xRot = -180.0, yRot = 135.0, zRot = 0.0 },
model = 'w_pi_pistol',
category = 'pistol'
}

==================================================

REQUIREMENTS

* QB-Core
* ox_lib
* (optional) 0r-hud atau qb-hud

==================================================

INSTALLATION

1. Masukkan folder ke:
   resources/[local]/

2. Tambahkan di server.cfg:
   ensure hs_ricoil

3. Restart server.

==================================================

NOTES

* Gunakan `WEAPON_HASH` (backtick), bukan string biasa.
* Jangan lupa koma setelah setiap field di config.
* Jika config error, seluruh script gagal load.
* Script ini hanya mengontrol weapon system, bukan sistem inventory.

==================================================

END
