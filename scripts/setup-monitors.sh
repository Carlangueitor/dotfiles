#!/bin/sh

# xrandr --output HDMI-1-2 --rotate left
xrandr --output HDMI-1-1 --right-of eDP-1-1
xrandr --output HDMI-1-2 --right-of HDMI-1-1
