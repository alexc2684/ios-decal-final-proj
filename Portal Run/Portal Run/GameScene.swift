//
//  GameScene.swift
//  Portal Run
//
//  Created by Phat Pham on 12/1/16.
//  Copyright © 2016 Portal Run Team. All rights reserved.
//

import UIKit
import SpriteKit

class GameScene: SKScene {

    let testingImage = SKSpriteNode(imageNamed: "Spaceship")
    
    override func didMove(to view: SKView) {
        testingImage.position = CGPoint(x: self.size.height/2 , y: self.size.height/2)
        self.addChild(testingImage)
    }
}
