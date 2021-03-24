# Make Amaze!
Check it out here: https://murphysdad.itch.io/make-amaze

Created for the 
[GDFG 2021 February Game Jam](https://itch.io/jam/gdfgs-monthly-game-jam-2)

Built with Godot

# Notes:
## TODO
- Publish v2
- Publish to Android store
https://godotengine.org/qa/265/how-release-project-google-play-store-android-release-mode
https://docs.godotengine.org/en/3.2/getting_started/step_by_step/exporting.html#android

# Probably Won't Do
- Levels inherit, instead of copyings
- May want to consider improving the visuals (clear that blocks BLOCK)
- Game over / win sound effects (opengameart.org)
- Change foostep sound effects
- There isn't one way to solve the problem. It's kinda fun to see other solutions. What could I do with this? Make a leaderboard? (could give me practice setting up a server, if I want that)
- Gameplay video/trailer
- Improve HUD (Make it clear that you've won vs loss)
- Worldbuild?
- Redo walker
- Make tiles look nice
- Improve Main Menu
- Improve Level Menu
- Have a "Best Time"
- Make your own level
- There are still bugs with the walker not completing the path sometimes. Unable to reproduce reliably. For instance, if you start level 11 w/o placing any blocks, he takes a weird path

## Development
- A little documentation on instancing/scene/shared properties: [https://www.reddit.com/r/godot/comments/drc82n/gdscript_instance_unique_material/](https://www.reddit.com/r/godot/comments/drc82n/gdscript_instance_unique_material/)
- I wonder if it's a bad practice to be modifying the scene child the way I am with the tilemap for the map

## Level Design:
- Each level should subvert or introduce a new mechanic
- Starting/destination positions (central is harder)
- Beginning # unmovable blocks
- Limit # of blocks
- Diagonals are faster...is this a feature or a bug?
- Blank levels are boring
- Some blocks are redundant

## Android Commands
- `adb devicces`
- `adb install <YOUR_FILE>.apk`
- Should be able to just unplug, unless I turned on FIle Transfer (by going into Setting > Connected Devices > USB and selectin file transfer)
- OHHH I believe I have trouble exporting an Android app in NOT debug mode (that's when I get the keystore error, I think). Wonder if I need to generate a new key or something for that
