//
//  LocationService.h
//  AirPortG5
//
//  Created by Константин Надоненко on 30.06.2021.
//

#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>

#define kLocationServiceDidUpdateCurrentLocation @"LocationServiceDidUpdateCurrentLocation"

@interface LocationService : NSObject
@property (strong, nonatomic) CLLocation *currentLocation;
@property (nonatomic, strong) CLLocationManager *locationManager;
@end
