//
//  Favorites.swift
//  SampleDEV
//
//  Created by Artyom Mihailovich on 8/13/20.
//  Copyright © 2020 Artyom Mihailovich. All rights reserved.
//

// It's write for the future
//import Foundation
//import Firebase
//
//class Favorites: Identifiable {
//
//    var id: String!
//    var ownerId: String!
//    var items: [Picture] = []
//
//    func add(_ item: Picture) {
//        items.append(item)
//    }
//
//    func remove(_ item: Picture) {
//
//        if let index = items.firstIndex(of: item) {
//            items.remove(at: index)
//        }
//    }
//
//    func emptyFavorites() {
//        self.items = []
//        saveFavoritesToFirestore()
//    }
//
//    func saveFavoritesToFirestore() {
//
//        FirebaseReference(.Favorites).document(self.id).setData(favoritesDictionaryFrom(self))
//    }
//
//}
//
//
//func favoritesDictionaryFrom(_ favorite: Favorites) -> [String : Any] {
//
//    var allPicturesIds: [String] = []
//
//    for picture in favorite.items {
//        allPicturesIds.append(picture.id)
//    }
//
//    return NSDictionary(objects: [favorite.id,
//                                  favorite.ownerId,
//                                  allPicturesIds
//                                ],
//                    forKeys: [kID as NSCopying,
//                     kOWNERID as NSCopying,
//                     kPICTUREIDS as NSCopying
//    ]) as! [String : Any]
//
//}
//
//
//
