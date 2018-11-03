//
//  UITableView.swift
//  Pods
//
//  Created by Yazdan on 12/15/16.
//
//

import UIKit

public extension UITableView {
    
    func register(T: TableViewCellYazdan.Type, bundle: Bundle? = nil) {
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        self.register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: TableViewCellYazdan>(forIndexPath indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        cell.checkActive()
        return cell
    }
}
