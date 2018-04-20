//
//  Help_VC.swift
//  Belize_Taxiapp
//
//  Created by SIERRA on 4/2/18.
//  Copyright © 2018 SIERRA. All rights reserved.
//

import UIKit
import IQKeyboardManager

class Help_VC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initSidebar()
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "HELP"
        self.navigationController?.navigationBar.barTintColor = UIColor.navColor
       
    }

   

}
