//
//  GameScene.swift
//  Tower
//
//  Created by Victor Mashukevich on 6.08.21.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene,SKPhysicsContactDelegate {


  
    var Player = SKSpriteNode(color: SKColor.white, size: CGSize(width:32, height:32))
   
    let BulletCatagory: UInt32 = 0x1 << 0
      
    let EnemyCatagory: UInt32 = 1
    
    
    var ScoreLabel: SKLabelNode!
    var Score: Int = 0 {
        didSet{
            ScoreLabel.text = "Cчёт: \(Score)"
        }
    }
    
    
   
    var Enemys = ["RD1","RD2","RD3","RD4"]
    var Plas: SKSpriteNode?
  
    var touched: Bool = false
    
    var Location = CGPoint.zero

 
    var GameTimer: Timer!
 
    var EnemyTime: Timer!
    
    var ShotTime: Double = 0.0
    
    var backgroundeffect: SKEmitterNode!
   
    override func didMove(to view: SKView) {

        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
       
        self.physicsWorld.contactDelegate = self
      
        backgroundeffect = SKEmitterNode(fileNamed: "Star")

        backgroundeffect.position = CGPoint(x: 0, y: 1000)
        backgroundeffect.advanceSimulationTime(20)
        ScoreLabel = SKLabelNode(text: "Cчёт: 0")
      
        Player = SKSpriteNode(imageNamed: "starship")
        
        ScoreLabel.fontName = "AmericanTypewriter-Bold"
        ScoreLabel.fontSize = 60
        ScoreLabel.fontColor = UIColor.white
        ScoreLabel.position = CGPoint(x: -450, y: 700)
        
        Player.size = CGSize(width: 150, height: 150)
        
        Score = 0
        
        
    
        Player.position = CGPoint(x:0, y:-500)
        
        self.backgroundColor = UIColor.black
        ShotTime = 0.4
      
        
           
        
      EnemyTime = Timer.scheduledTimer(timeInterval: ShotTime, target: self, selector: #selector(Bullet), userInfo: nil, repeats: true)

        GameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(AddEnemy), userInfo: nil, repeats: true )
       
        
       
     //   self.addChild(background!)
        self.addChild(backgroundeffect)
        self.addChild(Player)
        self.addChild(ScoreLabel)
     
     
         }
    
  
  
  

    func didBegin(_ contact: SKPhysicsContact) {
        var EnemyBody:SKPhysicsBody
        var BulletBody: SKPhysicsBody
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask  {
            BulletBody = contact.bodyA
            EnemyBody = contact.bodyB
        } else {
            EnemyBody = contact.bodyB
            BulletBody = contact.bodyA
            
        }
        
        if (EnemyBody.categoryBitMask & EnemyCatagory) != 0 && (BulletBody.categoryBitMask & BulletCatagory) != 0 {
            Coolision(BulletNode: BulletBody.node as! SKSpriteNode, EnemyNode: EnemyBody.node as! SKSpriteNode)
        }
      
    }
       
        
    
    func Coolision(BulletNode: SKSpriteNode, EnemyNode: SKSpriteNode){
       let explosion = SKEmitterNode(fileNamed: "Vzriv")
        explosion?.position = EnemyNode.position
        self.addChild(explosion!)
        self.run(SKAction.playSoundFileNamed("Demol", waitForCompletion: false))
        
        BulletNode.removeFromParent()
        EnemyNode.removeFromParent()
        self.run(SKAction.wait(forDuration: 1)){
            explosion?.removeFromParent()
        }
        
        Score += 1

    }

    // Cтрельба
  @objc  func Bullet(){
        let Bullet = SKSpriteNode(color: SKColor.red, size: CGSize(width: 10, height: 40))
   
        Bullet.position = Player.position
        Bullet.position.y += 90
        Bullet.physicsBody = SKPhysicsBody(circleOfRadius: 30)
        Bullet.physicsBody?.isDynamic = true
        Bullet.physicsBody?.categoryBitMask = BulletCatagory
        Bullet.physicsBody?.contactTestBitMask = EnemyCatagory
         Bullet.physicsBody?.collisionBitMask = 0
        Bullet.physicsBody?.usesPreciseCollisionDetection = true
        self.addChild(Bullet)
        
    let duraction: TimeInterval = 0.3
        var Action = [SKAction]()
        Action.append(SKAction.move(to: CGPoint(x: Player.position.x, y: 1000), duration: duraction))
        Action.append(SKAction.removeFromParent())
        Bullet.run(SKAction.sequence(Action))
    self.run(SKAction.playSoundFileNamed("fire", waitForCompletion: false))
        
        
        
    }
    // Появление Врагов
  @objc   func AddEnemy(){
    Enemys = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: Enemys) as! [String]
    
    let Enemy = SKSpriteNode(imageNamed: Enemys[0])
    
    
     let Randompos = GKRandomDistribution(lowestValue: -630, highestValue: 630)
       
        let Pos = CGFloat(Randompos.nextInt())
   
        Enemy.position = CGPoint(x: Pos, y: 1000)
    
        Enemy.physicsBody = SKPhysicsBody(circleOfRadius: 100)
       
        Enemy.physicsBody?.isDynamic = true
        
        Enemy.physicsBody?.categoryBitMask = EnemyCatagory
        
        Enemy.physicsBody?.contactTestBitMask = BulletCatagory
        
        Enemy.physicsBody?.collisionBitMask = 0
     
        
        let Duraction: TimeInterval = 6
        var Action = [SKAction]()
    
    Action.append(SKAction.move(to: CGPoint(x: Pos, y: -1200), duration: Duraction))
        
    Action.append(SKAction.removeFromParent())
       
    Enemy.run(SKAction.sequence(Action))
        
        self.addChild(Enemy)
    }
    
    
    
  // Передвежение Персонажа
    func MoveNodeToLocation() {
      
        var Dx = Location.x - Player.position.x
       
        var Dy = Location.y - Player.position.y
       
        let Speed:CGFloat = 0.3
      
        Dx = Dx * Speed
      
        Dy = Dy * Speed
        
        Player.position = CGPoint(x:Player.position.x+Dx, y: Player.position.y+Dy)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        touched = true
        
    
        
        
        for touch in touches {
            Location = touch.location(in:self)
           
        }
      
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            Location = touch.location(in: self)
           
        }
       
      
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
     
        touched = false
      
    }
  // Постоянное обновление
    override func update(_ currentTime: TimeInterval) {
        if (touched) {
            MoveNodeToLocation()
        }
      
       
        
    }
   
}

