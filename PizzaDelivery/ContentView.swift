//
//  ContentView.swift
//  PizzaDelivery
//
//  Created by Lukich on 11.10.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var nomber = ""
    @State private var password = ""

    
    var body: some View {
        VStack(spacing: 20) {
            Text("Авторизація")
                .padding()
                .padding(.horizontal, 30)
                .font(.title2.bold())
                .background(Color("whiteAlpha"))
                .cornerRadius(30)
            
            VStack {
                TextField("Номер телефону", text: $nomber)
                    .padding()
                    .background(Color("whiteAlpha"))
                    .cornerRadius(12)
                    .padding(8)
                    .padding(.horizontal, 12)
                
                SecureField("Введіть пароль", text: $password)
                    .padding()
                    .background(Color("whiteAlpha"))
                    .cornerRadius(12)
                    .padding(8)
                    .padding(.horizontal, 12)

               
                    
                    Button {
                        print("Увійти")
                    } label: {
                        Text("Увійти")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(LinearGradient(colors: [.yellow, .orange], startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(12)
                            .padding(8)
                            .padding(.horizontal, 12)
                            .font(.title3.bold())
                            .foregroundColor(Color("brown"))
                    }

                Button {
                     print("Реєстрація")
                } label: {
                    Text("Реєстрація")
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity)
                        //.background(LinearGradient(colors: [.yellow, .orange], startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(12)
                        .padding(8)
                        .padding(.horizontal, 12)
                        .font(.title3.bold())
                        .foregroundColor(Color("brown"))
                }

                
            }
            .padding()
            .padding(.top, 16)
            .background(Color("whiteAlpha"))
            .cornerRadius(12)
            .padding()
            //.padding(30)
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Image("pizza1").ignoresSafeArea())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
