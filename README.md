# Weapon System + Stress (QB-Core & 0r-hud Compatible)

Skrip sistem senjata ini dirancang untuk FiveM dengan integrasi QB-Core dan 0r-hud. Fitur-fitur utama meliputi recoil senjata, sistem stress, modifier damage, dan prop senjata yang terlihat oleh semua pemain.

## Fitur Utama

### QB-Core Integration
- Menggunakan `metadata` dari pemain untuk `stress`.
- Stress disimpan di server dan persisten saat relog.
- Aman dari eksploitasi client.

### Recoil System
- Recoil dapat dikonfigurasi per senjata.
- Mendukung efek kamera: `shake` atau `drunk`.
- Recoil tidak mengubah damage secara langsung.

### Stress System (0r-hud)
- Stress hanya bertambah jika senjata memiliki parameter `stress`.
- Tidak ada fallback `defaultPerShot`.
- Cooldown antara tembakan untuk mencegah spam.
- Kompatibel dengan 0r-hud untuk menampilkan stress.

### Damage Modifier
- Menggunakan native GTA: `SetWeaponDamageModifier(weaponHash, value)`.
- Damage dapat diatur per senjata tanpa mengubah damage global.

### Weapon Prop System
- Senjata terlihat di badan player dan disinkronkan ke semua pemain (networked).
- Prop otomatis hilang saat senjata di-equip atau pemain mati/unload.

## Konfigurasi Senjata

Semua senjata diatur di `Config.Weapons`. Contoh:

```lua
Config.Weapons = {
    {
        name = 'WEAPON_PISTOL',
        model = 'w_pi_pistol',
        recoil = 0.1,
        damage = 0.8,
        stress = 0.5,
        officer = { bone = 24818, x = 0.15, y = -0.15, z = 0.0, xRot = 0.0, yRot = 180.0, zRot = 0.0 },
        usual  = { bone = 24818, x = 0.15, y = -0.15, z = 0.0, xRot = 0.0, yRot = 180.0, zRot = 0.0 }
    }
}