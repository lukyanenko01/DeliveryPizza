//
//  ProductCell.swift
//  PizzaDelivery
//
//  Created by Lukich on 12.10.2022.
//

import SwiftUI

struct ProductCell: View {
    
    var product: Product
    @State var uiImage = UIImage(named: "pizzaPH")
    
    var body: some View {
        VStack(spacing: 2) {
            Image(uiImage: uiImage!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: screen.width * 0.45)
                .clipped()
            HStack {
                Text(product.title)
                    .font(.custom("AvenirNext-regular", size: 12))
                Spacer()
                Text("\(product.price) грн")
                    .font(.custom("AvenirNext-bold", size: 12))
            }
            .padding(.horizontal, 8)
            .padding(.bottom, 6)
        }.frame(width: screen.width * 0.45, height: screen.width * 0.55)
            .background(Color.white)
            .cornerRadius(16)
            .shadow(radius: 2)
            .onAppear {
                StorageService.shared.downloadProductImage(id: self.product.id) { result in
                    switch result {
                    case .success(let data):
                        if let img = UIImage(data: data) {
                            self.uiImage = img
                        }
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
    }
}

struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell(product: Product(id: "1",
                                     title: "Маргарита",
                                     imageUrl: "Not Found",
                                     price: 69,
                                     descript: "Дешева піца бери і їж"))
    }
}
