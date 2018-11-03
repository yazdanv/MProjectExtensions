//
//  NibLoadableView.swift
//  Pods
//
//  Created by Yazdan on 12/15/16.
//
//

import UIKit

public protocol NibLoadableView: class {}

extension NibLoadableView where Self: UIView {
    public static var nibName: String {
        return String(describing: self)
    }
    public static var nib: UINib {
        return UINib(nibName: Self.nibName, bundle: nil)
    }
}
