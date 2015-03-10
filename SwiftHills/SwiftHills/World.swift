//
//  Ground.swift
//  SwiftHills
//
//  Created by Mauricio Bell'Albero on 3/9/15.
//  Copyright (c) 2015 StoryTree. All rights reserved.
//

import UIKit
import SpriteKit

class World: NSObject {
    let scene : SKScene
    let dillo : Dillo
    let hills : NSMutableArray
    let dilloPosition : CGFloat
    init(gameScene: SKScene, dillo: Dillo) {
        scene = gameScene
        hills = NSMutableArray()
        self.dillo = dillo
        self.dilloPosition = dillo.position.x
        super.init()
        self.setupHills()
        self.addHillsToScene()
    }
    
    func setupHills() {
        hills.addObject(Hill(parentFrame: scene.frame))
        let hill = Hill(parentFrame: CGRectMake(scene.frame.origin.x + 500, scene.frame.origin.y, scene.frame.size.width, scene.frame.size.height))
        hills.addObject(hill)
        hill = Hill(parentFrame: CGRectMake(scene.frame.origin.x + 1000, scene.frame.origin.y, scene.frame.size.width, scene.frame.size.height))
        hills.addObject(hill)
        hill = Hill(parentFrame: CGRectMake(scene.frame.origin.x + 1500, scene.frame.origin.y, scene.frame.size.width, scene.frame.size.height))
        hills.addObject(hill)
        hill = Hill(parentFrame: CGRectMake(scene.frame.origin.x + 2000, scene.frame.origin.y, scene.frame.size.width, scene.frame.size.height))
        hills.addObject(hill)
    }
    
    func addHillsToScene() {
        for hill in hills {
            scene.addChild(hill as GameNode)
        }
    }
    
    func update() {
        let dilloPositionDifference = dillo.position.x - dilloPosition
        for object in hills {
            let hill = object as Hill
            hill.position = CGPointMake(hill.position.x - dilloPositionDifference, hill.position.y)
            if (hill.position < -300) {
                addHill()
            }
            
        }
        dillo.position = CGPointMake(dilloPosition,  dillo.position.y)
    }
    
    func addHill() {
        
    }
    
    
}
