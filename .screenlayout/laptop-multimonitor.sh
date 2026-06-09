#!/bin/sh
[ "$(bspc query --monitors --names | wc -l)" = "4" ] && exit
xrandr --output eDP-1 --mode 2560x1600 --pos 0x0 --rotate normal --output DisplayPort-1 --off --output DisplayPort-2 --off --output DisplayPort-3 --off --output DisplayPort-4 --off --output DisplayPort-5 --off --output DisplayPort-6 --off --output DisplayPort-7 --off --output DisplayPort-8 --off --output DisplayPort-9 --mode 1920x1080 --pos 6400x0 --rotate normal --output DisplayPort-10 --primary --mode 1920x1080 --pos 4480x0 --rotate normal --output DisplayPort-11 --mode 1920x1080 --pos 2560x0 --rotate normal --output eDP-1-0 --off --output DisplayPort-1-0 --off
bspc wm -r
bspc config -m eDP-1 top_padding 0
bspc config -m DisplayPort-11 top_padding 0
bspc config -m DisplayPort-9 top_padding 0
bspc desktop -f 1
