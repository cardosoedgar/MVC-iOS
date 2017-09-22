//
//  ViewController.swift
//  isMVCbad
//
//  Created by Edgar Cardoso on 22/09/17.
//  Copyright © 2017 Concrete. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let loginManager = LoginManager()
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func login(_ sender: Any) {
        loginManager.login(email: emailTextField.text, password: passwordTextField.text) { success in
            
        }
    }
    
    @IBAction func createAccount(_ sender: Any) {
        loginManager.register(name: nameTextField.text, email: emailTextField.text, password: passwordTextField.text) { success in
            
        }
    }
}

