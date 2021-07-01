//
//  DataManager.h
//  AirPortG5
//
//  Created by Rodion Molchanov on 16.06.2021.
//

#import <Foundation/Foundation.h>
#import "Country.h"
#import "City.h"
#import "Airport.h"
#import "Enums.h"

#define kDataManagerLoadDataDidComplete @"DataManagerLoadDataDidComplete"

@interface DataManager : NSObject

+(instancetype) sharedInstance;
-(void) loadData;

@property (nonatomic, strong, readonly) NSArray *contries;
@property (nonatomic, strong, readonly) NSArray *cities;
@property (nonatomic, strong, readonly) NSArray *airports;

- (City *)cityForIATA:(NSString *)iata;
- (City *)cityForLocation:(CLLocation *)location;

@end
