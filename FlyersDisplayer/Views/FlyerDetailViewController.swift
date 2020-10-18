//
//  FlyerDetailViewController.swift
//  FlyersDisplayer
//
//  Created by Mauro Romito on 18/10/2020.
//

import Foundation
import UIKit
import Kingfisher

protocol FlyerDetailViewProtocol: UIViewController {
    func updateViewState(_ viewState: FlyerViewState)
}

class FlyerDetailViewController: UIViewController, Storyboarded {
    
    static let storyboardName = "Main"
    static var storyboardId = "FlyerDetailViewController"
    
    var presenter: FlyerDetailPresenterProtocol!
    
    @IBOutlet weak var flyerImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.populate()
    }
    
    @IBAction func didTapOnCloseButton(_ sender: Any) {
    }
}

extension FlyerDetailViewController: FlyerDetailViewProtocol {
    
    func updateViewState(_ viewState: FlyerViewState)  {
        DispatchQueue.main.async {
            self.flyerImageView.kf.setImage(with: try? viewState.imageUrl.asURL())
            self.titleLabel.text = viewState.title
        }
    }
}
