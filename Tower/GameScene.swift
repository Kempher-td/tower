//
//  GameScene.swift
//  Tower
//
//  Created by Victor Mashukevich on 6.08.21.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    

    var sprite = SKSpriteNode(color: SKColor.white, size: CGSize(width:32, height:32))
    let bulletcatagory: UInt32 = 1*0 << 1
    var field: SKEmitterNode!
    var background: SKSpriteNode?
    var plas: SKSpriteNode?
    var touched: Bool = false
    var location = CGPoint.zero
    
    override func didMove(to view: SKView) {
        field = SKEmitterNode(fileNamed: "Rain")

        sprite = SKSpriteNode(imageNamed: "1")
        sprite.size = CGSize(width: 150, height: 150)
        sprite.position = CGPoint(x:0, y:-500)
         
        self.addChild(field)
        self.addChild(sprite)
        
         }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        touched = true
        for touch in touches {
            location = touch.location(in:self)
            
        }
       
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            location = touch.location(in: self)
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Stop node from moving to touch
        touched = false
      
    }

    
    func bullet(){
        let bullet = SKSpriteNode(color: SKColor.blue, size: CGSize(width: 10, height: 10))
        bullet.position = sprite.position
        bullet.position.y += 90
        bullet.physicsBody = SKPhysicsBody(circleOfRadius: bullet.size.width / 2)
        bullet.physicsBody?.isDynamic = true
        bullet.physicsBody?.categoryBitMask = bulletcatagory
        bullet.physicsBody?.collisionBitMask = 0
        self.addChild(bullet)
        let duraction: TimeInterval = 1
        var action = [SKAction]()
        action.append(SKAction.move(to: CGPoint(x: sprite.position.x, y: 800), duration: duraction))
        action.append(SKAction.removeFromParent())
        bullet.run(SKAction.sequence(action))
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        if (touched) {
            moveNodeToLocation()
        }
bullet()
    
        
    }
   
    
    // Move the node to the location of the touch
    func moveNodeToLocation() {
        // Compute vector components in direction of the touch
        var dx = location.x - sprite.position.x
        var dy = location.y - sprite.position.y
        // How fast to move the node. Adjust this as needed
        let speed:CGFloat = 0.1
        // Scale vector
        dx = dx * speed
        dy = dy * speed
        sprite.position = CGPoint(x:sprite.position.x+dx, y: -500)
    }
}

