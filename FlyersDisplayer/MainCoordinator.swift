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
        unowned let weakPresenter = presenter
        presenter.goToFlyerDetail = { [weak self] model in
            self?.goToFlyerDetail(model: model, previousPresenter: weakPresenter)
        }
        vc.presenter = presenter
        navigationController.pushViewController(vc, animated: false)
    }
    
    func goToFlyerDetail(model: Flyer, previousPresenter: FlyersDisplayerPresenter) {
        let vc = FlyerDetailViewController.instantiate()
        let interactor = FlyerDetailInteractor(model: model)
        let presenter = FlyerDetailPresenter(view: vc, interactor: interactor)
        presenter.dismissClosure = { [weak self] in
            DispatchQueue.main.async {
                self?.navigationController.dismiss(animated: true) {
                    previousPresenter.updateFlyers()
                }
            }
        }
        vc.presenter = presenter
        DispatchQueue.main.async {
            self.navigationController.present(vc, animated: true)
        }
    }
}
