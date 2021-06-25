//
//  MainViewController.m
//  AirPortG5
//
//  Created by Rodion Molchanov on 16.06.2021.
//

#import "MainViewController.h"
#import "DataManager.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[DataManager sharedInstance] loadData];
    [self addSubviews];
    self.view.backgroundColor = UIColor.cyanColor;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadDidComplete) name:kDataManagerLoadDataDidComplete object:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [self setNeedsStatusBarAppearanceUpdate];
}

- (BOOL)prefersStatusBarHidden {
   return NO;
}

- (void) loadDidComplete {
//    self.view.backgroundColor = UIColor.greenColor;
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void) addSubviews {

    CGRect frameLabelFrom = CGRectMake(16.0, 140.0, ([UIScreen mainScreen].bounds.size.width - 32.0), 20.0);

    _labelFrom = [[UILabel alloc] initWithFrame: frameLabelFrom];
    _labelFrom.font = [UIFont systemFontOfSize:20.0 weight:UIFontWeightBold];
    _labelFrom.textColor = [UIColor darkGrayColor];
    _labelFrom.textAlignment = NSTextAlignmentCenter;
    _labelFrom.text = @"Выберите город вылета";

    [self.view addSubview: _labelFrom];


    CGRect frameTextFieldFrom = CGRectMake(16.0, 180.0, ([UIScreen mainScreen].bounds.size.width - 32.0), 40.0);

    _textFieldFrom = [[UITextField alloc] initWithFrame:frameTextFieldFrom];
    _textFieldFrom.borderStyle = UITextBorderStyleRoundedRect;
    _textFieldFrom.placeholder = @"Откуда";
    _textFieldFrom.font = [UIFont systemFontOfSize:20.0 weight:UIFontWeightLight];

    [self.view addSubview: _textFieldFrom];


    CGRect frameLabelDestination = CGRectMake(16.0, 240.0, ([UIScreen mainScreen].bounds.size.width - 32.0), 20.0);

    _labelDestination = [[UILabel alloc] initWithFrame: frameLabelDestination];
    _labelDestination.font = [UIFont systemFontOfSize:20.0 weight:UIFontWeightBold];
    _labelDestination.textColor = [UIColor darkGrayColor];
    _labelDestination.textAlignment = NSTextAlignmentCenter;
    _labelDestination.text = @"Выберите город посадки";

    [self.view addSubview: _labelDestination];


    CGRect frameTextFieldDestination = CGRectMake(16.0, 280.0, ([UIScreen mainScreen].bounds.size.width - 32.0), 40.0);

    _textFieldDestination = [[UITextField alloc] initWithFrame: frameTextFieldDestination];
    _textFieldDestination.borderStyle = UITextBorderStyleRoundedRect;
    _textFieldDestination.placeholder = @"Куда";
    _textFieldDestination.font = [UIFont systemFontOfSize:20.0 weight:UIFontWeightLight];

    [self.view addSubview: _textFieldDestination];
}

@end
