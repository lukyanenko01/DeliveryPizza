//
//  OrderCell.swift
//  PizzaDelivery
//
//  Created by Lukich on 17.10.2022.
//

import SwiftUI

struct OrderCell: View {
    
    @State var order: Order = Order(userId: "", date: Date(), status: "Новий")
    
    var body: some View {
        HStack {
            Text("\(order.date)")
            Text("\(order.cost)")
                .bold()
                .frame(width: 90)
            Text("\(order.status)")
                .frame(width: 120)
                .foregroundColor(.green)
        }
    }
}

struct OrderCell_Previews: PreviewProvider {
    static var previews: some View {
        OrderCell()
    }
}
