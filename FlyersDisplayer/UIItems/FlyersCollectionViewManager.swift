//
//  FlyersCollectionViewManager.swift
//  FlyersDisplayer
//
//  Created by Mauro Romito on 18/10/2020.
//

import Foundation
import UIKit

class FlyersCollectionViewManager: NSObject, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: FlyerCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
        let horizontalSpace: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
        let verticalSpace: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.top ?? 0.0) + (flowayout?.sectionInset.bottom ?? 0.0)
        let width:CGFloat = (collectionView.frame.size.width - horizontalSpace) / 2.0
        let height = (collectionView.frame.size.height - verticalSpace) / 2.0
        return CGSize(width: width, height: height)
    }
}
