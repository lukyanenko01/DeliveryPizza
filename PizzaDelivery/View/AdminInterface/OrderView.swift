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
        
        VStack(alignment: .leading, spacing: 8) {
            Text("\(viewModel.user.name)")
                .font(.title3).bold()
            Text("+380 \(viewModel.user.phone)")
                .bold()
            Text("\(viewModel.user.address)")
            
            List {
                Text("A List Item")
                Text("A Second List Item")
                Text("A Third List Item")
                ForEach(viewModel.order.positions, id: \.id) { position in
                    PositionCell(position: position)
                }
            }
            Text("Итого: \(viewModel.order.cost) грн")
        }.padding()
            .onAppear {
                viewModel.getUserData()
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
