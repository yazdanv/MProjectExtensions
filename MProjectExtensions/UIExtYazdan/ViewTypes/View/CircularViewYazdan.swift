//
//  CircularViewYazdan.swift
//  UIExtYazdan
//
//  Created by Yazdan on 12/5/16.
//  Copyright © 2016 Yazdan. All rights reserved.
//

import UIKit

@IBDesignable open class CircularViewYazdan: UIView {

    private var _shadowR: Int = 3
    private var _shadowOp: Float = 0.2

    @IBInspectable var shadowRange: Int {
        set {
            self.round(Int(self.frame.size.width)/2, shR: shadowRange, Op: shadowOpacity)
            _shadowR = newValue
        }
        get {
            return _shadowR
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        set {
            self.round(Int(self.frame.size.width)/2, shR: shadowRange, Op: shadowOpacity)
            _shadowOp = newValue
        }
        get {
            return _shadowOp
        }
    }
    
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.checkActive()
        let calculatedDim = (self.frame.size.width + self.frame.size.height)/2
        self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: calculatedDim, height: calculatedDim)
        self.round(Int(self.frame.size.width)/2, shR: shadowRange, Op: shadowOpacity)
    }
    
    public convenience init(rect: CGRect){
        self.init(frame: rect)
        self.checkActive()
        self.round(Int(self.frame.size.width)/2, shR: shadowRange, Op: shadowOpacity)
    }

}
