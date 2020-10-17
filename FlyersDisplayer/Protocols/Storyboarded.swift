//
//  Storyboarded.swift
//  FlyersDisplayer
//
//  Created by Mauro Romito on 17/10/2020.
//

import Foundation
import UIKit

protocol Storyboarded: UIViewController {
    
    static var storyboardName: String {get}
    static var storyboardId: String {get}
    static func instantiate() -> Self
}

extension Storyboarded {
    
    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: storyboardId) as? Self else {
            fatalError("Wrong storyboard id or name")
        }
        return vc
    }
}
