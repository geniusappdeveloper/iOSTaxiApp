//
//  EditProfile_VC.swift
//  Belize_Taxiapp
//
//  Created by SIERRA on 4/6/18.
//  Copyright © 2018 SIERRA. All rights reserved.
//

import UIKit
import IQKeyboardManager
import MRCountryPicker
import SkyFloatingLabelTextField

class EditProfile_VC: UIViewController,MRCountryPickerDelegate,UINavigationControllerDelegate {
//outlets
    @IBOutlet weak var countrytxt_field: UITextField!
    @IBOutlet weak var repassword_txtfield: SkyFloatingLabelTextField!
    @IBOutlet weak var password_textfield: SkyFloatingLabelTextField!
    @IBOutlet weak var mobiletext_field: SkyFloatingLabelTextField!
    @IBOutlet weak var email_txtfield: SkyFloatingLabelTextField!
    @IBOutlet weak var last_name: SkyFloatingLabelTextField!
    @IBOutlet weak var first_name: SkyFloatingLabelTextField!
    @IBOutlet weak var main_view: UIView!
    @IBOutlet weak var save_btn_outlet: UIButton!
    @IBOutlet weak var picker_view: MRCountryPicker!
    
    @IBOutlet weak var country_lbl: UILabel!
    @IBOutlet weak var flag_outlet: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initSidebar()
        self.main_view.isHidden = true
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "Edit Profile"
        self.picker_view.countryPickerDelegate = self
        self.picker_view.showPhoneNumbers = true
    }
    func validations(){
//        if countrytxt_field.text == "" && repassword_txtfield.text == "" && password_textfield.text == "" && mobiletext_field.text == "" && email_txtfield.text == "" && last_name.text == "" && first_name.text == ""{
//            self.alert(title: "Alert", message: "Please fill all fields")
//        }
//        else if   countrytxt_field.text == ""  {
//         self.alert(title: "Alert", message: "please select your country code")
//            }
//
//        else if repassword_txtfield.text == "" {
//            self.alert(title: "Alert", message: "please enter password again")
//        }
//        else if  password_textfield.text == "" {
//            self.alert(title: "ALert", message: "please enter password")
//
//        }
//        else if mobiletext_field.text == "" {
//            self.alert(title: "Alert", message: "please enter mobile number")
//        }
//        else if  email_txtfield.text == "" {
//            self.alert(title: "Alert", message: "please enter email")
//        }
//        else if last_name.text == "" {
//            self.alert(title: "Alert", message: "please enter last name")
//        }
//        else if  first_name.text == "" {
//            self.alert(title: "Alert", message: "please enter first name")
//        }
//        else if isValidEmail(testStr: email_txtfield.text!){
//            print("validate")
//
//        }else{
//            self.alert(title: "Alert", message: "Wrong email")
//        }
//
        }
    
//    func isValidEmail(testStr:String) -> Bool {
//        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
//        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
//        return emailTest.evaluate(with: testStr)
//    }
//    func password() {
//        if password_textfield.text!.characters.count < 6 {
//            self.alert(title: "Alert", message: "password should be more then six characters")
//        }
//        else if repassword_txtfield.text!.characters.count < 6 {
//            self.alert(title: "Alert", message: "password not matched")
//        }
//    }
    func countryPhoneCodePicker(_ picker: MRCountryPicker, didSelectCountryWithName name: String, countryCode: String, phoneCode: String, flag: UIImage) {
        self.flag_outlet.image = flag
        self.country_lbl.text = phoneCode
    }
    @IBAction func chooseCOuntry_code(_ sender: UIButton) {
        self.main_view.isHidden = false
        self.save_btn_outlet.isHidden = true
    }
    @IBAction func cancel_Action(_ sender: UIButton) {
        self.main_view.isHidden  = true
        self.save_btn_outlet.isHidden = false
    }
    @IBAction func done_Action(_ sender: UIButton) {
        self.main_view.isHidden = true
        self.save_btn_outlet.isHidden = false
        
    }
    @IBAction func save_Action(_ sender: UIButton) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "Home_VC") as! Home_VC
        self.navigationController?.pushViewController(secondViewController, animated: true)
//        self.validations()
        
    }
}
