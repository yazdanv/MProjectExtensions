//
//  ReusableView.swift
//  Pods
//
//  Created by Yazdan on 12/15/16.
//
//

import UIKit

public protocol ReusableView: class {}

extension ReusableView where Self: UIView {
    
    public static var reuseIdentifier: String {
        return String(describing: self)
    }
}
