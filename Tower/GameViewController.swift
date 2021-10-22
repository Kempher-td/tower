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

    @IBOutlet weak var Dif: UIButton!
    var Vc: secvondcontroller?
    
    @IBOutlet weak var StartGameText: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "StartGame") as? secvondcontroller
        self.navigationController?.isNavigationBarHidden = true
        StartGameText.layer.cornerRadius = 20
        Dif.layer.cornerRadius = 20
        
    }
  
    @IBAction func StartGame(_ sender: Any) {
         guard let SecondView = Vc else {
                     return
                 }
       
        
        _ = SecondView.view
     
        
       
        navigationController?.show(SecondView, sender: nil)
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
