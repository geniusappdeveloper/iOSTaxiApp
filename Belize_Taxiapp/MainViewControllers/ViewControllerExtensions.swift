//
//  ViewControllerExtensions.swift
//  ToDoList
//
//  Created by MAC on 12/20/17.
//  Copyright © 2017 MAC. All rights reserved.
//

import Foundation
import UIKit
import MMDrawerController
import IQKeyboardManager
import UserNotifications
import AVFoundation
extension UIViewController :UITextFieldDelegate,URLSessionDelegate,URLSessionTaskDelegate,URLSessionDataDelegate,UNUserNotificationCenterDelegate {

    //Web Service
    func webservicesPostRequest(baseString: String, parameters: [String:String],success:@escaping (_ response: NSDictionary)-> Void, failure:@escaping (_ error: Error) -> Void){

        let headers =
            [
                "content-type": "text/html",
                ]
        let sessionConfiguration = URLSessionConfiguration.default

        let session = URLSession(configuration: sessionConfiguration, delegate: nil, delegateQueue: OperationQueue.main)

        let jsonData = try? JSONSerialization.data(withJSONObject:parameters)

        let url = baseString

    //    print(url)
    //    print(parameters)

        var request = URLRequest(url: URL(string: url)!)
        request.allHTTPHeaderFields = headers
        request.httpMethod = "POST"
        request.httpBody = jsonData

        let dataTask = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            if error == nil{
                if let responseData = data{
                    do {
                        let json = try JSONSerialization.jsonObject(with: responseData, options: [])
                        success(json as! NSDictionary)
                    }catch let err{
                        print(err)
                        failure(err)

                    }
                }
            }else{
                failure(error!)
            }
        }
        dataTask.resume()
    }

    //MARK:=================================  UPLOAD VIDEO ==========================================
    func uploadVideo(urlString:String,params:[String:String]?,videoURL:URL?,success:@escaping (_ response: NSDictionary)-> Void, failure:@escaping (_ error: Error) -> Void){
        let boundary: String = "------VohpleBoundary4QuqLuM1cE5lMwCy"
        let contentType: String = "multipart/form-data; boundary=\(boundary)"
        let headers :[String:String] =
            [
                "content-type": "application/json",
                ]
        var request = URLRequest(url: URL(string: urlString)!)

        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }

        request.httpShouldHandleCookies = false
        request.timeoutInterval = 60
        request.httpMethod = "POST"
        request.setValue(contentType, forHTTPHeaderField: "Content-Type")

        let body = NSMutableData()
        if let parameters = params {
            for (key, value) in parameters {
                body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
                body.append("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n".data(using: String.Encoding.utf8)!)
                body.append("\(value)\r\n".data(using: String.Encoding.utf8)!)
            }
        }
        //which field you have to sent image on server
        let fileName: String = "file"
        if videoURL != nil {
            body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
            body.append("Content-Disposition: form-data; name=\"\(fileName)\"; filename=\"Video.MOV\"\r\n".data(using: String.Encoding.utf8)!)
            body.append("Content-Type:image/png\r\n\r\n".data(using: String.Encoding.utf8)!)
            body.append(NSData(contentsOf: videoURL!)! as Data)
            body.append("\r\n".data(using: String.Encoding.utf8)!)
        }


        body.append("--\(boundary)--\r\n".data(using: String.Encoding.utf8)!)
        request.httpBody = body as Data
        //  let session = URLSession.shared
        let session = URLSession(configuration:.default, delegate: self, delegateQueue: .main)
        let task = session.dataTask(with: request as URLRequest) { (data, response, error) in

            DispatchQueue.main.async {
                self.hideProgress()

                if(error != nil){
                    //  print(String(data: data!, encoding: .utf8) ?? "No response from server")

                    failure(error!)

                }


                if let responseData = data{
                    do {
                        let json = try JSONSerialization.jsonObject(with: responseData, options: [])
                  //      print(json)
                        success(json as! NSDictionary)

                    }catch let err{
                      //  print(err)

                        failure(err)

                    }
                }

            }

        }
        task.resume()
    }
    //MARK:=================================  UPLOAD Audio ==========================================

    func uploadAudio(urlString:String,params:[String:String]?,AudioURl:URL?,success:@escaping (_ response: NSDictionary)-> Void, failure:@escaping (_ error: Error) -> Void){
        let boundary: String = "------VohpleBoundary4QuqLuM1cE5lMwCy"
        let contentType: String = "multipart/form-data; boundary=\(boundary)"
        let headers :[String:String] =
            [
                "content-type": "application/json",

                ]
        var request = URLRequest(url: URL(string: urlString)!)

        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }

        request.httpShouldHandleCookies = false
        request.timeoutInterval = 60
        request.httpMethod = "POST"
        request.setValue(contentType, forHTTPHeaderField: "Content-Type")

        let body = NSMutableData()
        if let parameters = params {
            for (key, value) in parameters {
                body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
                body.append("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n".data(using: String.Encoding.utf8)!)
                body.append("\(value)\r\n".data(using: String.Encoding.utf8)!)
            }
        }
        //which field you have to sent image on server
        let fileName: String = "file"
        if AudioURl != nil {
            body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
            body.append("Content-Disposition: form-data; name=\"\(fileName)\"; filename=\"Audio.mp3\"\r\n".data(using: String.Encoding.utf8)!)
            body.append("Content-Type:image/png\r\n\r\n".data(using: String.Encoding.utf8)!)
            body.append(NSData(contentsOf: AudioURl!)! as Data)
            body.append("\r\n".data(using: String.Encoding.utf8)!)
        }


        body.append("--\(boundary)--\r\n".data(using: String.Encoding.utf8)!)
        request.httpBody = body as Data
        //  let session = URLSession.shared
        let session = URLSession(configuration:.default, delegate: self, delegateQueue: .main)
        let task = session.dataTask(with: request as URLRequest) { (data, response, error) in

            DispatchQueue.main.async {
                self.hideProgress()

                if(error != nil){
                    //  print(String(data: data!, encoding: .utf8) ?? "No response from server")

                    failure(error!)

                }


                if let responseData = data{
                    do {
                        let json = try JSONSerialization.jsonObject(with: responseData, options: [])
                //        print(json)
                        success(json as! NSDictionary)

                    }catch let err{
             //           print(err)

                        failure(err)

                    }
                }

            }

        }
        task.resume()
    }


    //MARK:=================================  UPLOAD IMAGE ==========================================
    func uploadImage(urlString:String,params:[String:String]?,image:[UIImage?],success:@escaping (_ response: NSDictionary)-> Void, failure:@escaping (_ error: Error) -> Void){

        let boundary: String = "------VohpleBoundary4QuqLuM1cE5lMwCy"
        let contentType: String = "multipart/form-data; boundary=\(boundary)"
        let headers :[String:String] =
            [
                "content-type": "application/json",
                ]
        var request = URLRequest(url: URL(string: urlString)!)

        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }

        request.httpShouldHandleCookies = false
        request.timeoutInterval = 60
        request.httpMethod = "POST"
        request.setValue(contentType, forHTTPHeaderField: "Content-Type")

        let body = NSMutableData()
        if let parameters = params {
            for (key, value) in parameters {
                body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
                body.append("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n".data(using: String.Encoding.utf8)!)
                body.append("\(value)\r\n".data(using: String.Encoding.utf8)!)
            }
        }
        //which field you have to sent image on server
        let fileName: String = "file"
        if image[0] != nil {
            body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
            body.append("Content-Disposition: form-data; name=\"\(fileName)\"; filename=\"image.png\"\r\n".data(using: String.Encoding.utf8)!)
            body.append("Content-Type:image/png\r\n\r\n".data(using: String.Encoding.utf8)!)
            body.append(UIImageJPEGRepresentation(image[0]!, 0.2)!)
            body.append("\r\n".data(using: String.Encoding.utf8)!)
        }
        let fileName2: String = "cover_image"

        if image[1] != nil {
            body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
            body.append("Content-Disposition: form-data; name=\"\(fileName2)\"; filename=\"image.png\"\r\n".data(using: String.Encoding.utf8)!)
            body.append("Content-Type:image/png\r\n\r\n".data(using: String.Encoding.utf8)!)
            body.append(UIImageJPEGRepresentation(image[1]!, 0.2)!)
            body.append("\r\n".data(using: String.Encoding.utf8)!)
        }

        body.append("--\(boundary)--\r\n".data(using: String.Encoding.utf8)!)
        request.httpBody = body as Data
        //  let session = URLSession.shared
        let session = URLSession(configuration:.default, delegate: self, delegateQueue: .main)
        // var session = NSURLSession(configuration: configuration, delegate: self, delegateQueue: NSOperationQueue.mainQueue())
        let task = session.dataTask(with: request as URLRequest) { (data, response, error) in

         //   print(data as Any)
            DispatchQueue.main.async {
                self.hideProgress()

                if(error != nil){
                    //  print(String(data: data!, encoding: .utf8) ?? "No response from server")

                    failure(error!)

                }


                if let responseData = data{
                    do {
                        let json = try JSONSerialization.jsonObject(with: responseData, options: [])
                  //      print(json)
                        success(json as! NSDictionary)

                    }catch let err{
                    //    print(err)

                        failure(err)

                    }
                }

            }

        }
        task.resume()
    }

    //MARK:======================= URLSESSION DELEGATES =====================
    public func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
      //  print("didCompleteWithError")
        //   let myAlert = UIAlertView(title: "Alert", message: error?.localizedDescription, delegate: nil, cancelButtonTitle: "Ok")
        //  myAlert.show()
        //  self.uploadButton.enabled = true
    }

    public func urlSession(_ session: URLSession, task: URLSessionTask, didSendBodyData bytesSent: Int64, totalBytesSent: Int64, totalBytesExpectedToSend: Int64) {

    //    print("didSendBodyData")
        let uploadProgress:Float = Float(totalBytesSent) / Float(totalBytesExpectedToSend)
//        SingletonClass.sharedInstance.ProgressHUD.progress = uploadProgress
//        SingletonClass.sharedInstance.ProgressHUD.detailsLabel.text = "\(Int(uploadProgress*100))%"


        //        imageUploadProgressView.progress = uploadProgress
        //        let progressPercent = Int(uploadProgress*100)
        //        progressLabel.text = "\(progressPercent)%"
        //        println(uploadProgress)
    }

    public func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse, completionHandler: @escaping (URLSession.ResponseDisposition) -> Void) {

 //       print("didReceiveResponse")
        //        println(response);
        //        self.uploadButton.enabled = true
    }

    public func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
     //   print("didReceiveData")

    }




    //MARK:======================= PopViewController ========================
    func PopViewController(){
        navigationController?.popViewController(animated: true)
    }
    func dissmisView(){
        self.dismiss(animated: true, completion: nil)
    }

    //MARK:=======================ALert View============================
    func alert(title:String , message: String)
    {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: UIAlertControllerStyle.alert)
        let cancelAction = UIAlertAction(title: "OK",
                                         style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }




    //MARK: ====================== Hide or Show Naviation =============================

    func HideNavigation(type:Bool){
        self.navigationController?.navigationBar.isHidden = type
        let attributes = [NSAttributedStringKey.font : UIFont(name: "Avenir-Medium", size: 17)!, NSAttributedStringKey.foregroundColor : UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = attributes
    }




    //MARK:======================= SetUp IQKeyBoard  ===============================
    func DisableIQkeyboard(){
        IQKeyboardManager.shared().isEnabled = false
        IQKeyboardManager.shared().isEnableAutoToolbar = false
        IQKeyboardManager.shared().shouldShowToolbarPlaceholder = false
        IQKeyboardManager.shared().previousNextDisplayMode = IQPreviousNextDisplayMode.alwaysHide
    }
    func EnableIQkeyboard(){
        IQKeyboardManager.shared().isEnabled = true
        IQKeyboardManager.shared().isEnableAutoToolbar = true
        IQKeyboardManager.shared().shouldShowToolbarPlaceholder = true
        IQKeyboardManager.shared().previousNextDisplayMode = IQPreviousNextDisplayMode.alwaysShow
    }



    //MARK:======================= Show Animation  ===============================
    func ShowAnimation(){

        UIView.animate(withDuration: 0.5) {

            self.view.layoutIfNeeded()


        }




    //MARK:======================= Delay Function ========================


    func delayWithSeconds(_ seconds: Double, completion: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            completion()
        }
    }

    //MARK:======================= Play Sound ========================

    func PlaySound(){
        let url = URL(fileURLWithPath: "/System/Library/Audio/UISounds/Modern/calendar_alert_chord.caf")
        var soundID: SystemSoundID = 0
        AudioServicesCreateSystemSoundID(url as CFURL, &soundID)
        AudioServicesPlaySystemSound(soundID);
    }

    //MARK:======================= Update UDID ========================
//    func UpdateDeviceID(isLogout:Bool){
//
//        var  prams = [String:String]()
//        if isLogout{
//            prams = [
//                "user_id": "\(UserDefaults.standard.value(forKey: USER_ID) ?? "")",
//                "device_type":"I",
//                "device_token":""
//            ]
//        }else{
//          prams = [
//            "user_id":"\(UserDefaults.standard.value(forKey: USER_ID) ?? "")",
//            "device_type":"I",
//            "device_token":"\(UserDefaults.standard.value(forKey: DEVICE_ID) ?? "")"
//        ]
//        }
//   //     print(prams)
//        self.webservicesPostRequest(baseString: BASE_URL + UPDATE_DEVICE_ID, parameters: prams, success: { (response) in
//
//    //        print(response)
//
//        }) { (error) in
//         //   print(error)
//           // self.UpdateDeviceID()
//        }
//
//    }
//

}
}
//

