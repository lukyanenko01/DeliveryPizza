//
//  Position.swift
//  PizzaDelivery
//
//  Created by Lukich on 13.10.2022.
//

import Foundation

struct Position: Identifiable {
    
    var id: String
    var product: Product
    var count: Int
    
    var cost: Int {
        return product.price * self.count
    }
    
    var representation: [String: Any] {
        var repres = [String: Any]()
        repres["id"] = id
        repres["count"] = count
        repres["title"] = product.title
        repres["price"] = product.price
        repres["cost"] = self.cost
        return repres
    }
    
}
