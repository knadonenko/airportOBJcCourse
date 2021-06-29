//
//  FeedInfoViewController.h
//  AirPortG5
//
//  Created by Константин Надоненко on 28.06.2021.
//

#import <UIKit/UIKit.h>
#import "Feed.h"

NS_ASSUME_NONNULL_BEGIN

#define GenerateNSUrl(url) [NSURL URLWithString:[NSString stringWithFormat:@"%@", url]];

@interface FeedInfoViewController : UIViewController

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UILabel *labelTitle;
@property (nonatomic, strong) UILabel *labelPublishedAt;
@property (nonatomic, strong) UILabel *labelContent;
@property (nonatomic, strong) UILabel *labelAuthor;
@property (nonatomic, strong) Feed *feed;

- (instancetype)initWithFeed:(Feed *)feed;

@end

NS_ASSUME_NONNULL_END
