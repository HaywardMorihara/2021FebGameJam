# 2021 February Game Jam Game
[https://itch.io/jam/gdfgs-monthly-game-jam-2](https://itch.io/jam/gdfgs-monthly-game-jam-2)

# Polishing TODOS:
- I don't think level 4 is possible? Need to make the Timer less
- Playtesting
- Worldbuild (Shrinking snowman)
- Redo Walker Sprite
- Redo Tile 1
- Redo Tile 2
- Redo Tile 3
- Adjust speeds, timers
- Improve HUD (Make it clear that you've won vs loss)
- Improve Main Menu
- Improve Level Menu
- Publish

# Enhanements
- Stop player from placing a block that would make the level impossible
- Sound Effects
- App Icon
- Music
- Drag and place blocks (instead of individual presses)
- Have a "Best Time"
- There are still bugs with the walker not completing the path sometimes. Unable to reproduce reliably
- It seems like the longest maze is actually the horizontal lanes? vs any of the other optimal ones?
- Multiple Walkers?
- Multiple Destinations?

# Level Design:
- Starting positions
- Beginning # unmovable blocks
- Limit # of blocks

# Notes:
- A little documentation on instancing/scene/shared properties: [https://www.reddit.com/r/godot/comments/drc82n/gdscript_instance_unique_material/](https://www.reddit.com/r/godot/comments/drc82n/gdscript_instance_unique_material/)
- I wonder if it's a bad practice to be modifying the scene child the way I am with the tilemap for the map

## Android Commands
- `adb devicces`
- `adb install <YOUR_FILE>.apk`
- Should be able to just unplug, unless I turned on FIle Transfer (by going into Setting > Connected Devices > USB and selectin file transfer)
