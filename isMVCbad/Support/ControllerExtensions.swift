//
//  ControllerExtensions.swift
//  isMVCbad
//
//  Created by Edgar Cardoso on 25/09/17.
//  Copyright © 2017 Concrete. All rights reserved.
//

import UIKit

extension UIViewController {
    func alert(withTitle title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .cancel) { action in
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}
