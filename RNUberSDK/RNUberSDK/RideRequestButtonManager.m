#import "RideRequestButton.h"
#import "RideRequestButtonManager.h"


@interface RideRequestButtonManager()
@end


@implementation RideRequestButtonManager

RCT_EXPORT_MODULE()

- (UIView *)view
{
  RideRequestButton *rideRequestButton = [[RideRequestButton alloc] initWithFrame:CGRectZero];
  
  return rideRequestButton;
}

- (BOOL) canFetchRoute: (RideRequestButton *)rideRequestButton {
  return rideRequestButton.dropoff && rideRequestButton.pickup;
}

RCT_CUSTOM_VIEW_PROPERTY(pickup, NSDictionary, RideRequestButton)
{
  view.pickup = [RCTConvert NSDictionary:json];
  
  if ([self canFetchRoute:view]) {
    [view initRouteForButton];
  }
}

RCT_CUSTOM_VIEW_PROPERTY(dropoff, NSDictionary, RideRequestButton)
{
  view.dropoff = [RCTConvert NSDictionary:json];
  
  if ([self canFetchRoute:view]) {
    [view initRouteForButton];
  }
}

@end
