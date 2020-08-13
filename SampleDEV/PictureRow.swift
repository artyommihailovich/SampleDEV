//
//  PictureRow.swift
//  SampleDEV
//
//  Created by Artyom Mihailovich on 27.07.2020.
//  Copyright © 2020 Artyom Mihailovich. All rights reserved.
//

import SwiftUI

struct PictureRow: View {

  var pictures: [Picture]
  var categoryName: String
    
    var body: some View {
        

                    ScrollView(.vertical, showsIndicators: false) {
                        
                        VStack(alignment: .leading) {
                            
                            ForEach(self.pictures) { picture in

                            NavigationLink(destination: PictureDetail(picture: picture)) {
                                
                                PictureItem(picture: picture)
                                .frame(width: 350)
                                .padding()
                            }
                            .foregroundColor(.black)
                }
            }
        }
    }
}

struct PictureRow_Previews: PreviewProvider {
    static var previews: some View {
        PictureRow(pictures: pictureData, categoryName: "photography")
    }
}
