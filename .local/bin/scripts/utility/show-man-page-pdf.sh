#!/usr/bin/env sh
set -xe

# DMENU=dmenu
DMENU="rofi -dmenu"

SELECTED_LINE=$(apropos . | $DMENU -l 20 -p 'desired manpage?')
MAN_PG=$(echo $SELECTED_LINE | cut -d' ' -f1)
# last part gets rid of the parens
MAN_SECT=$(echo $SELECTED_LINE | cut -d' ' -f2 | sed 's,(,,; s,),,')

# open the man page in zathura. could easily be changed to open up in different
# pdf viewer
man -Tpdf $MAN_SECT $MAN_PG | zathura -
