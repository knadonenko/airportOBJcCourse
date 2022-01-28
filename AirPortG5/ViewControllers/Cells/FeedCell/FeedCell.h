//
//  FeedCell.h
//  AirPortG5
//
//  Created by Константин Надоненко on 28.06.2021.
//

#import <UIKit/UIKit.h>
#import "Feed.h"

NS_ASSUME_NONNULL_BEGIN

#define GetNewsImage(url) [NSURL URLWithString:[NSString stringWithFormat:@"%@", url]];

@interface FeedCell : UITableViewCell

@property (nonatomic, strong) Feed *feed;
@property (nonatomic, strong) UILabel *labelTitle;
@property (nonatomic, strong) UILabel *labelPublished;
@property (nonatomic, strong) UILabel *labelContent;

@end

NS_ASSUME_NONNULL_END
