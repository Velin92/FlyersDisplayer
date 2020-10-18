//
//  FlyersDisplayerInteractor.swift
//  FlyersDisplayer
//
//  Created by Mauro Romito on 18/10/2020.
//

import Foundation

enum FlyerDisplayerError: Error {
    case genericError(error: Error)
    case empty
}

protocol FlyersDisplayerInteractorProtocol: AnyObject {
    
    func loadFlyersData(completion: @escaping ((Result<[Flyer], FlyerDisplayerError>)->Void))
}

class FlyersDisplayerInteractor {
    
    let service: FlyersAPI
    
    var flyers: [Flyer] = []
    
    init(service: FlyersAPI) {
        self.service = service
    }
}

extension FlyersDisplayerInteractor: FlyersDisplayerInteractorProtocol {
    
    func loadFlyersData(completion: @escaping ((Result<[Flyer], FlyerDisplayerError>)->Void)) {
        service.getFlyersList { [weak self] result in
            switch result {
            case .success(let response):
                guard let data = response.data else {
                    completion(.failure(.empty))
                    return
                }
                self?.flyers = data.compactMap(Flyer.init)
                completion(.success(self?.flyers ?? []))
            case .failure(let error):
                completion(.failure(.genericError(error: error)))
            }
        }
    }
}
