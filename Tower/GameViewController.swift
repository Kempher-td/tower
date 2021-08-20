//
//  GameViewController.swift
//  Tower
//
//  Created by Victor Mashukevich on 6.08.21.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    var vc: secvondcontroller?
    
    @IBOutlet weak var Multigamebutt: UIButton!
    @IBOutlet weak var SologameButt: UIButton!
    let transition = SKTransition.flipVertical(withDuration: 0.5)
   
    @IBOutlet weak var stargametext: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "StartGame") as? secvondcontroller
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "Main") {
            
                scene.scaleMode = .aspectFill
                
        
                view.presentScene(scene, transition: transition)
            }
        }
    }
  
    @IBAction func StartGame(_ sender: Any) {
        guard let vcc = vc else {
                    return
                }
        _ = vcc.view
     
        
        
        navigationController?.show(vcc, sender: nil)
    }
    override var shouldAutorotate: Bool {
        return true
    }

    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
