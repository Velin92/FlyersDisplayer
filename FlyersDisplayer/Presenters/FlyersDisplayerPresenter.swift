//
//  FlyersDisplayerPresenter.swift
//  FlyersDisplayer
//
//  Created by Mauro Romito on 18/10/2020.
//

import Foundation

protocol FlyersDisplayerPresenterProtocol: AnyObject {
    
    func loadFlyers()
    func didSelectItem(at index: Int)
    func toggleFilter()
    func startUpdatingConnectionStatus()
    func stopUpdatingConnectionStatus()
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
        interactor.connectedClosure = { [weak self] in
            self?.updateConnectionState(with: .reachable)
        }
        interactor.unreachableClosure = { [weak self] in
            self?.updateConnectionState(with: .unreachable)
        }
    }
    
    private func updateView() {
        view.updateViewState(viewState)
    }
    
    private func updateConnectionState( with state: ConnectionState) {
        viewState.connectionState = state
        updateView()
    }
}

extension FlyersDisplayerPresenter: FlyersDisplayerPresenterProtocol {
    
    func startUpdatingConnectionStatus() {
        interactor.startUpdatingConnectionStatus()
    }
    
    func stopUpdatingConnectionStatus() {
        interactor.stopUpdatingConnectionStatus()
    }
    
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
        var filteredModels: [Flyer]
        if viewState.isFilterActive {
            filteredModels = models.filter({$0.isRead})
        } else {
            filteredModels = models
        }
        var cellViewStates: [FlyerCellViewState] = []
        var mappedIdentifiers: [Int] = []
        for model in filteredModels {
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
    
    func toggleFilter() {
        viewState.isFilterActive = !viewState.isFilterActive
        updateFlyers()
    }
}
