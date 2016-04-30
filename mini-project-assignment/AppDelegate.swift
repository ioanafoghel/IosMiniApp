//
//  AppDelegate.swift
//  mini-project-assignment
//
//  Created by Ioana Foghel on 4/29/16.
//  Copyright © 2016 Ioana Foghel. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        let urlPath = "http://rss2json.com/api.json?rss_url=https%3A%2F%2Fitunes.apple.com%2Fus%2Frss%2Ftopfreeebooks%2Flimit%3D10%2Fxml"
        let url: NSURL = NSURL(string: urlPath)!
        let session = NSURLSession.sharedSession()
        var bookObjects = [Book]()
        
        let task = session.dataTaskWithURL(url)
            { (data, response, error) -> Void in
                if error == nil {
                    
                    let returnData = JSON(data: data!)
                    
                    let books = returnData["items"]
                    for (_, value):(String, JSON) in books {
                        let title = value["title"].stringValue
                        let author = value["author"].stringValue
                        let pubDate = value["pubDate"].stringValue
                        let summary = value["description"].stringValue
                        
                        bookObjects.append(
                            Book(title: title, author: author, pubDate: pubDate, summary: summary)                        )
                    }
                    
                    let vc = (self.window?.rootViewController as! UINavigationController).viewControllers.first as! TableViewController
                    
                    vc.books = bookObjects
                    vc.dataIsReady()
                    
                } else {
                    // display an alert to notify the user that NO data was recieved
                    
                }
        }
        
        task.resume()
        
        
        return true

    
    
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

