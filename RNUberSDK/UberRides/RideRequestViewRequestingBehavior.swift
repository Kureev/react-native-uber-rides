//
//  RideRequestViewRequestingBehavior.swift
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


/// A RideRequesting object for requesting a ride via the RideRequestViewController
@objc(UBSDKRideRequestViewRequestingBehavior) public class RideRequestViewRequestingBehavior : NSObject {
    
    /// The UIViewController to present the RideRequestViewController over
    unowned public var presentingViewController: UIViewController
    
    /**
     The LoginManager to use with the RideRequestViewController. Uses the
     accessTokenIdentifier & keychainAccessGroup to get an AccessToken. Will be used
     to log a user in, if necessary
     */
    public var loginManager: LoginManager {
        get {
            return self.modalRideRequestViewController.rideRequestViewController.loginManager
        }
        set {
            self.modalRideRequestViewController.rideRequestViewController.loginManager = newValue
        }
    }
    
    /// The ModalRideRequestViewController that is created by this behavior, only exists after requestRide() is called
    public internal(set) var modalRideRequestViewController: ModalRideRequestViewController
    
    /**
     Creates the RideRequestViewRequestingBehavior with the given presenting view controller.
     This view controller will be used to modally present the ModalRideRequestViewController
     when this behavior is executed
     
     - parameter presentingViewController: The UIViewController to present the ModalRideRequestViewController over
     - parameter loginManager:             The LoginManager to use for managing the AccessToken for the RideRequestView
     
     - returns: An initialized RideRequestViewRequestingBehavior object
     */
    @objc public init(presentingViewController: UIViewController, loginManager: LoginManager) {
        self.presentingViewController = presentingViewController
        let rideRequestViewController = RideRequestViewController(rideParameters: RideParametersBuilder().build(), loginManager: loginManager)
        modalRideRequestViewController = ModalRideRequestViewController(rideRequestViewController: rideRequestViewController)
    }
    
    /**
     Creates the RideRequestViewRequestingBehavior with the given presenting view controller.
     This view controller will be used to modally present the ModalRideRequestViewController
     when this behavior is executed
     
     Uses a default LoginManager() for login & token management
     
     - parameter presentingViewController: The UIViewController to present the ModalRideRequestViewController over
     
     - returns: An initialized RideRequestViewRequestingBehavior object
     */
    @objc public convenience init(presentingViewController: UIViewController) {
        self.init(presentingViewController: presentingViewController, loginManager: LoginManager())
    }
}

extension RideRequestViewRequestingBehavior : RideRequesting {
    /**
     Requests a ride by presenting a RideRequestView that is constructed using the provided
     rideParameters
     
     - parameter rideParameters: The RideParameters to use for building and prefilling
     the RideRequestView
     */
    public func requestRide(rideParameters: RideParameters?) {
        if let rideParameters = rideParameters {
            modalRideRequestViewController.rideRequestViewController.rideRequestView.rideParameters = rideParameters
        }
        presentingViewController.presentViewController(modalRideRequestViewController, animated: true, completion: nil)
    }
}
