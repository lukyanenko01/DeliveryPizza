//
//  MainTabBar.swift
//  PizzaDelivery
//
//  Created by Lukich on 11.10.2022.
//

import SwiftUI

struct MainTabBar: View {
    
    var viewModel: MainTabBarViewModel
    
    var body: some View {
        
        TabView {
            
            NavigationView {
                MenuView()
            }
            .tabItem {
                VStack {
                    Image(systemName: "menucard")
                    Text("Меню")
                }
            }
                        
            CartView(viewModel: CartViewModel.shared)
                .tabItem {
                    VStack {
                        Image(systemName: "cart")
                        Text("Корзина")
                    }
                }
            PersonView(viewModel: PersonViewModel(profile: MainUser(id: "",
                                                                      name: "",
                                                                      phone: 0000000000,
                                                                      address: "")))
                .tabItem {
                    VStack {
                        Image(systemName: "person.circle")
                        Text("Профіль")
                    }
                }
            
        }
        
    }
}

//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainTabBar(viewModel: MainTabBarViewModel(user: User()))
//    }
//}
