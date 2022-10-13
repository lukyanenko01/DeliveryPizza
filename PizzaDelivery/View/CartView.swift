//
//  CartView.swift
//  PizzaDelivery
//
//  Created by Lukich on 12.10.2022.
//

import SwiftUI

struct CartView: View {
    
    @StateObject var viewModel: CartViewModel
    
    var body: some View {
        VStack {
            List(viewModel.positions) { position in
                PositionCell(position: position)
                    .swipeActions {
                        Button {
                            viewModel.positions.removeAll { pos in
                                pos.id == position.id
                            }
                        } label: {
                            Text("Видалити")
                        }.tint(.red)

                    }
            }
            .listStyle(.plain)
        .navigationTitle("Корзина")
            
            HStack {
                Text("До сплати:")
                    .fontWeight(.bold)
                Spacer()
                Text("\(self.viewModel.cost) грн")
                    .fontWeight(.bold)
            }.padding()
            
            HStack(spacing: 24) {
                Button {
                    print("Відмінити")
                } label: {
                    Text("Відмінити")
                        .font(.body)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(24)
                }
                
                Button {
                    print("Замовити")
                } label: {
                    Text("Замовити")
                        .font(.body)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(24)
                }

            }.padding()
            
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(viewModel: CartViewModel.shared)
    }
}
