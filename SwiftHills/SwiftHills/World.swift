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
    }
    
    func setupHills() {
        hills.addObject(Hill(parentFrame: scene.frame))
        let hill = Hill(parentFrame: CGRectMake(scene.frame.origin.x, scene.frame.origin.y, scene.frame.size.width, scene.frame.size.height))
        hills.addObject(hill)
        scene.addChild(hill)
        self.appendHill()
        self.appendHill()
        self.appendHill()
        self.appendHill()
    }
    
    func update() {
        let dilloPositionDifference = dillo.position.x - dilloPosition
        for object in hills {
            let hill = object as Hill
            hill.position = CGPointMake(hill.position.x - dilloPositionDifference, hill.position.y)
        }
        dillo.position = CGPointMake(dilloPosition,  dillo.position.y)
        if ((hills[0] as Hill).position.x < -1000.0) {
            appendHill()
            popHill()
        }
    }
    
    func appendHill() {
        let lastHill = (hills.lastObject as Hill)
        let hill = Hill(parentFrame: CGRectMake(lastHill.position.x + 445, lastHill.position.y, lastHill.size.width, lastHill.size.height))
        hills.addObject(hill)
        scene.addChild(hill)
    }
    
    func popHill() {
        hills.removeObjectAtIndex(0)
    }
}
