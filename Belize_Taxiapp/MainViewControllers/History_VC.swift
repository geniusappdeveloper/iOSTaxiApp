//
//  History_VC.swift
//  Belize_Taxiapp
//
//  Created by SIERRA on 4/2/18.
//  Copyright © 2018 SIERRA. All rights reserved.
//

import UIKit

class History_VC: UIViewController ,UITableViewDelegate,UITableViewDataSource{
var array = ["1","2","3","4","5"]
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initSidebar()
        
        tableview.separatorStyle = .none
        tableview.rowHeight = 140
//        tableview.estimatedRowHeight = UITableViewAutomaticDimension
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "History"
        self.navigationController?.navigationBar.barTintColor = UIColor.navColor
        UINavigationBar.appearance().tintColor = UIColor.white
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell

    }
 //   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
  //      return 200
//    }

}
