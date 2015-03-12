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
    var hills : [Hill]
    let coins : NSMutableArray
    let dilloPosition : CGFloat
    var coinCollisioned : Coin?
    init(gameScene: SKScene, dillo: Dillo) {
        scene = gameScene
        coins = NSMutableArray()
        let frame = CGRectMake(-2000, scene.frame.origin.y, scene.frame.size.width, scene.frame.size.height)
        hills = [Hill(parentFrame: frame), Hill(parentFrame: frame), Hill(parentFrame: frame), Hill(parentFrame: frame), Hill(parentFrame: frame), Hill(parentFrame: frame), Hill(parentFrame: frame)]
        self.dillo = dillo
        dilloPosition = dillo.position.x
        super.init()
        self.setupHills()
    }
    
    func setupHills() {
        for hill in hills {
            scene.addChild(hill)
        }
    }
    
    func update() {
        let dilloPositionDifference = dillo.position.x - dilloPosition
        for object in hills {
            let hill = object as Hill
            hill.position = CGPointMake(hill.position.x - dilloPositionDifference, hill.position.y)
        }
        updateCoins()
        dillo.position = CGPointMake(dilloPosition,  dillo.position.y)
        for hill in hills {
            if (hill.position.x < -1000.0) {
                popHill()
            }
        }
    }
    
    func updateCoins() {
        while coins.count < 10 {
            let coin = Coin(origin: CGPointMake(-2000.0, 600.0))
            coins.addObject(coin)
            scene.addChild(coin)
            (coins.lastObject as Coin).position.x = CGFloat(arc4random_uniform(1000)) + 1000
            (coins.lastObject as Coin).position.y = CGFloat(arc4random_uniform(200)) + 400
        }
        let dilloPositionDifference = dillo.position.x - dilloPosition
        for obj in coins {
            let coin = obj as Coin
            coin.position.x = coin.position.x - dilloPositionDifference
            if coin.position.x < -1000 {
                resetCoin(coin)
            }
        }
        if coinCollisioned != nil {
            resetCoin(coinCollisioned!)
            coinCollisioned = nil
        }
    }
    
    func popHill() {
        var minHill : Hill
        var maxHill : Hill
        (minHill, maxHill) = minMaxHills()
        minHill.position = CGPointMake(maxHill.position.x + 550, 235)
    }
    
    func minMaxHills() -> (minHill: Hill, maxHill: Hill) {
        var minHill = hills.first!
        var maxHill = hills.first!
        for hill in hills {
            minHill = minHill.position.x > (hill as Hill).position.x ? hill : minHill
            maxHill = maxHill.position.x < (hill as Hill).position.x ? hill : maxHill
        }
        return (minHill, maxHill)
    }
    
    func hitCoin(coin: Coin) {
        coinCollisioned = coin
    }
    
    func resetCoin(coin: Coin) {
        coin.position.x = CGFloat(arc4random_uniform(1000)) + 1000
        coin.position.y = CGFloat(arc4random_uniform(200)) + 400
    }
}
