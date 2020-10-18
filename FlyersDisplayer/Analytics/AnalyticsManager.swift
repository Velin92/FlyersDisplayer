//
//  AnalyticsManager.swift
//  FlyersDisplayer
//
//  Created by Mauro Romito on 18/10/2020.
//

import Foundation

final class AnalyticsManager {
    
    private static let streamFully: StreamFully = {
        guard let appId = Bundle.main.bundleIdentifier,
            let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String else {
            fatalError("Couldn't find app version and/or bundle identifier")
        }
        return StreamFully(appIdentifier: appId, appVersion: appVersion)
    }()
    
    static func process(event: ​StreamFullyEvent​) {
        streamFully.process(event: event)
    }
}
