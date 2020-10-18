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
    
    //SINCE IS NOT SPECIFIED IF THE DURATION SHOULD BE IN SECONDS OR MILLISECONDS, I WILL USE THE LATTER SINCE IS MORE COMMON FOR SESSION MEASUREMENT.
    let sessionDurationInMilliseconds: Int
    let firstRead: Bool

    enum CodingKeys: String, CodingKey {
        case flyerID = "flyer_id"
        case sessionDurationInMilliseconds = "session_duration"
        case firstRead = "first_read"
    }
}
