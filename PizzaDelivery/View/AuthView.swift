//
//  AuthView.swift
//  PizzaDelivery
//
//  Created by Lukich on 11.10.2022.
//

import SwiftUI

struct AuthView: View {
    
    @State private var isAuth = true
    
    @State private var email = ""
    @State private var password = ""
    @State private var repitPassword = ""
    @State private var isTabViewShow = false
    
    @State private var isShowAlert = false
    @State private var alertMessage = ""


    
    var body: some View {
        VStack(spacing: 20) {
            Text(isAuth ? "Авторизація" : "Реєстрація")
                .padding(isAuth ? 16 : 24)
                .padding(.horizontal, 30)
                .font(.title2.bold())
                .background(Color("whiteAlpha"))
                .cornerRadius(30)
            
            VStack {
                TextField("Номер телефону", text: $email)
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
                            
                            guard password == repitPassword else {
                                self.alertMessage = "Паролі не співпадають"
                                self.isShowAlert.toggle()
                                return
                            }
                            
                            AuthService.share.signUp(email: self.email,
                                                     password: self.password) { result in
                                switch result {
                                    
                                case .success(let user):
                                    
                                    alertMessage = "Ви зареєструвалися з email: \(user.email!) "
                                    self.isShowAlert.toggle()
                                    self.email = ""
                                    self.password = ""
                                    self.repitPassword = ""
                                    self.isAuth.toggle()
                                case .failure(let error):
                                    alertMessage = "Помилка реєстрації \(error.localizedDescription)! "
                                    self.isShowAlert.toggle()
                                }
                            }
                            
                           
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
            .alert(alertMessage,
                   isPresented: $isShowAlert) {
                Button { } label: {
                    Text("OK")
                }
            }
            
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

