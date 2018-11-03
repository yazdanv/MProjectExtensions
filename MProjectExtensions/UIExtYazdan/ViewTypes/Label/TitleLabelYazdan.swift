//
//  YazdanTitleLabel.swift
//  UIExtYazdan
//
//  Created by Yazdan on 10/25/16.
//  Copyright © 2016 Yazdan. All rights reserved.
//

import UIKit

@IBDesignable open class TitleLabelYazdan: UILabel {

    public var fnt = UIFont(name: "Montserrat", size: 16)
    
    @IBInspectable var fontSize: CGFloat {
        get {return 10.0}
        set {
            self.font = self.fnt?.withSize(newValue)
        }
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.font = self.fnt?.withSize(self.font.pointSize)
    }

    public convenience init(){
        self.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        self.font = self.fnt
    }
    
    public convenience init(frm: CGRect){
        self.init(frame: frm)
        self.font = self.fnt
    }
    
}


