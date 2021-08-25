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
      
    let EnemyCat: UInt32 = 1*0 << 1
    
    
    var background: SKSpriteNode?
    
    var plas: SKSpriteNode?
  
    var touched: Bool = false
    
    var location = CGPoint.zero
  
 
    var GameTimer: Timer!
 
    var EnemyTime: Timer!
    
    var ShotTime: Double = 0.0
    
    
    
    override func didMove(to view: SKView) {
       
       
        
        sprite = SKSpriteNode(imageNamed: "1")
        
        sprite.size = CGSize(width: 150, height: 150)
        
        sprite.position = CGPoint(x:0, y:-500)
        
        background = SKSpriteNode(imageNamed: "map")
        
        background?.size = CGSize(width: 1280, height: 2000)
      
        ShotTime = 0.5
    
        GameTimer = Timer.scheduledTimer(timeInterval: 0.75, target: self, selector: #selector(Enemy), userInfo: nil, repeats: true )
        
        EnemyTime = Timer.scheduledTimer(timeInterval: ShotTime, target: self, selector: #selector(bullet), userInfo: nil, repeats: true)
    
       
        
        self.addChild(background!)
        
        self.addChild(sprite)
    
      
         }
   



    // Cтрельба
  @objc  func bullet(){
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
        action.append(SKAction.move(to: CGPoint(x: sprite.position.x, y: 1000), duration: duraction))
        action.append(SKAction.removeFromParent())
        bullet.run(SKAction.sequence(action))
        
        
        
    }
    // Появление Врагов
  @objc   func Enemy(){
        
        
        let enemy = SKSpriteNode(color: SKColor.white, size: CGSize(width: 100, height: 100))
  
    let Randompos = GKRandomDistribution(lowestValue: -630, highestValue: 630)
       
        let pos = CGFloat(Randompos.nextInt())
   
        enemy.position = CGPoint(x: pos, y: 1000)
    
        enemy.physicsBody = SKPhysicsBody(circleOfRadius: enemy.size.width)
       
        enemy.physicsBody?.isDynamic = true
        
        enemy.physicsBody?.categoryBitMask = EnemyCat
        
        enemy.physicsBody?.contactTestBitMask = bulletcatagory
        
        enemy.physicsBody?.collisionBitMask = 0
        
        let duraction: TimeInterval = 8
        var action = [SKAction]()
    
    action.append(SKAction.move(to: CGPoint(x: pos, y: -1200), duration: duraction))
        
    action.append(SKAction.removeFromParent())
       
    enemy.run(SKAction.sequence(action))
        
        self.addChild(enemy)
    }
    
    
    
  // Передвежение Персонажа
    func moveNodeToLocation() {
      
        var dx = location.x - sprite.position.x
       
        var dy = location.y - sprite.position.y
       
        let speed:CGFloat = 0.3
      
        dx = dx * speed
      
        dy = dy * speed
        
        sprite.position = CGPoint(x:sprite.position.x+dx, y: sprite.position.y+dy)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        touched = true
        
    
        var touch = touches
        
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
     
        touched = false
      
    }
  // Постоянное обновление
    override func update(_ currentTime: TimeInterval) {
        if (touched) {
            moveNodeToLocation()
        }

        
        
    }
   
}

