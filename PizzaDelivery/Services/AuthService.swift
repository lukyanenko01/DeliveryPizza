//
//  AuthService.swift
//  PizzaDelivery
//
//  Created by Lukich on 13.10.2022.
//

import Foundation
import FirebaseAuth

class AuthService {
    
    static let share = AuthService()
    
    private init() { }
    
    private let auth = Auth.auth()
    
    private var currentUser: User? {
        return auth.currentUser
    }
    
    func signUp(email: String,
                password: String,
                completion: @escaping (Result<User, Error>) -> Void) {
        
        auth.createUser(withEmail: email,
                        password: password) { result, error in
            if let result = result {
                completion(.success(result.user))
            } else if let error = error {
                completion(.failure(error))
            }
        }
        
    }
    
}
