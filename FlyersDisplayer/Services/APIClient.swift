//
//  APIClient.swift
//  FlyersDisplayer
//
//  Created by Mauro Romito on 17/10/2020.
//


import Foundation
import Alamofire

protocol FlyersAPI {
    func getFlyersList(completion: @escaping (AFResult<FlyersListResponse>) -> Void)
}

class APIClient {
    private func request<T: Codable> (_ urlConvertible: URLRequestConvertible, completion: @escaping (AFResult<T>) -> Void) {
        AF.request(urlConvertible).responseData() { (dataResponse: AFDataResponse<Data>) in
            let decoder = JSONDecoder()
            let response: AFResult<T> = decoder.decodeResponse(from: dataResponse)
            completion(response)
        }
    }
}

extension APIClient: FlyersAPI {
    func getFlyersList(completion: @escaping (AFResult<FlyersListResponse>) -> Void) {
        request(APIRouter.getFlyersList, completion: completion)
    }
}
