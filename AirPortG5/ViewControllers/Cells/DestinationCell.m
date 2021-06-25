//
//  DestinationCell.m
//  AirPortG5
//
//  Created by Константин Надоненко on 25.06.2021.
//

#import "DestinationCell.h"

@implementation DestinationCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

    if (self) {

        _labelName = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, ([UIScreen mainScreen].bounds.size.width - 20), 20)];

        _labelName.textAlignment = NSTextAlignmentLeft;

        [self.contentView addSubview:_labelName];


        _labelCode = [[UILabel alloc] initWithFrame: CGRectMake(10, 40, ([UIScreen mainScreen].bounds.size.width - 20), 20)];

        _labelCode.textAlignment = NSTextAlignmentCenter;

        [self.contentView addSubview:_labelCode];
    }

    return self;
}

@end
