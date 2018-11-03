//
//  LikeButton.swift
//  UIExtYazdan
//
//  Created by Yazdan on 10/22/16.
//  Copyright © 2016 Yazdan. All rights reserved.
//

import UIKit

typealias YazdanVoidClosure = () -> Void


@IBDesignable
open class LikeButtonYazdan: UIButton {
    
    @IBInspectable var status: Bool = false
    @IBInspectable var on: UIImage?
    @IBInspectable var off: UIImage?
    
    var onFunc: YazdanVoidClosure?
    var offFunc: YazdanVoidClosure?
    
    public convenience init(rect: CGRect) {
        self.init(frame: rect)
        self.addTarget(self, action: #selector(LikeButtonYazdan.changeImage), for: .touchUpInside)
        self.setImg()
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.addTarget(self, action: #selector(LikeButtonYazdan.changeImage), for: .touchUpInside)
        self.setImg()
    }
    
    public func SetUp(_ on: UIImage, _ off: UIImage, _ status: Bool, onFunc: @escaping (() -> Void), offFunc: @escaping (() -> Void)){
        if s.on {
            self.on = on
            self.off = off
            self.status = status
            self.onFunc = onFunc
            self.offFunc = offFunc
            self.setImg()
        }
    }
    
    @objc func changeImage(){
        if status{
            self.setBackgroundImage(off, for: .normal)
            status = false
            if let fn = offFunc {
                fn()
            }
        }else{
            self.setBackgroundImage(on, for: .normal)
            status = true
            if let fn = onFunc {
                fn()
            }
        }
        
    }
    
    func setImg(){
        if status{
            self.setBackgroundImage(on, for: .normal)
            if let fn = onFunc {
                fn()
            }
        }else{
            self.setBackgroundImage(off, for: .normal)
            if let fn = offFunc {
                fn()
            }
        }
    }
    
    
}
