#import <UIKit/UIKit.h>
#import <UberRides/UberRides-Swift.h>
#import "UIView+React.h"

NS_ASSUME_NONNULL_BEGIN

@interface RideRequestButton : UIView

- (instancetype)initWithFrame:(CGRect)frame;

@property (nonatomic, weak) id <UBSDKRideRequestButtonDelegate> _Nullable delegate;
@property (nonatomic, assign) NSDictionary *pickup;
@property (nonatomic, assign) NSDictionary *dropoff;

@end

NS_ASSUME_NONNULL_END
