//
//  HomeViewController.swift
//  isMVCbad
//
//  Created by Edgar Cardoso on 25/09/17.
//  Copyright © 2017 Concrete. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, HomeViewDelegate {
    
    let configManager = ConfigManager()
    let homeView = HomeView()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        homeView.delegate = self
        self.view = homeView
    }
    
    func logoutButtonPressed() {
        configManager.signout {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
