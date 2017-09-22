//
//  FirebaseRequest.swift
//  isMVCbad
//
//  Created by Edgar Cardoso on 22/09/17.
//  Copyright © 2017 Concrete. All rights reserved.
//

import Foundation
import Firebase

class FirebaseRequest: NetworkRequest {
    
    func register(name: String, email: String, password: String, completion: @escaping (Result<User>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { user, error in
            guard let user = user, let email = user.email else {
                return completion(.error)
            }
            
            user.createProfileChangeRequest().displayName = name
            
            let registeredUser = User(id: user.uid, name: name, email: email)
            completion(.success(registeredUser))
        }
    }
    
    func login(email: String, password: String, completion: @escaping (Result<User>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { user, error in
            guard let user = user, let email = user.email, let name = user.displayName else {
                return completion(.error)
            }
            
            let loginUser = User(id: user.uid, name: name, email: email)
            completion(.success(loginUser))
        }
    }
}
