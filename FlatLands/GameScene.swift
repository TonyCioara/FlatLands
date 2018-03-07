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
    
    var leftScreen: SKScene!
    var rightScreen: SKScene!
    
    override func didMove(to view: SKView) {
        
        leftScreen = SKScene
        
//        Initialize swipe gesture recognizers
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view?.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view?.addGestureRecognizer(swipeLeft)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizerDirection.up
        self.view?.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeDown.direction = UISwipeGestureRecognizerDirection.down
        self.view?.addGestureRecognizer(swipeDown)
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.right:
                side1Right()
            case UISwipeGestureRecognizerDirection.left:
                side1Left()
            case UISwipeGestureRecognizerDirection.down:
                side1Down()
            case UISwipeGestureRecognizerDirection.up:
                side1Up()
            default:
                break
            }
        }
    }
    
    func side1Up() {
        print("side1Up")
    }
    
    func side1Down() {
        print("side1Down")
    }
    
    func side1Left() {
        print("side1Left")
    }
    
    func side1Right() {
        print("side1Right")
    }
    
}
