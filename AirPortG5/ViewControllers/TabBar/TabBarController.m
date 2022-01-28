//
//  TabBarController.m
//  AirPortG5
//
//  Created by Константин Надоненко on 05.07.2021.
//

#import "TabBarController.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (instancetype)init {

    self = [super initWithNibName:nil bundle:nil];

    if (self) {
        self.viewControllers = [self createViewControllers];
        self.tabBar.tintColor = [UIColor blueColor];
    }

    return self;
}


- (NSArray<UIViewController*> *)createViewControllers {

    NSMutableArray<UIViewController*> *controllers = [NSMutableArray new];

    MainViewController *mainViewController = [[MainViewController alloc] init];
    mainViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle: @"Поиск" image: [UIImage imageNamed: @"search"] selectedImage: [UIImage imageNamed: @"search"]];
    UINavigationController *mainNavigationController = [[UINavigationController alloc] initWithRootViewController: mainViewController];
    [controllers addObject: mainNavigationController];

    MapViewController *mapViewController = [[MapViewController alloc] init];
    mapViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle: @"Карта цен" image: [UIImage imageNamed: @"map"] selectedImage: [UIImage imageNamed: @"map"]];
    UINavigationController *mapNavigationController = [[UINavigationController alloc] initWithRootViewController: mapViewController];
    [controllers addObject:mapNavigationController];

    FeedViewController *feedViewController = [[FeedViewController alloc] init];
    feedViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle: @"Новости" image: [UIImage imageNamed: @"news"] selectedImage: [UIImage imageNamed: @"news"]];
    UINavigationController *feedNavigationController = [[UINavigationController alloc] initWithRootViewController: feedViewController];
    [controllers addObject:feedNavigationController];

    TicketsViewController *favoriteViewController = [[TicketsViewController alloc] initFavoriteTicketsController];
    favoriteViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Избранное" image:[UIImage imageNamed:@"favorite"] selectedImage:[UIImage imageNamed:@"favorite"]];
    UINavigationController *favoriteNavigationController = [[UINavigationController alloc] initWithRootViewController:favoriteViewController];
    [controllers addObject:favoriteNavigationController];

    return controllers;
}

@end
