//
//  NewsRow.swift
//  SampleDEV
//
//  Created by Artyom Mihailovich on 8/13/20.
//  Copyright © 2020 Artyom Mihailovich. All rights reserved.
//

import SwiftUI

struct NewsRollRow: View {
    
    var news: [News]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(self.news) {
                   news in NewsRollItem(news: news)
                    
                }
            }
        }
    }
}



struct NewsRollRow_Previews: PreviewProvider {
    static var previews: some View {
        NewsRollRow(news: newsData)
    }
}
