//
//  MenuView.swift
//  PizzaDelivery
//
//  Created by Lukich on 12.10.2022.
//

import SwiftUI

struct MenuView: View {
    
    let layoutForPopular = [GridItem(.adaptive(minimum: screen.width / 2.2))]
    let layoutForPizza = [GridItem(.adaptive(minimum: screen.width / 2.4))]
    @StateObject var viewModel = MenuViewModel()

    var body: some View {
        
        //MARK: - Section 1
        ScrollView(.vertical, showsIndicators: false) {
            Section("Акції") {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: layoutForPopular, spacing: 16) {
                        ForEach(MenuViewModel.shared.favoriteProducts, id: \.id) { item in
                            NavigationLink {
                                
                                let viewModel = ProductDetailViewModel(product: item)
                                
                                ProductDetailView(viewModel: viewModel)
                            } label: {
                                ProductCell(product: item)
                                    .foregroundColor(.black)
                            }
                        }
                    }.padding()
                }
            }
            
            //MARK: - Section 2
            ScrollView(.vertical, showsIndicators: false) {
                Section("Піца") {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: layoutForPizza, spacing: 16) {
                            ForEach(viewModel.pizza, id: \.id) { item in
                                NavigationLink {
                                    let viewModel = ProductDetailViewModel(product: item)
                                    ProductDetailView(viewModel: viewModel)
                                } label: {
                                        ProductCell(product: item)
                                            .foregroundColor(.black)
                                    }
                            }
                        }.padding()
                    }
                }
            }
            .background(Color.white)
                .cornerRadius(20)

        }.navigationBarHidden(true)
            .background(Color.red)
            .onAppear {
                viewModel.getProducts()
            }
    }
}

struct Catalog_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
