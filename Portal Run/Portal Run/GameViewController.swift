//
//  GameViewController.swift
//  Portal Run
//
//  Created by Phat Pham on 11/11/16.
//  Copyright © 2016 Portal Run Team. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    /** Displays the title of the game. */
    var gameTitle: UILabel!
    
    /** A button that allows the game to start. */
    var startGameButton: UIButton!
    
    /** A button that allows the user to view the high score. */
    var highScoreButton: UIButton!
    
    /** A button that allows the user to see the instructions for the game. */
    var instructionButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        gameTitle = UILabel()
        gameTitle.text = "Portal Run"
        gameTitle.sizeToFit()
        
        
        startGameButton = UIButton()
        
        highScoreButton = UIButton()
        
        instructionButton = UIButton()
        
        
        self.view.addSubview(gameTitle)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

}
