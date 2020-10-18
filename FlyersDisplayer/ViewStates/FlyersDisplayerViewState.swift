//
//  FlyersDisplayerViewState.swift
//  FlyersDisplayer
//
//  Created by Mauro Romito on 18/10/2020.
//

import Foundation

enum ConnectionState: String {
    case reachable = "Connected"
    case unreachable = "Not connected"
    case unknown = "Unknown"
}

struct FlyersDisplayerViewState {
    
    var cellViewStates: [FlyerCellViewState] = []
    var isFilterActive = false
    var connectionState: ConnectionState = .unknown
}
