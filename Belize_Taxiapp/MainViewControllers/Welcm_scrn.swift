//
//  Splash_screen.swift
//  Belize_Taxiapp
//
//  Created by SIERRA on 3/30/18.
//  Copyright © 2018 SIERRA. All rights reserved.
//

import UIKit

class Welcm_scrn: UIViewController {

    @IBOutlet weak var wlcm_label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wlcm_label.textColor = UIColor.labelColor
        // hide text ofback button
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.barTintColor = UIColor.navColor
        UINavigationBar.appearance().tintColor = UIColor.white
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func login_Action(_ sender: UIButton) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "Login_VC") as! Login_VC
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    
   
    @IBAction func register_btn_action(_ sender: UIButton) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "Register_VC") as! Register_VC
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    

}
