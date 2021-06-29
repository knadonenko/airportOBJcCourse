//
//  FeedViewController.h
//  AirPortG5
//
//  Created by Константин Надоненко on 28.06.2021.
//

#import <UIKit/UIKit.h>
#import "FeedInfoViewController.h"
#import "FeedCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface FeedViewController : UITableViewController

@property (nonatomic, strong) NSArray *feeds;

- (instancetype)initWithFeeds:(NSArray *)feeds;

@end

NS_ASSUME_NONNULL_END
