//
//  PictureRow.swift
//  SampleDEV
//
//  Created by Artyom Mihailovich on 27.07.2020.
//  Copyright © 2020 Artyom Mihailovich. All rights reserved.
//

import SwiftUI

struct PictureRow: View {
    
    var categoryName: String
    var pictures: [Picture]
    
    var body: some View {
        
        VStack(alignment: .center) {
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        VStack {
                            ForEach(self.pictures) { picture in
                            
                            NavigationLink(destination: PictureDetail(picture: picture)) {
                                
                                PictureItem(picture: picture)
                                .frame(width: 350)
                                .padding(.vertical)
                            }
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

struct PictureRow_Previews: PreviewProvider {
    static var previews: some View {
        PictureRow(categoryName: "photograpry", pictures: pictureData)
    }
}
