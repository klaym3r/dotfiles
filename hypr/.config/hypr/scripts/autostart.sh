#!/bin/bash
#
# GTK тема
gsettings set org.gnome.desktop.interface gtk-theme 'catppuccin-frappe-sky-standart+default'
gsettings set org.gnome.desktop.interface icon-theme 'oomox-Catppuccin-Frappe'
gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Ice'

# Qt тема
export QT_QPA_PLATFORMTHEME=qt5ct

# Применить к gtk4 apps
export GTK_THEME=catppuccin-frappe-sky-standart+default
