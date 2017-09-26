//
//  CreateAccountViewController.swift
//  isMVCbad
//
//  Created by Edgar Cardoso on 25/09/17.
//  Copyright © 2017 Concrete. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var delegate: LoginViewControllerDelegate?
    let loginManager = LoginManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func createAccount(_ sender: Any) {
        loginManager.createAccount(email: emailTextField.text, password: passwordTextField.text) { success in
            if success {
                if let email = self.emailTextField.text {
                    self.delegate?.fill(withEmail: email)
                    return self.dismiss(animated: true, completion: nil)
                }
            }
            
            self.alert(withTitle: "error", message: "try again")
        }
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
