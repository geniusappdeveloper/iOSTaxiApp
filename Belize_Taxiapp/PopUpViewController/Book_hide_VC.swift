//
//  Book_hide_VC.swift
//  Belize_Taxiapp
//
//  Created by SIERRA on 4/3/18.
//  Copyright © 2018 SIERRA. All rights reserved.
//

import UIKit
protocol DissmissView {
    func DismmIssDone()
}
class Book_hide_VC: UIViewController {

    var delegate :DissmissView?
    override func viewDidLoad() {
        super.viewDidLoad()

       
        // Do any additional setup after loading the view.
    }

    @IBAction func done_btn_Action(_ sender: UIButton) {
        
        dismiss(animated: false) {
            
            self.delegate?.DismmIssDone()
        }
        
    }
    
    @IBOutlet weak var cancel_btn_ACtion: UIButton!
    override func select(_ sender: Any?) {
       
    }
    
    @IBAction func Cancel_Action(_ sender: UIButton) {
         self.dismiss(animated: true, completion: nil)
    }
}
