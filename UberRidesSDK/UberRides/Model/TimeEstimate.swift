//
//  TimeEstimate.swift
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

import ObjectMapper

// MARK: TimeEstimates

/**
*  Internal object that contains a list of ETAs for Uber products.
*/
struct TimeEstimates {
    var list: [TimeEstimate]?
    init?(_ map: Map) {
    }
}

extension TimeEstimates: UberModel {
    mutating func mapping(map: Map) {
        list <- map["times"]
    }
}

// MARK: TimeEstimate

/**
*  Contains information regarding the ETA of an Uber product.
*/
@objc(UBSDKTimeEstimate) public class TimeEstimate: NSObject {
    /// Unique identifier representing a specific product for a given latitude & longitude.
    public private(set) var productID: String?
    
    /// Display name of product. Ex: "UberBLACK".
    public private(set) var name: String?
    
    /// ETA for the product (in seconds).
    public private(set) var estimate: Int = 0
    
    public required init?(_ map: Map) {
    }
}

extension TimeEstimate: UberModel {
    public func mapping(map: Map) {
        productID <- map["product_id"]
        name      <- map["display_name"]
        estimate  <- map["estimate"]
    }
}
