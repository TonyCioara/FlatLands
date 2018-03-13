//
//  PhysicsContacts.swift
//  FlatLands
//
//  Created by Tony Cioara on 3/13/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import SpriteKit

struct PhysicsCategory {
    static let None:    UInt32 = 0          // 00000
    static let RedCharacter:  UInt32 = 0b1        // 00001
    static let BlueCharacter:   UInt32 = 0b10       // 00010
    static let GrayBox:  UInt32 = 0b100      // 00100
    static let BlueBox:   UInt32 = 0b1000     // 01000
    static let RedBox:   UInt32 = 0b10000     // 10000
}

