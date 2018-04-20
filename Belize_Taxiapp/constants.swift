//
//  constants.swift
//  Belize_Taxiapp
//
//  Created by SIERRA on 3/30/18.
//  Copyright © 2018 SIERRA. All rights reserved.
//

import Foundation
import UIKit

let BASE_URL = "http://18.218.130.74/taxi/userServices/"

let signUp = "register"
let login = "login"
let verify_code = "verifyCode"
let forgot_password = "ForgetPassword"
let ResendCode = "ResendCode"
let socialLogin = "SocialWithLogin"
extension UIColor
{
    public class var labelColor: UIColor
    {
        return UIColor(red: 0.0/255.0, green: 192.0/255.0, blue: 217.0/255.0, alpha: 1.0)
    }
    
    public class var navColor:UIColor
    {
        return UIColor(red: 00.0/255.0, green: 167.0/255.0, blue: 201.0/255.0, alpha: 1.0)
    }
    
    
}
extension UIViewController {
    
    func alert(message: String, title: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}

