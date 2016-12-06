//
//  WallGenerator.swift
//  Portal Run
//
//  Created by Steven Holman on 12/5/16.
//  Copyright © 2016 Portal Run Team. All rights reserved.
//

import Foundation
import SpriteKit

class WallGenerator: SKSpriteNode {
    var generationTimer: Timer?
    var walls = [Wall]()
    
    
    func startGeneratingWallsEvery(seconds: TimeInterval){
        generationTimer = Timer.scheduledTimer(timeInterval: seconds, target: self, selector: #selector(WallGenerator.generateWall), userInfo: nil, repeats: true)
    }
    
    
    func stopGenerating() {
        generationTimer?.invalidate()
    }
    
    
    func generateWall() {
        let wall = Wall()
        wall.position.x = size.width 
        if Currently_At == 1 {
            wall.position.y =  TopHeight + wall.size.height/2 + 10
            
        }
        if Currently_At == 2 {
            wall.position.y =  CenterHeight + wall.size.height/2 + 10

            
        }
        if Currently_At == 3 {
            wall.position.y =  BottomHeight + wall.size.height/2 + 10

        }
        addChild(wall)
        walls.append(wall)
    }
    
    func stopWalls(){
        stopGenerating()
        for wall in walls {
            wall.stop()
        }
        
    }
}
