//
//  AdvancedNotificationController.swift
//  WatchTestApp
//
//  Created by Somogyi András on 10/01/16.
//  Copyright © 2016 Somogyi András. All rights reserved.
//

import WatchKit
import Foundation


class CatNotificationController: WKUserNotificationInterfaceController {
    
    @IBOutlet var catImage: WKInterfaceImage!
    
    let catUrl = "http://thecatapi.com/api/images/get?format=src&type=jpg&size=small&api_key="
    //FIXME: Use your own api key, if needed. Api key is not needed for basic functionality.
    let apiKey = ""
    
    override func didReceiveRemoteNotification(remoteNotification: [NSObject : AnyObject], withCompletion completionHandler: ((WKUserNotificationInterfaceType) -> Void)) {
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        configuration.requestCachePolicy = NSURLRequestCachePolicy.ReloadIgnoringCacheData
        configuration.timeoutIntervalForRequest = 60.0
        
        let catRequest = NSURLRequest.init(URL: NSURL(string: catUrl + apiKey)!)

        let catSession = NSURLSession(configuration: configuration)
        let catTask = catSession.dataTaskWithRequest(catRequest) { (catData, catResponse, catError) -> Void in
            if (catError == nil) {
                self.catImage.setImageData(catData)
                completionHandler(.Custom)
            } else {
                completionHandler(.Default)
            }
        }
        catTask.resume()
    }
}
