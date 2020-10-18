//
//  Flyer.swift
//  FlyersDisplayer
//
//  Created by Mauro Romito on 18/10/2020.
//

import Foundation

struct Flyer {
    
    let id: Int
    let retailerId: Int
    let title: String
    
    init?(from data: FlyerData) {
        guard let idString = data.id,
              let id = Int(idString),
              let retailerIdString = data.retailerID,
              let retailerId = Int(retailerIdString),
              let title = data.title else {return nil}
        self.id = id
        self.retailerId = retailerId
        self.title = title
    }
}
