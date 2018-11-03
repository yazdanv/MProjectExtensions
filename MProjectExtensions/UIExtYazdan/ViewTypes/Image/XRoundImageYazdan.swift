//
//  XRoundImageYazdan.swift
//  Pods
//
//  Created by Yazdan on 12/17/16.
//
//


import UIKit

open class XRoundImageYazdan: UIImageView {
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.round(Int(self.frame.size.width)/8, shR: 3, Op: 0.2)
    }
    
    public convenience init(rect: CGRect){
        self.init(frame: rect)
        self.round(Int(self.frame.size.width)/8, shR: 3, Op: 0.2)
    }
    
}
