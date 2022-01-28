//
//  TicketCell.h
//  AirPortG5
//
//  Created by Константин Надоненко on 05.07.2021.
//

#import <UIKit/UIKit.h>
#import <YYWebImage/YYWebImage.h>
#import "DataManager.h"
#import "NetworkManager.h"
#import "FavoriteTicket+CoreDataClass.h"

#define AirlineLogo(iata) [NSURL URLWithString:[NSString stringWithFormat:@"https://pics.avs.io/200/200/%@.png", iata]];

@interface TicketCell : UITableViewCell

    @property (nonatomic, strong) Ticket *ticket;
    @property (nonatomic, strong) UIImageView *airlineLogoView;
    @property (nonatomic, strong) UILabel *priceLabel;
    @property (nonatomic, strong) UILabel *placesLabel;
    @property (nonatomic, strong) UILabel *dateLabel;
    @property (nonatomic, strong) FavoriteTicket *favoriteTicket;

@end
