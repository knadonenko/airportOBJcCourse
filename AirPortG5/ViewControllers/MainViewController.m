//
//  MainViewController.m
//  AirPortG5
//
//  Created by Rodion Molchanov on 16.06.2021.
//

#import "MainViewController.h"
#import "PlacesViewController.h"
#import "DataManager.h"

@interface MainViewController () <PlaceViewControllerDelegate>
@end


@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[DataManager sharedInstance] loadData];
    [self addSubviews];
    self.view.backgroundColor = UIColor.cyanColor;
    self.title = @"Поиск";
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadDidComplete) name:kDataManagerLoadDataDidComplete object:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [self setNeedsStatusBarAppearanceUpdate];
}

- (BOOL)prefersStatusBarHidden {
    return NO;
}

- (void) loadDidComplete {
    //    self.view.backgroundColor = UIColor.greenColor;
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void) addSubviews {

    _departureButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_departureButton setTitle:@"Откуда" forState: UIControlStateNormal];
    _departureButton.tintColor = [UIColor blackColor];
    _departureButton.frame = CGRectMake(30.0, 140.0, [UIScreen mainScreen].bounds.size.width - 60.0, 60.0);
    _departureButton.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3];
    [_departureButton addTarget:self action:@selector(placeButtonDidTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_departureButton];


    _arrivalButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_arrivalButton setTitle:@"Куда" forState: UIControlStateNormal];
    _arrivalButton.tintColor = [UIColor blackColor];
    _arrivalButton.frame = CGRectMake(30.0, CGRectGetMaxY(_departureButton.frame) + 20.0, [UIScreen mainScreen].bounds.size.width - 60.0, 60.0);
    _arrivalButton.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3];
    [_arrivalButton addTarget:self action:@selector(placeButtonDidTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_arrivalButton];
}

- (void)placeButtonDidTap:(UIButton *)sender {

    PlacesViewController *placeViewController;
    if ([sender isEqual:_departureButton]) {
        placeViewController = [[PlacesViewController alloc] initWithType: PlaceTypeDeparture];
    }
    else {
        placeViewController = [[PlacesViewController alloc] initWithType: PlaceTypeArrival];
    }
    placeViewController.delegate = self;
    [self.navigationController pushViewController: placeViewController animated:YES];
}

#pragma mark - PlacesViewControllerDelegate

- (void)selectPlace:(id)place withType:(PlaceType)placeType andDataType:(DataSourceType)dataType {

    [self setPlace:place withDataType:dataType andPlaceType:placeType forButton: (placeType == PlaceTypeDeparture) ? _departureButton : _arrivalButton ];
}

- (void)setPlace:(id)place withDataType:(DataSourceType)dataType andPlaceType:(PlaceType)placeType forButton:(UIButton *)button {

    NSString *title;

    NSString *iata;

    if (dataType == DataSourceTypeCity) {
        City *city = (City *)place;
        title = city.name;
        iata = city.code;
    }
    else if (dataType == DataSourceTypeAirport) {
        Airport *airport = (Airport *)place;
        title = airport.name;
        iata = airport.cityCode;
    }
    if (placeType == PlaceTypeDeparture) {
        _searchRequest.origin = iata;
    }
    else {
        _searchRequest.destionation = iata;
    }

    [button setTitle: title forState: UIControlStateNormal];
}

@end
