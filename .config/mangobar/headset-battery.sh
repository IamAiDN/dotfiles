#!/usr/bin/env bash

# Uses Nerd Font headphone icon: 󰋋 (U+F02CB)
ICON="󰋋"

get_upower_battery() {
    command -v upower >/dev/null 2>&1 || return 1

    for dev in $(upower -e 2>/dev/null); do
        case "$dev" in
            *headset* | *headphone* | *btd* | *bluez* | *battery_*)
                info=$(upower -i "$dev" 2>/dev/null)
                pct=$(printf '%s\n' "$info" | awk -F: '/percentage:/ {gsub(/[^0-9]/, "", $2); print $2; exit}')
                if [[ -n "$pct" ]]; then
                    printf '%s\n' "$pct"
                    return 0
                fi
                ;;
        esac
    done
    return 1
}

get_bluetoothctl_battery() {
    command -v bluetoothctl >/dev/null 2>&1 || return 1

    # Check connected devices and look for a Battery Percentage property
    while IFS= read -r mac; do
        [[ -z "$mac" ]] && continue
        pct=$(bluetoothctl info "$mac" 2>/dev/null | awk -F'[()]' '/Battery Percentage:/ {gsub(/[^0-9]/, "", $2); print $2; exit}')
        if [[ -n "$pct" ]]; then
            printf '%s\n' "$pct"
            return 0
        fi
    done < <(bluetoothctl devices Connected 2>/dev/null | awk '{print $2}')

    return 1
}

pct=$(get_upower_battery || get_bluetoothctl_battery || true)

if [[ -z "$pct" ]]; then
    # Output nothing so the pill stays hidden when disconnected or unsupported
    exit 0
fi

# Print class on line 2 if your bar/script uses class states, or just the formatted string:
if (( pct <= 15 )); then
    printf "%s %s%%\n" "$ICON" "$pct"
else
    printf "%s %s%%\n" "$ICON" "$pct"
fi
