//
//  ImplicitGrantAuthenticator.swift
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

import UIKit

/**
 *  Defines the implicit grant authorization flow where access token is extracted from redirect fragment.
 */
@objc(UBSDKImplicitGrantAuthenticator) public class ImplicitGrantAuthenticator: LoginViewAuthenticator {
    
    override var endpoint: UberAPI {
        return OAuth.ImplicitLogin(clientID: Configuration.getClientID(), scopes: self.scopes, redirect: Configuration.getCallbackURIString(.Implicit))
    }
    
    override public init(presentingViewController: UIViewController, scopes: [RidesScope]) {
        super.init(presentingViewController: presentingViewController, scopes: scopes)
        callbackURIType = .Implicit
    }
}
