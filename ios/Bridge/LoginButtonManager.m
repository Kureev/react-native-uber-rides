#import "LoginButton.h"
#import "LoginButtonManager.h"

@interface LoginButtonManager()

@property (nonatomic, nonnull) UBSDKLoginManager *loginManager;

@end


@implementation LoginButtonManager

RCT_EXPORT_MODULE()

RCT_EXPORT_VIEW_PROPERTY(onLogin, RCTBubblingEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onLogout, RCTBubblingEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onLoginError, RCTBubblingEventBlock)

- (UIView *)view
{
  NSArray<UBSDKRidesScope *> *scopes = @[UBSDKRidesScope.Profile];
  _loginManager = [[UBSDKLoginManager alloc] initWithLoginType:UBSDKLoginTypeNative];
  LoginButton *loginButton = [[LoginButton alloc]
                              initWithFrame:CGRectZero
                              scopes:scopes
                              loginManager:_loginManager];
  return loginButton;
}

@end
