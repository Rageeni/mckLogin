//
//  ViewController.swift
//  Login
//
//  Created by Rageeni Jadam on 10/08/19.
//  Copyright © 2019 Rageeni Jadam. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        btnLogin.layer.cornerRadius = 6.0
    }
    
    //MARK:- IBAction
    @IBAction func loginBtnAction(_ sender: Any) {
        if validateEmail(email: (txtEmail.text?.trimmingCharacters(in: CharacterSet.whitespaces))!) {
            APIRequest.userLogin(email: (txtEmail.text?.trimmingCharacters(in: CharacterSet.whitespaces))!, password: (txtPassword.text?.trimmingCharacters(in: CharacterSet.whitespaces))!, vc: self)
        } else {
            let alert = UIAlertController(title: nil, message: "Please enter valid email id.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    //MARK:- API Response
    func loginUser() {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "login", sender: nil)
        }
    }
    
    //MARK:- Other Methods
    func validateEmail(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: email)
    }
}

