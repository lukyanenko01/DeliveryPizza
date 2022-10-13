//
//  PositionCell.swift
//  PizzaDelivery
//
//  Created by Lukich on 13.10.2022.
//

import SwiftUI

struct PositionCell: View {
    
    let position: Position
    
    var body: some View {
        HStack {
            Text(position.product.title)
                .fontWeight(.bold)
            Spacer()
            Text("\(position.count) шт.")
            Text("\(position.cost) грн")
                .frame(width: 85, alignment: .trailing)
        }.padding(.horizontal)
    }
}

struct PositionCell_Previews: PreviewProvider {
    static var previews: some View {
        PositionCell(
            position: Position(id: UUID().uuidString,
                                        product: Product(id: UUID().uuidString,
                                                         title: "Маргарита",
                                                         imageUrl: "pizzaPH",
                                                         price: 350,
                                                         descript: "tratratratratratrat"),
                                        count: 3))
    }
}
