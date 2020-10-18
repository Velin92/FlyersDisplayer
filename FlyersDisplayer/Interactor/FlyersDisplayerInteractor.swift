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
    func getFlyer(for identifier: Int) -> Flyer
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
        service.getFlyersList { [unowned self] result in
            switch result {
            case .success(let response):
                guard let data = response.data else {
                    completion(.failure(.empty))
                    return
                }
                self.flyers = data.compactMap(self.createValidFlyerModel)
                completion(.success(self.flyers))
            case .failure(let error):
                completion(.failure(.genericError(error: error)))
            }
        }
    }
    
    private func createValidFlyerModel(from data: FlyerData) -> Flyer? {
        guard let idString = data.id,
              let id = Int(idString),
              let retailerIdString = data.retailerID,
              let retailerId = Int(retailerIdString),
              let title = data.title else {return nil}
        return Flyer(id: id,
                     retailerId: retailerId,
                     title: title,
                     imageUrl: "\(Constants.imagesBaseUrlPath)\(id)@3x.jpg")
    }
    
    func getFlyer(for identifier: Int) -> Flyer {
        guard let flyer = flyers.first(where: {$0.id == identifier}) else {
            fatalError("Identifier: \(identifier) doesn't exist")
        }
        return flyer
    }
}
