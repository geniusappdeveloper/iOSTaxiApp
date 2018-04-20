//
//  SideMenu_VC.swift
//  Belize_Taxiapp
//
//  Created by SIERRA on 4/4/18.
//  Copyright © 2018 SIERRA. All rights reserved.
//

import UIKit
import MMDrawerController

class SideMenu_VC: UIViewController,UITableViewDataSource,UITableViewDelegate {
    struct mytbl {
        var images: UIImage
        var name: String
    }
    var sideMenu = [mytbl]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        sideMenu = [mytbl(images: #imageLiteral(resourceName: "home"), name: "Home"), mytbl(images: #imageLiteral(resourceName: "payment"), name: "Payment"), mytbl(images: #imageLiteral(resourceName: "booking"), name: "Booking"),mytbl(images: #imageLiteral(resourceName: "freetrips"), name: "Free Trips") ,mytbl(images: #imageLiteral(resourceName: "history"), name: "History"),mytbl(images: #imageLiteral(resourceName: "setting"), name: "Settings")]

        // Do any additional setup after loading the view.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sideMenu.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SideViewCell
        cell.cell_lbl.text = sideMenu[indexPath.row].name
        cell.cell_image.image = sideMenu[indexPath.row].images
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        if indexPath.row == 0{
            let centerViewController = storyBoard.instantiateViewController(withIdentifier: "Home_VC") as! Home_VC
            let centnav = UINavigationController(rootViewController:centerViewController)
            let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.centerContainer?.centerViewController = centnav
            appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
            
        }
        if indexPath.row == 1{
            let centerViewController = storyBoard.instantiateViewController(withIdentifier: "Payment_VC") as! Payment_VC
            let centnav = UINavigationController(rootViewController:centerViewController)
            let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.centerContainer?.centerViewController = centnav
            appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
            
        }
        if indexPath.row == 2{
            let centerViewController = storyBoard.instantiateViewController(withIdentifier: "Booking_VC") as! Booking_VC
            let centnav = UINavigationController(rootViewController:centerViewController)
            let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.centerContainer?.centerViewController = centnav
            appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
            
        }
        if indexPath.row == 3{
            let centerViewController = storyBoard.instantiateViewController(withIdentifier: "ReviewYourTrip__VC") as! ReviewYourTrip__VC
            let centnav = UINavigationController(rootViewController:centerViewController)
            let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.centerContainer?.centerViewController = centnav
            appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
            
            
        }
        
        
        if indexPath.row == 4{
            let centerViewController = storyBoard.instantiateViewController(withIdentifier: "History_VC") as! History_VC
            let centnav = UINavigationController(rootViewController:centerViewController)
            let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.centerContainer?.centerViewController = centnav
            appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
            
            
        }
        
        if indexPath.row == 5 {
            let centerViewController = storyBoard.instantiateViewController(withIdentifier: "Settings_VC") as! Settings_VC
            let centnav = UINavigationController(rootViewController:centerViewController)
            let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.centerContainer?.centerViewController = centnav
            appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
            
    }
      
        
}
    @IBAction func Edit_Profile(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let centerViewController = storyBoard.instantiateViewController(withIdentifier: "EditProfile_VC") as! EditProfile_VC
        let centnav = UINavigationController(rootViewController:centerViewController)
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.centerContainer?.centerViewController = centnav
        appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)

    }
}
