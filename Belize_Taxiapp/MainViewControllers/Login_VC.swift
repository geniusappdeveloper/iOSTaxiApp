//
//  Login_VC.swift
//  Belize_Taxiapp
//
//  Created by SIERRA on 3/30/18.
//  Copyright © 2018 SIERRA. All rights reserved.
//

import UIKit
import IQKeyboardManager
import MRCountryPicker
import SkyFloatingLabelTextField
import FacebookLogin
import FacebookCore
import FacebookShare
import FBSDKLoginKit
import Google
import GoogleSignIn




class Login_VC: UIViewController,UINavigationControllerDelegate,MRCountryPickerDelegate, GIDSignInUIDelegate,GIDSignInDelegate{
    //variables
    let userType = "U"
    let login_type = "F"
    var firstname = ""
    var lastname = ""
    var email = ""
    var uniqueId = ""
    var profilePic = ""
    // outlets
    @IBOutlet weak var country_code_lbl: UILabel!
    @IBOutlet weak var country_code_textfield: SkyFloatingLabelTextField!
    @IBOutlet weak var passwordTetfield: SkyFloatingLabelTextField!
    @IBOutlet weak var facebook_btn: UIButton!
    @IBOutlet weak var phoneNUmber_textfield: SkyFloatingLabelTextField!
    @IBOutlet weak var google_btn: UIButton!
    @IBOutlet weak var phone_lbl: UILabel!
    @IBOutlet weak var flaf_imageview: UIImageView!
    @IBOutlet weak var countryView: UIView!
    @IBOutlet weak var CountryPicker: MRCountryPicker!
    @IBOutlet weak var details_lbl: UILabel!
    // variables
    var dict : [String : AnyObject]!
     var error : NSError?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.phone_lbl.text = ""
        self.CountryPicker.backgroundColor = UIColor.darkGray
         self.navigationController?.navigationBar.barTintColor = UIColor.navColor
         self.details_lbl.textColor = UIColor.labelColor
        self.navigationController?.isNavigationBarHidden = false
       UINavigationBar.appearance().tintColor = UIColor.white
         self.CountryPicker.countryPickerDelegate = self
         self.CountryPicker.showPhoneNumbers = true
         self.countryView.isHidden = true
        //google
        GGLContext.sharedInstance().configureWithError(&error)
        //if any error stop execution and print error
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        //getting the signin button and adding it to view
        if error != nil{
            print(error ?? "google error")
            return
        }
    }
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        //if any error stop and print the error
        if error != nil{
            print(error ?? "google error")
            return
        }
    }
    @IBAction func forgot_password_btn(_ sender: Any) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "Forgot_password_VC") as! Forgot_password_VC
         self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    func countryPhoneCodePicker(_ picker: MRCountryPicker, didSelectCountryWithName name: String, countryCode: String, phoneCode: String, flag: UIImage) {
        self.phone_lbl.text = phoneCode
       self.flaf_imageview.image = flag
    }
    @IBAction func cancelAction(_ sender: UIButton) {
        self.countryView.isHidden = true
        self.google_btn.isHidden = false
        self.facebook_btn.isHidden = false
    }
    @IBAction func doneAction(_ sender: UIButton) {
        self.countryView.isHidden = true
        self.google_btn.isHidden = false
        self.facebook_btn.isHidden = false
    }
    @IBAction func getPicker_view(_ sender: UIButton) {
        self.countryView.isHidden = false
        self.google_btn.isHidden = true
        self.facebook_btn.isHidden = true
    }
    @IBAction func facebook_btn_action(_ sender: UIButton) {
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if (error == nil){
                let fbloginresult : FBSDKLoginManagerLoginResult = result!
                if fbloginresult.grantedPermissions != nil {
                    if(fbloginresult.grantedPermissions.contains("email"))
                    {
                        self.getFBUserData()
                        fbLoginManager.logOut()
                    }
                }
            }
        }
    }
    func getFBUserData(){
        if((FBSDKAccessToken.current()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                    self.dict = result as! [String : AnyObject]
                    print(result!)
                    print(self.dict)
                    self.fbLoginAPi()

                }
            })
        }
    }
    
// google signin
    @IBAction func google_Action(_ sender: UIButton) {
        GIDSignIn.sharedInstance().delegate=self
        GIDSignIn.sharedInstance().uiDelegate=self
        GIDSignIn.sharedInstance().signIn()
    }
    @IBAction func LoginAction(_ sender: UIButton) {
        self.logIn()
//        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "Home_VC") as! Home_VC
//        self.navigationController?.pushViewController(secondViewController, animated: true)
//
        // self.validations()
    }
    func validations(){
        if phoneNUmber_textfield.text == "" && passwordTetfield.text == "" && phone_lbl.text == "" {
            self.alert(title: "ALert", message: "Please enter all fields")
        }
        else if phoneNUmber_textfield.text == "" {
            self.alert(title: "Alert", message: "please enter phone number")
        }
        else if passwordTetfield.text == "" {
            self.alert(title: "Alert", message: "Please enter password")
        }
        else if phone_lbl.text == ""{
            self.alert(title: "Alert", message: "Please enter country code")        }
    }
    func logIn(){
        let params = "country_code=\(self.country_code_lbl.text!)&phone_number=\(self.phoneNUmber_textfield.text!)&password=\(self.passwordTetfield.text!)&user_type=\(self.userType)"
        
        
        webservicesPostForHtml(baseString: BASE_URL+login, parameters: params, success: {(response) in
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
    func fbLoginAPi(){
        let params = "first_name=\(self.firstname)&last_name=\(self.lastname)&email\(self.email)&unique_id=\(self.uniqueId)&login_type\(self.login_type)&profile_pic\(self.profilePic)"
        webservicesPostForHtml(baseString: BASE_URL+socialLogin, parameters: params, success: {(response) in
            print(params)
            let data = response
            print(data)
            let Fbdict:NSDictionary = response as! NSDictionary
            print(Fbdict)
            if Fbdict.value(forKeyPath: "status") as! String == "0"{
                self.hideProgress()
                let message  = "\((response as AnyObject).value(forKey: "message") ?? "0")"
                print(message)
                
            }
            else{
               
                let userId = "\(Fbdict.value(forKeyPath: "result.user_id") ?? "NA")"
                UserDefaults.standard.set(userId, forKey: "USERID")
                let username = "\(Fbdict.value(forKeyPath: "result.last_name") ?? "NA")"
                print(username)
                let lastname = "\(Fbdict.value(forKeyPath: "result.email") ?? "NA")"
                print(lastname)
                let unique_id = "\(Fbdict.value(forKeyPath: "result.unique_id") ?? "NA")"
                print(unique_id)
                let login_type = "\(Fbdict.value(forKeyPath: "result.login_type") ?? "NA")"
                print(login_type)
                let profile_pic = "\(Fbdict.value(forKeyPath: "result.profile_pic") ?? "NA")"
                print(profile_pic)
                let id  = "\(Fbdict.value(forKeyPath: "result.id") ?? "NA")"
                print(id)
               
               
                
            }
        }, failure:
            {
                (error) in
                print(error)
                self.hideProgress()
        })
    }
        
    }

