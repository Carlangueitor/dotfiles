#!/bin/sh

xrandr --output DP-2 --rotate left
xrandr --output HDMI-1 --left-of eDP-1
xrandr --output DP-2 --left-of HDMI-1
