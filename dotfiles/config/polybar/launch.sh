#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
# polybar -c $HOME/.config/polybar/config myi3 -r &

export TZ=Asia/Tokyo

for d in $(polybar --list-monitors | cut -d":" -f1); do
  if [[ $d == "HDMI-A-0" ]]; then
    TOWER=1
  fi
done

if type "xrandr"; then
  if [[ $TOWER == 1 ]]; then
    for m in $(polybar --list-monitors | cut -d":" -f1); do
      if [[ $m == "HDMI-A-0" ]]; then
        MONITOR=$m TRAY_POSITION=right polybar -c $HOME/.config/polybar/config myi3-tower -r &
        continue
      fi

      if [[ $m == "DisplayPort-0" || $m == "DisplayPort-1" ]]; then
        MONITOR=$m TRAY_POSITION=right polybar -c $HOME/.config/polybar/config myi3-tower -r &
        continue
      fi

      if [[ $m == "DisplayPort-2" ]]; then
        MONITOR=$m TRAY_POSITION=none polybar -c $HOME/.config/polybar/config myi3dp2 -r &
        continue
      fi

      MONITOR=$m TRAY_POSITION=none polybar -c $HOME/.config/polybar/config myi3 -r &
    done
  else
    for m in $(polybar --list-monitors | cut -d":" -f1); do
      if [[ $m == "eDP1" || $m == "HDMI-A-0" ]]; then
        MONITOR=$m TRAY_POSITION=right polybar -c $HOME/.config/polybar/config myi3 -r &
        continue
      fi

      if [[ $m == "DisplayPort-2" ]]; then
        hdmi1width=$(polybar --list-monitors | grep "HDMI1" | cut -d":" -f1 | cut -d"x" -f1)
        MONITOR=$m TRAY_POSITION=none polybar -c $HOME/.config/polybar/config myi3hdmi1 -r &
        continue
      fi

      MONITOR=$m TRAY_POSITION=none polybar -c $HOME/.config/polybar/config myi3 -r &
    done
  fi
else
  polybar -c $HOME/.config/polybar/config myi3 -r &
fi

echo "Polybar launched..."