//
//  MapViewController.m
//  AirPortG5
//
//  Created by Константин Надоненко on 30.06.2021.
//

#import "MapViewController.h"

@interface MapViewController () <MKMapViewDelegate>

@end

@implementation MapViewController

- (void)viewDidLoad {

    [super viewDidLoad];

    self.title = @"Карта цен";

    _mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];

    _mapView.showsUserLocation = YES;

    [self.view addSubview:_mapView];

    [[DataManager sharedInstance] loadData];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dataLoadedSuccessfully) name:kDataManagerLoadDataDidComplete object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateCurrentLocation:) name:kLocationServiceDidUpdateCurrentLocation object:nil];
}

- (void)dealloc {

    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void)dataLoadedSuccessfully {
    _locationService = [[LocationService alloc] init];
}


- (void)updateCurrentLocation:(NSNotification *)notification {

    CLLocation *currentLocation = notification.object;

    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(currentLocation.coordinate, 1000000, 1000000);

    [_mapView setRegion: region animated: YES];

    if (currentLocation) {

        _origin = [[DataManager sharedInstance] cityForLocation:currentLocation];

        if (_origin) {

            [[NetworkManager sharedInstance] mapPricesFor:_origin withCompletion:^(NSArray *prices) {
                self.prices = prices;
            }];

        }

    }

}

- (void)setPrices:(NSArray *)prices {

    _prices = prices;

    [_mapView removeAnnotations: _mapView.annotations];

    for (MapPrice *price in prices) {

        dispatch_async(dispatch_get_main_queue(), ^{

            MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];

            annotation.title = [NSString stringWithFormat:@"%@ (%@)", price.destination.name, price.destination.code];

            annotation.subtitle = [NSString stringWithFormat:@"%ld руб.", (long)price.value];

            annotation.coordinate = price.destination.coordinate;

            [self->_mapView addAnnotation: annotation];
        });

    }

}

@end
