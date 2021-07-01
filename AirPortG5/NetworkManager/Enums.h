//
//  Enums.h
//  AirPortG5
//
//  Created by Константин Надоненко on 01.07.2021.
//

#import <Foundation/Foundation.h>

typedef struct SearchRequest {
    __unsafe_unretained NSString *origin;

    __unsafe_unretained NSString *destionation;

    __unsafe_unretained NSDate *departDate;

    __unsafe_unretained NSDate *returnDate;
} SearchRequest;


typedef enum PlaceType {
    PlaceTypeArrival,

    PlaceTypeDeparture
} PlaceType;


typedef enum DataSourceType {
    DataSourceTypeCountry,

    DataSourceTypeCity,

    DataSourceTypeAirport
} DataSourceType;


@interface Enums : NSObject

@end
