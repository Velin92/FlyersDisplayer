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
        let interactor = FlyersDisplayerInteractor(service: APIClient())
        let presenter = FlyersDisplayerPresenter(view: vc, interactor: interactor)
        presenter.goToFlyerDetail = { [weak self] model in
            self?.goToFlyerDetail(model: model)
        }
        vc.presenter = presenter
        navigationController.pushViewController(vc, animated: false)
    }
    
    func goToFlyerDetail(model: Flyer) {
        let vc = FlyerDetailViewController.instantiate()
        navigationController.present(vc, animated: true, completion: nil)
    }
}
