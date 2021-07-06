//
//  TicketsViewController.h
//  AirPortG5
//
//  Created by Константин Надоненко on 05.07.2021.
//

#import <UIKit/UIKit.h>
#import "TicketCell.h"
#import "CoreDataHelper.h"

@interface TicketsViewController : UITableViewController

@property (nonatomic) bool isFavorites;
@property (nonatomic) bool isTickets;
@property (nonatomic, strong) NSArray *prices;
@property (nonatomic, strong) UISegmentedControl *segmentedControl;
@property (nonatomic, strong) NSArray *tickets;
- (instancetype)initWithTickets:(NSArray *)tickets;
- (instancetype)initFavoriteTicketsController;

@end
