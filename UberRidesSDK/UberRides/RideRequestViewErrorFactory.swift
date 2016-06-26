//
//  RideRequestViewErrorFactory.swift
//  UberRides
//
//  Copyright © 2016 Uber Technologies, Inc. All rights reserved.
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

/// Factory class for creating RideRequestViewErrors
class RideRequestViewErrorFactory {
    
    static let errorDomain = "com.uber.rides-ios-sdk.riderequesterror"
    
    /**
     Creates a NSError using the provided RideRequestViewErrorType
     
     - parameter rideRequestViewErrorType: The RideRequestViewErrorType to create the error with
     
     - returns: An initialized NSError
     */
    static func errorForType(rideRequestViewErrorType: RideRequestViewErrorType) -> NSError {
        return NSError(domain: errorDomain, code: rideRequestViewErrorType.rawValue, userInfo: nil)
    }
    
    /**
     Creates a RideRequestViewError using the provided error String. The error string 
     should match the string provided from the Ride Request Widget endpoint
     
     - parameter rawValue: The error string to use
     
     - returns: An initialized RideRequestViewError
     */
    static func errorForString(rawValue: String) -> NSError {
        let errorType = rideRequestViewErrorType(rawValue)
        return RideRequestViewErrorFactory.errorForType(errorType)
    }
    
    static func rideRequestViewErrorType(rawValue: String) -> RideRequestViewErrorType {
        switch rawValue {
        case "network_error":
            return .NetworkError
        case "not_supported":
            return .NotSupported
        case "no_access_token":
            return .AccessTokenMissing
        case "unauthorized":
            return .AccessTokenExpired
        default:
            return .Unknown
        }
    }
}
