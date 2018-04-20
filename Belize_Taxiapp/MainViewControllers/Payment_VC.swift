//
//  Payment.swift
//  Belize_Taxiapp
//
//  Created by SIERRA on 4/7/18.
//  Copyright © 2018 SIERRA. All rights reserved.
//

import UIKit
import MFCard

class Payment_VC: UIViewController,MFCardDelegate {
  
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "Payment"
        self.navigationController?.navigationBar.barTintColor = UIColor.navColor
        self.initSidebar()

       
    }

    @IBAction func Add_PAyment(_ sender: UIButton) {
        var myCard : MFCardView
        myCard  = MFCardView(withViewController: self)
        myCard.delegate = self
        myCard.autoDismiss = true
        myCard.toast = true
        myCard.blurStyle  = UIBlurEffect(style: UIBlurEffectStyle.light)
        myCard.showCard()
    }
    func cardDoneButtonClicked(_ card: Card?, error: String?) {
        if error == nil{
            print(card!)
        }else{
            print(error!)
        }
    }
    
    func cardTypeDidIdentify(_ cardType: String) {
        print(cardType)
    }
}
