//
//  SlideMenu.swift
//  SampleDEV
//
//  Created by Artyom Mihailovich on 28.07.2020.
//  Copyright © 2020 Artyom Mihailovich. All rights reserved.
//

import SwiftUI

struct SlideMenu: View {
    @State var showSlideMenu = false
    @State var index = "Home"
    var body: some View {
        ZStack {
            (self.showSlideMenu ? Color.black.opacity(0.05) : Color.clear).edgesIgnoringSafeArea(.all)

            
//            ZStack(alingnment:){
//                
//            }
            
            
        ZStack(alignment: .topTrailing) {
            HomeView(showSlideMenu: self.$showSlideMenu, index: self.$index)
                            .scaleEffect(self.showSlideMenu ? 0.9 : 1)
                            .offset(x: self.showSlideMenu ? 170 : 0, y : self.showSlideMenu ? 180 : 0)
            }
        }
    }
}

struct SlideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SlideMenu()
    }
}
