//
//  ContentView.swift
//  SampleDEV
//
//  Created by Artyom Mihailovich on 25.07.2020.
//  Copyright © 2020 Artyom Mihailovich. All rights reserved.
//

import SwiftUI
import Lottie

struct SlideMenu: View {
    @State var showSlideMenu = false
    var body: some View {
        ZStack {
            (self.showSlideMenu ? Color.primary : Color.white)
                .edgesIgnoringSafeArea(.all)
        
        ZStack(alignment: .topTrailing) {
                           HomeView(showSlideMenu: self.$showSlideMenu)
                               .scaleEffect(self.showSlideMenu ? 0.8 : 1)
                               .offset(x: self.showSlideMenu ? (UIScreen.main.bounds.width - 100) : 0)
            }
        }
    }
}

struct HomeView: View {
    @Binding var showSlideMenu: Bool
    
    @ObservedObject var pictureListener = PictureListener()
 
    var categories: [String: [Picture]] {
        .init(
            grouping: pictureListener.pictures,
            by: {$0.category.rawValue
        })
    }
    
    var body: some View {
        VStack(spacing: 0){
            ZStack {
                HStack(alignment: .center) {
                LottieButton(filename: "BurgerMenu", action: {
                        withAnimation(.spring()) {
                            
                            self.showSlideMenu.toggle()
                        }
                    })
                      .frame(width: 40, height: 40, alignment: .center)
                    
                Spacer()
                    
                Button(action: {}) {
                    Image("ShopingBagEmpty")
                    .resizable()
                    .foregroundColor(Color.black)
                    .frame(width: 19, height: 19, alignment: .center)
                    }
                    
                }
                Text("SAMPLE")
                  .font(.title)
                  .bold()
            }
            .padding(.horizontal)
            .padding(.vertical)
            
            Spacer()
            
            List(categories.keys.sorted(), id: \String.self) {
                key in
                PictureRow(categoryName: "\(key)".uppercased(), pictures: self.categories[key]!)
                    .padding(.vertical)
            }
        }
        .background(Color.white)
        .cornerRadius(7)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SlideMenu()
    }
}
