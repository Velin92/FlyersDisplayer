//
//  ReusableView.swift
//  FlyersDisplayer
//
//  Created by Mauro Romito on 18/10/2020.
//

import Foundation
import UIKit

protocol ReusableView: UIView {
    static var defaultReuseId: String {get}
}
