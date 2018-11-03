//
//  RoundWebView.swift
//  UIExtYazdan
//
//  Created by Yazdan on 10/21/16.
//  Copyright © 2016 Yazdan. All rights reserved.
//

import UIKit

@IBDesignable
open class RoundWebViewYazdan: UIWebView {
    
    private var _fraction: CGFloat = 0.05
    private var _shadowR: Int = 3
    private var _shadowOp: Float = 0.2
    
    @IBInspectable var fraction: CGFloat {
        set {
            self.round(Int(((self.frame.width + self.frame.height)/2) * newValue), shR: _shadowR, Op: _shadowOp)
            _fraction = newValue
        }
        get {
            return _fraction
        }
    }
    
    @IBInspectable var shadowRange: Int {
        set {
            self.round(Int(((self.frame.width + self.frame.height)/2) * _fraction), shR: newValue, Op: _shadowOp)
            _shadowR = newValue
        }
        get {
            return _shadowR
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        set {
            self.round(Int(((self.frame.width + self.frame.height)/2) * _fraction), shR: _shadowR, Op: _shadowOp)
            _shadowOp = newValue
        }
        get {
            return _shadowOp
        }
    }
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.checkActive()
        self.round(Int(((self.frame.width + self.frame.height)/2) * _fraction), shR: _shadowR, Op: _shadowOp)
    }
    
    public convenience init(rect: CGRect){
        self.init(frame: rect)
        self.checkActive()
        if s.on {
            self.round(Int(((self.frame.width + self.frame.height)/2) * _fraction), shR: _shadowR, Op: _shadowOp)
            self.backgroundColor = .white
        }
    }
}
