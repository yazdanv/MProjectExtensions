//
//  YazdanSubTitleLable.swift
//  UIExtYazdan
//
//  Created by Yazdan on 10/25/16.
//  Copyright © 2016 Mandaa. All rights reserved.
//

import UIKit

open class SubTitleLabelYazdan: UILabel {
    
    static let fnt = UIFont(name: "B Yekan+", size: UIDevice.current.fontSize("stitle"))
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        if s.on {self.font = SubTitleLabelYazdan.fnt}
    }
    
    public convenience init(){
        self.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        if s.on {self.font = SubTitleLabelYazdan.fnt}
    }
    
    public convenience init(rect: CGRect){
        self.init(frame: rect)
        if s.on {self.font = SubTitleLabelYazdan.fnt}
    }
    
}
