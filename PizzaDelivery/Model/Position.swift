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
    
}
