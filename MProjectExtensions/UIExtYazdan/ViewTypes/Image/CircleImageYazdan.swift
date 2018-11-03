//
//  CircleImageYazdan.swift
//  Allunac
//
//  Created by Yazdan Vakili on 10/28/18.
//  Copyright © 2018 Raviss. All rights reserved.
//

import UIKit

@IBDesignable
open class CircleImageYazdan: UIImageView {
    
    
    private var _shadowR: Int = 3
    private var _shadowOp: Float = 0.2
    
    @IBInspectable var shadowRange: Int {
        set {
            self.round(Int(((self.frame.width + self.frame.height)/4)), shR: newValue, Op: _shadowOp)
            _shadowR = newValue
        }
        get {
            return _shadowR
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        set {
            self.round(Int(((self.frame.width + self.frame.height)/4)), shR: _shadowR, Op: _shadowOp)
            _shadowOp = newValue
        }
        get {
            return _shadowOp
        }
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        makeCircle()
    }
    
    public convenience init(rect: CGRect){
        self.init(frame: rect)
        makeCircle()
    }
    
    func makeCircle() {
        let rect = self.frame
        let computedSize = CGSize(width: CGFloat((rect.width + rect.height) / 2), height: CGFloat((rect.width + rect.height) / 2))
        self.frame = CGRect(origin: CGPoint(x: rect.origin.x - CGFloat((computedSize.width - rect.width) / 2), y: rect.origin.y - CGFloat((computedSize.height - rect.height) / 2)), size: computedSize)
        self.clipsToBounds = true
        self.layer.cornerRadius = CGFloat(computedSize.width/2)
    }
}
