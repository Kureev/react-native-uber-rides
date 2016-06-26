//
//  AuthorizationCodeGrantAuthenticator.swift
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

@objc(UBSDKAuthorizationCodeGrantAuthenticator) public class AuthorizationCodeGrantAuthenticator: LoginViewAuthenticator {
    public var state: String?
    
    @objc public init(presentingViewController: UIViewController, scopes: [RidesScope], state: String?) {
        self.state = state
        super.init(presentingViewController: presentingViewController, scopes: scopes)
        callbackURIType = .AuthorizationCode
    }
    
    override var endpoint: UberAPI {
        return OAuth.AuthorizationCodeLogin(clientID: Configuration.getClientID(), redirect: Configuration.getCallbackURIString(.AuthorizationCode), scopes: scopes, state: state)
    }
    
    override public convenience init(presentingViewController: UIViewController, scopes: [RidesScope]) {
        self.init(presentingViewController: presentingViewController, scopes: scopes, state: nil)
    }
    
    override func handleRedirectRequest(request: NSURLRequest) -> Bool {
        var shouldHandle = false
        if let url = request.URL where AuthenticationURLUtility.shouldHandleRedirectURL(url, type: callbackURIType) {
            if let urlComponents = NSURLComponents(URL: url, resolvingAgainstBaseURL: false),
                let queryItems = urlComponents.queryItems where queryItems.contains({ $0.name == "error" }) {
                shouldHandle = false
            } else {
                shouldHandle = true
            }
        }
        
        if shouldHandle {
            executeRedirect(request)
            loginCompletion?(accessToken: nil, error: nil)
        } else {
            shouldHandle = super.handleRedirectRequest(request)
        }
        return shouldHandle
    }
    
    func executeRedirect(request: NSURLRequest) {
        NSURLSession.sharedSession().dataTaskWithRequest(request).resume()
    }
}
