//
//  UBSDKConnectButtonView.h
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

#import <UIKit/UIKit.h>
#import <UberRides/UberRides-Swift.h>
#define UBSDKLOC(LOC_STRING) UBSDKLocalizedString(LOC_STRING)
#define UBSDKLocalizedString(key, ...) [NSString stringWithFormat:[[NSBundle bundleWithPath:[[NSBundle bundleForClass:[self class]] pathForResource:@"Localizations" ofType:@"bundle"]] localizedStringForKey:(key) value:@"" table:@"UberRides"], ##__VA_ARGS__, nil]

NS_ASSUME_NONNULL_BEGIN

/**
 *  View that has a single UBSDKLoginButton in the center
 */
@interface UBSDKLoginButtonView : UIView

@property (nonatomic, readonly, nonnull) UBSDKLoginButton *loginButton;

- (instancetype)initWithFrame:(CGRect)frame scopes:(NSArray<UBSDKRidesScope *> *)scopes loginType:(UBSDKLoginType)loginType;

@end

NS_ASSUME_NONNULL_END