//
//  GameData.swift
//  Portal Run
//
//  Created by Phat Pham on 12/6/16.
//  Copyright © 2016 Portal Run Team. All rights reserved.
//

import UIKit
import SpriteKit
import GameKit

class GameData: NSObject {
    
    /** Provides the score of the current game session. */
    private var currentScore: Int
    
    /** The timer for the current game session. */
    private var timer: Timer!
    
    /** Provides information on the amount of time that has elapsed within the current game session. */
    private var timeElapsed: Int
    
    /** The high score of the user */
    static var highScore: Int = 0
    
    override init() {
        self.currentScore = 0
        self.timeElapsed = 0
        super.init()
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: self.updateTimeStatus(timer:))
    }
    
    /** Updates the score of the current game session to the desired amount. */
    func updateScore(to score: Int) {
        self.currentScore = score
    }
    
    /** Increment the score of the current game session by one. */
    func incrementScoreByOne() {
        self.currentScore += 1
    }
    
    @objc func updateTimeStatus(timer: Timer) {
        self.timeElapsed += 1
        print("Amount of Time That Has Elapsed in the Current Game Session: \(self.timeElapsed)")
    }
}
