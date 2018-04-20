//
//  extension.swift
//  sidemenudemo
//
//  Created by MAC on 03/02/18.
//  Copyright © 2018 MAC. All rights reserved.
//

import Foundation
import UIKit
import MMDrawerController
import NVActivityIndicatorView


extension UIViewController:NVActivityIndicatorViewable{
    
    
    //MARK:======================= SetUp Side Bar ===============================
    func initSidebar(){
        let btnBack = UIBarButtonItem(image: #imageLiteral(resourceName: "menutgree") ,  style: .plain, target: self, action:#selector(SideBarAct))
        self.navigationItem.leftBarButtonItem  = btnBack
        navigationController?.navigationBar.tintColor = .black
    }
    
    @objc func SideBarAct(){
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
        
    }
    func showProgress() {
        // loader starts
        let size = CGSize(width: 50, height: 50)
        self.startAnimating(size, message:"Loading", messageFont: UIFont.systemFont(ofSize: 18.0), type: NVActivityIndicatorType.ballSpinFadeLoader, color: UIColor.white, padding: 1, displayTimeThreshold: nil, minimumDisplayTime: nil)
    }
    func hideProgress() {
        // stop loader
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0) {
            self.stopAnimating() }
    }
    
    
}
extension UIView {
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
