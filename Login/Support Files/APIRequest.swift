//
//  APIRequest.swift
//  Login
//
//  Created by Rageeni Jadam on 10/08/19.
//  Copyright © 2019 Rageeni Jadam. All rights reserved.
//

import UIKit

class APIRequest: NSObject {
    
    static var postData:Data? = nil

    static func userLogin(email: String, password: String, vc: LoginViewController) {
        let parameters = [
            "email": email,
            "password": password
            ] as [String : Any]
        do {
            postData = try JSONSerialization.data(withJSONObject: parameters, options: [])
        } catch let error {
            print("Error in writting Json" + error.localizedDescription)
        }
        
        var request = URLRequest(url: URL(string: "https://reqres.in/api/login")!, cachePolicy: URLRequest.CachePolicy.reloadIgnoringCacheData, timeoutInterval: 30)
        request.httpMethod = "POST"
        request.httpBody = postData!
        
        let session = URLSession.shared
        vc.view.isUserInteractionEnabled = false
        
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            DispatchQueue.main.async {
                vc.view.isUserInteractionEnabled = true
            }
            if (error != nil) {
                print(error!.localizedDescription)
            } else {
                let dataResponse = data!
                do {
                    let json = try JSONSerialization.jsonObject(with: dataResponse, options: .mutableContainers) as! Dictionary<String, Any>
                    print(json)
                    UserDefaults.standard.set(true, forKey: "login")
//                    let dict = NSDictionary.init(object: json["userinfo"] as Any, forKey: "userinfo" as NSCopying)
                    print(json)
                    vc.loginUser()
                } catch {
                    print("Something went wrong")
                }
            }
        })
        dataTask.resume()
    }
}
