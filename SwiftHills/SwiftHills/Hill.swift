//
//  Hill.swift
//  SwiftHills
//
//  Created by Mauricio Bell'Albero on 3/7/15.
//  Copyright (c) 2015 StoryTree. All rights reserved.
//

import UIKit
import SpriteKit

class Hill: GameNode {
    init(parentFrame: CGRect) {
        let frame = CGRectMake(parentFrame.origin.x + 50, 235,
            parentFrame.size.width, 4.0)
        let texture = SKTexture(imageNamed: "hill2.png")
        super.init(imageNamed: "hill2.png")
        self.position = frame.origin
        self.physicsBody = SKPhysicsBody(texture: texture, size: texture.size())
        self.physicsBody!.velocity = CGVectorMake(0.0, 0.0)
        self.physicsBody!.affectedByGravity = false
        self.physicsBody!.linearDamping = 0.0
        self.physicsBody!.dynamic = false
        self.physicsBody!.friction = 0.0
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
