```md
# 🔒 0Gravity - Weapon Lock System (Free Version)

A lightweight standalone script for FiveM that allows players to lock and unlock their firearms using a single key. Created with ox_lib integration and designed for easy expansion.

> 📖 **Full Documentation:**  
> 👉 [https://0grav1ty.gitbook.io/zerogravity/0gravity-weapon-lock-or-free](https://0grav1ty.gitbook.io/zerogravity/0gravity-weapon-lock-or-free)

---

## 🚀 Features

- 🔐 Toggle firearm lock/unlock with key (default `L`)
- 🛡️ Prevents players from firing while weapon is locked
- 💬 Clean ox_lib notifications and progress bar
- ⚙️ Configurable lock time and cooldown
- 🧩 Easy-to-edit weapon whitelist
- ⚡ Fast, lightweight, no framework required

---

## 🧠 How It Works

1. Player presses `L` to toggle lock state.
2. If the player is holding a configured weapon:
   - It becomes locked.
   - Firing (`LMB`, `RMB`) is disabled.
3. Pressing `L` again triggers a progress bar and unlocks the weapon.
4. If the player tries to shoot while locked, they receive a notification.

---

## 🛠️ Installation

1. Place the resource in your `resources` folder.
2. Add the following lines to your `server.cfg`:
   ```
   ensure ox_lib
   ensure 0gravity_weaponlock
   ```

---

## ⚙️ Configuration

Edit `config.lua`:

```lua
Config.ToggleKey = 182 -- L key
Config.UnlockTime = 3000 -- in milliseconds
Config.NotifyCooldown = 2000 -- time between "locked" notifications

Config.FireWeapons = {
    "WEAPON_PISTOL",
    "WEAPON_COMBATPISTOL",
    "WEAPON_APPISTOL",
    "WEAPON_SMG",
    "WEAPON_ASSAULTRIFLE",
    "WEAPON_CARBINERIFLE",
    "WEAPON_SNIPERRIFLE"
}
```

You can modify the keybind, unlock duration, notification delay, and the allowed weapon list.

---

## 💡 Requirements

- ✅ [ox_lib](https://overextended.dev/ox_lib/) (make sure it’s installed and started first)

---

## 📂 File Structure

```
0gravity_weaponlock/
├── client.lua
├── config.lua
├── fxmanifest.lua
```

---

## 🧪 Example Notification

```
🔔 Broń zablokowana
Naciśnij [L], aby odblokować broń!
```

---

## 📘 Full Docs

For advanced configuration, updates, or visual previews, visit the GitBook:

👉 **[https://0grav1ty.gitbook.io/zerogravity/0gravity-weapon-lock-or-free](https://0grav1ty.gitbook.io/zerogravity/0gravity-weapon-lock-or-free)**

---

## 📜 License

MIT License

---

## 🤝 Need Help?

Join the community:  
📬 [Discord](https://discord.gg/YbuNXpwkWY)
```
