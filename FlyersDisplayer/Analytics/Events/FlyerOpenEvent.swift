//
//  FlyerOpenEvent.swift
//  FlyersDisplayer
//
//  Created by Mauro Romito on 18/10/2020.
//

import Foundation

struct FlyerOpenEvent: Encodable, ​StreamFullyEvent​ {
    
    var eventType: String {
        get {
            return "flyer_open"
        }
    }
    
    let retailerID, flyerID: Int
    let title: String
    let position: Int
    let firstRead: Bool
    
    enum CodingKeys: String, CodingKey {
        case retailerID = "retailer_id"
        case flyerID = "flyer_id"
        case title, position
        case firstRead = "first_read"
    }
}
