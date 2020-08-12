//
//  ContentView.swift
//  SampleDEV
//
//  Created by Artyom Mihailovich on 25.07.2020.
//  Copyright © 2020 Artyom Mihailovich. All rights reserved.
//

import SwiftUI


struct HomeView: View {
    @ObservedObject var pictureListener = PictureListener()
    @State private var showingBasket = true
    
    var categories: [String: [Picture]] {
        .init(
            grouping: pictureListener.pictures,
            by: {$0.category.rawValue
        })
    }
    
    var body: some View {

        NavigationView {
            
            
            List(categories.keys.sorted(), id: \String.self) {
                         key in
                         PictureRow(categoryName: "\(key)".uppercased(), pictures: self.categories[key]!)
                             .padding(.top)
                             .padding(.bottom)
            }

            .navigationBarTitle("SAMPLE")
            .navigationBarItems(leading:
                Button(action: {
            FUser.logOutCurrenUser { (error) in
                print("error loging out user, ", error?.localizedDescription)
            }
        }, label: {
            Text("Выход")
                .foregroundColor(.black)
        })
        , trailing:
                Button(action: {
            self.showingBasket.toggle()
        }, label: {
            Image(systemName: "bag")
                .font(.system(size: 16, weight: .regular))
                .foregroundColor(.black)
        })
            .sheet(isPresented: $showingBasket) {

                if FUser.currentUser() != nil && FUser.currentUser()!.onBoarding {
                    
                    OrderBasketView()
                } else if FUser.currentUser() != nil {
                    FinishRegistrationView()
                } else {
                    LoginView()
                }
            })
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
