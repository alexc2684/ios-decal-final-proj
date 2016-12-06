//
//  PortalGenerator.swift
//  Portal Run
//
//  Created by Steven Holman on 12/5/16.
//  Copyright © 2016 Portal Run Team. All rights reserved.
//

import Foundation
import SpriteKit

class PortalGenerator: SKSpriteNode {
    var portals = [Portal]()

    
    
    func generatePortal(index: Int, count: Int, x: CGFloat) {
        let portal = Portal()
        if portals.count == 2 {
            portals = [Portal]()
        }
        
        if index == 0 {
            if count == 1 {
                portal.position.x = portals[0].position.x
            }
            else {
                portal.position.x = x

            }
            portal.position.y =  TopHeight + portal.size.height/2 + 10
            
        }
        
        if index == 1 {
            if count == 1 {
                portal.position.x = portals[0].position.x
            }
            else {
                portal.position.x = x
                
            }
            portal.position.y =  CenterHeight + portal.size.height/2 + 10
            
            
        }
        
        if index == 2 {
            if count == 1 {
                portal.position.x = portals[0].position.x
            }
            else {
                portal.position.x = x
                
            }
            portal.position.y =  BottomHeight + portal.size.height/2 + 10
            
        }
        print(portal.position.x, portal.position.y)
        addChild(portal)
        portals.append(portal)

    }
    

}
