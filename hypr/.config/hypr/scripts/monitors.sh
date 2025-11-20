#!/usr/bin/bash

if hyprctl monitors | grep -q "HDMI-A-1"; then
  hyprctl reload
  hyprctl keyword monitor "eDP-1, 1920x1080@60, 0x1080, 1.25"
  hyprctl keyword monitor "HDMI-A-1, 1920x1080@119, 0x0, 1"
  hyprctl keyword workspace "1, monitor:HDMI-A-1"
  hyprctl keyword workspace "2, monitor:eDP-1"
  hyprctl keyword workspace "3, monitor:eDP-1"
  hyprctl keyword workspace "4, monitor:eDP-1"
  hyprctl keyword workspace "5, monitor:eDP-1"
else
  hyprctl reload
  hyprctl keyword monitor "eDP-1, 1920x1080@60, 0x0, 1.25"
  hyprctl keyword workspace "1, monitor:eDP-1"
  hyprctl keyword workspace "2, monitor:eDP-1"
  hyprctl keyword workspace "3, monitor:eDP-1"
  hyprctl keyword workspace "4, monitor:eDP-1"
  hyprctl keyword workspace "5, monitor:eDP-1"
fi
