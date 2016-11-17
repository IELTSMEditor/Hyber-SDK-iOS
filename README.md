# Hyber SDK 2.0 for iOS
[![Platform](https://img.shields.io/badge/Platforms-iOS-lightgray.svg)]()
[![Swift version](https://img.shields.io/badge/Swift-3.0.x-orange.svg)]()
[![Release][release-svg]][release-link]

[![Build Status][travis-build-status-svg]][travis-build-status-link]

## Installation

Hyber is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Hyber'
```
Then, run the following command:

```bash
$ pod install
```

#### Add files
Add [```HyberFirebaseMessagingDelegate.swift```][HyberFirebaseMessagingDelegateLink] file to your project

#### Modify AppDelegate
##### Add ```import``` statement
```swift
import Hyber
```

In  `func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool` add following
```swift
  HyberFirebaseMessagingDelegate.sharedInstance.registerForRemoteNotification() //Allow to get remove notificaion
  HyberFirebaseMessagingDelegate.sharedInstance.configureFirebaseMessaging() //Allow to use firebaseHelper

  Hyber.initialise(clientApiKey:"ClientApiKey", 
  firebaseMessagingHelper: HyberFirebaseMessagingDelegate.sharedInstance)
```

In  `func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData)` add following
```swift
  Hyber.didRegisterForRemoteNotificationsWithDeviceToken(deviceToken)
```

In `func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject], fetchCompletionHandler completionHandler: (UIBackgroundFetchResult) -> Void)` add following
```swift
   Hyber.didReceiveRemoteNotification(userInfo: userInfo)
   
   completionHandler(.newData)
```

#### Register your application for Remote Notification

##### Certificates
Configure push-notifications in [Certificates, Identifiers & Profiles](https://developer.apple.com/account/ios/certificate/certificateList.action) section of Apple Developer Member Center ([manual](https://developer.apple.com/library/ios/documentation/IDEs/Conceptual/AppDistributionGuide/AddingCapabilities/AddingCapabilities.html#//apple_ref/doc/uid/TP40012582-CH26-SW6))
##### Registering for Remote Notifications
Register your application to receive remote push-notifications ([manual](https://developer.apple.com/library/mac/documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/Chapters/IPhoneOSClientImp.html#//apple_ref/doc/uid/TP40008194-CH103-SW2))

Don't forget add Push Notifications for your target (see `Capabilities` tab). And add turn on `Background Modes`, whith `Remote Notifications` flag ON)
Use method for allow push notification
```swift
  HyberFirebaseMessagingDelegate.sharedInstance.registerForRemoteNotification() 
```

### Usage
To start using Hyber framework you should provide correct subscriber e-mail & phone (optionally)

## Use logger
By default logger enabled
- Disable `HyberLogger` by setting `enabled` to `false`:

```swift
HyberLogger.enabled = false
```
By default HyberLogger print all messages
- Define a minimum level of severity to only print the messages with a greater or equal severity:

```swift
HyberLogger.minLevel = .warning
```

> The severity levels are `trace`, `debug`, `info`, `warning`, and `error`.
#### Subscriber information
##### Add
To add new subscriber you should call
```swift
    Hyber.registration(phoneId: String, completionHandler: { (success) -> Void in
            if success {
               
            } else { 
            	//catch errors here
            }
        })
```
In completion handler result you will get Hyber subscriber ID if success


#### Get delivered messages
To fetch delivered messages call
```swift
 Hyber.getMessageList(completionHandler: { (success) -> Void in
           
           if success {
            
            } else {
             //Catch error here
            }
        })

```

### How to get keys, push-notifications, IDs

#### Hyber application key
Contact [Hyber](http://hyber.io)

#### Firebase Messaging (push-notifications)
Create new project in [Firebase console](https://firebase.google.com/console/).
Add iOS aaplication into your project.
Enable Cloud Messaging API for you project in  Go to project Settings, switch to Cloud Messaging tab. Upload APNs certificates ([Manual](https://firebase.google.com/docs/cloud-messaging/ios/certs)).
Than download `GoogleService-Info.plist` from `General` tab (Firebase console, project settings).
Add this file to yours application project.

### License
[MIT][LICENSE]


[release-svg]: http://github-release-version.herokuapp.com/github/Incuube/Hyber-SDK-iOS/release.svg
[release-link]: https://github.com/Incuube/Hyber-SDK-iOS/releases/latest

[travis-build-status-svg]: https://travis-ci.org/Incuube/Hyber-SDK-iOS.svg?branch=swift-3.0
[travis-build-status-link]: https://travis-ci.org/Incuube/Hyber-SDK-iOS
