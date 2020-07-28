//
//  NewsRollItem.swift
//  SampleDEV
//
//  Created by Artyom Mihailovich on 28.07.2020.
//  Copyright © 2020 Artyom Mihailovich. All rights reserved.
//

import SwiftUI

struct NewsRollItem: View {
    var body: some View {
 
            ZStack(alignment: .leading) {
                Image("CoverRihter")
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width, height: 220)
                .foregroundColor(Color.black.opacity(0.9))
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text("РИХТЕР x SAMPLE онлайн аукцион")
                        .font(.custom("AsketExtended-Light", size:  20))
                        .foregroundColor(Color.white)
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Text("СМОТРЕТЬ")
                            .font(.callout)
                        .foregroundColor(Color.white)
                        .frame(minWidth: 0, maxWidth: 120, alignment: .center)
                        .background(Rectangle()
                        .stroke(lineWidth: 1)
                        .foregroundColor(Color.white))
                        .padding(.top, 30)
                    }
                }
                .padding(.horizontal)
                .padding(.vertical)
        }
    }
}

struct NewsRollItem_Previews: PreviewProvider {
    static var previews: some View {
        NewsRollItem()
    }
}
