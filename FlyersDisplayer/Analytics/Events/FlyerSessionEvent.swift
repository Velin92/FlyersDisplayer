//
//  FlyerSessionEvent.swift
//  FlyersDisplayer
//
//  Created by Mauro Romito on 18/10/2020.
//

import Foundation

struct FlyerSessionEvent: Encodable, ​StreamFullyEvent​ {
    
    var eventType: String {
        get {
            return "flyer_session"
        }
    }
    
    let flyerID: String
    
    //I will use milliseconds
    let sessionDuration: Int
    let firstRead: Bool

    enum CodingKeys: String, CodingKey {
        case flyerID = "flyer_id"
        case sessionDuration = "session_duration"
        case firstRead = "first_read"
    }
}
