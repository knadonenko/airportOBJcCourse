//
//  FavoriteTicket+CoreDataProperties.m
//  AirPortG5
//
//  Created by Константин Надоненко on 06.07.2021.
//

#import "FavoriteTicket+CoreDataProperties.h"

@implementation FavoriteTicket (CoreDataProperties)

+ (NSFetchRequest<FavoriteTicket *> *)fetchRequest {
    return [NSFetchRequest fetchRequestWithEntityName:@"FavoriteTicket"];
}

@dynamic price;
@dynamic airline;
@dynamic departure;
@dynamic expires;
@dynamic flightNumber;
@dynamic returnDate;
@dynamic from;
@dynamic to;
@dynamic created;

@end
