//
//  AddProductView.swift
//  PizzaDelivery
//
//  Created by Vladimir Lukyanenko on 20.10.2022.
//

import SwiftUI

struct AddProductView: View {
    
    @State private var showImagePicker = false
    @State private var image = UIImage(named: "pizzaPH")!
    @State private var title: String = ""
    @State private var discript: String = ""
    @State private var price: Int? = nil

    
    var body: some View {

        VStack {
            Text("Добавити товар")
                .font(.title2).bold()
            Image(uiImage: image)
                .resizable()
                .frame(maxWidth: .infinity,minHeight: 300 , maxHeight: 320)
                .aspectRatio(contentMode: .fit)
                .onTapGesture {
                    showImagePicker.toggle()
                }
            TextField("Назва продукта", text: $title)
                .padding()
            TextField("Ціна продукта", value: $price, format: .number)
                .keyboardType(.numberPad)
                .padding()
            TextField("Опис продукта", text: $discript)
                .padding()
            
            Button {
                print("Зберегти")
            } label: {
                Text("Зберегти")
                    .padding()
                    .padding(.horizontal, 30)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(16)
            }

            Spacer()

        }
        .padding()
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(sourceType: .photoLibrary, selectedImage: $image)
        }
    }
}

struct AddProductView_Previews: PreviewProvider {
    static var previews: some View {
        AddProductView()
    }
}
