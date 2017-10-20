//
//  HomeView.swift
//  isMVCbad
//
//  Created by Edgar Cardoso on 20/10/17.
//  Copyright © 2017 Concrete. All rights reserved.
//

import UIKit
import Cartography

@objc protocol HomeViewDelegate {
    func logoutButtonPressed()
}

class HomeView: UIView, ViewCode {
    
    let logoutButton = UIButton(type: .system)
    var delegate: HomeViewDelegate?
    
    init() {
        super.init(frame: CGRect.zero)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        constrain(self, logoutButton) { containerView, logoutButton in
            logoutButton.center == containerView.center
        }
    }
    
    func buildViewHierarchy() {
        self.addSubview(logoutButton)
    }
    
    func configureViews() {
        self.backgroundColor = .white
        
        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.addTarget(delegate, action: #selector(delegate?.logoutButtonPressed), for: .touchUpInside)
    }
}
