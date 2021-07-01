//
//  FeedViewController.m
//  AirPortG5
//
//  Created by Константин Надоненко on 28.06.2021.
//

#import "FeedViewController.h"

#define FeedCellReuseIdentifier @"FeedCellIdentifier"

@interface FeedViewController ()

@end

@implementation FeedViewController

- (void)viewDidLoad {

    [super viewDidLoad];

    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[FeedCell class] forCellReuseIdentifier:FeedCellReuseIdentifier];

    [[NetworkManager sharedInstance] feedsWithRequest: @"ru" withCompletion: ^(NSArray *feeds) {
        self.feeds = feeds;
        [self.tableView reloadData];
    }];

}

#pragma mark - UITableViewDataSource & UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _feeds.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FeedCell *cell = [tableView dequeueReusableCellWithIdentifier:FeedCellReuseIdentifier forIndexPath:indexPath];

    cell.feed = [_feeds objectAtIndex:indexPath.row];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 140.0;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    FeedInfoViewController *feedInfoViewController = [[FeedInfoViewController alloc] initWithFeed: [_feeds objectAtIndex:indexPath.row]];
    [self.navigationController showViewController:feedInfoViewController sender:self];
}

@end
