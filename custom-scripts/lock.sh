#!/usr/bin/env zsh

BLANK='#00000000'
DEFAULT='#0a4cf6cc'
TEXT='#cce6ffff'
WRONG='#ff4d00ff'
VERIFYING='#ffea00ff'
TYPING='#00f0ffff'
BACKSPACE='#bf66ffff'

i3lock \
    --insidever-color=$BLANK \
    --ringver-color=$VERIFYING \
    \
    --insidewrong-color=$BLANK \
    --ringwrong-color=$WRONG \
    \
    --inside-color=$BLANK \
    --ring-color=$DEFAULT \
    --line-color=$BLANK \
    --separator-color=$DEFAULT \
    \
    --verif-color=$TEXT \
    --wrong-color=$WRONG \
    --time-color=$TEXT \
    --date-color=$TEXT \
    --layout-color=$TEXT \
    --keyhl-color=$TYPING \
    --bshl-color=$BACKSPACE \
    \
    --screen 1 \
    --blur 5 \
    --clock \
    --indicator \
    --time-str="%H:%M:%S" \
    --date-str="%A, %Y-%m-%d" \
    --keylayout 1 \
    -i=$HOME/.config/wallpaper/overmind.jpg \
    \
    --greeter-text="System Locked" \
    --greeter-color=$TEXT \
    --greeter-pos="ix:iy-120" \
    --greeter-font="monospace" \
    --greeter-size=24 \
