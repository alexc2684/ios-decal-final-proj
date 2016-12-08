//
//  Scoreboard.swift
//  Portal Run
//
//  Created by Phat Pham on 12/7/16.
//  Copyright © 2016 Portal Run Team. All rights reserved.
//

import UIKit
import SpriteKit

class Scoreboard: SKLabelNode {
    
    init(positionAt: CGPoint) {
        super.init()
        self.fontColor = UIColor.white
        self.fontName = "Helvetica"
        self.fontSize = 22.0
        self.position = positionAt
        self.text = "0"
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateScore(to score: Int) {
        self.text = "\(score)"
        let fadeTimeInterval = TimeInterval(5)
        let fadingIn = SKAction.fadeIn(withDuration: fadeTimeInterval)
        let fadingOut = SKAction.fadeOut(withDuration: fadeTimeInterval)
        let newScoreActionSequence = SKAction.sequence([fadingIn, fadingOut])
        run(newScoreActionSequence)
    }
}
