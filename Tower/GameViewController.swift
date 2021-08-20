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
 
    @IBOutlet weak var StartGameText: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "StartGame") as? secvondcontroller
        self.navigationController?.isNavigationBarHidden = true
        StartGameText.layer.cornerRadius = 20
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
