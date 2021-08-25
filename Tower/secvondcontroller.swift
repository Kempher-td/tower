//
//  ViewController.swift
//  Tower
//
//  Created by Victor Mashukevich on 13.08.21.
//

import UIKit
import SpriteKit
import GameplayKit

class secvondcontroller: UIViewController {
    var sceneView: SKView?

    override func loadView() {
        sceneView = SKView()
        sceneView!.backgroundColor = .white

        self.view = sceneView
    }
    
    func startgame() {
        let transition = SKTransition.flipVertical(withDuration: 0.5)
        if let view = self.view as! SKView? {
            
            if let scene = SKScene(fileNamed: "GameScene") {

                scene.scaleMode = .aspectFill
                
                
                view.presentScene(scene, transition: transition)
            }
        
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
            loadView()
        startgame()
        
        
   
    
        }
    }
