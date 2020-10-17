//
//  MainCoordinator.swift
//  FlyersDisplayer
//
//  Created by Mauro Romito on 17/10/2020.
//

import Foundation
import UIKit

class MainCoordinator {
    
    private weak var navigationController: UINavigationController!
    
    init (navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = FlyersDisplayerViewController.instantiate()
        navigationController.pushViewController(vc, animated: false)
    }
}
