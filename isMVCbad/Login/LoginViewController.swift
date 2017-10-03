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

class LoginViewController: UIViewController, LoginViewControllerDelegate, LoginViewDelegate {
    
    var loginManager = LoginManager()
    let loginView = LoginView()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        loginView.delegate = self
        self.view = loginView
    }
    
    func loginButtonPressed() {
        loginManager.login(email: loginView.getEmail(), password: loginView.getPassword()) { success in
            if success {
                return self.loadHome()
            }
        
            self.alert(withTitle: "Error", message: "email ou senha incorretos!")
        }
    }
    
    func createAccountButtonPressed() {
        let vc = CreateAccountViewController(delegate: self)
        self.present(vc, animated: true, completion: nil)
    }
    
    func loadHome() {
        let homeVC = storyboard?.instantiateViewController(withIdentifier: "HomeViewController")
        if let homeVC = homeVC {
            self.present(homeVC, animated: true, completion: nil)
        }
    }
    
    func fill(withEmail email: String) {
        loginView.fillTextFieild(withEmail: email)
    }
}

