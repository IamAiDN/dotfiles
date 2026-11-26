#!/usr/bin/env bash

MONITOR_SINK="alsa_output.pci-0000_09_00.1.hdmi-stereo"
HEADSET_SINK="alsa_output.usb-Logitech_PRO_X_Wireless_Gaming_Headset-00.analog-stereo"

case "${1:-status}" in
    up)
        wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
        wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+
        ;;
    down)
        wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
        ;;
    mute)
        wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        ;;
    next-sink)
        current="$(pactl get-default-sink)"
        if [ "$current" = "$HEADSET_SINK" ]; then
            pactl set-default-sink "$MONITOR_SINK"
        else
            pactl set-default-sink "$HEADSET_SINK"
        fi
        ;;
    status)
        vol_line="$(wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>/dev/null)"
        [ -z "$vol_line" ] && { echo "󰖁 n/a"; exit 0; }

        vol_pct="$(awk '{ printf "%d", $2 * 100 }' <<< "$vol_line")"
        muted=0
        grep -q "MUTED" <<< "$vol_line" && muted=1

        current="$(pactl get-default-sink)"
        case "$current" in
            "$HEADSET_SINK")
                dev_label="󰋋 Headset"
                ;;
            "$MONITOR_SINK")
                dev_label="󰍹 Monitor"
                ;;
            *)
                dev_label="󰓃 Other"
                ;;
        esac

        if [ "$muted" -eq 1 ]; then
            echo "󰝟 ${vol_pct}% · $dev_label"
        else
            if [ "$vol_pct" -eq 0 ]; then
                icon="󰕿"
            elif [ "$vol_pct" -lt 50 ]; then
                icon="󰖀"
            else
                icon="󰕾"
            fi
            echo "$icon ${vol_pct}% · $dev_label"
        fi
        ;;
esac
