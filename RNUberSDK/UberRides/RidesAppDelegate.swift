//
//  RidesAppDelegate.swift
//  UberRides
//
//  Copyright © 2015 Uber Technologies, Inc. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

/**
 Responsible for parsing any events that require switching to the Uber app.
 Designed to mimic methods from your application's AppDelegate and should
 be called inside their corresponding methods
 */
@objc(UBSDKRidesAppDelegate) public class RidesAppDelegate : NSObject {
    
    //MARK: Class variables
    
    public static let sharedInstance = RidesAppDelegate()
    
    //MARK: Public variables
    
    public var loginManager : LoginManaging?
    
    //Mark: NSObject
    
    public override init() {
        super.init()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(didBecomeActive), name: UIApplicationDidBecomeActiveNotification, object: nil)
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    //MARK: Public Methods
    
    /**
     Handles parsing a deeplink that can be handled by the Rides SDK. Should be
     be called in your ApplicationDelegate:
     application:openURL:sourceApplication:annotation: (iOS 8)
     OR
     app:openURL:options: (iOS 9+), passing in options[UIApplicationOpenURLOptionsSourceApplicationKey] as sourceApplication
     
     - parameter application: Your singleton app object. As passed to the corresponding AppDelegate method
     - parameter url: The URL resource to open. As passed to the corresponding AppDelegate methods
     - parameter sourceApplication: The bundle ID of the app that is requesting
     your app to open the URL (url). As passed to the corresponding AppDelegate method (iOS 8) or
     options[UIApplicationOpenURLOptionsSourceApplicationKey] (iOS 9+)
     - parameter annotation: A property list object supplied by the source app to
     communicate information to the receiving app As passed to the corresponding AppDelegate method
     - returns: true if the URL was intended for the Rides SDK, false otherwise
     */
    public func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject?) -> Bool {
        guard let manager = loginManager else {
            return false
        }
        let urlHandled = manager.application(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation)
        if (urlHandled) {
            loginManager = nil
        }

        return urlHandled
    }
    
    public func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        guard let options = launchOptions, let launchURL = options[UIApplicationLaunchOptionsURLKey] as? NSURL else {
            return false
        }
        
        let manager = loginManager ?? LoginManager()
        let sourceApplication = options[UIApplicationLaunchOptionsSourceApplicationKey] as? String
        let annotation = options[UIApplicationLaunchOptionsAnnotationKey]
        let urlHandled = manager.application(application, openURL: launchURL, sourceApplication: sourceApplication, annotation: annotation)
        loginManager = nil
        return urlHandled
    }
    
    //MARK: Private Methods
    
    @objc private func didBecomeActive(notification: NSNotification) {
        if let manager = loginManager {
            manager.applicationDidBecomeActive()
            loginManager = nil
        }
    }
}
