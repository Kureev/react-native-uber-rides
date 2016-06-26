//
//  UserActivity.swift
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

import ObjectMapper

// MARK: TripHistory

/**
*  User's lifetime trip activity with Uber.
*/
@objc(UBSDKTripHistory) public class TripHistory: NSObject {
    /// Position in pagination.
    public private(set) var offset: Int = 0
    
    /// Number of items retrieved.
    public private(set) var limit: Int = 0
    
    /// Total number of items available.
    public private(set) var count: Int = 0
    
    /// Array of trip information.
    public private(set) var history: [UserActivity]?
    
    public required init?(_ map: Map) {
    }
}

extension TripHistory: UberModel {
    public func mapping(map: Map) {
        offset  <- map["offset"]
        limit   <- map["limit"]
        count   <- map["count"]
        history <- map["history"]
    }
}

// MARK: UserActivity

/**
*  Information regarding an Uber trip in a user's activity history.
*/
@objc(UBSDKUserActivity) public class UserActivity: NSObject {
    /// Status of the activity. Only returns completed for now.
    public private(set) var status: RideStatus?
    
    /// Length of activity in miles.
    public private(set) var distance: Float = 0.0
    
    /// Represents timestamp of activity request time in current locale.
    public private(set) var requestTime: NSDate?
    
    /// Represents timestamp of activity start time in current locale.
    public private(set) var startTime: NSDate?
    
    /// Represents timestamp of activity end time in current locale.
    public private(set) var endTime: NSDate?
    
    /// City that activity started in.
    public private(set) var startCity: TripCity?
    
    /// Unique activity identifier.
    public private(set) var requestID: String?
    
    /// Unique identifier representing a specific product for a given latitude & longitude.
    public private(set) var productID: String?
    
    public required init?(_ map: Map) {
    }
}

extension UserActivity: UberModel {
    public func mapping(map: Map) {
        distance    <- map["distance"]
        requestTime <- (map["request_time"], DateTransform())
        startTime   <- (map["start_time"], DateTransform())
        endTime     <- (map["end_time"], DateTransform())
        startCity   <- map["start_city"]
        requestID   <- map["request_id"]
        productID   <- map["product_id"]
        
        status = .Unknown
        if let value = map["status"].currentValue as? String {
            status = RideStatusFactory.convertRideStatus(value)
        }
    }
}

// MARK: TripCity

/**
*  Information relating to a city in a trip activity.
*/
@objc(UBSDKTripCity) public class TripCity : NSObject {
    /// Latitude of city location.
    public private(set) var latitude: Float = 0.0
    
    /// Longitude of city location.
    public private(set) var longitude: Float = 0.0
    
    /// Display name of city.
    public private(set) var name: String?
    
    public required init?(_ map: Map) {
    }
}

extension TripCity: Mappable {
    public func mapping(map: Map) {
        latitude  <- map["latitude"]
        longitude <- map["longitude"]
        name      <- map["display_name"]
    }
}
