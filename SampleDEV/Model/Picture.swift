//
//  Lot.swift
//  SampleDEV
//
//  Created by Artyom Mihailovich on 25.07.2020.
//  Copyright © 2020 Artyom Mihailovich. All rights reserved.
//

import Foundation
import SwiftUI

enum Category: String, CaseIterable, Codable, Hashable {
    case uncategorized
    case painting
    case graphics
    case ceramic
    case collages
    case photograpry
    case mixedMedia
}

struct Picture: Identifiable, Hashable {
    var id: String
    var nameOfArtist: String
    var imageName: String
    var nameOfWorkImage: String
    var size: String
    var price: Double
    var category: Category
    var country: String
    var year: Int
}

func pictureDictionaryFrom(picture: Picture) -> [String: Any] {
    return NSDictionary(objects: [picture.id,
                                  picture.nameOfArtist,
                                  picture.imageName,
                                  picture.nameOfWorkImage,
                                  picture.size,
                                  picture.price,
                                  picture.category.rawValue,
                                  picture.country,
                                  picture.year
                                 ],
                        forKeys: [kID as NSCopying,
                                  kNAMEOFARTIST as NSCopying,
                                  kIMAGENAME as NSCopying,
                                  kNAMEOFWORKIMAGE as NSCopying,
                                  kSIZE as NSCopying,
                                  kPRICE as NSCopying,
                                  kCATEGORY as NSCopying,
                                  kCOUNTRY as NSCopying,
                                  kYEAR as NSCopying,
    ]) as! [String : Any]
}

func CreateShopList() {
    for picture  in pictureData {
        FirebaseReference(.ShopList).addDocument(data: pictureDictionaryFrom(picture: picture))
    }
}

let pictureData = [
    Picture(id: UUID().uuidString,  nameOfArtist: "ОЛЬГА УШАКОВА", imageName: "ShoeOlga", nameOfWorkImage: "Туфля", size: "35 × 28", price: 7.500, category: Category.photograpry,  country: "Россия", year: 2018),
    
    Picture(id: UUID().uuidString, nameOfArtist: "АНАСТАСИЯ КОЛЕСНИЧЕНКО", imageName: "InvasionAnastasiya", nameOfWorkImage: "Вторжение", size: "50 × 33", price: 7.500, category: Category.photograpry, country: "Россия", year: 2019),
    
    Picture(id: UUID().uuidString, nameOfArtist: "АНАСТАСИЯ КОЛЕСНИЧЕНКО", imageName: "SweetyAnastasiya", nameOfWorkImage: "Сладкий", size: "50 × 34", price: 9.000, category: Category.photograpry, country: "Россия", year: 2019),
    
    Picture(id: UUID().uuidString, nameOfArtist: "ЛЕОНИД СОРОКИН", imageName: "DeltaSorokin", nameOfWorkImage: "Delta, серия Yongtimer", size: "22.5 × 15", price: 13.000, category: Category.photograpry, country: "Россия", year: 2016)
    
]

