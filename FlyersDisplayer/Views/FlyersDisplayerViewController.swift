//
//  FlyersDisplayerCollectionViewController.swift
//  FlyersDisplayer
//
//  Created by Mauro Romito on 17/10/2020.
//

import Foundation
import UIKit

protocol FlyersDisplayerViewProtocol: UIViewController {
    func updateViewState(_ viewState: FlyersDisplayerViewState)
}

class FlyersDisplayerViewController: UIViewController, Storyboarded, LoaderDisplayer  {
    
    static let storyboardName = "Main"
    static let storyboardId = "FlyersDisplayerViewController"
    
    var presenter: FlyersDisplayerPresenterProtocol!
    
    @IBOutlet weak var flyersCollectionView: UICollectionView!
    @IBOutlet weak var connectionStateLabel: UILabel!
    
    var filterButton: UIButton!
    
    let collectionViewManager = FlyersCollectionViewManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        setupFilterButton()
        setupCollectionView()
        presenter.loadFlyers()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.startUpdatingConnectionStatus()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        presenter.stopUpdatingConnectionStatus()
    }
    
    private func setupCollectionView() {
        collectionViewManager.didSelectItem = { [weak self] index in
            self?.presenter.didSelectItem(at: index)
        }
        flyersCollectionView.dataSource = collectionViewManager
        flyersCollectionView.delegate = collectionViewManager
        flyersCollectionView.reloadData()
    }
    
    private func setupFilterButton() {
        filterButton = UIButton(type: .custom)
        filterButton.frame = CGRect(x: 0.0, y: 0.0, width: 25, height: 25)
        let image = UIImage(named:"icon_eye")!
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
        presenter.toggleFilter()
    }
}

extension FlyersDisplayerViewController: FlyersDisplayerViewProtocol {
    
    func updateViewState(_ viewState: FlyersDisplayerViewState) {
        DispatchQueue.main.async {
            self.updateFilterButtonState(isActive: viewState.isFilterActive)
            self.updateCollectionView(with: viewState.cellViewStates)
            self.updateConnectionView(with: viewState.connectionState)
        }
    }
    
    private func updateFilterButtonState(isActive: Bool) {
        let image = isActive ? UIImage(named:"icon_eye_fill")! : UIImage(named:"icon_eye")!
        filterButton.setImage(image, for: .normal)
    }
    
    private func updateCollectionView(with data: [FlyerCellViewState]) {
        collectionViewManager.dataSource = data
        flyersCollectionView.reloadData()
    }
    
    private func updateConnectionView(with state: ConnectionState) {
        connectionStateLabel.text = state.rawValue
        switch state {
        case .reachable:
            connectionStateLabel.textColor = .systemGreen
            break
        case .unreachable:
            connectionStateLabel.textColor = .systemRed
            break
        default:
            if #available(iOS 13.0, *) {
                connectionStateLabel.textColor = .label
            } else {
                connectionStateLabel.textColor = .black
            }
        }
    }
}
