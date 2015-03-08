//
//  Wall.swift
//  SwiftHills
//
//  Created by Mauricio Bell'Albero on 3/7/15.
//  Copyright (c) 2015 StoryTree. All rights reserved.
//

import UIKit
import SpriteKit

class Wall: SKSpriteNode {
    init(parentFrame: CGRect) {
        let frame = CGRectMake(0.0, 100 - 4.0,
            parentFrame.size.width, 4.0)
        super.init(texture: nil, color: UIColor.yellowColor(), size: frame.size)
        self.position = frame.origin
        let path = CGPathCreateWithRect(CGRectMake(0, 0, frame.size.width, frame.size.height), nil)
        self.physicsBody = SKPhysicsBody(polygonFromPath: path)
        self.physicsBody!.velocity = CGVectorMake(0.0, 0.0)
        self.physicsBody!.affectedByGravity = false
        self.physicsBody!.linearDamping = 0.0
        self.physicsBody!.dynamic = false
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
