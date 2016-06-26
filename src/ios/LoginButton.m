#import "LoginButton.h"

@interface LoginButton()<UBSDKLoginButtonDelegate>

@property (nonatomic, nonnull) UBSDKLoginManager *loginManager;
@property (nonatomic, readonly, nonnull) NSArray<UBSDKRidesScope *> *scopes;

@end

@implementation LoginButton

#pragma mark - LoginButton

- (instancetype)initWithFrame:(CGRect)frame
                       scopes:(NSArray<UBSDKRidesScope *> *)scopes
                 loginManager:(UBSDKLoginManager *)loginManager {

  self = [super initWithFrame:frame];
  if (self) {
    _scopes = scopes;
    UBSDKLoginButton *_loginButton = [[UBSDKLoginButton alloc]
                    initWithFrame:CGRectZero
                    scopes:scopes
                    loginManager:loginManager];

    _loginButton.delegate = self;
    [self addSubview:_loginButton];
    [self _addLoginButtonConstraints:_loginButton];
  }
  return self;
}

#pragma mark - UBSDKLoginButtonDelegate

- (void)loginButton:(UBSDKLoginButton *)button didLogoutWithSuccess:(BOOL)success {
  _onLogout(@{@"isLoggedOut": @(success)});
}

- (void)loginButton:(UBSDKLoginButton *)button didCompleteLoginWithToken:(UBSDKAccessToken *)accessToken error:(NSError *)error {
  if (accessToken) {
    _onLogin(@{
                   @"accessToken": accessToken.tokenString,
                   @"renewToken": accessToken.refreshToken
                   });
  } else if (error) {
    _onLoginError(@{@"error": [error localizedDescription]});
  }
}

#pragma mark - LoginButton constraints

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
