//
//  ConfigManager.swift
//  isMVCbad
//
//  Created by Edgar Cardoso on 25/09/17.
//  Copyright © 2017 Concrete. All rights reserved.
//

import Foundation

class ConfigManager {
    
    let network: NetworkRequest = FirebaseRequest()
    
    func signout(completion: @escaping () -> Void) {
        network.signout(completion: nil)
        completion()
    }
}
