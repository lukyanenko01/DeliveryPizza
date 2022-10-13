//
//  MenuViewModel.swift
//  PizzaDelivery
//
//  Created by Lukich on 12.10.2022.
//

import Foundation

// ObservableObject - такой обьект, за которым можно вести наблюдение
// Все ViewModels рекомендуеться подписывать под этот протокол в SwiftUI

class MenuViewModel: ObservableObject {
    
    //Создаем синглтон
    
    static let shared = MenuViewModel()
    
    var favoriteProducts = [
        Product(id: "1",
                title: "Маргарита Гурме",
                imageUrl: "Not Found",
                price: 69,
                descript: "Дешева піца бери і їж"),
        Product(id: "2",
                title: "Пепероні",
                imageUrl: "Not Found",
                price: 169,
                descript: "Дешева піца бери і їж"),
        Product(id: "3",
                title: "Маргарита",
                imageUrl: "Not Found",
                price: 99,
                descript: "Дешева піца бери і їж"),
        Product(id: "4",
                title: "Гавайська",
                imageUrl: "Not Found",
                price: 129,
                descript: "Дешева піца бери і їж"),
        Product(id: "5",
                title: "Діабло",
                imageUrl: "Not Found",
                price: 139,
                descript: "Дешева піца бери і їж")
    ]
    
    var pizza = [
        Product(id: "1",
                title: "Маргарита Гурме",
                imageUrl: "Not Found",
                price: 69,
                descript: "Дешева піца бери і їж"),
        Product(id: "2",
                title: "Пепероні",
                imageUrl: "Not Found",
                price: 169,
                descript: "Дешева піца бери і їж"),
        Product(id: "3",
                title: "Маргарита",
                imageUrl: "Not Found",
                price: 99,
                descript: "Дешева піца бери і їж"),
        Product(id: "4",
                title: "Гавайська",
                imageUrl: "Not Found",
                price: 129,
                descript: "Дешева піца бери і їж"),
        Product(id: "5",
                title: "Діабло",
                imageUrl: "Not Found",
                price: 139,
                descript: "Дешева піца бери і їж")
    ]
    
}
