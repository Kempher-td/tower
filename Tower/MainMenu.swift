//
//  mainmenu.swift
//  Tower
//
//  Created by Victor Mashukevich on 15.08.21.
//

import UIKit
import SpriteKit
class MainMenu: SKScene {
    
    
    var playButton = SKSpriteNode(color: SKColor.white, size: CGSize(width:32, height:32))
    let playButtonTex = SKTexture(imageNamed: "play")
    
    var field: SKEmitterNode!
        override func didMove(to view: SKView) {
            playButton = SKSpriteNode(texture: playButtonTex)
                   playButton.position = CGPoint(x: frame.midX, y: frame.midY)
                   self.addChild(playButton)
           
            
        }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
          if let touch = touches.first {
              let pos = touch.location(in: self)
              let node = self.atPoint(pos)

              if node == playButton {
                  if let view = view {
                     
                    let transition:SKTransition = SKTransition.fade(withDuration: 1)
                      let scene:SKScene = GameScene(size: self.size)
                    scene.scaleMode = .aspectFill
                      self.view?.presentScene(scene, transition: transition)
                  }
              }
          }
    }
}
