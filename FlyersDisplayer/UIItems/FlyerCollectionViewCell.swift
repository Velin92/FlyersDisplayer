//
//  FlyerCollectionViewCell.swift
//  FlyersDisplayer
//
//  Created by Mauro Romito on 18/10/2020.
//

import Foundation
import UIKit
import Kingfisher

class FlyerCollectionViewCell: UICollectionViewCell, ReusableView {
    
    static let defaultReuseId = "FlyerCollectionViewCell"
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var readFlagImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func setViewState(_ viewState: FlyerCellViewState) {
        print(viewState.flyerViewState.imageUrl)
        backgroundImageView.kf.setImage(with: try? viewState.flyerViewState.imageUrl.asURL())
        titleLabel.text = viewState.flyerViewState.title
        readFlagImageView.isHidden = viewState.isReadImageHidden
        if #available(iOS 13.0, *) {
            readFlagImageView.tintColor = .systemBlue
        } else {
            readFlagImageView.tintColor = UIColor(displayP3Red: 0.0, green: 122.0/255.0, blue: 255.0, alpha: 1)
        }
        readFlagImageView.layer.cornerRadius = readFlagImageView.frame.height/2
    }
}
