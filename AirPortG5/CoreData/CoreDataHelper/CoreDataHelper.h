//
//  CoreDataHelper.h
//  AirPortG5
//
//  Created by Константин Надоненко on 06.07.2021.
//

#import <CoreData/CoreData.h>
#import "Ticket.h"
#import "MapPrice.h"
#import "DataManager.h"
#import "FavoriteTicket+CoreDataClass.h"

@interface CoreDataHelper : NSObject

+ (instancetype)sharedInstance;

@property (nonatomic, strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSManagedObjectModel *managedObjectModel;

- (NSArray *)favorites;
- (BOOL)isFavorite:(Ticket *)ticket;
- (void)addToFavorite:(Ticket *)ticket;
- (void)removeFromFavorite:(Ticket *)ticket;

@end
