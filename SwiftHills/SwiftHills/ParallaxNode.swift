//
//  ParallaxNode.swift
//  SwiftHills
//
//  Created by Mauricio Bell'Albero on 2/26/15.
//  Copyright (c) 2015 StoryTree. All rights reserved.
//
//  This is a conversion from objective-c to Swift
//  class:   FMMParallaxNode.m
//  project: SpaceShooter
//  by:      Tony Dahbura
//


import Foundation
import UIKit
import SpriteKit

class ParallaxNode : SKNode {
    var backgrounds : NSMutableArray = []
    var numberOfImagesForBackground : NSTimeInterval = 0.0
    var lastUpdateTime : NSTimeInterval = 0.0
    var deltaTime : NSTimeInterval = 0.0
    var pointsPerSecondSpeed : Float = 0.0
    var randomizeDuringRollover : Bool = false
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init(files: [], size: CGSizeMake(0.0, 0.0), pointsPerSecondSpeed: 0.0)
    }
    
    convenience init(file: NSString, size: CGSize, pointsPerSecondSpeed: Float) {
        self.init(files: [file, file, file], size: size, pointsPerSecondSpeed: pointsPerSecondSpeed);
    }
    
    init(files: NSArray, size: CGSize, pointsPerSecondSpeed: Float) {
        self.pointsPerSecondSpeed = pointsPerSecondSpeed
        self.numberOfImagesForBackground = Double(files.count)
        self.backgrounds = NSMutableArray(capacity: Int(numberOfImagesForBackground))
        self.randomizeDuringRollover = false
        super.init()
        files.enumerateObjectsUsingBlock { (obj: AnyObject!, idx: Int, stop: UnsafeMutablePointer<ObjCBool>) -> Void in
            let node = SKSpriteNode(imageNamed: obj as String)
            node.size = size
            node.anchorPoint = CGPointZero
            node.position = CGPointMake(size.width * CGFloat(idx), 0.0)
            node.name = "background"
            self.backgrounds.addObject(node)
            self.addChild(node)
        }
    }
    
    func randomValueBetween(low: CGFloat, high: CGFloat) -> CGFloat {
        return ((CGFloat(arc4random()) / 0xFFFFFFFF) * (high - low)) + low;
    }
    
    func randomizeNodesPositions() {
        backgrounds.enumerateObjectsUsingBlock { (obj: AnyObject!, idx: Int, stop: UnsafeMutablePointer<ObjCBool>) -> Void in
            let node = obj as SKSpriteNode
            self.randomizeNodePosition(node)
        }
        randomizeDuringRollover = true
    }
    
    func randomizeNodePosition(node: SKSpriteNode) {
        let randomYPosition = self.randomValueBetween(node.size.height / 2.0, high: (self.frame.size.height-node.size.height/2.0))
        node.position = CGPointMake(node.position.x, randomYPosition)
    }
    
    func update(currentTime: NSTimeInterval) {
        if (lastUpdateTime >= 0.0) {
            deltaTime = currentTime - lastUpdateTime
        } else {
            deltaTime = 0
        }
        lastUpdateTime = currentTime
        
        let bgVelocity = CGPointMake(CGFloat(-pointsPerSecondSpeed), 0.0)
        let amtToMove = CGPointMake(bgVelocity.x * CGFloat(deltaTime), bgVelocity.y * CGFloat(deltaTime));
        self.position = CGPointMake(self.position.x + amtToMove.x, self.position.y + amtToMove.y)
        let backgroundScreen = self.parent
        
        backgrounds.enumerateObjectsUsingBlock { (obj: AnyObject!, idx: Int, stop: UnsafeMutablePointer<ObjCBool>) -> Void in
            
            let bg = obj as SKSpriteNode;
            let bgScreenPos = self.convertPoint(bg.position, toNode: backgroundScreen!)
            if (bgScreenPos.x <= -bg.size.width) {
                bg.position = CGPointMake(bg.position.x + (bg.size.width * CGFloat(self.numberOfImagesForBackground)), bg.position.y);
                if (self.randomizeDuringRollover) {
                    self.randomizeNodePosition(bg)
                }
            }
        }
    }
}
