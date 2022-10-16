//
//  MainTabBarViewModel.swift
//  PizzaDelivery
//
//  Created by Lukich on 16.10.2022.
//

import Foundation
import FirebaseAuth

class MainTabBarViewModel: ObservableObject {
    
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
    
}
