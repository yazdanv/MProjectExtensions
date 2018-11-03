//
//  UIDevice.swift
//  UIExtYazdan
//
//  Created by Yazdan on 10/26/16.
//  Copyright © 2016 Yazdan. All rights reserved.
//

import UIKit
    

public extension UIDevice {
    
    var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8 , value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        switch identifier {
        case "iPod5,1":                                 return "4in"
        case "iPod7,1":                                 return "4in"
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "3in"
        case "iPhone4,1":                               return "3in"
        case "iPhone5,1", "iPhone5,2":                  return "4in"
        case "iPhone5,3", "iPhone5,4":                  return "4in"
        case "iPhone6,1", "iPhone6,2":                  return "4in"
        case "iPhone7,2":                               return "5in"
        case "iPhone7,1":                               return "5.5in"
        case "iPhone8,1":                               return "5in"
        case "iPhone8,2":                               return "5.5in"
        case "iPhone9,1", "iPhone9,3":                  return "5in"
        case "iPhone9,2", "iPhone9,4":                  return "5.5in"
        case "iPhone8,4":                               return "4in"
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "10in"
        case "iPad3,1", "iPad3,2", "iPad3,3":           return "10in"
        case "iPad3,4", "iPad3,5", "iPad3,6":           return "10in"
        case "iPad4,1", "iPad4,2", "iPad4,3":           return "10in"
        case "iPad5,3", "iPad5,4":                      return "10in"
        case "iPad2,5", "iPad2,6", "iPad2,7":           return "8in"
        case "iPad4,4", "iPad4,5", "iPad4,6":           return "8in"
        case "iPad4,7", "iPad4,8", "iPad4,9":           return "8in"
        case "iPad5,1", "iPad5,2":                      return "8in"
        case "iPad6,3", "iPad6,4", "iPad6,7", "iPad6,8":return "12in"
        case "AppleTV5,3":                              return "Apple TV"
        case "i386", "x86_64":                          return "Simulator"
        default:                                        return identifier
        }
    }
    
    func fontSize(_ type: String) -> CGFloat {
        let device = modelName
        switch device {
        case "3in":
            switch type {
            case "title":
                return 12
            case "stitle":
                return 10
            default:
                return 12
            }
        case "4in":
            switch type {
            case "title":
                return 14
            case "stitle":
                return 12
            default:
                return 13
            }
        case "5in":
            switch type {
            case "title":
                return 15
            case "stitle":
                return 13
            default:
                return 14
            }
        default:
            switch type {
            case "title":
                return 18
            case "stitle":
                return 15
            default:
                return 15
            }
        }
    }
    
}
