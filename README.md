#Overwatch
These are my autohotkey scripts for Overwatch. They simply play a sound file at the appropriate time, since the in-game sounds/notifications can oft be overlooked in the heat of battle.

NOTE: Blizzard has stated that so long as you don't use AHK to perform more than one in-game action, it is not considered cheating. Since these scripts do nothing in game, but rather simply perform a timer to play a sound file, these should be safe to use.

#Instructions for use:
 - Save this folder anywhere on your machine, the script uses relative paths.
 - Launch the "Overwatch.exe" AHK compiled script.
 - Go about playing the game, and once you choose a hero, Press the Windows Key + one of the numbers from 0-9 . This will play an audio file indicating which hero the profile is for. 
 - Proceed to play the game

#Bindings:
 WIN + 0 : Set your hero as unassigned - intended to shut off hotkey functionality so heroes like Mercy will work again, until I fix the right-click bug
 WIN + 1 : You can set this up to be your blizzard PW if, like me, it frequently doesn't remember it when logging in, and you have a long hard pw that even you don't remember
 
 Hero bindings:
  CTRL + [First letter of hero name] e.g. CTRL + J for Junkrat
  If there are two characters starting with the same first letter: CTRL + ALT + [First letter of hero name] to select the second hero with that name
  If there are three: CTRL + ALT + [First letter of hero name] to select the third hero with that name (e.g. McCree, Mei, Mercy)

#Known Issues: 
  - Some of the times are a tad off due to in-game fluctuations (e.g. if Roadhog's chain hits or not). There isn't really a way around this, so I approximate the time.
 - Multiple sound files have issues playing at the same time.


#Future enhancements:
 - All hero support
 - More dynamic hero handling:
 	- Keep track of how many blinks Tracer has available, and play "1, 2, or 3" depending
 	- Hanzo's countdown shouldn't start until he fires his arrow
 	- Mei's R countdown shouldn't start until she builds the wall
 - Only make scripts active if in game, so that you can leave the script running all the time without having to worry about it messing up your usual computer usage
 - Add "E.wav" file for those people who are still using the archaic ASDW movement keys rather than SDFE
 - Add support for when the user hits the actual Shift or "R" (or "E") button, rather than the mouse buttons
 
