//
//  LoginManager.swift
//  isMVCbad
//
//  Created by Edgar Cardoso on 22/09/17.
//  Copyright © 2017 Concrete. All rights reserved.
//

import Foundation

class LoginManager {
    private var user: User?
    private let network: NetworkRequest
    
    init() {
        self.network = FirebaseRequest()
    }
    
    func login(email: String?, password: String?, completion: @escaping (Bool) -> Void) {
        guard let email = email, let password = password else {
            return completion(false)
        }
        
        network.login(email: email, password: password) { result in
            guard case .success(let user) = result else {
                return completion(false)
            }
            
            self.user = user
            completion(true)
        }
    }
    
    func createAccount(email: String?, password: String?, completion: @escaping (Bool) -> Void) {
        guard let email = email, let password = password else {
            return completion(false)
        }
        
        network.createAccount(email: email, password: password) { result in
            guard case .success = result else {
                return completion(false)
            }
            completion(true)
        }
    }
    
    func signout(completion: @escaping () -> Void) {
        network.signout(completion: nil)
        completion()
    }
}
