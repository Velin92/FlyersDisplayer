//
//  FlyerDetailViewController.swift
//  FlyersDisplayer
//
//  Created by Mauro Romito on 18/10/2020.
//

import Foundation
import UIKit

class FlyerDetailViewController: UIViewController, Storyboarded {
    
    static let storyboardName = "Main"
    static var storyboardId = "FlyerDetailViewController"
    
    @IBOutlet weak var flyerImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func didTapOnCloseButton(_ sender: Any) {
    }
    
}
