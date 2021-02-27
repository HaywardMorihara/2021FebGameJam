# 2021 February Game Jam Game
[https://itch.io/jam/gdfgs-monthly-game-jam-2](https://itch.io/jam/gdfgs-monthly-game-jam-2)

# Polishing TODOS:
- Bold font
- Publish game

# If I find myself w/ time:
- Improve HUD (Make it clear that you've won vs loss)
- Worldbuild
- Redo walker
- Make tiles look nice
- Improve Main Menu
- Improve Level Menu

# Enhancements
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
- Starting/destination positions (central is harder)
- Beginning # unmovable blocks
- Limit # of blocks
- Diagonals are faster...is this a feature or a bug?

# Notes:
- A little documentation on instancing/scene/shared properties: [https://www.reddit.com/r/godot/comments/drc82n/gdscript_instance_unique_material/](https://www.reddit.com/r/godot/comments/drc82n/gdscript_instance_unique_material/)
- I wonder if it's a bad practice to be modifying the scene child the way I am with the tilemap for the map

## Android Commands
- `adb devicces`
- `adb install <YOUR_FILE>.apk`
- Should be able to just unplug, unless I turned on FIle Transfer (by going into Setting > Connected Devices > USB and selectin file transfer)
