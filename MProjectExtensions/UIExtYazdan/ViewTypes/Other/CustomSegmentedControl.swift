//
//  CustomSegmentedControl.swift
//  Allunac
//
//  Created by Yazdan Vakili on 10/20/18.
//  Copyright © 2018 Raviss. All rights reserved.
//

import UIKit

@IBDesignable open class CustomSegmentedControl: UISegmentedControl {
    
    private var _fraction: CGFloat = 0.0
    private var _shadowR: Int = 3
    private var _shadowOp: Float = 0.2
    private var _borderColor: UIColor = .clear
    private var _borderWidth: CGFloat = 1.0
    
    @IBInspectable var fraction: CGFloat {
        set {
            _fraction = newValue
            self.round(Int(((self.frame.width + self.frame.height)/2) * newValue), shR: _shadowR, Op: _shadowOp)
        }
        get {
            return _fraction
        }
    }
    
    @IBInspectable var shadowRange: Int {
        set {
            _shadowR = newValue
            self.round(Int(((self.frame.width + self.frame.height)/2) * _fraction), shR: newValue, Op: _shadowOp)
        }
        get {
            return _shadowR
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        set {
            _shadowOp = newValue
            self.round(Int(((self.frame.width + self.frame.height)/2) * _fraction), shR: _shadowR, Op: _shadowOp)
        }
        get {
            return _shadowOp
        }
    }
    @IBInspectable var borderColor: UIColor {
        set {
            _borderColor = newValue
            self.setBorder()
        }
        get {
            return _borderColor
        }
    }
    @IBInspectable var borderWidth: CGFloat {
        set {
            _borderWidth = newValue
            self.setBorder()
        }
        get {
            return _borderWidth
        }
    }
    
    func setBorder() {
        for selectView in subviews {
            selectView.layer.borderColor = borderColor.cgColor
            selectView.layer.borderWidth = CGFloat(borderWidth)
            selectView.layer.cornerRadius = CGFloat(Int(((self.frame.width + self.frame.height)/2) * _fraction))
            selectView.layer.masksToBounds = true
        }
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.round(Int(((self.frame.width + self.frame.height)/2) * _fraction), shR: _shadowR, Op: _shadowOp)
        setBorder()
    }
    
    public convenience init(rect: CGRect){
        self.init(frame: rect)
        self.round(Int(((self.frame.width + self.frame.height)/2) * _fraction), shR: _shadowR, Op: _shadowOp)
        self.backgroundColor = .clear
        setBorder()
    }
    
}
