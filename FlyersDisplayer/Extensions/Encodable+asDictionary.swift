//
//  Encodable+asDictionary.swift
//  FlyersDisplayer
//
//  Created by Mauro Romito on 18/10/2020.
//

import Foundation

extension Encodable {
    
    func asDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw NSError()
        }
        return dictionary
    }
    
    var dictionary: [String: Any]? {
        return try? asDictionary()
    }
}
