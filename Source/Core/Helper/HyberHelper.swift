//
//  HyberObject.swift
//  Hyber
//
//  Created by Vitalii Budnik on 2/10/16.
//
//

import Foundation
//import GoogleCloudMessaging

/**
 Global Message Service Helper.
  - Note: No internal and public initializers aviable
 */
internal class HyberHelper {
  
  /// Application key. (private)
  private var applicationKey: String? = .None
  
  /// A pointer to currently running addSubscriber `Request`. (internal)
  internal var addSubscriberTask: NSURLSessionTask? = .None
  
  /// A pointer to currently running updateSubscriberInfo `Request`. (internal)
  internal var updateSubscriberInfoTask: NSURLSessionTask? = .None
  
  /// A pointer to currently running updateGCMToken `Request`. (internal)
  //internal var updateGCMTokenTask: Request? = .None
  
  /// A pointer to current settings `GMSSettings`. (internal)
  internal lazy var settings: HyberSettings = {
    HyberSettings.currentSettings
  }()
  
  /// Private initializer
  private init() {}
  
  // swiftlint:disable line_length
  /// Framework remote notifications delegate (`HyberMessageFetcherJSQ`)
  internal weak var internalRemoteNotificationsDelegate: HyberRemoteNotificationReciever? = .None
  // swiftlint:enable line_length
  
}

public extension Hyber {
  
  /// An instance of `HyberHelper`
  internal static let helper = HyberHelper()
  
  /// Application key. (read-only)
  public static var applicationKey: String {
    if let applicationKey = helper.applicationKey {
      return applicationKey
    } else {
      fatalError("Hyber. You should call register() first")
    }
  }
  
  /**
   Registers framework with passed application key and `HyberGoogleCloudMessagingHelper` 
   with `senderID`
   - Parameter applicationKey: `String` with yours application key
   - Parameter googleCloudMessagingHelper: An instance of `HyberGoogleCloudMessagingHelper`, 
   to be configured with SenderID, that provedes receiving of push-notifications on a device
   - Parameter googleCloudMessagingSenderID: Yours Google Cloud Messaging SenderID 
   (project number in Google Developer Console)
   */
  public static func register(
    applicationKey applicationKey: String,
    googleCloudMessagingHelper: HyberGoogleCloudMessagingHelper,
    andGoogleCloudMessagingSenderID googleCloudMessagingSenderID: String) // swiftlint:disable:this line_length
  {
    
    helper.applicationKey = applicationKey
    
    googleCloudMessagingHelper.configure(withSenderID: googleCloudMessagingSenderID)
    
    Hyber.googleCloudMessagingHelper = googleCloudMessagingHelper
    
  }
  
}
