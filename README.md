# Dotfiles

Personal Arch Linux Wayland configuration files, symlinked from `~/dotfiles` into `~/.config` (and `$HOME`).

## Overview

| Component | Tool / Config | Notes |
| :--- | :--- | :--- |
| **Status Bar** | [`mangobar`](.config/mangobar) | Custom Nord-styled bar (`config.jsonc`, `style.css`) with audio controls, power menu, and wireless headset battery script |
| **Terminal** | [`kitty`](.config/kitty) | Terminal emulator configuration |
| **App Launcher** | [`fuzzel`](.config/fuzzel) | Wayland application launcher config |
| **Notifications** | [`dunst`](.config/dunst) | Lightweight notification daemon styling & rules |
| **Editor** | [`zed`](.config/zed) | Zed editor settings & keybindings |
| **Qt Theming** | [`qt6ct`](.config/qt6ct) | Qt6 application appearance & palette settings |
| **Wayland Portals** | [`xdg-desktop-portal`](.config/xdg-desktop-portal) & [`xdg-desktop-portal-wlr`](.config/xdg-desktop-portal-wlr) | Screen sharing, file pickers, and wlroots portal integration |
| **Wayland Flags** | [`discord-flags.conf`](.config/discord-flags.conf) & [`electron-flags.conf`](.config/electron-flags.conf) | Native Wayland / Ozone flags for Electron apps and Discord |

## Structure

```text
dotfiles/
├── .config/
│   ├── dunst/
│   │   └── dunstrc
│   ├── fuzzel/
│   │   └── fuzzel.ini
│   ├── kitty/
│   │   └── kitty.conf
│   ├── mango/
│   │   ├── appearance.conf
│   │   ├── config.conf
│   │   ├── input.conf
│   │   ├── keybinds.conf
│   │   └── monitors.conf
│   ├── mangobar/
│   │   ├── audio.sh
│   │   ├── config.jsonc
│   │   ├── headset-battery.sh
│   │   ├── power-menu.sh
│   │   └── style.css
│   ├── qt6ct/
│   │   ├── colors/
│   │   │   └── OneNordDark.conf
│   │   └── qt6ct.conf
│   ├── xdg-desktop-portal/
│   │   └── mango-portals.conf
│   ├── xdg-desktop-portal-wlr/
│   │   └── config
│   └── zed/
│   │   └── settings.json
└── README.md
