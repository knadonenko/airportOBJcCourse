//
//  FirstViewController.h
//  AirPortG5
//
//  Created by Константин Надоненко on 12.07.2021.
//

#import <UIKit/UIKit.h>
#import "ContentViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface FirstViewController : UIPageViewController <UIPageViewControllerDelegate, UIPageViewControllerDataSource>
@property (strong, nonatomic) UIButton *nextButton;
@property (strong, nonatomic) UIPageControl *pageControl;
@end

NS_ASSUME_NONNULL_END
