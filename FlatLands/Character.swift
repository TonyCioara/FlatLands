//
//  Character.swift
//  FlatLands
//
//  Created by Elmer Astudillo on 3/8/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import SpriteKit

enum CharacterState
{
    case running
    case jumping
    case ducking
    
    func action() -> SKAction
    {
        var action = SKAction()
        switch self {
        case .running:
            return action
        case .jumping:
            return action
        case .ducking:
            return action
        }
    }
}

class Character: SKSpriteNode
{
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func jump()
    {
        cd
    }
    
    func duck()
    {
        
    }
}
