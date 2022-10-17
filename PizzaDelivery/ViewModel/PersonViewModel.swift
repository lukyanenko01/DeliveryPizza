//
//  PersonViewModel.swift
//  PizzaDelivery
//
//  Created by Lukich on 16.10.2022.
//

import Foundation

class PersonViewModel: ObservableObject {
    
    @Published var profaile: MainUser
    @Published var orders: [Order] = [Order]()
    
    init(profile: MainUser) {
        self.profaile = profile
    }
    
    func getOrders() {
        DataBaseService.shared.getOrders(by: AuthService.share.currentUser!.accessibilityHint) { result in
            switch result {
            case .success(let orders):
                self.orders = orders
                print("Всбого замовлень: \(orders.count)")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func setProfile() {
        
        DataBaseService.shared.setProfile(user: self.profaile) { result in
            switch result {
                
            case .success(let user):
                print(user.name)
            case .failure(let error):
                print("Помилка відправки данних \(error.localizedDescription)")
            }
        }
    }
    
    func getProfile() {
        DataBaseService.shared.getProfile { result in
            switch result {
            case .success(let user):
                self.profaile = user
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
    
}
