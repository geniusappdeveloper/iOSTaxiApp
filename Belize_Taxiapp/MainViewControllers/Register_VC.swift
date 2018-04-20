//
//  Register_VC.swift
//  Belize_Taxiapp
//
//  Created by SIERRA on 3/30/18.
//  Copyright © 2018 SIERRA. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import IQKeyboardManager
import MRCountryPicker
import NVActivityIndicatorView

class Register_VC: UIViewController,UINavigationControllerDelegate,MRCountryPickerDelegate {
    
    // variables
    var userType = "U"
    let USER_ID = "user_id"
    
// outlets
    
    @IBOutlet weak var countryy_lbl_code: UILabel!
    @IBOutlet weak var countrycode_textfield: SkyFloatingLabelTextField!
    @IBOutlet weak var phoneNum_Picker_View: UIView!
    @IBOutlet weak var nextbutton: UIButton!
    @IBOutlet weak var country_picker: MRCountryPicker!
    @IBOutlet weak var number_lbl: UILabel!
    @IBOutlet weak var flagimage: UIImageView!
    @IBOutlet weak var first_name_textfield: SkyFloatingLabelTextField!
    @IBOutlet weak var contextfield: SkyFloatingLabelTextField!
    @IBOutlet weak var passwordtextField: SkyFloatingLabelTextField!
    @IBOutlet weak var phonetextfield: SkyFloatingLabelTextField!
    @IBOutlet weak var email_textfield: SkyFloatingLabelTextField!
    @IBOutlet weak var last_name_textfield: SkyFloatingLabelTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
          self.navigationController?.navigationBar.barTintColor = UIColor.navColor
         self.navigationItem.title = "Register"
        self.navigationController?.isNavigationBarHidden = false
        self.phoneNum_Picker_View.isHidden = true
        self.country_picker.countryPickerDelegate = self
        self.country_picker.showPhoneNumbers = true
        UINavigationBar.appearance().tintColor = UIColor.white
    }
    func countryPhoneCodePicker(_ picker: MRCountryPicker, didSelectCountryWithName name: String, countryCode: String, phoneCode: String, flag: UIImage) {
        self.number_lbl.text = phoneCode
        self.flagimage.image = flag
    }
    func validations() {
        if (self.first_name_textfield.text == "" && self.last_name_textfield.text == "" && self.email_textfield.text == "" && self.countryy_lbl_code.text == "" && self.phonetextfield.text == "" && self.passwordtextField.text == "" && self.contextfield.text == "") {
            self.alert(title: "Alert", message: "please fill all the fields")
        }
        else if self.first_name_textfield.text == "" {
            self.alert(title: "Alert", message: "Please enter name")
        }
        else if self.last_name_textfield.text == "" {
            self.alert(title: "Alert", message: "Please enter last name")
        }
        else if self.isValidEmail(testStr: email_textfield.text!){
            self.alert(title: "Alert", message: "please enter valid email")
        }
        else if countryy_lbl_code.text == "" {
            self.alert(title: "Alert", message: "Please choose country code")
        }
        else if phonetextfield.text == "" {
            self.alert(title: "Alert", message: "Please enter phone number")
        }
        else if passwordtextField.text == "" {
            self.alert(title: "Alert", message: "Please enter password")
        }
        else if contextfield.text == "" {
            self.alert(title: "Alert", message: "please enter confirm password")
        }
        else  {
            self.passwordValidation()
        }
    }
    func passwordValidation() {
        if passwordtextField.isEqual(contextfield.text!){
            print("matched")
        }else{
            self.alert(title: "Alert", message: "Please enter the same password")
        }
    }
    func passwordlenght(){
        if passwordtextField.text!.characters.count < 6 {
            self.alert(title: "Alert", message: "Password should be six characters long ")
        }
    }
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    @IBAction func done_Action(_ sender: UIButton) {
        self.phoneNum_Picker_View.isHidden = true
        self.contextfield.isHidden = false
        self.nextbutton.isHidden = false
    }
    @IBAction func cancel_action(_ sender: UIButton) {
        self.phoneNum_Picker_View.isHidden = true
        self.contextfield.isHidden = false
        self.nextbutton.isHidden = false
    }
    @IBAction func flagBtn_Action(_ sender: UIButton) {
        self.phoneNum_Picker_View.isHidden = false
        self.contextfield.isHidden = true
        self.nextbutton.isHidden = true
    }
    @IBAction func next_btnAction(_ sender: UIButton) {
        
        self.RegisterApi()
 
    }
    func clear(){
        self.first_name_textfield.text = ""
        self.last_name_textfield.text = ""
        self.email_textfield.text = ""
        self.countrycode_textfield.text = ""
        self.phonetextfield.text = ""
        self.passwordtextField.text = ""
        self.contextfield.text = ""
    }
    func RegisterApi(){
        self.showProgress()
    let  parms = "first_name=\(self.first_name_textfield.text ?? "")&last_name=\(self.last_name_textfield.text ?? "")&email=\(self.email_textfield.text!)&country_code=\(self.countryy_lbl_code.text!)&password=\(self.passwordtextField.text!)&phone_number=\(self.phonetextfield.text!)&user_type=\(self.userType)"
        
        print(parms)
        
        webservicesPostForHtml(baseString: BASE_URL + signUp, parameters: parms, success: {(response) in

            print(response)
            self.hideProgress()

            let data = response
            print(data)
            let dict :NSDictionary = response as! NSDictionary
            print(dict)

            if dict.value(forKeyPath: "status") as! String == "0" {
                self.hideProgress()
                let message  = "\((response as AnyObject).value(forKey: "message") ?? "0")"
                print(message)
                

            }
            else{

                let userId = "\(dict.value(forKeyPath: "result.user_id") ?? "NA")"
                 UserDefaults.standard.set(userId, forKey: "USERID")
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "verify_mobile_VC") as! verify_mobile_VC
                vc.myString = self.countryy_lbl_code.text!
                vc.myString1 = self.phonetextfield.text!
                vc.strOtp = "\(dict.value(forKeyPath: "result.unique_code") ?? "")"
                self.navigationController?.pushViewController(vc, animated: true)
                
                
                
                

            }

        }, failure:
            {
                (error) in
                print(error)
                self.hideProgress()
        })
    }



}
