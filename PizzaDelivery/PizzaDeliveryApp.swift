//
//  PizzaDeliveryApp.swift
//  PizzaDelivery
//
//  Created by Lukich on 11.10.2022.
//

import SwiftUI
import Firebase

let screen = UIScreen.main.bounds

@main
struct PizzaDeliveryApp: App {
    var body: some Scene {
        WindowGroup {
            AuthView()
        }
    }
    
    class AppDelegate: NSObject, UIApplicationDelegate {
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            
            FirebaseApp.configure()
            return true
        }
    }
    
}
