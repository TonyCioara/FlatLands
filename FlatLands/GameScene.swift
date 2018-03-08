//
//  GameScene.swift
//  FlatLands
//
//  Created by Tony Cioara on 3/6/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var leftTouchLocation: CGPoint? = nil
    var rightTouchLocation: CGPoint? = nil
    
    override func didMove(to view: SKView) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self.view)
            if location.x > (self.view?.frame.midX)! {
                rightTouchLocation = location
            } else {
                leftTouchLocation = location
            }
        }
    }
    
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for touch in touches {
//            if
//        }
//    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self.view)
            if leftTouchLocation != nil && location.x < (self.view?.frame.midX)! {
                calculateSwipe(side: "left", firstTouch: leftTouchLocation!, lastTouch: location)
                leftTouchLocation = nil
            }
            else if rightTouchLocation != nil && location.x > (self.view?.frame.midX)! {
                calculateSwipe(side: "right", firstTouch: rightTouchLocation!, lastTouch: location)
                rightTouchLocation = nil
            }
        }
    }
    
    func calculateSwipe(side: String, firstTouch: CGPoint, lastTouch: CGPoint) {
        print("Calculating swipe on the \(side) side with location1: \(firstTouch) and location2: \(lastTouch)")
    }
    
}
