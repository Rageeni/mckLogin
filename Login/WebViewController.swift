//
//  WebViewController.swift
//  Login
//
//  Created by Rageeni Jadam on 10/08/19.
//  Copyright © 2019 Rageeni Jadam. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let token = UserDefaults.standard.value(forKey: "token") as! String
        let urlLink = URL(string: "https://mckinleyrice.com?token=\(token)")
        let urlRequest = URLRequest(url: urlLink!)
        webView.load(urlRequest)
    }
    
}
