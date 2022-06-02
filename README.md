# Pac-Dude

Group Name: Pac Bros
Group Members: Eric Sohel, Sunil Parab

Our project is going to be an enhanced version of Pac-Man called Pac-Dude, with many new features that are not present in the original. We first aim to have a fully functional Pac-Man game similar to the original, which would mean a preset map, the ability for Pac-Man to move around the map and pick up pellets, ghosts with a simple A.I. for deciding how they move around the map, and power pellets which Pac-Dude could eat to then eat the ghosts. After we finish with this we plan to improve the A.I. of the ghosts to make them similar to the original and add randomly generated maps and sound effects. Once we have achieved this we will start to work on additional features to the game, such as keys that can remove walls enclosing the power pellets, traps that can kill Pac-Dude (e.g. spikes that come out of the wall on a timed interval), or more power-ups that would help Pac-Dude clear the level.

Prototype: https://docs.google.com/document/d/1qzuJQvsFa4Hb9lO_jQYWX_D4uwLA5Xo509a6eXzZ-EY/edit?usp=sharing


Monday - 5/23/2022

Sunil Parab: Made the Entities interface, and the basic functions for the Ghost abstract class and PacDude class.

Eric Sohel: Created the map class which contains the preset map design along with several methods that allow other classes to interact with it. Also created several methods such as pellet generator which place all the in-game objects on the map.


Tuesday - 5/24/2022

Sunil Parab: - Finished all of the functions for PacDude

Eric Sohel: Finished working on the map class and recreated every single method needed in the map class as described in our prototype.


Wednesday - 5/25/2022

Sunil Parab: - Made PacDude appear on the screen and gave him the ability to move around by tapping the arrow keys. Also improved nextToBlock() for PacDude and Ghost so that it can be called to check any direction.

Eric Sohel: Worked on animating the two dimensional array map using processing. I animated the walls, ghost blocks, and the teleportation block as they are represented in the real game.


Thursday - 5/26/2022

Sunil Parab: - PacDude can now move around the map with proper collisions and has a sliding animation.

Eric Sohel: Fixed errors with the map including scaling issues and x position and y position issues with pac-dude. Animated the pellets in the map, and made it so that Pac-Dude could eat these pellets. Also created two new methods which keep track of how many pellets Pac-Dude is eating and worked on creating an end screen for when the player beats the game.


Friday - 5/27/2022

Sunil Parab: - Wasn't able to get work done due to my Sister's Graduation

Eric Sohel: - Worked on getting the pellets collected and updating pac-dude's pellet count.


Saturday - 5/28/2022

Sunil Parab: - Was still at my Sister's Graduation since it was a two-day event.

Eric Sohel: - started working on the ghost's methods. Worked on wander and chase however I could not get them to work properly.


Sunday - 5/29/2022

Sunil Parab: - PacDude will now continously move after a button is pressed, and you are able to queue his next movement by entering an input before he reaches a wall where he can  go in the inputed direction.

Eric Sohel: - Continued working on wander and chase and made them work a lot better. Then I updated the ghosts speeds and gave them the in-game colors they are supposed to have.

Monday - 5/30/2022

Sunil Parab: - Added Game Start and End screens, which appear upon starting the project and collecting all the pellets respectively. Also animated PacDude so that his mouth will open and close while moving.

Eric Sohel: - Worked on the score count and live counts for the pac dude game. I worked on accurately calculating the score based on pellets and killing ghost which create multipliers.

Tuesday - 5/31/2022
Sunil Parab: write here.

Eric Sohel: Worked on the in-game mechanics of the power pellets which included giving pac-dude his special ability to eat ghosts and tried creating a timer which keeps this ability for a certain amount of time.

Wednesday - 6/1/2022
Sunil - write here.

Eric: could not get much work done because I am sick. 
