//
//  FlyersDisplayerInteractor.swift
//  FlyersDisplayer
//
//  Created by Mauro Romito on 18/10/2020.
//

import Foundation

protocol FlyersDisplayerInteractorProtocol: AnyObject {
    
    func loadFlyersData()
}

class FlyersDisplayerInteractor {
    
    let service: FlyersAPI
    
    init(service: FlyersAPI) {
        self.service = service
    }
}

extension FlyersDisplayerInteractor: FlyersDisplayerInteractorProtocol {
    
    func loadFlyersData() {
        
    }
}
