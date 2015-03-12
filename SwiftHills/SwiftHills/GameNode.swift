//
//  Level.swift
//  SwiftHills
//
//  Created by Mauricio Bell'Albero on 3/9/15.
//  Copyright (c) 2015 StoryTree. All rights reserved.
//

import UIKit
import SpriteKit

class GameNode: SKSpriteNode {
    init(texture: SKTexture) {
        super.init(texture: texture, color: nil, size: texture.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
