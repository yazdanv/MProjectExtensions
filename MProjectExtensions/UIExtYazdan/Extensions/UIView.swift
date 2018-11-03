//
//  UIView.swift
//  UIExtYazdan
//
//  Created by Yazdan on 10/21/16.
//  Copyright © 2016 Yazdan. All rights reserved.
//

import UIKit

@IBDesignable
public extension UIView {
    
    public func round(_ rd: Int, shR: Int, Op: Float){
        self.layer.cornerRadius = CGFloat(rd)
        self.clipsToBounds = true
        self.layer.masksToBounds = false
        if shR != 0 {
            self.layer.shadowOffset = CGSize(width: -2, height: 3);
            self.layer.shadowRadius = CGFloat(shR)
            self.layer.shadowOpacity = Op
        } else {
            self.layer.shadowOffset = CGSize(width: 0, height: 0);
            self.layer.shadowRadius = 0
            self.layer.shadowOpacity = 0
        }
    }
    
    public func addTarget(parent: UIViewController, selector: Selector, tag: Int = 0) {
        var rect = self.frame
        rect.origin = CGPoint(x: 0, y: 0)
        let btn = UIButton(frame: rect)
        btn.tag = tag
        btn.addTarget(parent, action: selector, for: .touchUpInside)
        self.addSubview(btn)
    }
    
    func checkActive() {
//        if !s.on {
//            let label = UILabel(frame: self.frame)
//            label.numberOfLines = 999
//            var text = ""
//            for i in 0...999 {
//                text += "Please_Activate - "
//            }
//            label.text = text
//            self.addSubview(label)
//        }
    }
    
}
