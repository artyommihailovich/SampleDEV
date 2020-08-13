//
//  CheckoutView.swift
//  SampleDEV
//
//  Created by Artyom Mihailovich on 12.08.2020.
//  Copyright © 2020 rtyom Mihailovich. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    
    @ObservedObject var basketListener = BasketListener()
    
    static let paymentTypes = ["Наличными курьеру", "Кредитная карта"]
    static let tipAmounts = [250, 50, 100, 0]
    
    @State private var paymentType = 0
    @State private var tipAmount = 1
    @State private var showingPaymentAlert = false
    
    var totalPrice: Double {
        let total = basketListener.orderBasket.total
        let tipValue = total / 100 * Double(Self.tipAmounts[tipAmount])
        return total + tipValue
    }
    
    
    var body: some View {

        Form {
            Section {
                Picker(selection: $paymentType, label: Text("Выберите удобный для вас способ оплаты?")) {
                    
                    ForEach(0 ..< Self.paymentTypes.count) {
                        Text(Self.paymentTypes[$0])
                    }
                }
            }//End of Section
            
            
            Section (header: Text("Поддержать автора")) {
                
                Picker(selection: $tipAmount, label: Text("Percentage: ")) {
                    
                    ForEach(0 ..< Self.tipAmounts.count) {
                        Text("\(Self.tipAmounts[$0]) %")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }//End of Section
            
            Section(header: Text("Всего:  ₽\(totalPrice, specifier: "%.2f")").font(.title)) {
               
                Button(action: {
                    self.showingPaymentAlert.toggle()
                    self.createOrder()
                    self.emptyBasket()
                    
                }) {
                    Text("Подтвердить заказ")
                }
            }.disabled(self.basketListener.orderBasket?.items.isEmpty ?? true)
            //End of Section
            
        }//End of form
        .navigationBarTitle(Text("Оплата"), displayMode: .inline)
        .alert(isPresented: $showingPaymentAlert) {
                
            Alert(title: Text("Оплата прошла успешно"), message: Text("Спасибо!"), dismissButton: .default(Text("OK")))
        }
    }
    
    
    private func createOrder() {
        let order = Order()
        order.amount = totalPrice
        order.id = UUID().uuidString
        order.customerId = FUser.currentId()
        order.orderItems = self.basketListener.orderBasket.items
        order.saveOrderToFirestore()
    }
    
    
    private func emptyBasket() {
        self.basketListener.orderBasket.emptyBasket()
    }
    
    
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
    }
}
