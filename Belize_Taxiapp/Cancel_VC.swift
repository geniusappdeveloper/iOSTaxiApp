//
//  Cancel_VC.swift
//  Belize_Taxiapp
//
//  Created by SIERRA on 4/4/18.
//  Copyright © 2018 SIERRA. All rights reserved.
//

import UIKit

class Cancel_VC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     dismiss(animated: true, completion: nil)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func cancel_Action(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
