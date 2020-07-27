//
//  PictureListeners.swift
//  SampleDEV
//
//  Created by Artyom Mihailovich on 27.07.2020.
//  Copyright © 2020 Artyom Mihailovich. All rights reserved.
//

import Foundation
import Firebase

class PictureListener: ObservableObject {
    @Published  var pictures: [Picture] = []
    
    init() {
        downloadPictures()
    }
    
    func downloadPictures() {
        FirebaseReference(.ShopList).getDocuments { (snapshot, error) in
            
            guard let snaphot = snapshot else { return }
            if !snaphot.isEmpty {
                
                self.pictures = PictureListener.pictureFromnDictionary(snaphot)
            }
        }
    }
    
    static func pictureFromnDictionary(_ snapshot: QuerySnapshot)  -> [Picture]{
        var allPictures: [Picture] = []
        
        for snapshot in snapshot.documents {
            let pictureData = snapshot.data()
            
            let pictureItem = Picture(id: pictureData[kID] as? String ?? UUID().uuidString,
            nameOfArtist: pictureData[kNAMEOFARTIST] as? String ?? "Unknow Name",
            imageName: pictureData[kIMAGENAME] as? String ?? "Unknow Image",
            nameOfWorkImage: pictureData[kNAMEOFWORKIMAGE] as? String ?? "Unknow Name of Work Image",
            size: pictureData[kSIZE] as? String ?? "Unknow Size", price: pictureData[kPRICE] as? Double ?? 0.0,
            category: Category(rawValue: pictureData[kCATEGORY] as? String ?? "Unknow Name of Category") ?? .photograpry,
            country: pictureData[kCOUNTRY] as? String ?? "Unknow Name of Country",
            year: pictureData[kYEAR] as? Int ?? 0)
            
            allPictures.append(pictureItem)
        }
        return allPictures
    }
    
}
