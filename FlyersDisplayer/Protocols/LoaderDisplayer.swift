//
//  LoaderDisplayer.swift
//  FlyersDisplayer
//
//  Created by Mauro Romito on 18/10/2020.
//

import Foundation
import UIKit

protocol LoaderDisplayer: UIViewController {
    func showLoader()
    func hideLoader()
}

extension LoaderDisplayer {
    func showLoader() {
        DispatchQueue.main.async {
            let maskView = UIView(frame: self.view.frame)
            self.view.addSubview(maskView)
            let activityView: UIActivityIndicatorView
            if #available(iOS 13.0, *) {
                activityView = UIActivityIndicatorView(style: .large)
            } else {
                activityView = UIActivityIndicatorView()
            }
            activityView.center = self.view.center
            activityView.startAnimating()
            maskView.tag = String(describing: self).hashValue
            maskView.addSubview(activityView)
        }
    }
    
    func hideLoader() {
        DispatchQueue.main.async {
            if let maskView = self.view.subviews.first (where: {$0.tag == String(describing: self).hashValue}) {
                maskView.removeFromSuperview()
            }
        }
    }
}
