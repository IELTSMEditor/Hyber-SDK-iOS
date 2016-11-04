//
//  AppDelegate.swift
//  Hyber
//
//  Created by 4taras4 on 10/20/2016.
//  Copyright (c) 2016 4taras4. All rights reserved.
//

import UIKit
import Hyber
import UserNotifications
import Firebase
import FirebaseInstanceID
import FirebaseMessaging
import SwiftyJSON


var notificationJson: JSON = []

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        HyberFirebaseMessagingDelegate.sharedInstance.registerForRemoteNotification()
        HyberFirebaseMessagingDelegate.sharedInstance.connectToFirebaseMessaging()
        HyberFirebaseMessagingDelegate.sharedInstance.configureFirebaseMessaging()
        return true
    }
    
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        // If you are receiving a notification message while your app is in the background,
        // this callback will not be fired till the user taps on the notification launching the application.
        // TODO: Handle data of notification
        
        notificationJson = JSON(userInfo)
        // Print full message.
        print("Print JSON: %@", notificationJson)
        
          
    }

}
