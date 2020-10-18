//
//  FlyersDisplayerInteractor.swift
//  FlyersDisplayer
//
//  Created by Mauro Romito on 18/10/2020.
//

import Foundation

protocol FlyersDisplayerInteractorProtocol: AnyObject {
    
    func loadFlyersData(completion: @escaping ((Result<[Flyer], Error>)->Void))
}

class FlyersDisplayerInteractor {
    
    let service: FlyersAPI
    
    var flyers: [Flyer] = []
    
    init(service: FlyersAPI) {
        self.service = service
    }
}

extension FlyersDisplayerInteractor: FlyersDisplayerInteractorProtocol {
    
    func loadFlyersData(completion: @escaping ((Result<[Flyer], Error>)->Void)) {
        service.getFlyersList { [weak self] result in
            switch result {
            case .success(let response):
                guard let data = response.data else {
                    
                }
                
            case .failure(let error)
            }
        }
    }
}
