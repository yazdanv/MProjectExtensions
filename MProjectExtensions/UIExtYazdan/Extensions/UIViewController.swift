//
//  UIViewController.swift
//  UIExtYazdan
//
//  Created by Yazdan on 10/31/16.
//  Copyright © 2016 Yazdan. All rights reserved.
//

import UIKit

public extension UIViewController {
    func toast(text: String, time: Double, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: "", message: text, preferredStyle: UIAlertController.Style.alert)
        self.present(alert, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time, execute: {
            alert.dismiss(animated: true, completion: nil)
            if let completion = completion {
                completion()
            }
        })
    }
}
