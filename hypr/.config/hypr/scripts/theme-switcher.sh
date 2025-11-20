#!/bin/bash

# === КОНФИГУРАЦИЯ ===
STATE_FILE="$HOME/.config/hypr/theme_state"
WAYBAR_CONFIG_DIR="$HOME/.config/waybar"
KITTY_CONFIG_DIR="$HOME/.config/kitty"
MAKO_CONFIG_DIR="$HOME/.config/mako"

WALLPAPER_DIR="$HOME/.config/hypr/Wallpapers/"
WALLPAPER_LIGHT="frieren_gruvbox.png"
WALLPAPER_DARK="harbor.jpg"

# === ОПРЕДЕЛЕНИЕ ТЕКУЩЕЙ ТЕМЫ ===
if [ ! -f "$STATE_FILE" ]; then echo "light" > "$STATE_FILE"; fi
CURRENT_MODE=$(cat "$STATE_FILE")

if [ "$CURRENT_MODE" == "dark" ]; then
  NEW_MODE="light"

  GTK_THEME="Gruvbox-BL-LB-Light-Soft"
  ICON_THEME="Papirus-Light"

  HYPR_BORDER_ACTIVE="rgba(b8bb26ff) rgba(fabd2fff) 45deg"
  HYPR_BORDER_INACTIVE="rgba(928374aa)"

  CURRENT_WALLPAPER="$WALLPAPER_DIR/$WALLPAPER_LIGHT"

  ln -sf "$WAYBAR_CONFIG_DIR/colors-light.css" "$WAYBAR_CONFIG_DIR/colors.css"
  ln -sf "$MAKO_CONFIG_DIR/config_light" "$MAKO_CONFIG_DIR/config"
  ln -sf "$KITTY_CONFIG_DIR/gruvbox_light.conf" "$KITTY_CONFIG_DIR/current-theme.conf"
else
  NEW_MODE="dark"

  GTK_THEME="catppuccin-mocha-green-standard+default"
  ICON_THEME="Papirus-Dark"

  HYPR_BORDER_ACTIVE="rgba(89b4faff) rgba(cba6f7ff) 45deg"
  HYPR_BORDER_INACTIVE="rgba(585b70aa)"

  CURRENT_WALLPAPER="$WALLPAPER_DIR/$WALLPAPER_DARK"

  ln -sf "$WAYBAR_CONFIG_DIR/colors-dark.css" "$WAYBAR_CONFIG_DIR/colors.css"
  ln -sf "$MAKO_CONFIG_DIR/config_dark" "$MAKO_CONFIG_DIR/config"
  ln -sf "$KITTY_CONFIG_DIR/catppuccin-mocha.conf" "$KITTY_CONFIG_DIR/current-theme.conf"
fi

echo "$NEW_MODE" > "$STATE_FILE"

swww img "$CURRENT_WALLPAPER" \
  --transition-type grow \
  --transition-pos 0.85,0.85 \
  --transition-step 90 \
  --transition-fps 60 \
  --transition-duration 2

gsettings set org.gnome.desktop.interface gtk-theme "$GTK_THEME"
gsettings set org.gnome.desktop.interface icon-theme "$ICON_THEME"
gsettings set org.gnome.desktop.interface color-scheme "prefer-$NEW_MODE"

hyprctl keyword general:col.active_border "$HYPR_BORDER_ACTIVE"
hyprctl keyword general:col.inactive_border "$HYPR_BORDER_INACTIVE"

makoctl reload

killall -SIGUSR2 waybar
killall -SIGUSR1 kitty
killall -SIGUSR1 nvim

notify-send "System Theme" "Switched to $NEW_MODE mode"
