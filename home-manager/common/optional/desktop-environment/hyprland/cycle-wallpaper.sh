#!/usr/bin/env bash
# Directory where wallpapers are stored
WALLPAPER_DIR=~/Obrazy/Wallpapers

# Symlink target
DEFAULT_WALLPAPER="$WALLPAPER_DIR/default.jpg"

# Find all .jpg files except the default symlink
wallpapers=($(find "$WALLPAPER_DIR" -maxdepth 1 -type f -name "*.jpg" ! -name "default.jpg"))

# Read the last used wallpaper index
index_file="$WALLPAPER_DIR/.current_wallpaper_index"
if [ -f "$index_file" ]; then
  current_index=$(cat "$index_file")
else
  current_index=0
fi

# Increment the index to select the next wallpaper in round robin fashion
next_index=$(((current_index + 1) % ${#wallpapers[@]}))

# Get the next wallpaper path
next_wallpaper="${wallpapers[$next_index]}"

# Update the index file with the new index
echo "$next_index" >"$index_file"

# Remove the old symlink if it exists
[ -L "$DEFAULT_WALLPAPER" ] && rm "$DEFAULT_WALLPAPER"

# Create a new symlink to the next wallpaper
ln -s "$next_wallpaper" "$DEFAULT_WALLPAPER"

# Restart hyprpaper
pkill hyprpaper
hyprpaper &

echo "Wallpaper changed to $(basename "$next_wallpaper")"
