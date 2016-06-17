//
//  UBSDKLoginButtonView.m
//  Obj-C SDK
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

#import "LoginButton.h"

@interface LoginButton()

@property (nonatomic, nonnull) UBSDKLoginManager *loginManager;
@property (nonatomic, readonly, nonnull) NSArray<UBSDKRidesScope *> *scopes;

@end

@implementation LoginButton

#pragma mark - LoginButton

- (instancetype)initWithFrame:(CGRect)frame
                       scopes:(NSArray<UBSDKRidesScope *> *)scopes {
  
  self = [super initWithFrame:frame];
  if (self) {
    _scopes = scopes;
    UBSDKLoginManager *loginManager = [[UBSDKLoginManager alloc] initWithLoginType:UBSDKLoginTypeNative];
    UBSDKLoginButton *_loginButton = [[UBSDKLoginButton alloc]
                    initWithFrame:CGRectZero
                    scopes:scopes
                    loginManager:loginManager];
    
    [self addSubview:_loginButton];
    [self _addLoginButtonConstraints:_loginButton];
  }
  return self;
}

- (void) _addLoginButtonConstraints: (UBSDKLoginButton *)_loginButton {
  _loginButton.translatesAutoresizingMaskIntoConstraints = NO;
  
  NSLayoutConstraint *centerXConstraint = [NSLayoutConstraint
                                           constraintWithItem:_loginButton
                                           attribute:NSLayoutAttributeCenterX
                                           relatedBy:NSLayoutRelationEqual
                                           toItem:self
                                           attribute:NSLayoutAttributeCenterX
                                           multiplier:1.0
                                           constant:0.0];
  
  NSLayoutConstraint *centerYConstraint = [NSLayoutConstraint
                                           constraintWithItem:_loginButton
                                           attribute:NSLayoutAttributeCenterY
                                           relatedBy:NSLayoutRelationEqual
                                           toItem:self
                                           attribute:NSLayoutAttributeCenterY
                                           multiplier:1.0
                                           constant:0.0];
  
  NSLayoutConstraint *widthConstraint = [NSLayoutConstraint
                                         constraintWithItem:_loginButton
                                         attribute:NSLayoutAttributeWidth
                                         relatedBy:NSLayoutRelationEqual
                                         toItem:self
                                         attribute:NSLayoutAttributeWidth
                                         multiplier:1.0
                                         constant:0.0];
  
  NSLayoutConstraint *heightConstraint = [NSLayoutConstraint
                                          constraintWithItem:_loginButton
                                          attribute:NSLayoutAttributeHeight
                                          relatedBy:NSLayoutRelationEqual
                                          toItem:self
                                          attribute:NSLayoutAttributeHeight
                                          multiplier:1.0
                                          constant:0.0];
  
  [self addConstraints:@[centerXConstraint, centerYConstraint, widthConstraint, heightConstraint]];
}

@end