//
//  UIImageView.swift
//  Pods
//
//  Created by Yazdan on 2/22/17.
//
//

import UIKit

public enum imageAnim: Int {
    case none = 0
    case random = 1
    case popOver = 2
}

public extension UIImageView {
    
    public func setImg(_ image: UIImage, _ anim: imageAnim = .none) {
        
        switch anim {
            case .popOver:
                let imgView2 = UIImageView(frame: CGRect(x: self.frame.origin.x - self.frame.size.width, y: 0, width: self.frame.size.width, height: self.frame.size.height))
                imgView2.image = image
            
            default:
                self.image = image
        }
        
    }
    
}
