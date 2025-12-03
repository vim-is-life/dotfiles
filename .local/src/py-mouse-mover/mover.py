#!/usr/bin/env python3
import math, sys
from random import randint

try:
    import pyautogui as pag
except Exception:
    print("error on importing pyautogui. did you activate the venv?", file=sys.stderr)

# globals and config
screen_width, screen_height = pag.size()
pag.PAUSE = 5  # 5 second delay between pyautogui calls
pag.FAILSAFE = True  # allow moving mouse to top left to end prog
PAG_MOVE_DURATION: int = 4


def main():
    try:
        while True:
            newX: int = randint(0, screen_width)
            newY: int = randint(0, screen_height)
            pag.moveTo(newX, newY, PAG_MOVE_DURATION)
    except KeyboardInterrupt:
        print("interrupt received, exiting script...")
        exit(0)


if __name__ == "__main__":
    main()
