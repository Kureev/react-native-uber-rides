#import "RideRequestButton.h"
#import <CoreLocation/CoreLocation.h>

@interface RideRequestButton()

@property (nonatomic, nonnull) CLLocationManager *locationManager;

@end

@implementation RideRequestButton

- (void)setPickup:(NSDictionary *)pickup
{
  _pickup = pickup;
}

- (void)setDropoff:(NSDictionary *)dropoff
{
  _dropoff = dropoff;
}

#pragma mark - RideRequestButton

- (instancetype)initWithFrame:(CGRect)frame {

  self = [super initWithFrame:frame];
  if (self) {
    UBSDKRideRequestButton *button = [[UBSDKRideRequestButton alloc] init];
    UBSDKRidesClient *ridesClient = [[UBSDKRidesClient alloc] init];
    CLLocation *pickupLocation = [[CLLocation alloc] initWithLatitude: [_pickup[@"latitude"] doubleValue] longitude: [_pickup[@"longitude"] doubleValue]];
    CLLocation *dropoffLocation = [[CLLocation alloc] initWithLatitude: [_dropoff[@"latitude"] doubleValue] longitude: [_dropoff[@"longitude"] doubleValue]];
    __block UBSDKRideParametersBuilder *builder = [[UBSDKRideParametersBuilder alloc] init];
    builder = [builder setPickupLocation: pickupLocation];
    builder = [builder setDropoffLocation: dropoffLocation];
    [ridesClient fetchCheapestProductWithPickupLocation: pickupLocation completion:^(UBSDKUberProduct* _Nullable product, UBSDKResponse* _Nullable response) {
        if (product) {
            builder = [builder setProductID: product.productID];
            button.rideParameters = [builder build];
            [button loadRideInformation];
        }
    }];

    [self addSubview:button];
    [self _addRideRequestButtonConstraints:button];
  }
  return self;
}


- (void) _addRideRequestButtonConstraints: (UBSDKRideRequestButton *)button {
  button.translatesAutoresizingMaskIntoConstraints = NO;

  NSLayoutConstraint *centerXConstraint = [NSLayoutConstraint
                                           constraintWithItem:button
                                           attribute:NSLayoutAttributeCenterX
                                           relatedBy:NSLayoutRelationEqual
                                           toItem:self
                                           attribute:NSLayoutAttributeCenterX
                                           multiplier:1.0
                                           constant:0.0];

  NSLayoutConstraint *centerYConstraint = [NSLayoutConstraint
                                           constraintWithItem:button
                                           attribute:NSLayoutAttributeCenterY
                                           relatedBy:NSLayoutRelationEqual
                                           toItem:self
                                           attribute:NSLayoutAttributeCenterY
                                           multiplier:1.0
                                           constant:0.0];

  NSLayoutConstraint *widthConstraint = [NSLayoutConstraint
                                         constraintWithItem:button
                                         attribute:NSLayoutAttributeWidth
                                         relatedBy:NSLayoutRelationEqual
                                         toItem:self
                                         attribute:NSLayoutAttributeWidth
                                         multiplier:1.0
                                         constant:0.0];

  NSLayoutConstraint *heightConstraint = [NSLayoutConstraint
                                          constraintWithItem:button
                                          attribute:NSLayoutAttributeHeight
                                          relatedBy:NSLayoutRelationEqual
                                          toItem:self
                                          attribute:NSLayoutAttributeHeight
                                          multiplier:1.0
                                          constant:0.0];

  [self addConstraints:@[centerXConstraint, centerYConstraint, widthConstraint, heightConstraint]];
}

@end
