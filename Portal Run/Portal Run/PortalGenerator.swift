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
    
    
    func generatePortal(index: Int, x: CGFloat) {
        let portal = Portal()
        if portals.count == 2 {
            for portal in portals {
                portal.removeFromParent()
            }
            portals.removeAll()
        }
        if portals.count == 1 {
            portal.position.x = portals[0].position.x

            
        }
        if portals.count == 0 {
            portal.position.x = x

        }
        if index == 0 {
            portal.position.y =  TopHeight + portal.size.height/2 + 10

            
        }
        if index == 1 {
            portal.position.y =  CenterHeight + portal.size.height/2 + 10

        }
        
        if index == 2 {
            portal.position.y =  BottomHeight + portal.size.height/2 + 10

        }
        
        print(portal.position.x, portal.position.y)
        addChild(portal)
        portals.append(portal)

    }
    

}
