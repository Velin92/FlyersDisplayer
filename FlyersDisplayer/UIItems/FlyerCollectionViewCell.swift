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
    }
}
