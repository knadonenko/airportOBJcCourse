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

    TabBarController *tabBarController = [[TabBarController alloc] init];

    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];

    return YES;
}

@end
