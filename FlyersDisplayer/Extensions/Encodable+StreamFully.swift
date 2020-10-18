//
//  Encodable+StreamFully.swift
//  FlyersDisplayer
//
//  Created by Mauro Romito on 18/10/2020.
//

import Foundation

extension Encodable where Self: ​StreamFullyEvent​ {
    
    var attributes: [String: Any] {
        get {
            do {
                let dict = try self.asDictionary()
                return dict
            }
            catch {
                return ["error":"could not encode type"]
            }
        }
    }
}
