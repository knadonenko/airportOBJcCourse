//
//  AppDelegate.m
//  AirPortG5
//
//  Created by Rodion Molchanov on 16.06.2021.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    CGRect windowFrame = [[UIScreen mainScreen] bounds];

    self.window = [[UIWindow alloc] initWithFrame: windowFrame];

    MainViewController *ticketsViewController = [[MainViewController alloc] init];
    ticketsViewController.title = @"Билеты";
    UINavigationController *ticketsNavigationController = [[UINavigationController alloc] initWithRootViewController: ticketsViewController];

    FeedViewController *feedsViewController = [[FeedViewController alloc] init];
    feedsViewController.title = @"Новости";
    UINavigationController *feedsNavigationController = [[UINavigationController alloc] initWithRootViewController: feedsViewController];

    MapViewController *mapViewController = [[MapViewController alloc] init];
    mapViewController.title = @"Карта";
    UINavigationController *mapNavigationController = [[UINavigationController alloc] initWithRootViewController: mapViewController];

    UITabBarController *tabBarController = [[UITabBarController alloc] init];

    NSArray *tabsArray = [[NSArray alloc] initWithObjects: ticketsNavigationController,
                          feedsNavigationController,
                          mapNavigationController,
                          nil];

    tabBarController.viewControllers = tabsArray;

    int i = 0;

    for (UIBarButtonItem *barButton in tabBarController.toolbarItems) {
        switch (i) {
            case 0:
                barButton.image = [UIImage imageNamed: @"search"];
                break;
            case 1:
                barButton.image = [UIImage imageNamed: @"news"];
                break;
            default:
                barButton.image = [UIImage imageNamed: @"map"];
                break;
        }
        i += 1;
    }

    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];

    return YES;
}

@end
