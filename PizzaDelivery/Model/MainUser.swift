//
//  MainUser.swift
//  PizzaDelivery
//
//  Created by Lukich on 16.10.2022.
//

import Foundation

struct MainUser: Identifiable {
    
    // UUID() - уникальный идентификатор, который хитрым способом гинирируеться и который не повторяемый (гинириться на основании даты и времени текущей а также на основании того, какое у вас устройство)
    
    var id: String //= UUID().uuidString
    var name: String
    var phone: Int
    var address: String

    var representation: [String: Any] {
        
        var repres = [String: Any]()
        repres["id"] = self.id
        repres["name"] = self.name
        repres["phone"] = self.phone
        repres["address"] = self.address

        return repres
    }
    
//    "id": user.id,
//    "name": user.name,
//    "phone": user.phone,
//    "address": user.address
}
