//
//  FlyerDetailInteractor.swift
//  FlyersDisplayer
//
//  Created by Mauro Romito on 18/10/2020.
//

import Foundation

protocol FlyerDetailInteractorProtocol {
    
    var model: Flyer {get}
    func endSession()
    func startSession()
}

class FlyerDetailInteractor {
    
    var model: Flyer
    var startSessionDate: Date?
    
    init(model: Flyer) {
        self.model = model
    }
}

extension FlyerDetailInteractor: FlyerDetailInteractorProtocol {
    
    func endSession() {
        var duration = 0
        if let startSessionDate = startSessionDate {
            let endSessionDate = Date()
            let interval = endSessionDate.timeIntervalSince(startSessionDate)
            if interval >= 0 {
                //CONVERTING SECONDS TO MILLISECONDS
                duration = Int(interval * 1000)
            }
        }
        
        let event: FlyerSessionEvent = FlyerSessionEvent(flyerID: "\(model.id)", sessionDurationInMilliseconds: duration, firstRead: !model.isRead)
        AnalyticsManager.process(event: event)
    }
    
    func startSession() {
        startSessionDate = Date()
    }
}
