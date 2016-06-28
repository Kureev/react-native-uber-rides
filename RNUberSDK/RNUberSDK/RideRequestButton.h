#import <UIKit/UIKit.h>
#import <UberRides/UberRides-Swift.h>
#import "UIView+React.h"

NS_ASSUME_NONNULL_BEGIN

@interface RideRequestButton : UIView

- (instancetype)initWithFrame:(CGRect)frame;
- (void)initRouteForButton;

@property (nonatomic, weak) id <UBSDKRideRequestButtonDelegate> _Nullable delegate;
@property (nonatomic, strong) NSDictionary *pickup;
@property (nonatomic, strong) NSDictionary *dropoff;

@end

NS_ASSUME_NONNULL_END
