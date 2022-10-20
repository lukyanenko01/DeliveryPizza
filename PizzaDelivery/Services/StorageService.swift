//
//  StorageService.swift
//  PizzaDelivery
//
//  Created by Vladimir Lukyanenko on 20.10.2022.
//

import Foundation
import FirebaseStorage

class StorageService {
    
    static let shared = StorageService()
    private init() {  }
    
    private let storage = Storage.storage().reference()
    private var productsRef: StorageReference { storage.child("products") }
    
    func upload(id: String, image: Data, completion: @escaping (Result<String, Error>) -> Void) {
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpg"
        
        productsRef.child(id).putData(image, metadata: metadata) { metadata, error in
            
            guard let metadata = metadata else {
                if let error = error {
                    completion(.failure(error))
                }
                return
            }
            
            completion(.success("Розмер изображения \(metadata.size)"))
            
        }
        
    }
    
    
    
}