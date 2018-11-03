//
//  UICollectionView.swift
//  Pods
//
//  Created by Yazdan on 12/15/16.
//
//

import UIKit

public extension UICollectionView {
    
    func register(T: CollectionViewCellYazdan.Type, bundle: Bundle? = nil) {
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: CollectionViewCellYazdan>(forIndexPath indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        cell.checkActive()
        return cell
    }
}
