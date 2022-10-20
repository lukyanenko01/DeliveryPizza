//
//  ProductDetailViewModel.swift
//  PizzaDelivery
//
//  Created by Lukich on 12.10.2022.
//

import Foundation
import UIKit

class ProductDetailViewModel: ObservableObject {
    
    @Published var product: Product
    @Published var sizes = ["S", "M", "XL"]
    @Published var image = UIImage(named: "pizzaPH")
    
    init(product: Product) {
        self.product = product
    }
    
    func getPrice(size: String) -> Int {
        switch size {
        case "S": return product.price
        case "M": return Int(Double(product.price) * 1.25)
        case "Xl": return Int(Double(product.price) * 2)
        default: return 0
        }
    }
    
    func getImage() {
        StorageService.shared.downloadProductImage(id: product.id) { result in
            switch result {
            case .success(let data):
                if let image = UIImage(data: data) {
                    self.image = image
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
