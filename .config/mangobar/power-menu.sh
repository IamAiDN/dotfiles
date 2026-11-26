#!/usr/bin/env bash

menu() {
    fuzzel --dmenu \
        --anchor top-right \
        --x-margin 10 \
        --y-margin 32 \
        --width 24 \
        --lines "$1" \
        --prompt "$2"
}

choice=$(printf "  Power Off\n  Restart\n  Restart into Windows" | menu 3 "Power > ")

[ -z "$choice" ] && exit 0

confirm=$(printf "  Cancel\n  Confirm %s" "$choice" | menu 2 "Are you sure? > ")

case "$confirm" in
    *"Power Off")
        systemctl poweroff
        ;;
    *"Restart into Windows")
        # Prompts for password via fuzzel (--password); empty/Esc cancels before rebooting
        pw=$(printf "" | fuzzel --dmenu --password \
            --anchor top-right \
            --x-margin 10 \
            --y-margin 32 \
            --width 24 \
            --lines 0 \
            --prompt "Sudo password (Esc to cancel) > ")

        [ -z "$pw" ] && exit 0

        if printf '%s\n' "$pw" | sudo -S efibootmgr -n 0002 >/dev/null 2>&1; then
            systemctl reboot
        else
            notify-send "Power Menu" "Wrong password or cancelled — reboot aborted."
        fi
        ;;
    *"Restart")
        systemctl reboot
        ;;
    *)
        exit 0
        ;;
esac
