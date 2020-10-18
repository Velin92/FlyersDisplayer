//
//  FlyersDisplayerPresenter.swift
//  FlyersDisplayer
//
//  Created by Mauro Romito on 18/10/2020.
//

import Foundation

protocol FlyersDisplayerPresenterProtocol: AnyObject {
    
    func loadFlyers()
    func updateFlyers()
    func didSelectItem(at index: Int)
}

class FlyersDisplayerPresenter {
    
    typealias FlyersDisplayerView = FlyersDisplayerViewProtocol & LoaderDisplayer
    
    weak var view: FlyersDisplayerView!
    let interactor: FlyersDisplayerInteractorProtocol
    
    private var viewState = FlyersDisplayerViewState()
    private var identifiers: [Int] = []
    
    var goToFlyerDetail: ((Flyer)->())?
    
    init(view: FlyersDisplayerView, interactor: FlyersDisplayerInteractorProtocol) {
        self.view = view
        self.interactor = interactor
    }
    
    private func updateView() {
        view.updateViewState(viewState)
    }
}

extension FlyersDisplayerPresenter: FlyersDisplayerPresenterProtocol {
    
    func didSelectItem(at index: Int) {
        let flyer = interactor.readFlyer(for: identifiers[index])
        goToFlyerDetail?(flyer)
    }
    
    func loadFlyers() {
        view.showLoader()
        interactor.loadFlyersData { [weak self] result in
            self?.view.hideLoader()
            switch result {
            case .success(let flyers):
                self?.mapViewStates(with: flyers)
                self?.updateView()
                break
            case .failure(let error):
                break
            }
        }
    }
    
    private func mapViewStates(with models: [Flyer]) {
        var cellViewStates: [FlyerCellViewState] = []
        var mappedIdentifiers: [Int] = []
        for model in models {
            cellViewStates.append(FlyerCellViewState(from: model))
            mappedIdentifiers.append(model.id)
        }
        viewState.cellViewStates = cellViewStates
        identifiers = mappedIdentifiers
    }
    
    func updateFlyers() {
        mapViewStates(with: interactor.flyers)
        updateView()
    }
}
