//
//  FlyersDisplayerCollectionViewController.swift
//  FlyersDisplayer
//
//  Created by Mauro Romito on 17/10/2020.
//

import Foundation
import UIKit

protocol FlyersDisplayerViewProtocol {
    
}

class FlyersDisplayerViewController: UIViewController, Storyboarded  {
    
    static let storyboardName = "Main"
    static let storyboardId = "FlyersDisplayerViewController"
    
    var filterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFilterButton()
    }
    
    private func setupFilterButton() {
        filterButton = UIButton(type: .custom)
        filterButton.frame = CGRect(x: 0.0, y: 0.0, width: 25, height: 25)
        let image = UIImage(named:"icon_eye")!.withRenderingMode(.alwaysTemplate)
        filterButton.setImage(image, for: .normal)
        filterButton.imageView?.contentMode = .scaleAspectFit
        filterButton.tintColor = .systemBlue
        filterButton.addTarget(self, action: #selector(didTapOnFilterButton(_:)), for: .touchUpInside)
        let filterBarItem = UIBarButtonItem(customView: filterButton)
        let currWidth = filterBarItem.customView?.widthAnchor.constraint(equalToConstant: 30)
        currWidth?.isActive = true
        let currHeight = filterBarItem.customView?.heightAnchor.constraint(equalToConstant: 30)
        currHeight?.isActive = true
        self.navigationItem.rightBarButtonItem = filterBarItem
    }
    
    @objc private func didTapOnFilterButton(_ sender: Any){
        
    }
}

extension FlyersDisplayerViewController: FlyersDisplayerViewProtocol {
    
}
