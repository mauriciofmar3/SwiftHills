//
//  Coin.swift
//  SwiftHills
//
//  Created by Mauricio Bell'Albero on 3/4/15.
//  Copyright (c) 2015 StoryTree. All rights reserved.
//

import UIKit
import SpriteKit

let coinImage = UIImage(named: "star3.png")!
let coinCollision = 1

class Coin: GameNode {
    init(origin: CGPoint) {
        super.init(texture: SKTexture(image: coinImage))
        self.physicsBody = SKPhysicsBody(texture: texture, size: texture!.size())
        self.physicsBody!.categoryBitMask = UInt32(coinCollision)
        self.physicsBody!.collisionBitMask = UInt32(coinCollision)
        self.position = origin
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
