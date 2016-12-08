//
//  Cloud.swift
//  Portal Run
//
//  Created by Phat Pham on 12/7/16.
//  Copyright © 2016 Portal Run Team. All rights reserved.
//

import UIKit
import SpriteKit

class Cloud: SKSpriteNode {
    
    /** Provides the ratio of the cloud image from width to height. */
    private let _imageDimensionRatio = 1.701
    
    init() {
        let size = CGSize(width: 20, height: 20 * _imageDimensionRatio)
        super.init(texture: SKTexture(imageNamed: "icon-images/cloud.png"), color: UIColor.clear, size: size)
        self.startMoving()
    }
    
    convenience init(positionAt: CGPoint) {
        self.init()
        self.position = positionAt
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startMoving() {
        let moveLeft = SKAction.moveBy(x: (-moveSpeed/2) * 0.6, y: 0, duration: 1)
        run(SKAction.repeatForever(moveLeft))
    }
    
    func stop(){
        removeAllActions()
    }
}
