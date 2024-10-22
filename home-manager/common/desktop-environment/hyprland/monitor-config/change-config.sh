#!/usr/bin/env bash

# At each invocation of this script, this script cycles through the next config from ~/.config/hypr/monitor-config/
# directory and symlinks it to ~/.config/hypr/monitor-config.nix

if [ -f ~/.config/hypr/monitor-config.conf ]; then
  CURRENT_CONFIG="$(readlink ~/.config/hypr/monitor-config.conf)"
  NEXT_CONFIG=$(find ~/.config/hypr/monitor-config/*.conf | grep -A 1 "$CURRENT_CONFIG" | tail -n 1)

  # if next config is the same as the current, start from the beginning of the list
  if [ "$NEXT_CONFIG" == "$CURRENT_CONFIG" ]; then
    NEXT_CONFIG=$(find ~/.config/hypr/monitor-config/*.conf | head -n 1)
  fi
else
  NEXT_CONFIG=$(find ~/.config/hypr/monitor-config/*.conf | head -n 1)
fi

ln -sf "$NEXT_CONFIG" ~/.config/hypr/monitor-config.conf
hyprctl reload
swww restore
