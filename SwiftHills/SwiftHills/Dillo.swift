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
    init(imageNamed: String, origin: CGPoint) {
        let texture = SKTexture(imageNamed: imageNamed)
        super.init(texture: texture, color: nil, size: texture.size())
        self.position = origin
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
