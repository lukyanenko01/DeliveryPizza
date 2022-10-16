//
//  OrderStatus.swift
//  PizzaDelivery
//
//  Created by Lukich on 16.10.2022.
//

import Foundation

enum OrderStatus: String {
    case new = "Новий"
    case cooking = "Готується"
    case delivery = "Замовлення в дорозі"
    case complete = "Виконаний"
    case cancelled = "Профуканий"
}
