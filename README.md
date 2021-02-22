# 2021 February Game Jam Game
[https://itch.io/jam/gdfgs-monthly-game-jam-2](https://itch.io/jam/gdfgs-monthly-game-jam-2)

# Polishing TODOS:
- Display temporary error when you try and place a block and you can't plae anymore
- Adjust outlines on green tiles
- Error when there isn't a valid path, before it starts. maybe when the block is placed or maybe okay if there's a retry option
- Option to retry and keep the maze as you've made it so far. Maybe that should just be the default every time
- Make it clear that you've won vs loss
- Message at the start of the level (helpful for tutorial)
- Playtesting
- Improve HUD
- Improve Main Menu
- Improve Level Menu
- Worldbuild (Shrinking snowman)
- Redo Walker Sprite
- Redo Tile 1
- Redo Tile 2
- Redo Tile 3
- Music
- Sound Effects
- App Icon
- Drag and place blocks (instead of individual presses)
- Have a "Best Time"
- There are still bugs with the walker not completing the path sometimes. Unable to reproduce reliably
- It seems like the longest maze is actually the horizontal lanes? vs any of the other optimal ones?

# PUBLISH TO ALL PLATFORMS!

# Possible Features
- Multiple Walkers?
- Multiple Destinations?

# Level Design:
- Starting positions
- Beginning # of blocks
- Limit # of blocks

# Notes:
- A little documentation on instancing/scene/shared properties: [https://www.reddit.com/r/godot/comments/drc82n/gdscript_instance_unique_material/](https://www.reddit.com/r/godot/comments/drc82n/gdscript_instance_unique_material/)
- I wonder if it's a bad practice to be modifying the scene child the way I am with the tilemap for the map

## Android Commands
- `adb devicces`
- `adb install <YOUR_FILE>.apk`
- Should be able to just unplug, unless I turned on FIle Transfer (by going into Setting > Connected Devices > USB and selectin file transfer)
