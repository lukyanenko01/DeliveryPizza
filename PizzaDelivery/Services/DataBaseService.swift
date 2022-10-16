//
//  DataBaseService.swift
//  PizzaDelivery
//
//  Created by Lukich on 16.10.2022.
//

import Foundation
import FirebaseFirestore

class DataBaseService {
    
    static let shared = DataBaseService()
    private let db = Firestore.firestore()
    
    private var usersRef: CollectionReference {
        return db.collection("users")
    }
    
    private init() { }
    
    func setProfile(user: MainUser, completion: @escaping (Result<MainUser, Error>) -> Void) {
        
        usersRef.document(user.id).setData(user.representation) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(user))
            }
        }
    }
    
    func getProfile(complition: @escaping (Result<MainUser, Error>) -> Void){
        usersRef.document(AuthService.share.currentUser!.uid).getDocument { docSnapshot, error in
            
            guard let snap = docSnapshot else { return }
            guard let data = snap.data() else { return }
            guard let userName = data["name"] as? String else { return }
            guard let id = data["id"] as? String else { return }
            guard let phone = data["phone"] as? Int else { return }
            guard let address = data["address"] as? String else { return }

            let user = MainUser(id: id,
                                name: userName,
                                phone: phone,
                                address: address)
            
            complition(.success(user))
        }
    }
    
}
