//
//  NetworkManager.m
//  AirPortG5
//
//  Created by Константин Надоненко on 28.06.2021.
//


#import "NetworkManager.h"

#define NEWS_TOKEN @"402500baec3841c392f7d41fa26ab648"
#define NEWS_API_URL @"https://newsapi.org/v2/top-headlines"

@implementation NetworkManager

+ (instancetype)sharedInstance {
    static NetworkManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[NetworkManager alloc] init];
    });
    return instance;
}

- (void)load:(NSString *)urlString withCompletion:(void (^)(id _Nullable result))completion {

    [[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:urlString] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {

        completion([NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil]);
    }] resume];

}

- (void)feedsWithRequest:(NSString*)searchString withCompletion:(void (^)(NSArray *feeds))completion {

    NSString *urlString = [NSString stringWithFormat:@"%@?country=%@&apiKey=%@", NEWS_API_URL, searchString, NEWS_TOKEN];
    [self load:urlString withCompletion:^(id  _Nullable result) {
        NSDictionary *response = result;
        if (response) {
            NSDictionary *json = [response valueForKey:@"articles"];
            NSMutableArray *array = [NSMutableArray new];

            for (NSDictionary *key in json) {
                Feed *feed = [[Feed alloc] initWithDictionary:key];
                [array addObject:feed];
            }

            dispatch_async(dispatch_get_main_queue(), ^{
                completion(array);
            });
        }

    }];

}

@end

