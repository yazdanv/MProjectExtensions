//
//  TextField.swift
//  Pods
//
//  Created by Yazdan on 3/3/17.
//
//

import UIKit

open class TextFieldYazdan: UITextField, UITextFieldDelegate {
    
    var _fnt = UIFont(name: "B Yekan+", size: UIDevice.current.fontSize("stitle")) {didSet{self.config()}}
    
    var fnt: UIFont {
        set {_fnt = newValue}
        get {return _fnt!}
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        config()
    }
    
    public convenience init(){
        self.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        config()
    }
    
    public convenience init(rect: CGRect){
        self.init(frame: rect)
        config()
    }
    
    func config() {
        if s.on {
            self.font = fnt
            self.delegate = self
        }
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.resignFirstResponder()
        return false
    }
    
}
