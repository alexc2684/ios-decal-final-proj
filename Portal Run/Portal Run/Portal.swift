//
//  Portal.swift
//  Portal Run
//
//  Created by Steven Holman on 12/5/16.
//  Copyright © 2016 Portal Run Team. All rights reserved.
//

import Foundation
import SpriteKit


class Portal: SKSpriteNode {
    let Width = 10.0
    let Height = 40.0
    let Wall_COLOR = UIColor.red
    
    init() {
        let size = CGSize(width: Width, height: Height)
        super.init(texture: nil, color: Wall_COLOR, size: size)
        Moving()
        loadPhysicsBody(size: size)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func Moving() {
        let moveLeft = SKAction.moveBy(x: -moveSpeed/2, y: 0, duration: 1)
        run(SKAction.repeatForever(moveLeft))
    }
    
    func loadPhysicsBody(size: CGSize) {
        physicsBody = SKPhysicsBody(rectangleOf: size)
        physicsBody?.categoryBitMask = wallCatergory
        physicsBody?.affectedByGravity = false
        
    }
    func stop(){
        removeAllActions()
    }
    
    
    
}
