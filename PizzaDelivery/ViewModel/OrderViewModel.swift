//
//  OrderViewModel.swift
//  PizzaDelivery
//
//  Created by Lukich on 17.10.2022.
//

import Foundation

class OrderViewModel: ObservableObject {
    
    @Published var order: Order
    
    init(order: Order) {
        self.order = order
    }
    
}
