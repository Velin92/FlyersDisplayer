//
//  FlyerCollectionViewCell.swift
//  FlyersDisplayer
//
//  Created by Mauro Romito on 18/10/2020.
//

import Foundation
import UIKit

class FlyerCollectionViewCell: UICollectionViewCell, ReusableView {
    
    static let defaultReuseId = "FlyerCollectionViewCell"
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var readFlagImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
}
