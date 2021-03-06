//
//  EventInformationController.m
//  MAGE
//
//  Created by William Newman on 1/29/19.
//  Copyright © 2019 National Geospatial Intelligence Agency. All rights reserved.
//

#import "EventInformationController.h"
#import "EventInformationView.h"
#import "UIColor+Mage.h"
#import "Theme+UIResponder.h"

@interface EventInformationController ()
@property (strong, nonatomic) NSArray* forms;
@end

@implementation EventInformationController

static const NSInteger FORMS_SECTION = 0;

- (instancetype) init {
    self = [super initWithStyle:UITableViewStyleGrouped];
    return self;
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeNever;
    
    self.title = @"Event Information";
    
    self.tableView.backgroundColor = [UIColor tableBackground];
    
    EventInformationView *header = [[NSBundle mainBundle] loadNibNamed:@"EventInformationView" owner:self options:nil][0];
    header.nameLabel.text = self.event.name;
    header.descriptionLabel.hidden = [self.event.eventDescription length] == 0 ? YES : NO;
    header.descriptionLabel.text = self.event.eventDescription;
    self.tableView.tableHeaderView = header;
    
    self.forms = self.event.nonArchivedForms;
    
    [self registerForThemeChanges];
}

- (void) willMoveToParentViewController:(UIViewController *)parent {
    self.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeAutomatic;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    UIView *header = self.tableView.tableHeaderView;
    CGSize size = [header systemLayoutSizeFittingSize:CGSizeMake(header.frame.size.width, 0) withHorizontalFittingPriority:UILayoutPriorityRequired verticalFittingPriority:UILayoutPriorityFittingSizeLevel];
    if (header.frame.size.height != size.height) {
        CGRect frame = [header frame];
        frame.size.height = size.height;
        [header setFrame:frame];
        self.tableView.tableHeaderView = header;
        [self.tableView layoutIfNeeded];
    }
}
- (void) themeDidChange:(MageTheme)theme {    
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.forms count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    NSDictionary* form = [self.forms objectAtIndex:indexPath.row];
    cell.textLabel.text = [form valueForKey:@"name"];
    cell.tintColor = [UIColor brand];
    cell.textLabel.textColor = [UIColor primaryText];
    cell.backgroundColor = [UIColor background];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == FORMS_SECTION) {
        return @"Form Defaults";
    }
    
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *form = [self.forms objectAtIndex:indexPath.row];
    [self.delegate formSelected:form];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    if ([view isKindOfClass:[UITableViewHeaderFooterView class]]) {
        UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *) view;
        header.textLabel.textColor = [UIColor secondaryText];
    }
}

@end
