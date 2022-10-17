//
//  PersonView.swift
//  PizzaDelivery
//
//  Created by Lukich on 12.10.2022.
//

import SwiftUI

struct PersonView: View {
    
    @State var isAvaAlertPresented = false
    @State var isQuitAlertPresented = false
    @State var isAuthViewPresented = false
    
    @StateObject var viewModel: PersonViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 16) {
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .padding(8)
                    .background(Color("grey"))
                    .clipShape(Circle())
                    .onTapGesture {
                        isAvaAlertPresented.toggle()
                    }
                    .confirmationDialog("Взяти фото з", isPresented: $isAvaAlertPresented) {
                        Button {
                            print("Library")
                        } label: {
                            Text("З галереї")
                        }
                        
                        Button {
                            print("Камера")
                        } label: {
                            Text("З камери")
                        }
                        

                    }
                
                VStack(alignment: .leading, spacing: 12) {
                    TextField("Ім'я", text: $viewModel.profaile.name)
                        .font(.body.bold())
                    HStack {
                        Text("+380")
                        TextField("Телефон", value: $viewModel.profaile.phone, format: .number)
                    }
                }
                Spacer()
            }.padding(.horizontal)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Адес доставки: ")
                    .bold()
                    //Text("м. Зароріжья, вул. Шевченка 123")
                TextField("Твоя адреса", text: $viewModel.profaile.address)
            }.padding(.horizontal)
            
            //MARK: - таблица с заказами
            List {
                if viewModel.orders.count == 0 {
                    Text("Твої замовлення будуть тут")
                } else {
                    ForEach(viewModel.orders, id: \.id) { order in
                        OrderCell(order: order)
                    }
                }
                
            } .listStyle(.plain)
            
            Button {
                isQuitAlertPresented.toggle()
            } label: {
                Text("Вийти")
                    .padding()
                    .padding(.horizontal, 30)
                    .background(Color.red)
                    .cornerRadius(20)
                    .foregroundColor(.white)
            }.padding()
                .confirmationDialog("Вийти?", isPresented: $isQuitAlertPresented) {
                    Button {
                        isAuthViewPresented.toggle()
                    } label: {
                        Text("Так")
                    }
                }
            
              
                .fullScreenCover(isPresented: $isAuthViewPresented, onDismiss: nil) {
                    AuthView()
                }
        }
        .onSubmit {
            viewModel.setProfile()
        }
        
        .onAppear {
            self.viewModel.getProfile()
            self.viewModel.getOrders()
        }
        
    }
}

struct PersonView_Previews: PreviewProvider {
    static var previews: some View {
        PersonView(viewModel: PersonViewModel(profile: MainUser(id: "",
                                                                  name: "Володимир Володимир",
                                                                  phone: 9999999999,
                                                                  address: "Запоріжя")))
    }
}
