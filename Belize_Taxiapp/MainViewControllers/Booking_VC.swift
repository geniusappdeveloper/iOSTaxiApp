//
//  Booking_VC.swift
//  Belize_Taxiapp
//
//  Created by SIERRA on 4/7/18.
//  Copyright © 2018 SIERRA. All rights reserved.
//

import UIKit

class Booking_VC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var Booking_tableView: UITableView!
    var array = [String]()
    var dummy = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "Booking"
         Booking_tableView.rowHeight = 140
         Booking_tableView.rowHeight = UITableViewAutomaticDimension
            self.initSidebar()
        // Do any additional setup after loading the view.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      
        return 175
    }
}
