//
//  APIRouter.swift
//  FlyersDisplayer
//
//  Created by Mauro Romito on 17/10/2020.
//

import Foundation
import Alamofire


enum APIRouter: URLRequestConvertible {
    
    enum HTTPHeaderField: String {
        case authentication = "Authorization"
        case contentType = "Content-Type"
        case acceptType = "Accept"
        case acceptEncoding = "Accept-Encoding"
    }
    
    enum ContentType: String {
        case json = "application/json"
        case image = "image/png"
    }
    
    case getFlyersList
    
    var method: HTTPMethod {
        switch self {
        case .getFlyersList:
            return .get
        }
    }
    
    var path: String {
        
        switch self {
        case .getFlyersList:
            return ""
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        let url = try Constants.baseURLPath.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        switch self {
        case .getFlyersList:
            urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        }
        if let url = urlRequest.url?.absoluteString {
            print("GET REQUEST URL\n: \(url)")
        }
        return urlRequest
    }
}
