//
//  SwiftUIView.swift
//  MilkShopOnlineSwiftUI
//
//  Created by Artyom Mihailovich on 19.07.2020.
//  Copyright © 2020 Artyom Mihailovich. All rights reserved.
//

import SwiftUI

extension Color {
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
}

extension LinearGradient {
    init (_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors),startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}
