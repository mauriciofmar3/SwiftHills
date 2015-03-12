//
//  Hill.swift
//  SwiftHills
//
//  Created by Mauricio Bell'Albero on 3/7/15.
//  Copyright (c) 2015 StoryTree. All rights reserved.
//

import UIKit
import SpriteKit

let dilloImage = UIImage.imageWithImage(UIImage(named: "Hill2.png")!, newSize: CGSizeMake(550.0, 277.0))

class Hill: GameNode {
    init(parentFrame: CGRect) {
        let frame = CGRectMake(parentFrame.origin.x + 50, 235,
            parentFrame.size.width, 4.0)
        let texture = SKTexture(image: dilloImage)
        super.init(texture: texture)
        self.position = frame.origin
        self.physicsBody = SKPhysicsBody(texture: texture, size: texture.size())
        self.physicsBody!.velocity = CGVectorMake(0.0, 0.0)
        self.physicsBody!.affectedByGravity = false
        self.physicsBody!.linearDamping = 0.0
        self.physicsBody!.dynamic = false
        self.physicsBody!.friction = 0.0
        self.physicsBody!.restitution = 0.0
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
