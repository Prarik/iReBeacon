//
//  RBHomeViewController.m
//  iReBeacon
//
//  Created by Giuseppe Macrì on 10/29/13.
//  Copyright (c) 2013 giuseppem. All rights reserved.
//

#import "RBHomeViewController.h"
#import "RBLocationManager.h"

#import "RBAppDelegate.h"

@interface RBHomeViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *beaconInformationLabel;

@end

@implementation RBHomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        [RBAppDelegate appDelegate].applicationMode = RBApplicationModeRegionMonitoring;
        
        // Init beacon region manager monitoring
        [[RBLocationManager sharedManager] initializeRegionMonitoring];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Notifications

#pragma mark - UiTable View
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"DEAL";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    return cell;
    
}

@end
