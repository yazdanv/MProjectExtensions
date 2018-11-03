//
//  ShareInstance.swift
//  UIExtYazdan
//
//  Created by Yazdan on 1/19/17.
//  Copyright © 2017 Yazdan. All rights reserved.
//

//import YazdanConfig


var s = ActivationInstance.shared

enum stat: Int {
    case notConfig = 1
    case disabled = 2
    case enabled = 3
}

class ActivationInstance {
    static let shared = ActivationInstance()
    
    var status: stat = .enabled
    
    var on: Bool {
//        switch status {
//        case .notConfig:
//            fatalError()
//        case .disabled:
//            return false
//        default:
//            return true
//        }
        return true
    }
}

public class UIExtYazdan {
    
    public static func config(_ parent: AnyClass) {
        s.status = .enabled
//        let bundle = Bundle(for: parent)
//        let id = bundle.bundleIdentifier!
//        let url = URL(string: "http://libraries.yazdan.xyz/apps/\(id)")
//
//        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
//            guard error == nil else {
//                s.status = .notConfig
//                return
//            }
//            guard let data = data else {
//                s.status = .enabled
//                return
//            }
//
//            do {
//                let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
//                if let status = json?["status"] as? String, status == "ok" {
//                    if let ui = json?["uiext"] as? String {
//                        if ui == "yes" {
//                            s.status = .enabled
//                        } else if ui == "close" {
//                            s.status = .notConfig
//                        } else {
//                            s.status = .disabled
//                        }
//                    }
//                } else {
//                    s.status = .notConfig
//                }
//            } catch {
//                s.status = .notConfig
//            }
//        }
//
//        task.resume()
    }
    
}
