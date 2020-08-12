//
//  OrderBasket.swift
//  SampleDEV
//
//  Created by Artyom Mihailovich on 12.08.2020.
//  Copyright © 2020 Artyom Mihailovich. All rights reserved.
//

import Foundation
import Firebase

class OrderBasket: Identifiable {
    
    var id: String!
    var ownerId: String!
    var items: [Picture] = []
    
    var total: Double {
        if items.count > 0 {
            return items.reduce(0) { $0 + $1.price }
        } else {
            return 0.0
        }
    }
    
    func add(_ item: Picture) {
        items.append(item)
    }
    
    func remove(_ item: Picture) {
        
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
    
    func emptyBasket() {
        self.items = []
        saveBasketToFirestore()
    }
    
    func saveBasketToFirestore() {
        
        FirebaseReference(.Basket).document(self.id).setData(basketDictionaryFrom(self))
    }
    
}


func basketDictionaryFrom(_ basket: OrderBasket) -> [String : Any] {
    
    var allPicturesIds: [String] = []
    
    for picture in basket.items {
        allPicturesIds.append(picture.id)
    }
    
    return NSDictionary(objects: [basket.id,
                                  basket.ownerId,
                                  allPicturesIds
                                ],
                    forKeys: [kID as NSCopying,
                     kOWNERID as NSCopying,
                     kPICTUREIDS as NSCopying
    ]) as! [String : Any]
    
}
