//
//  HomeViewController.swift
//  isMVCbad
//
//  Created by Edgar Cardoso on 25/09/17.
//  Copyright © 2017 Concrete. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let loginManager = LoginManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func logout(_ sender: Any) {
        loginManager.signout {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
