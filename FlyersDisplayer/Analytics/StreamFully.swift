//
//  StreamFully.swift
//  FlyersDisplayer
//
//  Created by Mauro Romito on 18/10/2020.
//

import Foundation

//​ ​Analytics event processor
struct StreamFully {
    
    let appIdentifier: String
    let appVersion: String
    
    init(appIdentifier: String, appVersion: String)
    {
        self.appIdentifier = appIdentifier
        self.appVersion = appVersion
    }
    
    func process(event: ​StreamFullyEvent​) {
        print("App identifier: \(appIdentifier)")
        print("App version: \(appVersion)")
        print("Event type: \(event.eventType)")
        print("Event attributes: \(event.attributes.debugDescription)")
    }
}
