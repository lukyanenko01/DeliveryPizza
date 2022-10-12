//
//  AuthView.swift
//  PizzaDelivery
//
//  Created by Lukich on 11.10.2022.
//

import SwiftUI

struct AuthView: View {
    
    @State private var isAuth = true
    
    @State private var nomber = ""
    @State private var password = ""
    @State private var repitPassword = ""
    
    @State private var isTabViewShow = false

    
    var body: some View {
        VStack(spacing: 20) {
            Text(isAuth ? "Авторизація" : "Реєстрація")
                .padding(isAuth ? 16 : 24)
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
                
                if !isAuth {
                    SecureField("Повторіть пароль", text: $repitPassword)
                        .padding()
                        .background(Color("whiteAlpha"))
                        .cornerRadius(12)
                        .padding(8)
                        .padding(.horizontal, 12)
                }
               
                    
                    Button {
                        if isAuth {
                            print("Увійти")
                            self.isTabViewShow.toggle()
                        } else {
                            print("Реєстрація")
                            self.nomber = ""
                            self.password = ""
                            self.repitPassword = ""
                            self.isAuth.toggle()
                        }
                        
                    } label: {
                        Text(isAuth ? "Увійти" : "Створити аккаунт")
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
                    self.isAuth.toggle()
                } label: {
                    Text(isAuth ? "Реєстрація" : "Повернутися")
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
            .padding(isAuth ? 30 : 12)
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Image("pizza1")
                .ignoresSafeArea()
                .blur(radius: isAuth ? 0 : 6)
            )
            .animation(Animation.easeInOut(duration: 0.3), value: isAuth)
            .fullScreenCover(isPresented: $isTabViewShow) {
                MainTabBar()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}

