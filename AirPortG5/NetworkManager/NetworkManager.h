//
//  NetworkManager.h
//  AirPortG5
//
//  Created by Константин Надоненко on 28.06.2021.
//

#import <Foundation/Foundation.h>
#import "Feed.h"
#import "DataManager.h"
#import "MapPrice.h"
#import "Ticket.h"

@interface NetworkManager : NSObject

+ (instancetype)sharedInstance;
- (void)cityForCurrentIP:(void (^)(City *city))completion;
- (void)ticketsWithRequest:(SearchRequest)request withCompletion:(void (^)(NSArray *tickets))completion;
- (void)feedsWithRequest:(NSString*)searchString withCompletion:(void (^)(NSArray *feeds))completion;
- (void)mapPricesFor:(City *)origin withCompletion:(void (^)(NSArray *prices))completion;

@end
