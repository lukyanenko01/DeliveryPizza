//
//  MenuView.swift
//  PizzaDelivery
//
//  Created by Lukich on 12.10.2022.
//

import SwiftUI

struct MenuView: View {
    
    let layout = [GridItem(.adaptive(minimum: screen.width / 2.4))]
    
    var body: some View {
        
        //MARK: - Section 1
        ScrollView(.vertical, showsIndicators: false) {
            Section("Фаворити") {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: layout, spacing: 16) {
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
                Section("Фаворити") {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: layout, spacing: 16) {
                            ForEach(MenuViewModel.shared.pizza, id: \.id) { item in
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
        }.navigationBarHidden(true)
    }
}

struct Catalog_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
