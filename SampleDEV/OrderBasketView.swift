//
//  OrderBasketView.swift
//  SampleDEV
//
//  Created by Artyom Mihailovich on 12.08.2020.
//  Copyright © 2020 Artyom Mihailovich. All rights reserved.
//

import SwiftUI

struct OrderBasketView: View {
    
    @ObservedObject var basketListener = BasketListener()
    
    var body: some View {
        
        NavigationView {
            
            List {
                Section {
                    ForEach(self.basketListener.orderBasket?.items ?? []) { picture in
                        HStack {
                            Text(picture.id)
                            Spacer()
                            Text("$\(picture.price.clean)")
                        }//End of HStack
                    }//End of ForEach
                    .onDelete { (indexSet) in
                        self.deleteItems(at: indexSet)
                    }
                }
                
                Section {
                    NavigationLink(destination: CheckoutView()) {
                        Text("Оформить заказ")
                    }
                }.disabled(self.basketListener.orderBasket?.items.isEmpty ?? true)
                
            } //End of List
            .navigationBarTitle("Заказ")
            .listStyle(GroupedListStyle())
            
        } //End of Navigation view
        
    }
    
    func deleteItems(at offsets: IndexSet) {
        self.basketListener.orderBasket.items.remove(at: offsets.first!)
        self.basketListener.orderBasket.saveBasketToFirestore()
    }
    
    
}

struct OrderBasketView_Previews: PreviewProvider {
    static var previews: some View {
        OrderBasketView()
    }
}
