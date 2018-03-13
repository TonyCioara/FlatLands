//
//  GameScene.swift
//  FlatLands
//
//  Created by Tony Cioara on 3/6/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var leftTouchLocation: CGPoint? = nil
    var rightTouchLocation: CGPoint? = nil
    var scrollNode: SKNode!
    
    var blueCharacter = BlueCharacter()
    var redCharacter = RedCharacter()
    
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
    
    override func didMove(to view: SKView) {
        self.scrollNode = childNode(withName: "scrollNode")
//        let mapArray = [[2, 0, 3, 0 , 0, 2], [2, 0, 1, 0 , 0, 2], [1, 0, 2, 0 , 0, 1], [1, 0, 2, 0 , 1, 0], [0, 0, 0, 0 , 0, 0], [0, 0, 0, 0 , 0, 1]]
//        createMapFromArray(array: mapArray)
        addCharacters()
    }
    
    func addCharacters() {
        
        self.addChild(blueCharacter)
        self.addChild(redCharacter)
        blueCharacter.position.x = 200
        blueCharacter.position.y = 100
        redCharacter.position.x = 200
        redCharacter.position.y = 164
        
    }
    
    func createMapFromArray(array: [[Int]]) {
        for rowIndex in 0 ... array.count - 1 {
            for colIndex in 0 ... array[rowIndex].count - 1 {
                let typeValue = array[rowIndex][colIndex]
                if typeValue != 0 {
                    let type = ObstacleType(rawValue: typeValue - 1)
                    let xCoord = rowIndex * 40
                    let yCoord = colIndex * 40
                    addObstacleToScene(type: type!, xCoord: CGFloat(xCoord), yCoord: CGFloat(yCoord))
                }
            }
        }
    }
    
    func addObstacleToScene(type: ObstacleType, xCoord: CGFloat, yCoord: CGFloat) {
        let newObstacle = type.getClass()
        newObstacle.size = CGSize(width: 80, height: 80)
        self.scrollNode.addChild(newObstacle)
        newObstacle.position.x = xCoord
        newObstacle.position.y = yCoord
    }
    
    override func update(_ currentTime: TimeInterval) {
        scrollNode.position.x -= 2
        
    }
    
    func leftSideSwipeLeft() {
        print("leftSideSwipeLeft")
//        ???
    }
    
    func leftSideSwipeRight() {
        print("leftSideSwipeRight")
//        If also rightSideSwipeLeft switch positions
    }
    
    func leftSideSwipeUp() {
        print("leftSideSwipeUp")
//        Blue character jumps up
    }
    
    func leftSideSwipeDown() {
        print("leftSideSwipeDown")
//        Blue character ducks
    }
    
    func rightSideSwipeLeft() {
        print("rightSideSwipeLeft")
//        If also leftSideSwipeRight switch positions
    }
    
    func rightSideSwipeRight() {
        print("rightSideSwipeRight")
//        ???
    }
    
    func rightSideSwipeUp() {
        print("rightSideSwipeUp")
//        Red character jumps up
    }
    
    func rightSideSwipeDown() {
        print("rightSideSwipeDown")
//        Red character jumps up
    }
    
}
