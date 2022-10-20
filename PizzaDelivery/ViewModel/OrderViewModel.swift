//
//  OrderViewModel.swift
//  PizzaDelivery
//
//  Created by Lukich on 17.10.2022.
//

import Foundation

class OrderViewModel: ObservableObject {
    
    @Published var order: Order
    @Published var user = MainUser(id: "", name: "", phone: 0, address: "")
    init(order: Order) {
        self.order = order
    }
    
    func getUserData() {
        DataBaseService.shared.getProfile(by: order.userId) { result in
            switch result {
            case .success(let user):
                self.user = user
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
