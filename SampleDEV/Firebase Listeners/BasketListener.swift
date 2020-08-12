//
//  BasketListener.swift
//  iCoffee
//
//  Created by Artyom Mihailovich on 25.07.2020.
//  Copyright © 2020 Artyom Mihailovich. All rights reserved.
//

import Foundation
import Firebase

class BasketListener: ObservableObject {
    
    @Published var orderBasket: OrderBasket!
    
    
    init() {
        downloadBasket()
    }
    
    func downloadBasket() {
        
        if FUser.currentUser() != nil {
            FirebaseReference(.Basket).whereField(kOWNERID, isEqualTo: FUser.currentId()).addSnapshotListener { (snapshot, error) in
                
                
                guard let snapshot = snapshot else { return }
                
                if !snapshot.isEmpty {
                    
                    let basketData = snapshot.documents.first!.data()
                    
                    getDrinksFromFirestore(withIds: basketData[kPICTUREIDS] as? [String] ?? []) { (allPictures) in
                        
                        let basket = OrderBasket()
                        basket.ownerId = basketData[kOWNERID] as? String
                        basket.id = basketData[kID] as? String
                        basket.items = allPictures
                        self.orderBasket = basket
                    }
                }
            }

        }
    }
}


func getDrinksFromFirestore(withIds: [String], completion: @escaping (_ drinkArray: [Picture]) -> Void) {
    
    var count = 0
    var pictureArray: [Picture] = []
    
    
    if withIds.count == 0 {
        completion(pictureArray)
        return
    }
    
    for pictureId in withIds {
        
        FirebaseReference(.ShopList).whereField(kID, isEqualTo: pictureId).getDocuments { (snapshot, error) in
            
            guard let snapshot = snapshot else { return }
            
            if !snapshot.isEmpty {
                
                let pictureData = snapshot.documents.first!
                
                pictureArray.append(Picture(id: pictureData[kID] as? String ?? UUID().uuidString,
                                                                nameOfArtist: pictureData[kNAMEOFARTIST] as? String ?? "Unknow Name",
                                                                imageName: pictureData[kIMAGENAME] as? String ?? "Unknow Image",
                                                                  nameOfWorkImage: pictureData[kNAMEOFWORKIMAGE] as? String ?? "Unknow Name of Work Image",
                                                                  size: pictureData[kSIZE] as? String ?? "Unknow Size", price: pictureData[kPRICE] as? Double ?? 0.0,
                                                                  category: Category(rawValue: pictureData[kCATEGORY] as? String ?? "Unknow Name of Category") ?? .photograpry,
                                                                  country: pictureData[kCOUNTRY] as? String ?? "Unknow Name of Country",
                                                                  year: pictureData[kYEAR] as? Int ?? 0))
                
                count += 1
                
            } else {
                print("have no picture")
                completion(pictureArray)
            }
            
            
            if count == withIds.count {
                completion(pictureArray)
            }
            
        }

    }
    
    
    
}
