//
//  NewsRow.swift
//  SampleDEV
//
//  Created by Artyom Mihailovich on 27.07.2020.
//  Copyright © 2020 Artyom Mihailovich. All rights reserved.
//

import SwiftUI

struct PictureItem: View {
    
    var picture: Picture
    
//    Maybee change  it after?  Converted price in String??
    var convertedPicturePrice: String {
        let convertedValueRaw: Double = picture.price
        let convertedValueString = String("\(convertedValueRaw)00₽")
        return convertedValueString
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Image(picture.imageName)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 350, height: 350, alignment: .center)
                
            
                Text(picture.nameOfArtist)
                    .font(.subheadline)
                    .fontWeight(.light)
                
                Text(picture.nameOfWorkImage)
                    .font(.title)
                    .fontWeight(.regular)

                Text(convertedPicturePrice)
                    .font(.subheadline)
                    .fontWeight(.ultraLight)
        }
    }
}

struct NewsRow_Previews: PreviewProvider {
    static var previews: some View {
        PictureItem(picture: pictureData[0])
    }
}
