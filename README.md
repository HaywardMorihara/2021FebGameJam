# Make Amaze!
Check it out here: https://murphysdad.itch.io/make-amaze

Created for the 
[GDFG 2021 February Game Jam](https://itch.io/jam/gdfgs-monthly-game-jam-2)

Built with Godot

# Notes:

## Would like to do someday...
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
- Embedding HTML in Itch.io: https://itch.io/docs/creators/html5
	and https://www.youtube.com/watch?v=fNLpZVNDQqc was also helpful

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

## Journal Entries:
Feb 1–2: The goal of this jam is to (a) lean godot (b) learn how to finish and publish a game and participate in a game jame. The them came out as "making". Lots of interesting things came to mind, but I really need to focus on a small scope to make this achievable. Remember, I'm learning a lot. So right now, I have a somewhat simple idea….but it involves allowing the player to dynamically place tiles and pathfinding around those tiles. I'm worried this is too ambitious. But I think I gotta try it.

Feb 4: Followed along tutorial. Not sure how I like how much "magic" seems to be happening…but maybe I just don't understand it well enough. Didn't get things quite working, but maybe just need a better computer

Feb 5: Did find a bug in my code, but also, there's just some weird detail in the tilemap I think…this is very frustrating because I have no visibility. this is where it's nice if you could just compare files. I'm going to ignore the bug for now, since it doesn't occur often and it more or less works. Also, I'm not sure that using tiles with Navigation2D is optimal, feels like I should be doing AStar or something. So setting up my game jam project! Made the tiles, setup the frame. Spritesheet initiated. Click to change tile is working

Feb 6: Got the core game working? can place a tile and the character walks towards the goal! but…the pathfinding seems a bit buggy. I was skeptical how helpful these tools would be, and even though I don't really understand the engine very well yet, I'm getting something up and working very quickly. I think it's already paying off. Now trying to get a start button working. Now TODO list. Win condition

Feb 10: Timer causing win condition. Computer wasn't handling two godot projects open very well….I think I should get a new one. Had some trouble figuring out collisions

Feb 11: Determined that collisions weren't happening because Destination was an Area2d node, NOT a physicis body like the Mobs in the tutorial (still not sure when to use which). Now starting to look into level flow. Harder than I would've expected to figure out, but did eventually find https://godotengine.org/qa/24231/how-do-i-change-scenes and https://godotengine.org/qa/24773/how-to-load-and-change-scenes. May want to consider doing a menu/level naviation tutorial, since there doesn't seem to be anything out there….but maybe that's because it's SO basic

Feb 12: Got a lot done today. Got a single level working, with a main menu flow and everything. It's a working, single level game. Going to need to do some refactoring for multiple levels, the walker doesn't actually move on tiles, and a lot of touchups, but the basics are working!

Feb 13: Had a bunch of time, made good progress. Added ability to remove tiles, handle when no path, and not cutting corners. starting to actually be a kinda fun game. Then, starting to refactor so I can easily create levels. Getting a bit into the design and best practices of Go, which is kinda interesting. Also kinda frsutrating. The cnnecting signals stuff is a bit difficult, but I like it because I think it really encourages good design patterns. I'm a bit frustarted because I don't understand how different instances of scenes can have their own positions and speeds and stuff…either need to research it more or just accept it for now. It seems like a bit of magic, which I don't love The signals are kinda magical as well, which I don't love either. The design patterns it encourages though are good

Feb 14: Finished the refactor. Definitely don't think I have great organization, espeically around the signals. But I'm really liking how Godot seems to force you into some good design patterns

Feb 15: Got dynamic level menu working. So levels should be easy to create and add and appear in the menu. We'll see. So now, the core works. I think it's just a matter of polishing now…..and a LOT of polishing. Realizing that "polishing" is really the bulk of the work, and there's pretty much infinite amount that you can do (just like other art projects). Oh, and attaching scripts and reattaching them in Goto is really tedious. Or I'm just doing it wrong. And there's no easy way to refactor renaming scenes? Again, I think I'm probably just missing something and doing it wrong. Am I enjoying this? Certainly. Is it worth all the time? …I'm not sure. Yes, I'm enjoying it…but it takes so long to make anything. Granted, I'm learning and will get more efficient. But would my time be better spent doing more practical/achievable things? Doing more reading/learning, philosophical thinking, financial learning, or learning related to work? Maybe that's for later in life. 

Feb 16: Not so great today. Didn't really get the level flow working. For some reason, only just started saying the current scene is "Level"? And going to need to add more features (limiting blocks) in order to do level design. Also discovered that the sizing is WAY off on Android…probably shouldn't be a major priority. Also, I really gotta stop doing work by 8:45, and getting up earlier

Feb 17: Fixed several things, including the next level button, ordering the level menu, and Android screen proportions. Pathfinding was working weird in Anroid and HTML, realized it had something to do with some fancy logic that had been in the tutorial when mouse clicks were the destination

Feb 18: Bunch of progress. Designed two levels (first draft anyway), made it so you can't move blocks after the level has started, correct buttons for win/lose, blocks that can't be moved, limit number of blacks that can be placed…would feel really good, except the walker doesn't follow the path more times than I'd like to be seeing..concerned this really makes for a bad experience…oh well, might just have to live with that. Could polish around it somehow, maybe

Feb 19: Frustrating day today. Wanted to try an create a top menu, but it wasn't something I could quickly throw together…looked at viewports breifly, but they aren't that easy to understand, and I think a bit of overkill. So then tried just not placing tiles aat the top row and then placing a Control container there…but was having trouble working with the Control container, and then when I tried the game, placing blocks wasn't working. So I scrapped it all and decided I'm just going to put the start button where the player starts. I don't think it's the BEST UX, but I just gotta get this done. Also, lessons learned (a) Follow tutorials, it isn't efficient in the long run to try and figure out what something does and how it works (b) Time box spikes like this. I think I actually did a pretty good job here, but should always have it planned.. Also finding it really pays to scene/instance things and follow patterns and paradigms instead of manual placement. I think it'd be really helpful if I had everything following a grid. And changing the tileset showed how I shoulda just instanced everything

Feb 20: Some good progress. Prevent player from placing blocks on the start/destination, put the start button on the player, and touching up menus a bit (hopefully will completely redo them, but just so that the prototype doesn't completely suck while playtesting). And made some levels…some interesting stuff, but I don't think that it goes very far at the moment. May want to add more elements to up the difficulty (add more destinations/walkers). But probably won't, given the scope. Prioritizing other things next, I think. Starting to get kinda bored with it. I don't really want to continue on it now and polish it to be honest. I hope it's just because it's a pretty basic game, and if it were a more complex game that I want to do, I'd be more motivated. Did some playtesting w Jenna. Liking having this journal as I go. Todo list in something else, not a readme

Feb 21: Did some level design and updated the TODO list

Feb 22: Touched up the levels, made the walker bigger and labeled the labels. I'm really not going to have enough time to make this nice am I? Lol. Oh well, it's A game right now

Feb 23: Having HUD logic in the HUD, while a bit redundant, has been so helpful. Has made it much easier to change things. It's that abstraction/interface thing. Somehow lost all my tiles in Piskel? Got temp message working (nested Timer was kinda cool, kinda getting the hang of Godot I feel). Then some difficulty getting the retry level to start…

Feb 24: Got retrying the level and keeping the blocks to work. Also a message for at least the first level to tell the player what to do. Starting to plan - only have Friday left (~6 hours). Reflecting on Godot a bit - I'm actually not convinced how much time it's really saved me. I haven't spent this much time on a game before, and I think I actually might have been just as effective on LibGDX. However, I don't think I'm going to go back, for a few reasons: (1) I'm guessing that it does actually make me faster and it's just a difficult thing to measure. (2) I bet at larger scales it will be noticeable (3) I haven't really dived that deep in to either engine, so I don't really understand the intricacies (4) Godot has a bigger, growing community, so I bet it will pay off more going forward (5) I do think that Godot makes it easier to publish to different platforms (6) I think Godot might be a little less buggy. Or maybe a lot (7) I do think that it's quite convenient to have both the code and map editor in the same UI (8) Godot does make it easier to setup sprite animations (9) I'm betting there are a lot of features that I don't know that will help a lot (10) I was more familiar with Java, so I should have had an easier time getting started. Once I know Godot more, I bet I will be more effective, comparatively. I'm not sure yet if I'm going to do the Game Jam next month. A really busy month, and there are a couple non-game dev projects I want to work on (writing this blog, personal goals review, etc). And also, game jams are a good way to keep the scope limited, but I may want to explore making a game of a little larger scope, say, 2 months. Also, when I reflect on all this, will be interesting to see how much time total I spent. Oh, and I should have screenshots for this blog. Should do that iteratively next time (show what I had that day, to show progression). And maybe should actually write the thing day-by-day. Also, should consider followng that "post-moterm" format that the Skitter dev did. What do I want the format of this blog reflection to be? Oh, and doing tutorials is a really good way to learn. Because, I'm going through step-by-step, which helps me remember what I'm learning more than just reading would. Also, tutorial tells me thinks that I don't know I don't know (such as best practices, unknown base/dependency code), which is why it's superior to looking up how to do something ad hocc. And finally, after you complete the tutorial, you can go back to it and refer it. May want to tweet progress / little functionality I made (https://www.reddit.com/r/godot/comments/lrcsn0/how_we_handle_the_jump_off_the_edge_use_case_in/ as inspiration)

Feb 27: Spent a good 4 hours today. Didn't end up having all of yesterday like i thought I would, so had to cut a bunch of polishing out. Did a bunch of playtesting on levels with Jenna, so that it's not completely unfair, unplayable. Did a bunch of polishing, including trying to make the levels a good difficulty, making nice text and the start menu look pretty nice, reoritenting the levels, walker animation, making a nice icon and assets, and publishing! And not it's playable in the browser and donwloadable on Itch.io! William tried it and realized Windows wasn't working! needed the pck file. then he couldn't figure out that the point was to delay, so added a message to say "survive"

Post: Got lovely feedback from family, friends and strangers alike. I think I have a genuinely enjoyable game here. I'm not sure how long someone an play it before getting bored…might need at least one more mechanic or something if I really want to build more. the time spent play testing paid out in dividends and getting the difficulty right was huge, I think. Sound was a glaring miss, I think. Also discovered that comparing levels was one of the most fun parts, I think having a leaderboard or something would be cool. Also thinking giving players the ability to create their own levels could be interesting…there's more that can be done with this, just not sure my own interest level? Also learned that the concept of what you're supposed to do is pretty confusing at first, but pretty easy to grasp. I think making teh walker shrink or something would be very helpful.
Polishing to do
jams are prototype and practice
thank the community and talk about how i stumbled upon it, directed me to godot, got me to the jam
so cool haing the twitch stream and having actual strangers playing it. really makes the experience so gratifying and motivates me. i would wonder why I would make a game, because no one would play
share where I got the idea from
Level pacing super important. I think I did pretty well considering the limited time
Jams give you: players, feedback, FINISH (polish, the most important), scope, fail fast
What is the feeling?
Polishing
Now that I've received feedback, getting into the polishing. 
Had a couple things, such as sound, drag & place, confusing first level, levels 4 & 5 redundant, empty levels kinda boring, and need to be introducing new and subverting mechanics, make it clear that the blocks BLOCK
Other things I observed myselft that I wanted to change include making the walker shrink or something to help make it clear what the objective is (instead of just relying on instructions), "out-of-blocks" message was getting in the way, and wanting to polish the itch page and release to Android store

Mar 9: Drag place/remove blocks implemneted

Mar 10: Touched up levels a bit, got rid of redundant ones. Named the game "Sam" for brevity, and made him shrink through the level….not sure if this was a waste of time? not sure how I like it. I guess this is why you test things out. Maybe it'd work better in the context of a snowman or something. I guess this is why you gather feedback. Also, levels are very touchy and you have to have them exactly balaned. I have the feeling that some old solutions won't work anymore - wonder if that's a bad thing. Also, not sure if I like the fact that Sam moves faster on diagonals….I don't think that I want to spend that much more time on this game. But would be interesting if I addressed feedback, and it made the game worse. Something worth noting, and it makes sense - the path to making a game better isn't always linear

Mar 11: Made it possible for the player to remove the temp messages w a click, put the countdown front & center, and starting to touch up the level menu

Mar 12: Touched up level menu and made a credits menu. I need to make more reusable components, to have a consistent style and so I don't have to keep manually setting up fonts and stuff. Also, need to learn how you're supposed to make nice menus. Lastly, not sure why I abstracted the HUD signals

Mar 15: Started trying to add sund effect. Using Audacity. Muchg more difficult thatn I thought

Mar 18: Got some foosteps in, much harder than I thought. Hard to found just the right sound effect, at the right speed, and get the timing right. Not just a matter of playing it on each loop, needed to base if off speed. Started looking for music

Mar 19: Music and tried the singleton pattern (it's very easy). Tried a couple new levels….I think there's still more I can do with what I have. But wondering how interesting each one is. I think randomly strewing them about is a nice thing. Don't make them symmetrical. I think having multiple walkers could really take it to the next level, so I think I will take the time to do that

Mar 20: Added block placement noises, and made it so you can have multiple destinations ( I thught multiple walkers could get complicated, maybe for later though). I think it really adds a lot, a lot more levels I could do. Just made a few more and need to get them playtested now. spent a good 2 hours today. Should really be inheriting levels…and I'm sure I'm missing something, but wasn't able to have each new instance of Destination automatically part of the destinations group? Hard updating a game and not messing up the balance

Mar 21: Made the game playable within Itcho and pointed my website there. Also added some screenshots and information to the Itch page

Mar 22: not sure, look at commits

Mar 23: reordered levels, fixed a win/lose bug. But found a bug with pathfinding that's really annoying. Redo button. And 12 not perfectly symmetrical but whatever

Mar 24: Sorta figured out the pathfinidng bug…it does seem to be a problem with the get_simple_path function. or maybe it's just my understanding. basically, the Y coordinate that it takes you to doesn't match what you pass in. May want to consider blogging this because I couldn't find any resources online, but also, I might just be doing it completely wrong, so maybe that's kinda embarassing. Release v2. Starting on publishing to Google Play store. https://godotengine.org/qa/265/how-release-project-google-play-store-android-release-mode was very helpful.

Mar 25: Publishing to play store. I think this could deserve it's own blog. For some reason, i really can't find any all in one directions. https://instabug.com/blog/how-to-submit-your-app-to-the-google-play-store/#:~:text=Upload%20the%20APK%20or%20app%20bundle%20files%20for%20your%20app&text=To%20do%20this%2C%20go%20to,to%20the%20Google%20Play%20store seems about as close as it gets. So first, that signed APK link above seemed helpful. Next Bundle ID (in Godot, it's the Package > Unique Name). Register on the play store….it costs money??? Ohh okay…once you get to the console, I think it kinda holds your hand. We'll see. There was also a YouTube video that was helpful. Was kinda confused about the testing stuff…directly submitted a release for production…it appears to be in review. We'll see
