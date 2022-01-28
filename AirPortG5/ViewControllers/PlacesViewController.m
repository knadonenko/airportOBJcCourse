//
//  PlacesViewController.m
//  AirPortG5
//
//  Created by Константин Надоненко on 25.06.2021.
//

#import "PlacesViewController.h"
#import "DestinationCell.h"

#define ReuseIdentifier @"CellIdentifier"


@interface PlacesViewController ()

@property (nonatomic) PlaceType placeType;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UISegmentedControl *segmentedControl;

@property (nonatomic, strong) NSArray *currentArray;

@end

@implementation PlacesViewController

- (instancetype)initWithType:(PlaceType)type {
    self = [super init];

    if (self) {
        _placeType = type;
    }

    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];
}


- (void)configureView {

    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = nil;

    [self.view addSubview:_tableView];


    _segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"Города", @"Аэропорты"]];

    [_segmentedControl addTarget:self action:@selector(changeSource) forControlEvents:UIControlEventValueChanged];

    _segmentedControl.tintColor = [UIColor blackColor];

    self.navigationItem.titleView = _segmentedControl;

    _segmentedControl.selectedSegmentIndex = 0;

    [self changeSource];

    if (_placeType == PlaceTypeDeparture) {
        self.title = @"Откуда";
    }
    else {
        self.title = @"Куда";
    }

}

- (void)changeSource {
    switch (_segmentedControl.selectedSegmentIndex) {
        case 0:
            _currentArray = [[DataManager sharedInstance] cities];
            break;
        case 1:
            _currentArray = [[DataManager sharedInstance] airports];
            break;
        default:
            break;
    }

    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_currentArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    DestinationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DestinationCell"];

    if (!cell) {
        cell = [[DestinationCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIdentifier"];
    }

    if (_segmentedControl.selectedSegmentIndex == 0) {
        City *city = [_currentArray objectAtIndex:indexPath.row];
        cell.labelName.text = city.name;
        cell.labelCode.text = city.code;
    }
    else if (_segmentedControl.selectedSegmentIndex == 1) {
        Airport *airport = [_currentArray objectAtIndex:indexPath.row];
        cell.labelName.text = airport.name;
        cell.labelCode.text = airport.code;
    }

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DataSourceType dataType = ((int)_segmentedControl.selectedSegmentIndex) + 1;
    [self.delegate selectPlace:[_currentArray objectAtIndex:indexPath.row] withType:_placeType andDataType:dataType];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
