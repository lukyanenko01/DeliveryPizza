//
//  PizzaDeliveryApp.swift
//  PizzaDelivery
//
//  Created by Lukich on 11.10.2022.
//

import SwiftUI

let screen = UIScreen.main.bounds

@main
struct PizzaDeliveryApp: App {
    var body: some Scene {
        WindowGroup {
            AuthView()
        }
    }
}
