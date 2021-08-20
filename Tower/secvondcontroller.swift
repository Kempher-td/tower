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
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
            
                view.presentScene(scene, transition: transition)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
            loadView()
        startgame()
        
        
   
    
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


