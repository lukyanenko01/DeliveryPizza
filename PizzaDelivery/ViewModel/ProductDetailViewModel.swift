//
//  ProductDetailViewModel.swift
//  PizzaDelivery
//
//  Created by Lukich on 12.10.2022.
//

import Foundation

class ProductDetailViewModel: ObservableObject {
    
    @Published var product: Product
    @Published var sizes = ["S", "M", "XL"]
    
    
    init(product: Product) {
        self.product = product
    }
    
    func getPrice(size: String) -> Int {
        switch size {
        case "S": return product.price
        case "M": return Int(Double(product.price) * 1.25)
        case "Xl": return Int(Double(product.price) * 1.5)
        default: return 0
        }
    }
    
    
}
