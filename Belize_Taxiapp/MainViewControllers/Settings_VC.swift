//
//  Settings_VC.swift
//  Belize_Taxiapp
//
//  Created by SIERRA on 4/2/18.
//  Copyright © 2018 SIERRA. All rights reserved.
//

import UIKit
import IQKeyboardManager
import MMDrawerController

class Settings_VC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initSidebar()
          self.navigationController?.navigationBar.barTintColor = UIColor.navColor
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "Settings"
        UINavigationBar.appearance().tintColor = UIColor.white
        // Do any additional setup after loading the view.
    }
    @IBAction func change_pssword(_ sender: UIButton) {
      let vc = Forgot_password_VC.instantiate(fromAppStoryboard: .Main)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
