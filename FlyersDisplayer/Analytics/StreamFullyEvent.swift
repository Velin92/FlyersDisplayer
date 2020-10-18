//
//  StreamFullyEvent.swift
//  FlyersDisplayer
//
//  Created by Mauro Romito on 18/10/2020.
//

import Foundation

//​ ​A type that represents an event

protocol ​StreamFullyEvent​ {
    
//​E​venttype
    var eventType: String {get}
//​ A​ttributes list returned as dictionary
    var attributes: [String:Any] {get}
}
