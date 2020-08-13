//
//  News.swift
//  SampleDEV
//
//  Created by Artyom Mihailovich on 8/13/20.
//  Copyright © 2020 Artyom Mihailovich. All rights reserved.
//

import SwiftUI

import Foundation
import SwiftUI


struct News: Identifiable, Hashable {
    var id: String
    var nameOfNew: String
    var descriptionOfNew: String
    var nameOfNewImage: String
}

func newDictionaryFrom(new: News) -> [String: Any] {
    return NSDictionary(objects: [new.id,
                                  new.nameOfNew,
                                  new.descriptionOfNew,
                                  new.nameOfNewImage
                                 ],
                        forKeys: [kNEWSID as NSCopying,
                                  kDESCRIPTIONOFNEW as NSCopying,
                                  kNAMEOFNEWIMAGE as NSCopying,
    
    ]) as! [String : Any]
}

func CreateNewsList() {
    for picture  in pictureData {
        FirebaseReference(.ShopList).addDocument(data: pictureDictionaryFrom(picture: picture))
    }
}

let newsData = [
    News(id: UUID().uuidString, nameOfNew: "РИХТЕР x SAMPLE", descriptionOfNew: "Sample", nameOfNewImage: "CoverRihter"),
    
    News(id: UUID().uuidString, nameOfNew: "СЦЕНА/SZENA", descriptionOfNew: "Sample", nameOfNewImage: "CoverSzena"),
    
    News(id: UUID().uuidString, nameOfNew: "Евгения Дудникова", descriptionOfNew: "Sample", nameOfNewImage: "CoverEvgeniyaDudnikova")
]

