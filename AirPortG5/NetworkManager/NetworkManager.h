//
//  NetworkManager.h
//  AirPortG5
//
//  Created by Константин Надоненко on 28.06.2021.
//

#import <Foundation/Foundation.h>
#import "Feed.h"
#import "DataManager.h"

@interface NetworkManager : NSObject

    + (instancetype)sharedInstance;
    - (void)feedsWithRequest:(NSString*)searchString withCompletion:(void (^)(NSArray *feeds))completion;

@end
