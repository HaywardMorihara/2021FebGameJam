# Make Amaze!
Check it out here: https://murphysdad.itch.io/make-amaze

Created for the 
[GDFG 2021 February Game Jam](https://itch.io/jam/gdfgs-monthly-game-jam-2)

Built with Godot

# Notes:
## TODO
- See WhatsApp and itch.io feedback
- Improve HUD (Make it clear that you've won vs loss)
- Worldbuild
- Redo walker
- Make tiles look nice
- Improve Main Menu
- Improve Level Menu
- Sound Effects
- Music
- Drag and place blocks (instead of individual presses)
- Have a "Best Time"
- There are still bugs with the walker not completing the path sometimes. Unable to reproduce reliably
- It seems like the longest maze is actually the horizontal lanes? vs any of the other optimal ones?
- Multiple Walkers?
- Multiple Destinations?

## Development
- A little documentation on instancing/scene/shared properties: [https://www.reddit.com/r/godot/comments/drc82n/gdscript_instance_unique_material/](https://www.reddit.com/r/godot/comments/drc82n/gdscript_instance_unique_material/)
- I wonder if it's a bad practice to be modifying the scene child the way I am with the tilemap for the map

## Level Design:
- Starting/destination positions (central is harder)
- Beginning # unmovable blocks
- Limit # of blocks
- Diagonals are faster...is this a feature or a bug?

## Android Commands
- `adb devicces`
- `adb install <YOUR_FILE>.apk`
- Should be able to just unplug, unless I turned on FIle Transfer (by going into Setting > Connected Devices > USB and selectin file transfer)
- OHHH I believe I have trouble exporting an Android app in NOT debug mode (that's when I get the keystore error, I think). Wonder if I need to generate a new key or something for that
