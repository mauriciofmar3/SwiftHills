//
//  Dillo.swift
//  SwiftHills
//
//  Created by Mauricio Bell'Albero on 3/4/15.
//  Copyright (c) 2015 StoryTree. All rights reserved.
//

import UIKit
import SpriteKit

class Dillo {
    var node : SKSpriteNode
    init(imageNamed: String, frame: CGRect) {
        node = SKSpriteNode(imageNamed: imageNamed)
    }
}
