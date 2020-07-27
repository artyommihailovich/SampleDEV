//
//  FirebaseReference.swift
//  SampleDEV
//
//  Created by Artyom Mihailovich on 26.07.2020.
//  Copyright © 2020 Artyom Mihailovich. All rights reserved.
//

import Foundation
import FirebaseFirestore

enum FCollectionReference: String {
    case User
    case ShopList
    case Order
    case Basket
}

func FirebaseReference(_ collectionReference: FCollectionReference) -> CollectionReference {
    
    return Firestore.firestore().collection(collectionReference.rawValue)
}
