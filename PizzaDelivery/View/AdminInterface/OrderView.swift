//
//  OrderView.swift
//  PizzaDelivery
//
//  Created by Lukich on 17.10.2022.
//

import SwiftUI

struct OrderView: View {
    
    @StateObject var viewModel: OrderViewModel
    
    var statuses: [String] {
        var sts = [String]()
        
        for status in OrderStatus.allCases {
            sts.append(status.rawValue)
        }
        return sts
    }
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            Text("\(viewModel.user.name)")
                .font(.title3).bold()
            Text("+380 \(viewModel.user.phone)")
                .bold()
            Text("\(viewModel.user.address)")
        }.padding()
            .onAppear {
                viewModel.getUserData()
            }
        
        Picker(selection: $viewModel.order.status) {
            ForEach(statuses, id: \.self) { status in
                Text(status)
            }
        } label: {
            Text("Статус заказа")
        }
        .pickerStyle(.segmented)
        .onChange(of: viewModel.order.status) { newStatus in
            DataBaseService.shared.setOrder(order: viewModel.order) { result in
                switch result {
                case .success(let order):
                    print(order.status)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }

        
            List {
                Text("A List Item")
                Text("A Second List Item")
                Text("A Third List Item")
                ForEach(viewModel.order.positions, id: \.id) { position in
                    PositionCell(position: position)
                }
            }
            Text("Итого: \(viewModel.order.cost) грн")
        
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(viewModel: OrderViewModel(order: Order(userId: "",
                                                         date: Date(),
                                                         status: "Новий")))
    }
}
