//
//  FlyerViewState.swift
//  FlyersDisplayer
//
//  Created by Mauro Romito on 18/10/2020.
//

import Foundation

struct FlyerViewState{
    
    let imageUrl: String
    let title: String
    
    init(from model: Flyer) {
        self.imageUrl = model.imageUrl
        self.title = model.title
    }
}
