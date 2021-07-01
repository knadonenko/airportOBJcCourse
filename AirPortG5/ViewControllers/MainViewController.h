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

@interface MainViewController : UIViewController
@property (nonatomic, strong) UIButton *departureButton;
@property (nonatomic, strong) UIButton *arrivalButton;
@property (nonatomic) SearchRequest searchRequest;
@end

