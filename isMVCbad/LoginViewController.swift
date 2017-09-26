//
//  ViewController.swift
//  isMVCbad
//
//  Created by Edgar Cardoso on 22/09/17.
//  Copyright © 2017 Concrete. All rights reserved.
//

import UIKit

protocol LoginViewControllerDelegate {
    func fill(withEmail email: String)
}

class LoginViewController: UIViewController, LoginViewControllerDelegate {

    var loginManager = LoginManager()
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func login(_ sender: Any) {
        loginManager.login(email: emailTextField.text, password: passwordTextField.text) { success in
            if success {
                return self.loadHome()
            }
            
            self.alert(withTitle: "Error", message: "email ou senha incorretos!")
        }
    }
    
    @IBAction func createAccount(_ sender: Any) {
        loadCreateAccount()
    }
    
    func loadHome() {
        let homeVC = storyboard?.instantiateViewController(withIdentifier: "HomeViewController")
        if let homeVC = homeVC {
            self.present(homeVC, animated: true, completion: nil)
        }
    }
    
    func loadCreateAccount() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "CreateAccountViewController") as? CreateAccountViewController
        if let vc = vc {
            vc.delegate = self
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    func fill(withEmail email: String) {
        self.emailTextField.text = email
    }
}

