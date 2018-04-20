//
//  verify_mobile_VC.swift
//  Belize_Taxiapp
//
//  Created by SIERRA on 3/30/18.
//  Copyright © 2018 SIERRA. All rights reserved.
//

import UIKit
import IQKeyboardManager
import SkyFloatingLabelTextField


class verify_mobile_VC: UIViewController {
    var myString = String()
    var myString1 = String()
    var strOtp = String()
   
    
    @IBOutlet weak var phone_number: UILabel!
    @IBOutlet weak var lbl_code: UILabel!
    
  
    @IBOutlet weak var otptxt_field: SkyFloatingLabelTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lbl_code.text! = myString
        self.phone_number.text! = myString1
         self.navigationController?.navigationBar.barTintColor = UIColor.navColor
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "Verify Mobile"

        // Do any additional setup after loading the view.
    }

 
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
       otpAlert(message: "OTP is \(strOtp)")
    }
    
    @IBAction func SubmitAction(_ sender: UIButton) {
        self.verifyCode()
        let vc = Home_VC.instantiate(fromAppStoryboard: .Main)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func resend_Action(_ sender: UIButton) {
        self.resendCode()
        
    }
    
    
    func otpAlert(message:String){
  
      let alert  = UIAlertController(title: nil, message: message, preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
      present(alert, animated: true, completion: nil)
        
        
    }
    
    func verifyCode(){
       
        let params = "user_id=\(UserDefaults.standard.value(forKeyPath: "USERID") ?? "NA")&unique_id=\(self.otptxt_field.text!)"
    
        webservicesPostForHtml(baseString: BASE_URL+verify_code, parameters: params, success: {(response) in
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
    func resendCode(){
        let params = "user_id=\(UserDefaults.standard.value(forKeyPath: "USERID") ?? "NA")"
        webservicesPostForHtml(baseString: BASE_URL+ResendCode, parameters: params, success: {(response) in
            
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
