#!/bin/sh
xrandr --output eDP-1 --primary --mode 2560x1600 --pos 0x0 --rotate normal --output DisplayPort-1 --off --output DisplayPort-2 --off --output DisplayPort-3 --off --output DisplayPort-4 --off --output DisplayPort-5 --off --output DisplayPort-6 --off --output DisplayPort-7 --off --output DisplayPort-8 --off --output DisplayPort-9 --off --output DisplayPort-10 --off --output DisplayPort-11 --off --output eDP-1-0 --off --output DisplayPort-1-0 --off
bspc wm -r
bspc config top_padding 24	# top_padding I set equal to polybar's height
# bspc config -m eDP-1 top_padding 24
