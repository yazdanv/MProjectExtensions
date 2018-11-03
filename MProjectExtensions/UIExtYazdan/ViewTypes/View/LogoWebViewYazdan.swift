//
//  LogoWebViewYazdan.swift
//  Pods
//
//  Created by Yazdan on 1/20/17.
//
//

import UIKit

@IBDesignable
open class LogoWebViewYazdan: RoundWebViewYazdan {
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        let html = UserDefaults.standard.string(forKey: "attr")
        self.loadHTMLString(html ?? "", baseURL: nil)
    }
    
    public convenience init(rect: CGRect){
        self.init(rect: rect)
        let html = UserDefaults.standard.string(forKey: "attr")
        self.loadHTMLString(html ?? "", baseURL: nil)
    }
}
