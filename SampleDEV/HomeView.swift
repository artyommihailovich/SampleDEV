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
            (self.showSlideMenu ? Color.black : Color.offWhite)
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
                    
                 
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
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
        }
        .background(Color.offWhite)
        .cornerRadius(7)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SlideMenu()
    }
}
