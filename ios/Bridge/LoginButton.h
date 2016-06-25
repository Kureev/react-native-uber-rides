#import <UIKit/UIKit.h>
#import <UberRides/UberRides-Swift.h>
#import "UIView+React.h"

NS_ASSUME_NONNULL_BEGIN

/**
 *  View that has a single UBSDKLoginButton in the center
 */
@interface LoginButton : UIView

- (instancetype)initWithFrame:(CGRect)frame
                       scopes:(NSArray<UBSDKRidesScope *> *)scopes
                 loginManager:(UBSDKLoginManager *)loginManager;

@property (nonatomic, weak) id <UBSDKLoginButtonDelegate> _Nullable delegate;
@property (nonatomic, copy) RCTBubblingEventBlock onLogin;
@property (nonatomic, copy) RCTBubblingEventBlock onLogout;
@property (nonatomic, copy) RCTBubblingEventBlock onLoginError;

@end

NS_ASSUME_NONNULL_END
