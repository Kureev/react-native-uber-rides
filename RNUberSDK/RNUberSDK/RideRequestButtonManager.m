#import "RideRequestButton.h"
#import "RideRequestButtonManager.h"


@interface RideRequestButtonManager()<UBSDKRideRequestButtonDelegate>
@end


@implementation RideRequestButtonManager

RCT_EXPORT_MODULE()

- (UIView *)view
{
  RideRequestButton *rideRequestButton = [[RideRequestButton alloc] initWithFrame:CGRectZero];
  rideRequestButton.delegate = self;
  return rideRequestButton;
}

RCT_CUSTOM_VIEW_PROPERTY(pickup, NSDictionary, RideRequestButton)
{
  view.pickup = [RCTConvert NSDictionary:json];
}

RCT_CUSTOM_VIEW_PROPERTY(dropoff, NSDictionary, RideRequestButton)
{
  view.dropoff = [RCTConvert NSDictionary:json];
}

@end
