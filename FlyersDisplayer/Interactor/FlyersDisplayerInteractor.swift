//
//  FlyersDisplayerInteractor.swift
//  FlyersDisplayer
//
//  Created by Mauro Romito on 18/10/2020.
//

import Foundation

protocol FlyersDisplayerInteractorProtocol: AnyObject {
    
}

class FlyersDisplayerInteractor: FlyersDisplayerInteractorProtocol {
    
    let service: FlyersAPI
    
    init(service: FlyersAPI) {
        self.service = service
    }
}
