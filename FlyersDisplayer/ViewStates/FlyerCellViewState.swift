//
//  FlyerCellViewState.swift
//  FlyersDisplayer
//
//  Created by Mauro Romito on 18/10/2020.
//

import Foundation

struct FlyerCellViewState {
    
    let flyerViewState: FlyerViewState
    let isReadImageHidden: Bool
    
    init(from model: Flyer) {
        self.flyerViewState = FlyerViewState(from: model)
        self.isReadImageHidden = !model.isRead
    }
}
