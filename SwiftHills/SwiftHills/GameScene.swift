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
    var parallaxSpaceDust : ParallaxNode!
    var parallaxNodeBackgrounds : ParallaxNode!
    
    override func didMoveToView(view: SKView) {
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
        let parallaxBackgroundNames = ["bg_galaxy.png", "bg_planetsunrise.png",
            "bg_spacialanomaly.png", "bg_spacialanomaly2.png"]
        let planetSizes = CGSizeMake(200.0, 200.0)
        parallaxNodeBackgrounds = ParallaxNode(files: parallaxBackgroundNames, size: planetSizes, pointsPerSecondSpeed: 10.0)
        parallaxNodeBackgrounds.position = CGPointMake(size.width/2.0, size.height/2.0)
        parallaxNodeBackgrounds.randomizeNodesPositions()
        self.addChild(parallaxNodeBackgrounds)
        let parallaxBackground2Names = ["bg_front_spacedust.png", "bg_front_spacedust.png"]
        parallaxSpaceDust = ParallaxNode(files: parallaxBackground2Names, size: size, pointsPerSecondSpeed: 25.0)
        parallaxSpaceDust.position = CGPointMake(0, 0);
        self.addChild(parallaxSpaceDust)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
    }
   
    override func update(currentTime: CFTimeInterval) {
        parallaxNodeBackgrounds.update(currentTime)
        parallaxSpaceDust.update(currentTime)
    }
}