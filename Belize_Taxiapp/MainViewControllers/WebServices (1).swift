//
//  WebServices.swift
//  YoutubeSwift
//
//  Created by Gurinder Singh Batth on 19/06/17.
//  Copyright © 2017 Batth. All rights reserved.
//

import UIKit

extension UIViewController{
    
    func webservicesPostForHtml(baseString: String, parameters: String?,success:@escaping (_ response: Any)-> Void, failure:@escaping (_ error: Error) -> Void){
        
        let sessionConfiguration = URLSessionConfiguration.default
        
        let session = URLSession(configuration: sessionConfiguration, delegate: nil, delegateQueue: OperationQueue.main)
        
        var request = URLRequest(url: URL(string: baseString)!)
        request.httpMethod = "POST"
        request.httpBody = parameters?.data(using: .utf8)
        
        let dataTask = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            if error == nil{
                if let responseData = data{
                    do {
                        let json = try JSONSerialization.jsonObject(with: responseData, options: [])
                        success(json)
                    }catch let err{
                        print(err)
                    }
                }
            }else{
                failure(error!)
            }
        }
        dataTask.resume()
    }
    
    func webServiceGetRequest(baseString: String, parameters: String?, success:@escaping (_ response: Any) ->Void, failure:@escaping (_ error: Error) -> Void){
        
        let sessionConfiguration = URLSessionConfiguration.default
        
        let session = URLSession(configuration: sessionConfiguration, delegate: nil, delegateQueue: OperationQueue.main)
        let url = URL(string: baseString)
        
        
        
        
        let dataTask = session.dataTask(with: url!, completionHandler: { (data: Data?, response: URLResponse?,error: Error?) in
            if error == nil{
                if let responseData = data{
                    do {
                        let json = try JSONSerialization.jsonObject(with: responseData, options: [])
                        success(json)
                    }catch let err{
                        print(err)
                    }
                }
            }else{
                failure(error!)
            }
        })
        dataTask.resume()
    }
    
    
}
