//
//  OrderView.swift
//  PizzaDelivery
//
//  Created by Lukich on 17.10.2022.
//

import SwiftUI

struct OrderView: View {
    
    @StateObject var viewModel: OrderViewModel    
    
    var body: some View {
        
        VStack {
            Text("Адмін Адмін")
            Text("+380 999999999")
            Text("вул Вернадського 87")
            
            List {
                ForEach(viewModel.order.positions, id: \.id) { position in
                    PositionCell(position: position)
                }
            }
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(viewModel: OrderViewModel(order: Order(userId: "",
                                                         date: Date(),
                                                         status: "Новий")))
    }
}
