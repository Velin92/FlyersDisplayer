//
//  FlyersDisplayerInteractor.swift
//  FlyersDisplayer
//
//  Created by Mauro Romito on 18/10/2020.
//

import Foundation
import Reachability

enum FlyerDisplayerError: Error {
    case genericError(error: Error)
    case empty
}

protocol FlyersDisplayerInteractorProtocol: AnyObject {
    
    func loadFlyersData(completion: @escaping ((Result<[Flyer], FlyerDisplayerError>)->Void))
    func readFlyer(for identifier: Int) -> Flyer
    var flyers: [Flyer] {get}
    var connectedClosure: (()->())? {get set}
    var unreachableClosure: (()->())? {get set}
    func startUpdatingConnectionStatus()
    func stopUpdatingConnectionStatus()
}

class FlyersDisplayerInteractor {
    
    let service: FlyersAPI
    let reachability = try! Reachability()
    
    var connectedClosure: (()->())?
    var unreachableClosure: (()->())?
    
    var flyers: [Flyer] = []
    
    init(service: FlyersAPI) {
        self.service = service
        reachability.whenReachable = { [weak self] _ in
            self?.connectedClosure?()
        }
        reachability.whenUnreachable = { [weak self] _ in
            self?.unreachableClosure?()
        }
    }
}

extension FlyersDisplayerInteractor: FlyersDisplayerInteractorProtocol {
    func startUpdatingConnectionStatus() {
        try? reachability.startNotifier()
    }
    
    func stopUpdatingConnectionStatus() {
        reachability.stopNotifier()
    }
    
    
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
    
    func readFlyer(for identifier: Int) -> Flyer {
        guard let flyerIndex = flyers.firstIndex(where: {$0.id == identifier}) else {
            fatalError("Identifier: \(identifier) doesn't exist")
        }
        let result = flyers[flyerIndex]
        
        //FOR POSITION I AM NOT SURE IF IS ASKED THE POSITION AMONG THE RESPONSE OR AMONG THE APP, SO I'LL USE THE ONE COMING FROM THE RESPONSE
        AnalyticsManager.process(event: FlyerOpenEvent(retailerID: result.retailerId,
                                                       flyerID: result.id,
                                                       title: result.title,
                                                       position: flyerIndex,
                                                       firstRead: !result.isRead))
        flyers[flyerIndex].isRead = true
        return result
    }
}
