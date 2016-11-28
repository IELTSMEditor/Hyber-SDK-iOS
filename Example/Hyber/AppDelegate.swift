//
//  AppDelegate.swift
//  Hyber
//
//  Created by Taras on 10/20/2016.
//  Copyright (c) 2016 Incuube. All rights reserved.
//

import UIKit
import Hyber
import UserNotifications
import Firebase
import FirebaseInstanceID
import FirebaseMessaging
import SwiftyJSON
import Fabric
import Crashlytics


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        HyberFirebaseMessagingDelegate.sharedInstance.configureFirebaseMessaging()
        Hyber.initialise(clientApiKey:"b5a5b6f4-5af7-11e6-8b77-86f30ca893d3", firebaseMessagingHelper: HyberFirebaseMessagingDelegate.sharedInstance, launchOptions: launchOptions)
        //Init fabric
        Fabric.with([Crashlytics.self])

        return true
        
    }
   
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        // If you are receiving a notification message while your app is in the background,
        // this callback will not be fired till the user taps on the notification launching the application.
        
        // TODO: Handle data of notification
        Hyber.didReceiveRemoteNotification(userInfo: userInfo)
        completionHandler(.newData)
    }
    
}
