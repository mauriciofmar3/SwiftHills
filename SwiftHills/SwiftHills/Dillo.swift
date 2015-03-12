//
//  Dillo.swift
//  SwiftHills
//
//  Created by Mauricio Bell'Albero on 3/4/15.
//  Copyright (c) 2015 StoryTree. All rights reserved.
//

import UIKit
import SpriteKit

class Dillo : SKSpriteNode {
    let maxSpeed : CGFloat = 500.0
    var increasedDescent : Bool = false
    init(imageNamed: String, origin: CGPoint) {
        let texture = SKTexture(imageNamed: imageNamed)
        super.init(texture: texture, color: nil, size: texture.size())
        self.position = origin
        self.physicsBody = SKPhysicsBody(circleOfRadius: 30.0)
        self.physicsBody!.velocity = CGVectorMake(0.0, 0.0)
        self.physicsBody!.affectedByGravity = true
        self.physicsBody!.linearDamping = 0.0
        self.physicsBody!.restitution = 0.0
        self.physicsBody!.categoryBitMask = UInt32(coinCollision)
        self.physicsBody!.collisionBitMask = 2
        self.physicsBody!.contactTestBitMask = UInt32(coinCollision)

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateVelocity() {
        var dx = self.physicsBody!.velocity.dx
        var dy = self.physicsBody!.velocity.dy
        if (increasedDescent) {
            dy -= 5.0
        }
        dy = max(dy, -maxSpeed)
        dy = min(dy, maxSpeed)
        dx = max(dx, 30.0)
        
        self.physicsBody?.velocity = CGVectorMake(dx, dy)
    }
}
