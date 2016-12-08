//
//  Scoreboard.swift
//  Portal Run
//
//  Created by Phat Pham on 12/7/16.
//  Copyright © 2016 Portal Run Team. All rights reserved.
//

import UIKit
import SpriteKit

class Scoreboard: SKSpriteNode {
    
    var width = 10
    var height = 10
    
    init(positionAt: CGPoint) {
        let size = CGSize(width: self.width, height: self.height)
        super.init(texture: nil, color: UIColor.yellow, size: size)
        self.position = position
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
