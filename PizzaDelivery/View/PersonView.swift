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
                    Text("Чувак Любительпіци")
                        .bold()
                    Text("098 999 99 99")
                }
                Spacer()
            }.padding(.horizontal)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Адес доставки: ")
                    .bold()
                Text("м. Зароріжья, вул. Шевченка 123")
            }//.padding(.horizontal)
            
            //MARK: - таблица с заказами
            List {
                Text("Твої замовлення будуть тут")
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
    }
}

struct PersonView_Previews: PreviewProvider {
    static var previews: some View {
        PersonView()
    }
}
