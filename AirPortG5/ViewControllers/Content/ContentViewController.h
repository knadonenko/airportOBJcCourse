//
//  ContentViewController.h
//  AirPortG5
//
//  Created by Константин Надоненко on 12.07.2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ContentViewController: UIViewController
@property (nonatomic, strong) NSString *contentText;
@property (nonatomic, strong) UIImage *image;
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *contentLabel;
@property (nonatomic) int index;

@end

NS_ASSUME_NONNULL_END
