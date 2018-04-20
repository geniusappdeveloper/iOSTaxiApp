//
//  AppDelegate.swift
//  Belize_Taxiapp
//
//  Created by SIERRA on 3/30/18.
//  Copyright © 2018 SIERRA. All rights reserved.
//

import UIKit
import IQKeyboardManager
import MMDrawerController
import Google
import GoogleSignIn
import FacebookLogin
import FacebookCore
import FacebookShare
import FBSDKLoginKit
import GooglePlaces
import GoogleMaps
import GoogleMapsDirections




@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate{
  

    var window: UIWindow?
    var centerContainer: MMDrawerController?
    func iniSideMenu() {
         //creating object of main storyboard
        UINavigationBar.appearance().barTintColor = UIColor.navColor
        let mainstoryBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let centerViewController :UIViewController!
        centerViewController = mainstoryBoard.instantiateViewController(withIdentifier: "Welcm_scrn") as! Welcm_scrn
        let leftViewController = mainstoryBoard.instantiateViewController(withIdentifier: "SideMenu_VC") as! SideMenu_VC
        let leftsidenav = UINavigationController(rootViewController: leftViewController)
        let centnav = UINavigationController(rootViewController: centerViewController)
        centerContainer = MMDrawerController(center: centnav, leftDrawerViewController: leftsidenav)
        //centerContainer?.openDrawerGestureModeMask = MMOpenDrawerGestureMode.panningCenterView
        centerContainer?.closeDrawerGestureModeMask = MMCloseDrawerGestureMode.panningCenterView
//        centerContainer?.maximumLeftDrawerWidth = 300
        
        window?.rootViewController = centerContainer
        window?.makeKeyAndVisible()

    }
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance().handle(url as URL!,sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String, annotation: options[UIApplicationOpenURLOptionsKey.annotation])
    }
   
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return FBSDKApplicationDelegate.sharedInstance().application(application, open: url, sourceApplication: sourceApplication, annotation: annotation)
        
    }
    func application(application: UIApplication,
                     openURL url: NSURL, sourceApplication: String?, annotation: AnyObject?) -> Bool {
        var _: [String: AnyObject] = [UIApplicationOpenURLOptionsKey.sourceApplication.rawValue: sourceApplication as AnyObject,UIApplicationOpenURLOptionsKey.annotation.rawValue: annotation!]
        return GIDSignIn.sharedInstance().handle(url as URL!,sourceApplication: sourceApplication,annotation: annotation)
    }
   
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        GIDSignIn.sharedInstance().clientID = "246269445316-c5fn8noag3is9432f3v8a9089em9q3j9.apps.googleusercontent.com"
        GMSServices.provideAPIKey("AIzaSyBYrrX3fC63fHllsZSBcLmRGikAM15jems")
        GMSPlacesClient.provideAPIKey("AIzaSyDdPCBjb9IEtC9ZkPtdcGONmUnwnE9kWJg")
        GoogleMapsDirections.provide(apiKey: "AIzaSyDRrBM-W7nGkjY0helaOngEWjPyJ4fRm-U")
        IQKeyboardManager.shared().isEnabled = true
        self.iniSideMenu()
        return FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    func applicationWillResignActive(_ application: UIApplication) {
         FBSDKAppEvents.activateApp()
    }
   
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

   


}
