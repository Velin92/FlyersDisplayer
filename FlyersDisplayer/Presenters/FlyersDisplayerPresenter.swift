//
//  FlyersDisplayerPresenter.swift
//  FlyersDisplayer
//
//  Created by Mauro Romito on 18/10/2020.
//

import Foundation

protocol FlyersDisplayerPresenterProtocol: AnyObject {
    func loadFlyers()
}

class FlyersDisplayerPresenter {
    
    typealias FlyersDisplayerView = FlyersDisplayerViewProtocol & LoaderDisplayer
    
    weak var view: FlyersDisplayerView!
    let interactor: FlyersDisplayerInteractorProtocol
    
    init(view: FlyersDisplayerView, interactor: FlyersDisplayerInteractorProtocol) {
        self.view = view
        self.interactor = interactor
    }
}

extension FlyersDisplayerPresenter: FlyersDisplayerPresenterProtocol {
    
    func loadFlyers() {
        view.showLoader()
    }
}
