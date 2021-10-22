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
    var SceneView: SKView?

    override func loadView() {
        SceneView = SKView()
        SceneView!.backgroundColor = .white

        self.view = SceneView
    }
    
    func StartGame() {
        let Transition = SKTransition.flipVertical(withDuration: 0.5)
        if let View = self.view as! SKView? {
            
            if let Scene = SKScene(fileNamed: "GameScene") {

                Scene.scaleMode = .aspectFill
                
                
                View.presentScene(Scene, transition: Transition)
            }
        
            
            View.showsFPS = true
            View.showsNodeCount = true
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
            loadView()
        StartGame()
        
        
   
    
        }
    }
