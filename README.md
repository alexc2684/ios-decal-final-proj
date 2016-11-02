#iOS Decal Final Project #

App Name: Portal Run

Authors:
- Alex Chan
- Steven Holman
- Kijung Kim
- Phat Pham
**Purpose**
To entertain those that are dying from pure boredom. More specifically, create a fun endless runner game that is based on using portals to move you from danger to safety before hitting an obstacle.
**Features**
- User-generated portals
- Time-based scoring
- Continuous background flow
- Automated, randomly generated obstacle creation (Types of obstacles include cliff edges, rolling balls, borders, etc.)
- High Scores list
- Tutorial View to teach game basics

**Control Flow**
- Game begins by taking you to a StartScreen that provides three UI Buttons. The first button starts the game is start game. The second button will segue into the HighScoreView that displays all the highest scores received in the game. The third button will segue into the InstructionView that tells the user how to play the game.
- Pressing start game will segue into the GameView and begin the game processing. In the GameView, there will be an a buffer that is constantly generating and the icon will begin running to the right. This buffer will ensure that the games is constantly moving to the right as Endless Runners do and then Obstacles will begin to appear. These obstacles such as spikes or a wall will be sprites that have a physical location and mapping to the buffer.
- If contact with the player and an obstacle is made, then the character will die and the game will end.
- To avoid these obstacles, you need to press a location where your player will enter a portal and where he will exit. This entrance needs to be the same horizontal level as the player and the exit portal will be directly vertical to the entrance portal. As the player enters the portal, he pops out at the exit portal, avoiding the obstacle.
- The game will speed up as he progresses until the player is not quick enough to dodge the obstacles.
- Once the player dies, transition segue to a pop up AfterGameView that shows the score, and input name if you want to save it. This view will have transition buttons to restart game or main menu.
**Implementation**
- Model
 - ObstacleGeneration.swift
 - Score.swift
 - User.swift
 - Game.swift
 - Obstacle.swift
- View
  - StartScreenView
  - InstructionView
  - HighScoreView
  - GameView
  - AfterGameView
- Controller
  - GameViewController
  - HighScoreViewController
  - InstructionViewController
  - StartScreenViewController
  - AfterGameViewController
