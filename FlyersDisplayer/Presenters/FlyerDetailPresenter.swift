//
//  FlyerDetailPresenter.swift
//  FlyersDisplayer
//
//  Created by Mauro Romito on 18/10/2020.
//

import Foundation

protocol FlyerDetailPresenterProtocol {
    func populate()
}

class FlyerDetailPresenter {
    
    typealias FlyerDetailPresenterView = FlyerDetailViewProtocol
    weak var view: FlyerDetailPresenterView!
    let interactor: FlyerDetailInteractorProtocol
    
    init(view: FlyerDetailPresenterView, interactor: FlyerDetailInteractorProtocol) {
        self.view = view
        self.interactor = interactor
    }
}

extension FlyerDetailPresenter: FlyerDetailPresenterProtocol {
    
    func populate() {
        view.updateViewState(FlyerViewState(from: interactor.model))
    }
}
