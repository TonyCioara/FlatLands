//
//  Obstacle.swift
//  FlatLands
//
//  Created by Tony Cioara on 3/8/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import SpriteKit

enum ObstacleType : Int {
    case grayBox, redBox, blueBox
    
    func getClass() -> SKSpriteNode {
        var box: SKSpriteNode!
        switch self {
        case .grayBox:
            box = GrayBox()
        case .redBox:
            box = RedBox()
        case .blueBox:
            box = BlueBox()
        }
        return box
    }
}

class GrayBox: SKSpriteNode {
//    Both characters are immune to it
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        let size = CGSize(width: 80, height: 80)
        let texture = SKTexture(imageNamed: "grayBox")
        super.init(texture: texture, color: UIColor.init(white: 0, alpha: 0), size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

class RedBox: SKSpriteNode {
//    Red character is immune to it
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        let size = CGSize(width: 80, height: 80)
        let texture = SKTexture(imageNamed: "redBox")
        super.init(texture: texture, color: UIColor.init(white: 0, alpha: 0), size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

class BlueBox: SKSpriteNode {
//    Blue character is immune to it
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        let size = CGSize(width: 80, height: 80)
        let texture = SKTexture(imageNamed: "blueBox")
        super.init(texture: texture, color: UIColor.init(white: 0, alpha: 0), size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
