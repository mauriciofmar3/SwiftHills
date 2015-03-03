//
//  GameScene.swift
//  SwiftHills
//
//  Created by Mauricio Bell'Albero on 2/26/15.
//  Copyright (c) 2015 StoryTree. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var ship : SKSpriteNode!
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
//        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
//        myLabel.text = "Hello, World!";
//        myLabel.fontSize = 65;
//        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
//        
        //        self.addChild(myLabel)
        self.backgroundColor = SKColor.blackColor()

        self.setupBackground()
        self.setupShip()
    }
    
    func setupShip() {
        ship = SKSpriteNode(imageNamed: "SpaceFlier_sm_1.png")
        ship.position = CGPointMake(self.frame.size.width * 0.1, CGRectGetMidY(self.frame))
        self.addChild(ship)
    }
    
    func setupBackground() {
        
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            
            let sprite = SKSpriteNode(imageNamed:"Spaceship")
            
            sprite.xScale = 0.5
            sprite.yScale = 0.5
            sprite.position = location
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            sprite.runAction(SKAction.repeatActionForever(action))
            
            self.addChild(sprite)
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
