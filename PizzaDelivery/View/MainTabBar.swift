//
//  MainTabBar.swift
//  PizzaDelivery
//
//  Created by Lukich on 11.10.2022.
//

import SwiftUI

struct MainTabBar: View {
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
            PersonView()
                .tabItem {
                    VStack {
                        Image(systemName: "person.circle")
                        Text("Профіль")
                    }
                }
            
        }
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBar()
    }
}
