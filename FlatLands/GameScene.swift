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
        print("-----")
//        print("Calculating swipe on the \(side) side with location1: \(firstTouch) and location2: \(lastTouch)")
        let yChange = lastTouch.y - firstTouch.y
        let xChange = lastTouch.x - firstTouch.x
        if abs(xChange) > abs(yChange) {
            if xChange <= -20 {
                if side == "left" {
                    leftSideSwipeLeft()
                } else {
                    rightSideSwipeLeft()
                }
            } else if xChange >= 20 {
                if side == "left" {
                    leftSideSwipeRight()
                } else {
                    rightSideSwipeRight()
                }
            }
        } else {
            if yChange >= 20 {
                if side == "left" {
                    leftSideSwipeDown()
                } else {
                    rightSideSwipeDown()
                }
            } else if yChange <= -20 {
                if side == "left" {
                    leftSideSwipeUp()
                } else {
                    rightSideSwipeUp()
                }
            }
        }
    }
    
    func leftSideSwipeLeft() {
        print("leftSideSwipeLeft")
    }
    
    func leftSideSwipeRight() {
        print("leftSideSwipeRight")
    }
    
    func leftSideSwipeUp() {
        print("leftSideSwipeUp")
    }
    
    func leftSideSwipeDown() {
        print("leftSideSwipeDown")
    }
    
    func rightSideSwipeLeft() {
        print("rightSideSwipeLeft")
    }
    
    func rightSideSwipeRight() {
        print("rightSideSwipeRight")
    }
    
    func rightSideSwipeUp() {
        print("rightSideSwipeUp")
    }
    
    func rightSideSwipeDown() {
        print("rightSideSwipeDown")
    }
    
}
