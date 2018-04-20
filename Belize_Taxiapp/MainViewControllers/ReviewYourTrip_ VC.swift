//
//  ReviewYourTrip_ VC.swift
//  Belize_Taxiapp
//
//  Created by SIERRA on 4/3/18.
//  Copyright © 2018 SIERRA. All rights reserved.
//

import UIKit

class ReviewYourTrip__VC: UIViewController {

    @IBOutlet weak var static_view: UIView!
    @IBOutlet weak var comment_view: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        static_view.dropShadow(color: .lightGray, opacity: 0.5, offSet: CGSize(width: -1, height: 1), radius: 1, scale: true)
        comment_view.dropShadow(color: .lightGray, opacity: 0.5, offSet: CGSize(width: -1, height: 1), radius: 1, scale: true)
        self.initSidebar()
        UINavigationBar.appearance().tintColor = UIColor.white
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "Review Your Trip"
        self.navigationController?.navigationBar.barTintColor = UIColor.navColor
        
        // Do any additional setup after loading the view.
    }

   

}
