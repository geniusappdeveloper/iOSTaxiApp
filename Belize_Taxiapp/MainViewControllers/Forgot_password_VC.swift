//
//  Forgot_password_VC.swift
//  Belize_Taxiapp
//
//  Created by SIERRA on 3/30/18.
//  Copyright © 2018 SIERRA. All rights reserved.
//

import UIKit
import IQKeyboardManager
import SkyFloatingLabelTextField

class Forgot_password_VC: UIViewController {
// outlets
    @IBOutlet weak var emailTxtField: SkyFloatingLabelTextField!
    @IBOutlet weak var register_lbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
         self.navigationController?.navigationBar.barTintColor = UIColor.navColor
        self.register_lbl.textColor = UIColor.labelColor
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "Forgot Password"
        UINavigationBar.appearance().tintColor = UIColor.white
        // Do any additional setup after loading the view.
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    @IBAction func reset_password_btn(_ sender: Any) {
        self.forgotPassword()
//        let vc = verify_mobile_VC.instantiate(fromAppStoryboard: .Main)
//        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    func forgotPassword(){
        let params = "email=\(self.emailTxtField.text!)"
        webservicesPostForHtml(baseString: BASE_URL+forgot_password, parameters: params, success: {(response) in
            print(params)
            let data = response
            print(data)
            let dict:NSDictionary = response as! NSDictionary
            print(dict)
            if dict.value(forKeyPath: "status") as! String == "0"{
                self.hideProgress()
                let message  = "\((response as AnyObject).value(forKey: "message") ?? "0")"
                print(message)
                
            }
            else{
                let userId = "\(dict.value(forKeyPath: "result.user_id") ?? "NA")"
                UserDefaults.standard.set(userId, forKey: "USERID")
                
            }
        }, failure:
            {
                (error) in
                print(error)
                self.hideProgress()
        })
    }
    
    
            
    }
  

