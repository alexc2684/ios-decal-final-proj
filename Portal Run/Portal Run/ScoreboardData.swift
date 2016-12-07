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

class ScoreboardData: NSObject {
    
    /** Provides the score of the current game session. */
    private var currentScore: Int
    
    /** The timer for the current game session. */
    private var timer: Timer!
    
    /** Provides information on the amount of time that has elapsed within the current game session. */
    private var timeElapsed: Double
    
    /** The high score of the user */
    static var highScore: Int {
        get {
            if ScoreboardData.topScores.count > 0 {
                return ScoreboardData.topScores.max()!
            } else {
                return 0
            }
        }
    }
    
    /** Stores the top scores */
    static var topScores: [Int] = []
    
    /** Initializes the game data. Ideally, there should be a GameData instance for every game session played. */
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
    
    /** Updates the top scores if necessary with the selected score and indicates whether it succeeds. */
    func updateTopScore(score: Int) -> Bool {
        if ScoreboardData.topScores.count < 10 {
            ScoreboardData.topScores.append(score)
            ScoreboardData.topScores = ScoreboardData.topScores.sorted()
            return true
        }
        if score > ScoreboardData.topScores.min()! {
            ScoreboardData.topScores.removeFirst()
            ScoreboardData.topScores.append(score)
            ScoreboardData.topScores = ScoreboardData.topScores.sorted()
            return true
        }
        return false
    }
    
    @objc func updateTimeStatus(timer: Timer) {
        self.timeElapsed += 1
        print("Amount of Time That Has Elapsed in the Current Game Session: \(self.timeElapsed)")
    }
}
