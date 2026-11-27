<div align="center">

# ❄️ Arch + Mango Wayland Dotfiles

**A cohesive, Nord-inspired Wayland desktop environment tailored for Arch Linux.**

![OS](https://img.shields.io/badge/OS-Arch%20Linux-1793D1?style=for-the-badge&logo=arch-linux&logoColor=white)
![Display](https://img.shields.io/badge/Display-Wayland-FFBC00?style=for-the-badge&logo=wayland&logoColor=black)
![Theme](https://img.shields.io/badge/Palette-Nord%20%2F%20OneNord-88C0D0?style=for-the-badge)

<!-- Drop a screenshot of your desktop here! -->
<!-- ![Desktop Preview](assets/preview.png) -->

</div>

---

## 🧩 Stack Overview

| Component | Tool | Highlights & Notes |
| :--- | :--- | :--- |
| **Compositor** | [`mango`](.config/mango) | Modular setup (`config`, `appearance`, `input`, `keybinds`, `monitors`) |
| **Status Bar** | [`mangobar`](.config/mangobar) | Custom Nord bar with interactive audio controls, power menu, & wireless headset battery script |
| **Terminal** | [`kitty`](.config/kitty) | GPU-accelerated terminal styling & font configuration |
| **App Launcher** | [`fuzzel`](.config/fuzzel) | Fast, native Wayland application launcher |
| **Notifications** | [`dunst`](.config/dunst) | Minimalist notification daemon rules & Nord styling |
| **Editor** | [`zed`](.config/zed) | Zed editor preferences and workspace settings |
| **Qt Theming** | [`qt6ct`](.config/qt6ct) | Unified Qt6 appearance using the `OneNordDark` color palette |
| **Portals** | [`xdg-desktop-portal`](.config/xdg-desktop-portal) | Screen sharing, file pickers, and `wlr` portal integration |

---

## 📂 Repository Structure

```text
dotfiles/
├── .config/
│   ├── dunst/                  # Notification daemon
│   │   └── dunstrc
│   ├── fuzzel/                 # App launcher
│   │   └── fuzzel.ini
│   ├── kitty/                  # Terminal emulator
│   │   └── kitty.conf
│   ├── mango/                  # Wayland compositor
│   │   ├── appearance.conf
│   │   ├── config.conf
│   │   ├── input.conf
│   │   ├── keybinds.conf
│   │   └── monitors.conf
│   ├── mangobar/               # Custom status bar & scripts
│   │   ├── audio.sh
│   │   ├── config.jsonc
│   │   ├── headset-battery.sh
│   │   ├── power-menu.sh
│   │   └── style.css
│   ├── qt6ct/                  # Qt6 theming
│   │   ├── colors/
│   │   │   └── OneNordDark.conf
│   │   └── qt6ct.conf
│   ├── xdg-desktop-portal/     # Wayland portals
│   │   └── mango-portals.conf
│   ├── xdg-desktop-portal-wlr/
│   │   └── config
│   └── zed/                    # Code editor
│       └── settings.json
└── README.md
