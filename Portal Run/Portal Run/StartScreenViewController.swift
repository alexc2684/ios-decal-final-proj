//
//  StartScreenViewController.swift
//  Portal Run
//
//  Created by Phat Pham on 11/11/16.
//  Copyright © 2016 Portal Run Team. All rights reserved.
//

import UIKit

class StartScreenViewController: UIViewController {
    
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
        gameTitle.font = UIFont(name: "AvenirNextCondensed-BoldItalic ", size: 50)
        gameTitle.sizeToFit()
        gameTitle.frame.origin = self.view.center
        
        
        startGameButton = UIButton()
        startGameButton.backgroundColor = UIColor.blue
        startGameButton.setTitle("Start Game", for: .normal)
        startGameButton.addTarget(self, action: #selector(startNewGame), for: .touchUpInside)
        startGameButton.sizeToFit()
        startGameButton.frame.origin = CGPoint(x: gameTitle.frame.origin.x, y: gameTitle.frame.origin.y + gameTitle.frame.height)
        
        
        highScoreButton = UIButton()
        highScoreButton.backgroundColor = UIColor.red
        highScoreButton.setTitle("High Scores", for: .normal)
        highScoreButton.addTarget(self, action: #selector(showHighScores), for: .touchUpInside)
        highScoreButton.sizeToFit()
        highScoreButton.frame.origin = CGPoint(x: startGameButton.frame.origin.x, y: startGameButton.frame.origin.y + startGameButton.frame.height)
        
        instructionButton = UIButton()
        instructionButton.backgroundColor = UIColor.green
        instructionButton.setTitle("Instructions", for: .normal)
        instructionButton.addTarget(self, action: #selector(showInstructions), for: .touchUpInside)
        instructionButton.sizeToFit()
        instructionButton.frame.origin = CGPoint(x: startGameButton.frame.origin.x, y: highScoreButton.frame.origin.y + highScoreButton.frame.height)
        
        
        self.view.addSubview(gameTitle)
        self.view.addSubview(startGameButton)
        self.view.addSubview(highScoreButton)
        self.view.addSubview(instructionButton)
    }
    
    func startNewGame() {
        let gameVC = GameViewController()
        self.present(gameVC, animated: true, completion: nil)
    }
    
    func showHighScores() {
        let highScoreVC = InstructionViewController()
        self.present(highScoreVC, animated: true, completion: nil)
    }
    
    func showInstructions() {
        let instructionVC = InstructionViewController()
        self.present(instructionVC, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

}
