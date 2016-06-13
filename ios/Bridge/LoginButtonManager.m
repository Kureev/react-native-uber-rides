//
//  LoginButtonManager.m
//  UberSDKTest
//
//  Created by Alexey Kureev on 12.06.16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "LoginButton.h"
#import "LoginButtonManager.h"

@interface LoginButtonManager()<UBSDKLoginButtonDelegate>
@end


@implementation LoginButtonManager

RCT_EXPORT_MODULE()

- (UIView *)view
{
  NSArray<UBSDKRidesScope *> *scopes = @[UBSDKRidesScope.Profile,
                                         UBSDKRidesScope.Places,
                                         UBSDKRidesScope.Request];
  
  UBSDKLoginManager *loginManager = [[UBSDKLoginManager alloc] initWithLoginType:UBSDKLoginTypeNative];
  UBSDKLoginButton *loginButton = [[UBSDKLoginButton alloc] initWithFrame:CGRectZero scopes:scopes loginManager:loginManager];
  
  loginButton.delegate = self;
  return loginButton;
}

#pragma mark - UBSDKLoginButtonDelegate

- (void)loginButton:(UBSDKLoginButton *)button didLogoutWithSuccess:(BOOL)success {
  // success is true if logout succeeded, false otherwise
}

- (void)loginButton:(UBSDKLoginButton *)button didCompleteLoginWithToken:(UBSDKAccessToken *)accessToken error:(NSError *)error {
  if (accessToken) {
    NSLog(@"%@", [accessToken description]);
  } else if (error) {
    NSLog(@"%@", [error localizedDescription]);
  }
}

@end
