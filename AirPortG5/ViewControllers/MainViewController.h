//
//  MainViewController.h
//  AirPortG5
//
//  Created by Rodion Molchanov on 16.06.2021.
//

#import <UIKit/UIKit.h>

typedef struct SearchRequest {

    __unsafe_unretained NSString *origin;

    __unsafe_unretained NSString *destionation;

    __unsafe_unretained NSDate *departDate;

    __unsafe_unretained NSDate *returnDate;
} SearchRequest;

@interface MainViewController : UIViewController
@property (nonatomic, strong) UIButton *departureButton;
@property (nonatomic, strong) UIButton *arrivalButton;
@property (nonatomic) SearchRequest searchRequest;
@end

