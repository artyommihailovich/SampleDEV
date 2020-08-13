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
    @State private var showingBasket = false
    
    var categories: [String: [Picture]] {
        .init(
            grouping: pictureListener.pictures,
            by: {$0.category.rawValue
        })
    }
    
    var body: some View {

        NavigationView {
            
            ScrollView(.vertical, showsIndicators: false){
                Group {
                        
                    PictureRow(pictures: pictureData, categoryName: "photography")
                }
            }
           
  
            .navigationBarTitle("SAMPLE")
            .navigationBarItems(leading:
                Button(action: {
            FUser.logOutCurrenUser { (error) in
                print("error loging out user, ", error?.localizedDescription)
            }
        }, label: {
            Text("Выход")
                .font(.system(size: 16, weight: .regular))
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
