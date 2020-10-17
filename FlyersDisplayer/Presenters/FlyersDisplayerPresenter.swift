//
//  FlyersDisplayerPresenter.swift
//  FlyersDisplayer
//
//  Created by Mauro Romito on 18/10/2020.
//

import Foundation

protocol FlyersDisplayerPresenterProtocol: AnyObject {
    
}

class FlyersDisplayerPresenter {
    
    typealias FlyersDisplayerView = FlyersDisplayerViewProtocol
    weak var view: FlyersDisplayerView!
    let interactor: FlyersDisplayerInteractorProtocol
    
    init(view: FlyersDisplayerView, interactor: FlyersDisplayerInteractorProtocol) {
        self.view = view
        self.interactor = interactor
    }
    
}

extension FlyersDisplayerPresenter: FlyersDisplayerPresenterProtocol {
    
}
