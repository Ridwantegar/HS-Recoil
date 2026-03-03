# Weapon System + Stress (QB-Core & 0r-hud Compatible)

Script ini adalah **sistem senjata custom untuk FiveM (QB-Core)** yang mengatur:

- 🎯 Recoil senjata
- 🧠 Stress player (terintegrasi dengan **qb-core metadata** & **0r-hud**)
- 🔫 Damage modifier senjata
- 🎒 Weapon prop (senjata terlihat di badan player)
- ⚙️ Fully configurable lewat `Config.Weapons`

Script ini **TIDAK membuat instant headshot kill** dan **TIDAK menambah stress ke senjata yang belum diset**.

---

## ✨ Fitur Utama

### ✅ QB-Core Integration
- Menggunakan **metadata player (`stress`)**
- Stress disimpan di server (tidak hilang saat relog)
- Aman dari exploit client
- Bisa diakses oleh admin / resource lain

### ✅ Recoil System
- Recoil berbeda tiap senjata
- Efek kamera:
  - `shake`
  - `drunk`
- Tidak mempengaruhi damage langsung

### ✅ Stress System (0r-hud)
- Stress **HANYA bertambah jika senjata punya `stress`**
- Tidak ada fallback `defaultPerShot`
- Cooldown per tembakan
- Update HUD realtime

### ✅ Damage Modifier
- Menggunakan native GTA:
  ```lua
  SetWeaponDamageModifier(weaponHash, value)
