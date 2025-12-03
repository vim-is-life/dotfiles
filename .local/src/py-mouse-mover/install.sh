#!/usr/bin/env sh
set -e

INSTAL_DIR=~/.local/bin/
SOURCE_FILE="$PWD/mouse-mover"
INSTALL_FILE="$INSTAL_DIR/mouse-mover"

# ensure deps
python3 -m venv venv
. venv/bin/activate
pip install pyautogui

# copy to script dir
ln -s "$SOURCE_FILE" "$INSTALL_FILE"
