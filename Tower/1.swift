//
//  mainmenu.swift
//  Tower
//
//  Created by Victor Mashukevich on 15.08.21.
//

import UIKit
import SpriteKit
class mainmenu: SKScene {
    
    
    var playButton = SKSpriteNode(color: SKColor.white, size: CGSize(width:32, height:32))
       
    var field: SKEmitterNode!
        override func didMove(to view: SKView) {
            field = SKEmitterNode(fileNamed: "Rain")
            self.addChild(field)
        }

        
}
