//
//  BlueCharacter.swift
//  FlatLands
//
//  Created by Tony Cioara on 3/13/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import SpriteKit

class BlueCharacter: SKSpriteNode {
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        
        let size = CGSize(width: 64, height: 64)
        let texture = SKTexture(image: #imageLiteral(resourceName: "blueCharacter"))
        let color = UIColor.init(white: 0, alpha: 0)
        super.init(texture: texture, color: color, size: size)
        
        self.physicsBody = SKPhysicsBody(rectangleOf: size)
        
        self.physicsBody?.mass = 1
        self.physicsBody?.linearDamping = 0.5
        self.physicsBody?.allowsRotation = false
        
        self.physicsBody!.categoryBitMask    = PhysicsCategory.BlueCharacter // 00010
        self.physicsBody!.collisionBitMask   = PhysicsCategory.RedBox + PhysicsCategory.BlueBox + PhysicsCategory.GrayBox + PhysicsCategory.RedCharacter // 11101
        self.physicsBody!.contactTestBitMask = PhysicsCategory.RedBox + PhysicsCategory.BlueBox + PhysicsCategory.GrayBox + PhysicsCategory.RedCharacter // 11101
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func jump() {
        
    }
}
