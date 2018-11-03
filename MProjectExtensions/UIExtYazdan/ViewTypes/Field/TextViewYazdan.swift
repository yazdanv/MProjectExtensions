//
//  TextViewYazdan.swift
//  Pods
//
//  Created by Yazdan on 3/12/17.
//
//

import UIKit

open class TextViewYazdan: UITextView, UITextViewDelegate {
    
    var _fnt = UIFont(name: "B Yekan+", size: UIDevice.current.fontSize("stitle")) {didSet{self.config()}}
    
    var fnt: UIFont {
        set {_fnt = newValue}
        get {return _fnt!}
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.round(1, shR: 3, Op: 0.3)
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
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            self.resignFirstResponder()
            return false
        }
        return true
    }
    
}
