//
//  TicketsViewController.m
//  AirPortG5
//
//  Created by Константин Надоненко on 05.07.2021.
//

#import "TicketsViewController.h"

#define TicketCellReuseIdentifier @"TicketCellIdentifier"

@interface TicketsViewController ()

@end

@implementation TicketsViewController

- (instancetype)initWithTickets:(NSArray *)tickets {
    
    self = [super init];
    
    if (self) {
        _tickets = tickets;
        _isFavorites = NO;
        _isTickets = YES;
        self.title = @"Билеты";
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.tableView registerClass:[TicketCell class] forCellReuseIdentifier:TicketCellReuseIdentifier];
    }
    
    return self;
}

- (instancetype)initFavoriteTicketsController {
    
    self = [super init];
    
    if (self) {
        _isFavorites = YES;
        _isTickets = YES;
        self.tickets = [NSArray new];
        self.prices = [NSArray new];
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.tableView registerClass:[TicketCell class] forCellReuseIdentifier:TicketCellReuseIdentifier];
        
        _datePicker = [[UIDatePicker alloc] init];
        _datePicker.datePickerMode = UIDatePickerModeDateAndTime;
        _datePicker.minimumDate = [NSDate date];
        
        _dateTextField = [[UITextField alloc] initWithFrame:self.view.bounds];
        _dateTextField.hidden = YES;
        _dateTextField.inputView = _datePicker;
        
        UIToolbar *keyboardToolbar = [[UIToolbar alloc] init];
        [keyboardToolbar sizeToFit];
        UIBarButtonItem *flexBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        UIBarButtonItem *doneBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonDidTap:)];
        
        keyboardToolbar.items = @[flexBarButton, doneBarButton];
        _dateTextField.inputAccessoryView = keyboardToolbar;
        [self.view addSubview:_dateTextField];
    }
    
    return self;
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    if (_isFavorites) {
        self.tickets = [[CoreDataHelper sharedInstance] favorites];
    }
    
    [self.tableView reloadData];
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    if (_isFavorites) {
        self.navigationController.navigationBar.prefersLargeTitles = YES;
        self.navigationController.navigationBar.translucent = NO;
        
        self.title = @"Избранное";
        
        _segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"Билеты", @"Из карты"]];
        [_segmentedControl addTarget:self action:@selector(changeSource) forControlEvents:UIControlEventValueChanged];
        _segmentedControl.tintColor = [UIColor blackColor];
        
        self.navigationItem.titleView = _segmentedControl;
        _segmentedControl.selectedSegmentIndex = 0;
    }
    
}


- (void)changeSource {
    _isTickets = _segmentedControl.selectedSegmentIndex == 0;
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource & UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _isTickets ? _tickets.count : _prices.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TicketCell *cell = [tableView dequeueReusableCellWithIdentifier:TicketCellReuseIdentifier forIndexPath:indexPath];
    cell.ticket = [_tickets objectAtIndex:indexPath.row];
    if (_isFavorites) {
        cell.favoriteTicket = [_tickets objectAtIndex:indexPath.row];
    }
    else {
        cell.ticket = [_tickets objectAtIndex:indexPath.row];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell animate];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 140.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (_isFavorites) return;
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Действия с билетом" message:@"Что необходимо сделать с выбранным билетом?" preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *favoriteAction;
    
    UIAlertAction *notificationAction = [UIAlertAction actionWithTitle:@"Напомнить" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        self->_notificationCell = [tableView cellForRowAtIndexPath:indexPath];
        [self->_dateTextField becomeFirstResponder];
    }];
    
    if ([[CoreDataHelper sharedInstance] isFavorite: [_tickets objectAtIndex:indexPath.row]]) {
        favoriteAction = [UIAlertAction actionWithTitle:@"Удалить из избранного" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            [[CoreDataHelper sharedInstance] removeFromFavorite:[self->_tickets objectAtIndex:indexPath.row]];
        }];
        
    }
    else {
        favoriteAction = [UIAlertAction actionWithTitle:@"Добавить в избранное" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [[CoreDataHelper sharedInstance] addToFavorite:[self->_tickets objectAtIndex:indexPath.row]];
        }];
    }
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Закрыть" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:favoriteAction];
    [alertController addAction:notificationAction];
    [alertController addAction:cancelAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)doneButtonDidTap:(UIBarButtonItem *)sender {
    
    if (_datePicker.date && _notificationCell) {
        
        NSString *message = [NSString stringWithFormat:@"%@ - %@ за %@ руб.", _notificationCell.ticket.from, _notificationCell.ticket.to, _notificationCell.ticket.price];
        
        NSURL *imageURL;
        
        if (_notificationCell.airlineLogoView.image) {
            
            NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingString:[NSString stringWithFormat:@"/%@.png", _notificationCell.ticket.airline]];
            
            if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
                UIImage *logo = _notificationCell.airlineLogoView.image;
                NSData *pngData = UIImagePNGRepresentation(logo);
                [pngData writeToFile:path atomically:YES];
            }
            
            imageURL = [NSURL fileURLWithPath:path];
        }
        
        Notification notification = NotificationMake(@"Напоминание о билете", message, _datePicker.date, imageURL);
        
        [[NotificationCenter sharedInstance] sendNotification:notification];
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        NSLocale *ruLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"];
        
        [formatter setLocale:ruLocale];
        [formatter setDateFormat:@"dd MMMM yyyy в HH:mm"];
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Успешно" message:[NSString stringWithFormat:@"Уведомление будет отправлено - %@", [formatter stringFromDate:_datePicker.date]] preferredStyle:(UIAlertControllerStyleAlert)];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Закрыть" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            [self.view endEditing:YES];
        }];
        
        [alertController addAction:cancelAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }
    
    _datePicker.date = [NSDate date];
    _notificationCell = nil;

    [self.view endEditing:YES];
}

@end
