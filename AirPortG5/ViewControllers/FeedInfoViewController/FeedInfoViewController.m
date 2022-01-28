//
//  FeedInfoViewController.m
//  AirPortG5
//
//  Created by Константин Надоненко on 28.06.2021.
//

#import "FeedInfoViewController.h"

#define FeedCellReuseIdentifier @"FeedCellIdentifier"

@interface FeedInfoViewController ()

@end

@implementation FeedInfoViewController

- (instancetype)initWithFeed:(Feed *)feed {
    self = [super init];

    if (self) {
        _feed = feed;
        self.title = @"Новость";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addSubviews];
}

- (void) addSubviews {

    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = UIColor.whiteColor;
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 60)];
    _scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 760);
    _scrollView.backgroundColor = [UIColor whiteColor];
    _scrollView.showsVerticalScrollIndicator = YES;
    _scrollView.scrollEnabled = YES;
    _labelTitle = [[UILabel alloc] initWithFrame: CGRectMake(16, 10, [UIScreen mainScreen].bounds.size.width - 32, 200)];
    _labelTitle.font = [UIFont systemFontOfSize:20.0 weight:UIFontWeightBold];
    _labelTitle.numberOfLines = 0;
    _labelTitle.textAlignment = NSTextAlignmentJustified;
    _labelTitle.text = _feed.title;
    [_scrollView addSubview:_labelTitle];

    _labelPublishedAt = [[UILabel alloc] initWithFrame:  CGRectMake(16, CGRectGetMaxY(_labelTitle.frame) + 10.0, [UIScreen mainScreen].bounds.size.width - 32, 20)];
    _labelPublishedAt.font = [UIFont systemFontOfSize:16.0 weight:UIFontWeightRegular];
    _labelPublishedAt.text = _feed.publishedAt;
    [_scrollView addSubview:_labelPublishedAt];

    _labelContent = [[UILabel alloc] initWithFrame: CGRectMake(16, CGRectGetMaxY(_labelPublishedAt.frame) + 10.0, [UIScreen mainScreen].bounds.size.width - 32, 300)];
    _labelContent.font = [UIFont systemFontOfSize:20.0 weight:UIFontWeightRegular];
    _labelContent.numberOfLines = 0;
    _labelContent.text = _feed.descript;
    _labelContent.textAlignment = NSTextAlignmentNatural;
    [_scrollView addSubview:_labelContent];

    _labelAuthor = [[UILabel alloc] initWithFrame: CGRectMake(16, CGRectGetMaxY(_labelContent.frame) + 10.0, [UIScreen mainScreen].bounds.size.width - 32, 20)];
    _labelAuthor.font = [UIFont systemFontOfSize:16.0 weight:UIFontWeightRegular];
    _labelAuthor.textAlignment = NSTextAlignmentRight;
    [_scrollView addSubview:_labelAuthor];
    _labelAuthor.text = [NSString stringWithFormat: @"%@", _feed.author];

    [self.view addSubview:_scrollView];

}

@end
