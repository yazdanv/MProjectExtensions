//
//  UIImage.swift
//  Pods
//
//  Created by Yazdan on 12/25/16.
//
//
import UIKit

public extension UIImage {
    public var name: String {
        return String(describing: self)
    }
    
    public static func qrImg(_ input: String) -> UIImage {
        let filter = CIFilter(name: "CIQRCodeGenerator")
        filter?.setValue(input.data(using: .utf8), forKey: "inputMessage")
        filter?.setValue("Q", forKey: "inputCorrectionLevel")
        let context:CIContext = CIContext.init(options: nil)
        let cgImage:CGImage = context.createCGImage((filter?.outputImage)!, from: (filter?.outputImage!.extent)!)!
        let image:UIImage = UIImage.init(cgImage: cgImage)
        return image
    }
    
}


