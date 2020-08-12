//
//  Order.swift
//  SampleDEV
//
//  Created by Artyom Mihailovich on 8/12/20.
//  Copyright © 2020 Artyom Mihailovich. All rights reserved.
//

import Foundation

class Order: Identifiable {
    
    var id: String!
    var customerId: String!
    var orderItems: [Picture] = []
    var amount: Double!
    var customerName: String!
    var isCompleted: Bool!
    
    func saveOrderToFirestore() {
        
        FirebaseReference(.Order).document(self.id).setData(orderDictionaryFrom(self)) {
            error in
            
            if error != nil {
                print("error saving order to firestore: ", error!.localizedDescription)
            }
        }
    }
}


func orderDictionaryFrom(_ order: Order) -> [String : Any] {
    
    var allPictureIds: [String] = []
    
    for picture in order.orderItems {
        allPictureIds.append(picture.id)
    }
    
    return NSDictionary(objects: [order.id,
                                  order.customerId,
                                  allPictureIds,
                                  order.amount,
                                  order.customerName,
                                  order.isCompleted
                                ],
                        forKeys: [kID as NSCopying,
                                  kCUSTOMERID as NSCopying,
                                  kPICTUREIDS as NSCopying,
                                  kAMOUNT as NSCopying,
                                  kCUSTOMERNAME as NSCopying,
                                  kISCOMPLETED as NSCopying
    ]) as! [String : Any]
}
