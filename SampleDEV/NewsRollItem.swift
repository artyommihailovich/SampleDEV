//
//  NewsRollItem.swift
//  SampleDEV
//
//  Created by Artyom Mihailovich on 28.07.2020.
//  Copyright © 2020 Artyom Mihailovich. All rights reserved.
//

import SwiftUI

struct NewsRollItem: View {
    
    var news: News
    
    var body: some View {
 
            ZStack(alignment: .leading) {
                Image(news.nameOfNewImage)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width, height: 200)
                .background(Color.black)
                .opacity(0.7)

                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text(news.descriptionOfNew)
                        .bold()
                        .foregroundColor(Color.white)
                    
                    Text(news.nameOfNew)
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
                        .padding(.top, 5)
                    }
                }
                .padding(.horizontal)
                .padding(.vertical)
        }
    }
}

struct NewsRollItem_Previews: PreviewProvider {
    static var previews: some View {
        NewsRollItem(news: newsData[0])
    }
}
