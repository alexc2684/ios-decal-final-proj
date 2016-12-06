//
//  GameScene.swift
//  Portal Run
//
//  Created by Phat Pham on 12/1/16.
//  Copyright © 2016 Portal Run Team. All rights reserved.
//

import UIKit
import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {

    var movingGround:MovingGround!
    var movingGroundTop:MovingGround!
    var movingGroundBottom:MovingGround!
    var hero:Hero!
    var isStarted = false
    var total_teles = 0
    var wallGenerator: WallGenerator!
    var isGameOver = false
    var portalGenerator:PortalGenerator!
    
    
    override func didMove(to view: SKView) {
        backgroundColor = UIColor(red: 159.0/255.0, green: 201.0/255.0, blue: 244.0/255.0, alpha: 1.0)
        movingGround = MovingGround(size: CGSize(width: view.frame.size.width * 2, height: 20))
        movingGround.position = CGPoint(x: 0, y: view.frame.size.height/2 - 40)
        addChild(movingGround)
        CenterHeight = view.frame.size.height/2 - 40
        movingGroundTop = MovingGround(size: CGSize(width: view.frame.size.width * 2, height: 20))
        movingGroundTop.position = CGPoint(x: 0, y: movingGround.position.y + 120 )
        addChild(movingGroundTop)
        TopHeight = movingGround.position.y + 120
        movingGroundBottom = MovingGround(size: CGSize(width: view.frame.size.width * 2, height: 20))
        movingGroundBottom.position = CGPoint(x: 0, y: movingGround.position.y - 120)
        addChild(movingGroundBottom)
        BottomHeight = movingGround.position.y - 120

        hero = Hero()
        hero.position = CGPoint(x: 70, y: movingGround.position.y + movingGround.frame.size.height/2 + hero.frame.size.height/2)
        addChild(hero)
        hero.breathe()
        Currently_At = 2
        
        wallGenerator = WallGenerator(color: UIColor.clear, size: view.frame.size)
        addChild(wallGenerator)
        physicsWorld.contactDelegate = self
        
        portalGenerator = PortalGenerator(color: UIColor.clear, size: view.frame.size)
        addChild(portalGenerator)
        
    }
    
    func placeTele(x: CGFloat, y: CGFloat, ammount: Int){
        let diffs = [abs(Float(TopHeight - y)), abs(Float(CenterHeight - y)), abs(Float(BottomHeight - y))]
        let minimum = diffs.min()
        var position = diffs.index(of: minimum!) //Now if 0, goes to top, 1 goes to center, 2 goes to bot.
        if ammount == 1 {
            total_teles = 2
            portalGenerator.generatePortal(index: position!, count: ammount, x: x)
        }
        if ammount == 0 {
            total_teles = 1
            portalGenerator.generatePortal(index: position!, count: ammount, x: x)
        }
        if ammount == 2 { //Still need to do this case where both dissapear and then only the new click is the first portal
            
        }
        
            
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isGameOver{
            restart()
        }
        
        
        if !isStarted {
            movingGround.start()
            movingGroundTop.start()
            movingGroundBottom.start()
            hero.stop()
            hero.startRunning()
            wallGenerator.startGeneratingWallsEvery(seconds: 2.5)
            isStarted = true
        }
        else {
            if let touch = touches.first {
                let position = touch.location(in: self)
                print(position.x, position.y)
                placeTele(x: position.x, y: position.y, ammount: total_teles)

            }
        }

    }
    
    
    func gameOver(){
        isGameOver = true
        
        hero.physicsBody = nil
        wallGenerator.stopWalls()
        movingGround.stop()
        hero.stop()
        movingGroundTop.stop()
        movingGroundBottom.stop()
        
        let gameoverlabel = SKLabelNode(text: "Game Over!")
        gameoverlabel.fontColor = UIColor.black
        gameoverlabel.position.x = view!.center.x
        gameoverlabel.position.y = view!.center.y + 40
        gameoverlabel.fontName = "Helvetica"
        gameoverlabel.fontSize = 22.0
        addChild(gameoverlabel)
    }
    
    func restart() {
        let newScene = GameScene(size: view!.bounds.size)
        newScene.scaleMode = .aspectFill
        view!.presentScene(newScene)
    }
    
    func teleport() {
        return
    }
    
    
    func didBegin(_ contact: SKPhysicsContact) {
        print("contact")
        if let portal = contact.bodyA.node as? Portal{
            teleport() //fill this in
        }
        else if let portal = contact.bodyB.node as? Portal {
            teleport()
        }
        else {
            gameOver()
        }
        
    }
    
    
    
    
}
