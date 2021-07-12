//
//  MainViewController.h
//  AirPortG5
//
//  Created by Rodion Molchanov on 16.06.2021.
//

#import <UIKit/UIKit.h>
#import "FeedViewController.h"
#import "Enums.h"
#import "NetworkManager.h"
#import "DataManager.h"
#import "TicketsViewController.h"
#import "PlacesViewController.h"
#import "ProgressView.h"
#import "FirstViewController.h"

@interface MainViewController : UIViewController
@property (nonatomic, strong) UIButton *departureButton;
@property (nonatomic, strong) UIButton *arrivalButton;
@property (nonatomic, strong) UIView *placeContainerView;
@property (nonatomic, strong) UIButton *searchButton;
@property (nonatomic) SearchRequest searchRequest;
@end

