//
//  BuildScene.swift
//  FlatLands
//
//  Created by Tony Cioara on 3/9/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import SpriteKit

class BuildScene: SKScene {
    
    var barNode: SKSpriteNode!
    var scrollNode: SKNode!
    
    var scrolling = false
    
    var previousScrollPosition:CGPoint? = nil
    
    var touchingNode: SKSpriteNode? = nil {
        didSet {
            touchingNode?.zPosition += 10
        }
    }
    
    var mapArray = [[Int]]()
    
    override func didMove(to view: SKView) {
        
        self.barNode = childNode(withName: "barNode") as! SKSpriteNode
        self.scrollNode = childNode(withName: "scrollNode")
        
//        createGrid()
        
        for obstacleIndex in 0 ... ObstacleType.allValues.count - 1 {
            let obstacle = ObstacleType.allValues[obstacleIndex]
            let newNode = obstacle.getClass()
            newNode.name = obstacle.getName()
            newNode.size = CGSize(width: 80, height: 80)
            
            newNode.position.x = 0
            newNode.position.y = CGFloat(80 + obstacleIndex * 140)
            newNode.zPosition = 1
            
            self.barNode.addChild(newNode)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch:UITouch = touches.first!
        let positionInScene = touch.location(in: self)
        
        previousScrollPosition = positionInScene
        
        let touchedNode = self.atPoint(positionInScene)
        if let name = touchedNode.name {
            if name == "background" {
                scrolling = true
            }
            for obstacle in ObstacleType.allValues {
                if name == obstacle.getName() + "Copy" {
                    touchingNode = (touchedNode as! SKSpriteNode)
                    return
                } else if name == obstacle.getName() {
                    createMoveableNode(obstacle: obstacle, position: positionInScene)
                    return
                }
            }
        }
    }
    
//    func createGrid() {
//        
////        create vertical grid lines
//        var current_height = 0
//        while current_height < Int((self.view?.frame.height)!) {
//            print("height: \(current_height) 2: \(self.view?.frame.height)")
//            let hLine = SKSpriteNode(imageNamed: "hGridLine")
//            hLine.position.x = (self.view?.frame.width)!
//            hLine.position.y = CGFloat(40 + current_height)
//            hLine.zPosition = 0
//            self.addChild(hLine)
//            current_height += 40
//        }
//    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if scrolling == true {
            let touch:UITouch = touches.first!
            let positionInScene = touch.location(in: self)
            scroll(fingerPostion: positionInScene)
        }
        if touchingNode != nil {
            let touch:UITouch = touches.first!
            let positionInScene = touch.location(in: self)
            touchingNode?.position.y = positionInScene.y
            touchingNode?.position.x = positionInScene.x - scrollNode.position.x
        }
    }
    
    func scroll(fingerPostion: CGPoint) {
        if previousScrollPosition == nil {
            return
        }
        
        let scrollValueX = fingerPostion.x - (previousScrollPosition?.x)!
//        let scrollValueY = fingerPostion.y - (previousScrollPosition?.y)!
        scrollNode.position.x += scrollValueX
        if scrollNode.position.x > 122 {
            scrollNode.position.x = 122
        }
        previousScrollPosition = fingerPostion
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        scrolling = false
        if touchingNode == nil { return }
        
        snapNode(node: touchingNode!)
        
        touchingNode?.zPosition -= 10
        //        TODO: Snap node to grid. Delete if in trash after adding trash
        if (touchingNode?.position.x)! <= CGFloat(122) - scrollNode.position.x {
            touchingNode?.removeFromParent()
            print("remove from parent")
        }
        
        touchingNode = nil
    }
    
    func snapNode(node: SKSpriteNode) {
        
        let snapSize: CGFloat = 40
        
        let positionDeltaX = node.position.x.truncatingRemainder(dividingBy: snapSize)
        let positionDeltaY = node.position.y.truncatingRemainder(dividingBy: snapSize)
        
        print("---")
        print(positionDeltaY)
        print(positionDeltaX)
        
        var newPosX = Int(node.position.x)
        var newPosY = Int(node.position.y)
        
        if positionDeltaX > snapSize / 2 {
            newPosX += Int(snapSize - positionDeltaX + 0.1)
        } else {
            newPosX -= Int(positionDeltaX + 0.1)
        }
        
        if positionDeltaY > snapSize / 2 {
            newPosY += Int(snapSize - positionDeltaY + 0.1)
        } else {
            newPosY -= Int(positionDeltaY + 0.1)
        }
        
        node.position.y = CGFloat(newPosY)
        node.position.x = CGFloat(newPosX)
        
        print("---")
        print("YPOS: \(node.position.y)")
        print("XPOS: \(node.position.x)")
    }
    
    func createMoveableNode(obstacle: ObstacleType, position: CGPoint) {
        
        let newNode = obstacle.getClass()
        newNode.name = obstacle.getName() + "Copy"
        newNode.size = CGSize(width: 80, height: 80)
        newNode.position.y = position.y
        newNode.position.x = position.x - scrollNode.position.x
        
        newNode.zPosition = 5
        
        scrollNode.addChild(newNode)
        
        touchingNode = newNode
    }
}
