# Make Amaze!
Check it out here: https://murphysdad.itch.io/make-amaze

Created for the 
[GDFG 2021 February Game Jam](https://itch.io/jam/gdfgs-monthly-game-jam-2)

Built with Godot

# Notes:
## TODO
- Drag and place blocks (instead of individual presses)
- Make game playable right on Itch.io
- Publish to Android store
- Polish itch page (screenshots)
- Clearer instructions on the first level
- Make the walker shrink or something
- Make it apparent that the blocks BLOCK - they aren't the path
- Get rid of the first level, I think
- Get rid of level 5 (redundant)
- Make the "out of blocks" message not stop you from clicking things
- Countdown front & center
- Sound Effects
- Music
- Level redesign (blank levels boring new mechanic, diagonals are actually faster, more levels, each level should subvert or introduce a new mechanic, Shave off time allotted so that you need the absolute optimal path to make more of a challenge. Multiple walkers? multeipl destinations?)
- There isn't one way to solve the problem. It's kinda fun to see other solutions. What could I do with this? Make a leaderboard? (could give me practice setting up a server, if I want that)

# Probably Won't Do
- Gameplay video/trailer
- Improve HUD (Make it clear that you've won vs loss)
- Worldbuild?
- Redo walker
- Make tiles look nice
- Improve Main Menu
- Improve Level Menu
- Have a "Best Time"
- Make your own level
- There are still bugs with the walker not completing the path sometimes. Unable to reproduce reliably

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
