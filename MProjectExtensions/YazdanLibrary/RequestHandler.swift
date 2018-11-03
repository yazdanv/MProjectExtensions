//
//  RequestHandler.swift
//  Alamofire
//
//  Created by Yazdan on 7/9/17.
//

import Foundation

public let Request = RequestHandler()
public let Re = RequestHandler()

public enum DataCoding: Int {
    case json = 1
    case formdata = 2
    case urlEncoded = 3
}

public enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

public class RequestHandler: NSObject {
    
    
    public func json(_ url: String, _ parameters: [String: Any] = [:], headers: [String: String] = [:], method: RequestMethod = .get, coding: DataCoding = .urlEncoded, retry: Int = 1, _tried: Int = 0, object: ((JSON) -> Void)? = nil, array: (([JSON]) -> Void)? = nil, string: ((String) -> Void)? = nil, failure: (() -> Void)? = nil) {
        var tried = _tried;
        let failed = {
            if tried < retry {
                self.json(url, parameters, method: method, coding: coding, retry: retry,  _tried: tried, object: object, array: array, failure: failure)
            } else {
                if let failure = failure {failure()}
            }
        }
        tried += 1
        let handleData = {(val: String) in
            do {
                let jsn = try JSON(data: val.data(using: .utf8)!)
                if let json = jsn.array {
                    if let array = array {
                        array(json)
                    }
                } else if jsn != JSON.null  {
                    if let object = object {
                        object(jsn)
                    }
                } else {
                    string?(val)
                }
            } catch {failed()}
        }
        if method != .get {
            self.postStr(url, parameters, headers: headers, method: method, coding: coding, success: handleData, failed: failed)
        } else {
            self.getStr(url, parameters, headers: headers, success: handleData, failed: failed)
        }
    }
    
    public func getStr(_ url: String, _ parameters: [String: Any] = [:], headers: [String: String] = [:], success: @escaping ((String) -> Void), failed: (() -> Void)? = nil) {
        get(url, parameters, headers: headers, success: {dt in if let str = String(data: dt, encoding: .utf8) {success(str)} else {failed?()}}, failed: failed)
    }
    
    public func get(_ url: String, _ parameters: [String: Any] = [:], headers: [String: String] = [:], success: @escaping ((Data) -> Void), failed: (() -> Void)? = nil) {
        var paramStr = ""
        var first = true
        for (key, value) in parameters {
            if first {
                paramStr += "?\(key)=\(value)"
                first = false
            } else {
                paramStr += "&\(key)=\(value)"
            }
        }
        if let url = URL(string: "\(url)\(paramStr)") {
            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 30)
            for (key, value) in headers {
                request.addValue(value, forHTTPHeaderField: key)
            }
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let dt = data {
                    DispatchQueue.main.async {success(dt)}
                } else {
                    DispatchQueue.main.async {failed?()}
                }
            }.resume()
        }
    }
    
    public func postStr(_ url: String, _ parameters: [String: Any] = [:], headers: [String: String] = [:], method: RequestMethod = .post, coding: DataCoding = .json, success: @escaping ((String) -> Void), failed: (() -> Void)? = nil) {
        post(url, parameters, headers: headers, method: method, coding: coding, success: {dt in if let str = String(data: dt, encoding: .utf8) {success(str)} else {failed?()}}, failed: failed)
    }
    
    public func post(_ url: String, _ parameters: [String: Any] = [:], headers: [String: String] = [:], method: RequestMethod = .post, coding: DataCoding = .json, success: @escaping ((Data) -> Void), failed: (() -> Void)? = nil) {
        if let url = URL(string: url) {
            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 30)
            for (key, value) in headers {
                request.addValue(value, forHTTPHeaderField: key)
            }
            request.httpMethod = method.rawValue
            if parameters.keys.count > 0 {
                switch coding {
                    case .formdata:
                        var data = ""
                        for (key, value) in parameters {data+="\(key):\(value)\n"}
                        request.httpBody = data.data(using: .utf8)
                    case .urlEncoded:
                        var data = ""
                        for (key, value) in parameters {data+="\(key)=\(value)&"}
                        data.characters.removeLast()
                        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
                        request.httpBody = data.data(using: .utf8)
                    default:
                        let jsonData = try? JSONSerialization.data(withJSONObject: parameters)
                        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                        request.httpBody = jsonData
                }
            }
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let dt = data {
                    DispatchQueue.main.async {success(dt)}
                } else {
                    print(error)
                    DispatchQueue.main.async {failed?()}
                }
            }.resume()
        }
    }
}
