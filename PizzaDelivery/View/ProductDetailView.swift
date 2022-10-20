//
//  ProductDetailView.swift
//  PizzaDelivery
//
//  Created by Lukich on 12.10.2022.
//

import SwiftUI

struct ProductDetailView: View {
    
    @State var viewModel: ProductDetailViewModel
    @State var size = "S"
    @State var count = 1
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        VStack {
            VStack(alignment: .leading) {
                
                Image(uiImage: self.viewModel.image!)
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: 360)
                    .aspectRatio(contentMode: .fit)
                HStack {
                    Text("\(viewModel.product.title)")
                        .font(.title2.bold())
                    Spacer()
                    Text("\(viewModel.getPrice(size: self.size)) грн")
                        .font(.title2)

                }.padding(.horizontal)
                
                Text("\(viewModel.product.descript)")
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                
                HStack {
                    Stepper("Кількість", value: $count, in: 1...10)
                    
                    Text("\(self.count)")
                        .padding(.leading, 32)
                }.padding(.horizontal)

                Picker("Розмір", selection: $size) {
                    ForEach(viewModel.sizes, id: \.self) { item in
                        Text(item)
                    }
                }.pickerStyle(.segmented)
                    .padding()
            }
            Button {
                var position = Position(id: UUID().uuidString,
                                        product: viewModel.product,
                                        count: self.count)
                
                position.product.price = viewModel.getPrice(size: size)
                
                CartViewModel.shared.addPosition(position: position)
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("В кошик")
                    .padding()
                    .padding(.horizontal, 60)
                    .foregroundColor(Color("brown"))
                    .font(.title2.bold())
                    .background(LinearGradient(colors: [.yellow, .orange], startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(30)

            }
            .onAppear {
                self.viewModel.getImage()
            }
            
            Spacer()
        }
    }
}

struct ProductDitailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(viewModel: ProductDetailViewModel(product: Product(id: "1",
                                                                             title: "Маргарита",
                                                                             imageUrl: "Not Found",
                                                                             price: 69,
                                                                             descript: "Дешева піца бери і їж")))
    }
}
