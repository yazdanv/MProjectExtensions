//
//  UILabel.swift
//  Pods
//
//  Created by Yazdan on 3/3/17.
//
//

import UIKit

public enum uilabelListenerType: Int {
    case phone = 1
    case email = 2
    case website = 3
}

public extension UILabel{
    
    var requiredHeight: CGFloat{
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = self.font
        label.text = self.text
        label.sizeToFit()
        return label.frame.height
    }
    
    var englishNumbers: String? {
        var str = self.text
        for item in [["1","۱"],["2","۲"],["3","۳"],["4","۴"],["5","۵"],["6","۶"],["7","۷"],["8","۸"],["9","۹"],["0","۰"]] {
            str = str?.replacingOccurrences(of: item[1], with: item[0])
        }
        return str
    }
    
    public func setListener(_ parent: UIViewController, _ type: uilabelListenerType) {
        switch type {
            case .phone:
                self.addTarget(parent: parent, selector: #selector(openCall))
            case .email:
                break
            case .website:
                break
        }
    }
    
    @objc func openCall() {
        let number = self.englishNumbers
        if let url = URL(string: "tel://\(number!)") {
            UIApplication.shared.openURL(url)
        }
    }
}
