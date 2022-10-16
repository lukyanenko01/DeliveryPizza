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
    
    private var orderRef: CollectionReference {
        return db.collection("orders")
    }
    
    private init() { }
    
    func setOrder(order: Order, completion: @escaping (Result<Order, Error>) -> Void) {
        
        orderRef.document(order.id).setData(order.representation) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                self.setPositions(to: order.id,
                             positions: order.positions) { result in
                    switch result {
                        
                    case .success(let positions):
                        print(positions.count)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
                completion(.success(order))
            }
        }
    }
    
    func setPositions(to orderId: String, positions: [Position], completion: @escaping (Result<[Position], Error>) -> Void) {
        let positionRef = orderRef.document(orderId).collection("position")
        for position in positions {
            positionRef.document(position.id).setData(position.representation)
        }
        completion(.success(positions))
    }
    
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
