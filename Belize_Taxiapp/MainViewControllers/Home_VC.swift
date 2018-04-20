//
//  Request_rideVC.swift
//  Belize_Taxiapp
//
//  Created by SIERRA on 4/3/18.
//  Copyright © 2018 SIERRA. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import GoogleMapsDirections
import CoreLocation

class Home_VC: UIViewController,GMSMapViewDelegate,CLLocationManagerDelegate,DissmissView{

    
   
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var Request_view: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initSidebar()
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "Home"
        self.initSidebar()
        UINavigationBar.appearance().tintColor = UIColor.white
        self.navigationController?.navigationBar.barTintColor = UIColor.navColor
        Request_view.dropShadow(color: .lightGray, opacity: 0.5, offSet: CGSize(width: -1, height: 1), scale: true)
        self.Request_view.layer.cornerRadius = 14
    }

    @IBAction func confirmBooking(_ sender: UIButton) {
        let vc = Book_hide_VC.instantiate(fromAppStoryboard: .PopUp)
        vc.delegate = self
        self.present(vc, animated: true, completion: nil)
    }
    
    func DismmIssDone() {
        let vc  = PickupAriving_VC.instantiate(fromAppStoryboard: .Main)
        self.navigationController?.pushViewController(vc,  animated: true)
    }
    
}
