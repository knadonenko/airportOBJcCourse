//
//  PlacesViewController.h
//  AirPortG5
//
//  Created by Константин Надоненко on 25.06.2021.
//

#import <UIKit/UIKit.h>
#import "DataManager.h"
#import "Enums.h"
#import "PlaceCollectionCell.h"

NS_ASSUME_NONNULL_BEGIN

@protocol PlaceViewControllerDelegate <NSObject>

- (void)selectPlace:(id)place withType:(PlaceType)placeType andDataType:(DataSourceType)dataType;

@end

@interface PlacesViewController : UIViewController

@property (nonatomic, strong) id<PlaceViewControllerDelegate>delegate;
@property (nonatomic) PlaceType placeType;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UISegmentedControl *segmentedControl;
@property (nonatomic, strong) NSArray *currentArray;
@property (nonatomic, strong) NSArray *searchArray;
@property (nonatomic, strong) UISearchController *searchController;

- (instancetype)initWithType:(PlaceType)type;

@end

NS_ASSUME_NONNULL_END
