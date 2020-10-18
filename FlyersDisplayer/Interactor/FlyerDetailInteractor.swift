//
//  FlyerDetailInteractor.swift
//  FlyersDisplayer
//
//  Created by Mauro Romito on 18/10/2020.
//

import Foundation

protocol FlyerDetailInteractorProtocol {
    var model: Flyer {get}
}

class FlyerDetailInteractor {
    
    var model: Flyer
    
    init(model: Flyer) {
        self.model = model
    }
}

extension FlyerDetailInteractor: FlyerDetailInteractorProtocol {
    
}
