//
//  AddProductView.swift
//  PizzaDelivery
//
//  Created by Vladimir Lukyanenko on 20.10.2022.
//

import SwiftUI

struct AddProductView: View {
    
    @State private var showImagePicker = false
    @State private var image = UIImage(named: "pizzaSymbol")!
    @State private var title: String = ""
    @State private var descript: String = ""
    @State private var price: Int? = nil
    @Environment (\.dismiss) var dismiss
    
    var body: some View {

        VStack {
            Text("Добавити товар")
                .font(.title2).bold()
            Image(uiImage: image)
                .resizable()
                .frame(maxWidth: .infinity,minHeight: 200 , maxHeight: 320)
                .aspectRatio(contentMode: .fit)
                .onTapGesture {
                    showImagePicker.toggle()
                }
            TextField("Назва продукта", text: $title)
                .padding()
            TextField("Ціна продукта", value: $price, format: .number)
                .keyboardType(.numberPad)
                .padding()
            TextField("Опис продукта", text: $descript)
                .padding()
            
            Button {
                
                guard let price = price else {
                    print("Невозможно извлечь цену")
                    return
                }
                
                let product = Product(id: UUID().uuidString, title: title, price: price, descript: descript)
                guard let imageData = image.jpegData(compressionQuality: 0.15) else { return }
                DataBaseService.shared.setProduct(product: product, image: imageData) { result in
                    switch result {
                    case .success(let product):
                        print(product.title)
                        dismiss()
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
                
                
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
