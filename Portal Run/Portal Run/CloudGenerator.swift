//
//  CloudGenerator.swift
//  Portal Run
//
//  Created by Phat Pham on 12/7/16.
//  Copyright © 2016 Portal Run Team. All rights reserved.
//

import UIKit
import SpriteKit

class CloudGenerator: SKSpriteNode {
    var generationTimer: Timer?
    var clouds = [Cloud]()
    
    
    func startGeneratingcloudsEvery(seconds: TimeInterval){
        generationTimer = Timer.scheduledTimer(timeInterval: seconds, target: self, selector: #selector(CloudGenerator.generateCloud), userInfo: nil, repeats: true)
    }
    
    
    func stopGenerating() {
        generationTimer?.invalidate()
    }
    
    
    func generateCloud() {
        let cloud = Cloud()
        cloud.position.x = size.width
        if Currently_At == 1 {
            cloud.position.y =  TopHeight + cloud.size.height/2 + 60
            
        }
        if Currently_At == 2 {
            cloud.position.y =  CenterHeight + cloud.size.height/2 + 60
            
            
        }
        if Currently_At == 3 {
            cloud.position.y =  BottomHeight + cloud.size.height/2 + 60
            
        }
        addChild(cloud)
        clouds.append(cloud)
    }
    
    func stopClouds(){
        stopGenerating()
        for cloud in clouds {
            cloud.stop()
        }
        
    }

}
