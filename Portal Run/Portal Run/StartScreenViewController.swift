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
        gameTitle.font = UIFont(name: "Arial-BoldItalicMT", size: 50)
        gameTitle.sizeToFit()
        self.view.addSubview(gameTitle)
        gameTitle.translatesAutoresizingMaskIntoConstraints = false
        let xCenterConstraintForGameTitle = NSLayoutConstraint(item: gameTitle, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0)
        let topMarginForGameTitle = NSLayoutConstraint(item: gameTitle, attribute: .topMargin, relatedBy: .equal, toItem: self.view, attribute: .topMargin, multiplier: 2, constant: 70)
        self.view.addConstraints([xCenterConstraintForGameTitle, topMarginForGameTitle])
        
        
        
        
        startGameButton = UIButton()
        startGameButton.backgroundColor = UIColor.blue
        startGameButton.setTitle("Start Game", for: .normal)
        startGameButton.titleLabel?.font = UIFont(name: "Menlo-Regular", size: (startGameButton.titleLabel?.font.pointSize)!)
        startGameButton.addTarget(self, action: #selector(startNewGame), for: .touchUpInside)
        startGameButton.sizeToFit()
        startGameButton.layer.cornerRadius = 10
        self.view.addSubview(startGameButton)
        startGameButton.translatesAutoresizingMaskIntoConstraints = false
        let xCenterConstraintForStartGameButton = NSLayoutConstraint(item: startGameButton, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0)
        let yCenterConstraintForStartGameButton = NSLayoutConstraint(item: startGameButton, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 0)
        self.view.addConstraints([xCenterConstraintForStartGameButton, yCenterConstraintForStartGameButton])
        
        
        
        
        highScoreButton = UIButton()
        highScoreButton.backgroundColor = UIColor.red
        highScoreButton.setTitle("High Scores", for: .normal)
        highScoreButton.titleLabel?.font = UIFont(name: "Menlo-Regular", size: (highScoreButton.titleLabel?.font.pointSize)!)
        highScoreButton.addTarget(self, action: #selector(showHighScores), for: .touchUpInside)
        highScoreButton.sizeToFit()
        highScoreButton.layer.cornerRadius = 10
        self.view.addSubview(highScoreButton)
        highScoreButton.translatesAutoresizingMaskIntoConstraints = false
        let xCenterConstraintForHighScoreButton = NSLayoutConstraint(item: highScoreButton, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0)
        let topMarginForHighScoreButton = NSLayoutConstraint(item: highScoreButton, attribute: .topMargin, relatedBy: .equal, toItem: startGameButton, attribute: .bottomMargin, multiplier: 1, constant: 30)
        self.view.addConstraints([xCenterConstraintForHighScoreButton, topMarginForHighScoreButton])

        
        
        instructionButton = UIButton()
        instructionButton.backgroundColor = UIColor.green
        instructionButton.setTitle("Instructions", for: .normal)
        instructionButton.titleLabel?.font = UIFont(name: "Menlo-Regular", size: (instructionButton.titleLabel?.font.pointSize)!)
        instructionButton.addTarget(self, action: #selector(showInstructions), for: .touchUpInside)
        instructionButton.sizeToFit()
        instructionButton.layer.cornerRadius = 10
        self.view.addSubview(instructionButton)
        instructionButton.translatesAutoresizingMaskIntoConstraints = false
        let xCenterConstraintForInstructionButton = NSLayoutConstraint(item: instructionButton, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0)
        let topMarginForInstructionButton = NSLayoutConstraint(item: instructionButton, attribute: .topMargin, relatedBy: .equal, toItem: highScoreButton, attribute: .bottomMargin, multiplier: 1, constant: 30)
        self.view.addConstraints([xCenterConstraintForInstructionButton, topMarginForInstructionButton])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        super.viewWillDisappear(animated)
    }
    
    func startNewGame() {
        let gameVC = GameViewController()
        self.present(gameVC, animated: true, completion: nil)
    }
    
    func showHighScores() {
        let highScoreVC = HighScoresTableViewController()
        self.navigationController?.pushViewController(highScoreVC, animated: true)
    }
    
    func showInstructions() {
        let instructionVC = InstructionViewController()
        self.navigationController?.pushViewController(instructionVC, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

}
