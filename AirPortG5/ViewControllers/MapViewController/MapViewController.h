//
//  MapViewController.h
//  AirPortG5
//
//  Created by Константин Надоненко on 30.06.2021.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "NetworkManager.h"
#import "DataManager.h"
#import "LocationService.h"

NS_ASSUME_NONNULL_BEGIN

@interface MapViewController : UIViewController

@property (strong, nonatomic) MKMapView *mapView;
@property (nonatomic, strong) City *origin;
@property (nonatomic, strong) NSArray *prices;
@property (nonatomic, strong) LocationService *locationService;

@end

NS_ASSUME_NONNULL_END
